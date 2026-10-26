#!/usr/bin/env python3
"""Report-parser and CLI-policy regressions; no Lean invocation is needed."""
import contextlib
import importlib.util
import io
import itertools
from pathlib import Path
import subprocess
import sys
import unittest
from unittest.mock import patch


SCRIPT = Path(__file__).with_name("check_axioms.py")
ROOT = SCRIPT.parent.parent
SPEC = importlib.util.spec_from_file_location("check_axioms", SCRIPT)
CHECKER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CHECKER)
MODES = ("caps", "responses", "response-geometry", "haagerup-power", "upper-comparison")


class CheckAxiomsTests(unittest.TestCase):
    def run_main(self, args, text):
        stdout, stderr = io.StringIO(), io.StringIO()
        with patch.object(sys, "stdin", io.StringIO(text)), \
                contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
            try:
                code = CHECKER.main(args)
            except SystemExit as error:
                code = error.code
        return code, stdout.getvalue(), stderr.getvalue()

    def report(self, mode="default"):
        required, _ = CHECKER.audit_policy(mode)
        return "".join(f"'{name}' depends on axioms: [propext, Classical.choice, Quot.sound]\n"
                       for name in sorted(required))

    def test_existing_policy_headlines_and_native_restrictions(self):
        headlines = {
            "default": {"Grothe.fresh_upper", "Grothe.haagerup_bound", "Grothe.Lower.lower_bound_data"},
            "responses": {"Grothe.LowerAnalytic.ResponseGram.gram_qform",
                          "Grothe.LowerAnalytic.DiffuseCubicObstruction.above_target"},
            "response-geometry": {"Grothe.LowerAnalytic.DiffuseCubicObstruction.above_target"},
            "haagerup-power": {"Grothe.HaagerupPower.upper"},
            "upper-comparison": {"Grothe.fresh_upper"},
        }
        for mode, expected in headlines.items():
            with self.subTest(mode=mode):
                self.assertTrue(expected <= CHECKER.audit_policy(mode)[0])
        self.assertEqual(CHECKER.audit_policy("caps")[0],
                         {"Grothe.LowerAnalytic.lower_bound_of_capsRest"})
        for mode in ("default", "caps"):
            self.assertEqual(CHECKER.audit_policy(mode)[1], CHECKER.NATIVE)
        for mode in ("responses", "response-geometry"):
            self.assertEqual(CHECKER.audit_policy(mode)[1], set())
        self.assertEqual(CHECKER.audit_policy("haagerup-power")[1],
                         {"Grothe.HaagerupPower.check._native.native_decide.ax_1_1"})
        self.assertEqual(CHECKER.audit_policy("upper-comparison")[1],
                         {"Grothe.head_check._native.native_decide.ax_1_1",
                          "Grothe.Upper.comparison_check._native.native_decide.ax_1_1",
                          "Grothe.UpperChaos.phi_cover_check._native.native_decide.ax_1_1"})

    def test_policy_copies_are_isolated(self):
        for mode in ("default",) + MODES:
            with self.subTest(mode=mode):
                expected = CHECKER.audit_policy(mode)
                required, native = CHECKER.audit_policy(mode)
                required.clear()
                native.add("Test.unapproved")
                self.assertEqual(CHECKER.audit_policy(mode), expected)

    def test_each_mode_accepts_its_required_reports(self):
        for mode in ("default",) + MODES:
            with self.subTest(mode=mode):
                args = [] if mode == "default" else [f"--{mode}"]
                code, _, stderr = self.run_main(args, self.report(mode))
                self.assertEqual(code, 0, stderr)

    def test_each_mode_accepts_its_native_allowlist(self):
        for mode in ("default",) + MODES:
            with self.subTest(mode=mode):
                _, native = CHECKER.audit_policy(mode)
                extra = f"'Test.nativeFacts' depends on axioms: [{', '.join(sorted(native))}]\n"
                args = [] if mode == "default" else [f"--{mode}"]
                code, _, stderr = self.run_main(args, self.report(mode) + extra)
                self.assertEqual(code, 0, stderr)

    def test_each_mode_rejects_missing_required_result(self):
        for mode in ("default",) + MODES:
            with self.subTest(mode=mode):
                text = self.report(mode).split("\n", 1)[1]
                args = [] if mode == "default" else [f"--{mode}"]
                self.assertEqual(self.run_main(args, text)[0], 1)

    def test_each_mode_rejects_foreign_axiom(self):
        extra = "'Test.foreign' depends on axioms: [sorryAx]\n"
        for mode in ("default",) + MODES:
            with self.subTest(mode=mode):
                args = [] if mode == "default" else [f"--{mode}"]
                code, stdout, _ = self.run_main(args, self.report(mode) + extra)
                self.assertEqual(code, 1)
                self.assertIn("DISALLOWED AXIOM", stdout)

    def test_focused_modes_reject_native_axioms_from_other_routes(self):
        head = "Grothe.head_check._native.native_decide.ax_1_1"
        power = "Grothe.HaagerupPower.check._native.native_decide.ax_1_1"
        for mode, foreign in [("responses", head), ("response-geometry", head),
                              ("haagerup-power", head), ("upper-comparison", power)]:
            with self.subTest(mode=mode):
                extra = f"'Test.foreignRoute' depends on axioms: [{foreign}]\n"
                self.assertEqual(self.run_main([f"--{mode}"], self.report(mode) + extra)[0], 1)

    def test_all_distinct_mode_pairs_are_rejected_in_both_orders(self):
        for first, second in itertools.permutations(MODES, 2):
            with self.subTest(first=first, second=second):
                self.assertEqual(self.run_main([f"--{first}", f"--{second}"], self.report())[0], 2)

    def test_unknown_abbreviated_and_positional_arguments_are_rejected(self):
        for arg in ("--unknown", "--response", "--haagerup-pow", "unexpected"):
            with self.subTest(arg=arg):
                self.assertEqual(self.run_main([arg], self.report())[0], 2)

    def test_saved_multiline_power_report_passes(self):
        path = ROOT / "docs/verification/haagerup-resolvent-20261025/axioms.log"
        code, stdout, stderr = self.run_main(["--haagerup-power"], path.read_text())
        self.assertEqual(code, 0, stderr)
        self.assertIn("checked 43 theorems; native_decide facts used: 1 of 1", stdout)

    def test_duplicates_apostrophes_quoted_names_and_empty_axioms_pass(self):
        extra = ("'Grothe.foo'' depends on axioms: [propext,\n Classical.choice,\n Quot.sound]\n"
                 "'Grothe.foo'' depends on axioms: [propext]\n"
                 "'Grothe.«two words»' does not depend on any axioms\n"
                 "'Test.empty' depends on axioms: []\n")
        reports = CHECKER.parse_reports(extra)
        self.assertEqual([name for name, _ in reports],
                         ["Grothe.foo'", "Grothe.foo'", "Grothe.«two words»", "Test.empty"])
        code, _, stderr = self.run_main([], "\n\t" + self.report() + extra + " \n")
        self.assertEqual(code, 0, stderr)

    def test_duplicate_with_foreign_axiom_still_fails(self):
        name = sorted(CHECKER.REQUIRED)[0]
        extra = f"'{name}' depends on axioms: [sorryAx]\n"
        self.assertEqual(self.run_main([], self.report() + extra)[0], 1)

    def test_quoted_names_can_contain_line_breaks(self):
        for separator in ("\n", "\r", "\r\n"):
            with self.subTest(separator=separator):
                name = f"ParserFixture.«two{separator}words»"
                record = f"'{name}' does not depend on any axioms\n"
                self.assertEqual(CHECKER.parse_reports(record), [(name, [])])
                code, _, stderr = self.run_main([], self.report() + record)
                self.assertEqual(code, 0, stderr)

    def test_empty_input_is_rejected(self):
        for text in ("", " \n\t"):
            with self.subTest(text=text):
                self.assertEqual(self.run_main([], text)[0], 1)

    def test_truncated_and_malformed_extra_records_are_rejected(self):
        malformed = (
            "'Extra.unchecked' depends on axioms: [sorryAx\n",
            "'Extra.unchecked' depends on axioms: [",
            "'Extra.unchecked' does not depend on any",
            "'Extra.unchecked' depends on axioms: [propext,]\n",
            "'Extra.unchecked' depends on axioms: [,propext]\n",
            "'Extra.unchecked' depends on axioms: [propext,,Quot.sound]\n",
            "'Extra.unchecked' depends on axioms: [propext Quot.sound]\n",
            "'Extra.unchecked' depends on axioms: [[propext]]\n",
            "'Extra.unchecked' does not depend on any axioms EXTRA\n",
            "'Extra.unchecked' depends on axioms: []junk\n",
            "'Malformed' junk 'Extra.unchecked' depends on axioms: []\n",
        )
        for suffix in malformed:
            with self.subTest(suffix=suffix):
                code, _, stderr = self.run_main([], self.report() + suffix)
                self.assertEqual(code, 1)
                self.assertIn("invalid axiom report", stderr)

    def test_diagnostics_before_between_or_after_records_are_rejected(self):
        diagnostics = (
            "error: failed to load module\n",
            "scratch/Axioms.lean:1:0: error: failed to load module\n",
            "PANIC at Lean.Environment: unexpected exception\n",
            "scratch/Axioms.lean:1:0: warning: declaration uses sorry\n",
            "unrecognized output\n",
        )
        first, rest = self.report().split("\n", 1)
        for diagnostic in diagnostics:
            for text in (diagnostic + self.report(), first + "\n" + diagnostic + rest,
                         self.report() + diagnostic):
                with self.subTest(diagnostic=diagnostic, text_start=text[:80]):
                    self.assertEqual(self.run_main([], text)[0], 1)

    def test_import_does_not_parse_arguments_or_read_stdin(self):
        code = ("import importlib.util, sys\n"
                "class Unreadable:\n"
                " def read(self): raise AssertionError('stdin was read during import')\n"
                "sys.stdin = Unreadable()\n"
                "sys.argv = ['check_axioms.py', '--unknown']\n"
                f"spec = importlib.util.spec_from_file_location('import_check', {str(SCRIPT)!r})\n"
                "module = importlib.util.module_from_spec(spec)\n"
                "spec.loader.exec_module(module)\n")
        result = subprocess.run([sys.executable, "-c", code], capture_output=True, text=True, check=False)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, "")
        self.assertEqual(result.stderr, "")


if __name__ == "__main__":
    unittest.main()
