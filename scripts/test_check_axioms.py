#!/usr/bin/env python3
"""Report-parser and CLI-policy regressions; no Lean invocation is needed."""
import contextlib
import importlib.util
import io
import itertools
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


SCRIPT = Path(__file__).with_name("check_axioms.py")
ROOT = SCRIPT.parent.parent
SPEC = importlib.util.spec_from_file_location("check_axioms", SCRIPT)
CHECKER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CHECKER)
GENERATOR_SPEC = importlib.util.spec_from_file_location("gen_root_imports", ROOT / "tools/gen_root_imports.py")
GENERATOR = importlib.util.module_from_spec(GENERATOR_SPEC)
GENERATOR_SPEC.loader.exec_module(GENERATOR)
MODES = ("upper-six",)


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
        headlines = {"Grothe.Statement.main_bounds", "Grothe.Statement.upper_below_tight",
                     "Grothe.Statement.shared_gate_endpoint", "Grothe.UpperSix.bound",
                     "Grothe.UpperSeven.bound", "Grothe.UpperSeven.constant_le",
                     "Grothe.UpperSeven.constant_lt_inv_gammaDagger",
                     "Grothe.LowerAnalytic.tailNodeCaps_cert",
                     "Grothe.LowerAnalytic.sharedGate_lower_of_tailNodeCaps"}
        self.assertTrue(headlines <= CHECKER.audit_policy("default")[0])
        self.assertEqual(CHECKER.audit_policy("default")[1], CHECKER.NATIVE)
        self.assertNotIn("Grothe.UpperChaos.hardy_arc_part_0._native.native_decide.ax_1_1", CHECKER.NATIVE)
        self.assertIn("Grothe.UpperChaos.HardyGaussianCheck.charts_checked._native.native_decide.ax_1_1",
                      CHECKER.NATIVE)

    def test_data_registries_preserve_topic_modes_and_local_native_facts(self):
        self.assertEqual(set(CHECKER.MODES), set(MODES))
        for mode in MODES:
            with self.subTest(mode=mode):
                path = ROOT / "data/axioms/modes" / f"{mode}.required.txt"
                self.assertEqual(CHECKER.names(path), CHECKER.audit_policy(mode)[0])
        local_native = {f"Grothe.Lower.{name}._native.native_decide.ax_1_1"
                        for name in ("certRow01", "certRow14")}
        local_native.add("Grothe.LowerAnalytic.chordsOKRow00._native.native_decide.ax_1_1")
        self.assertTrue(local_native <= CHECKER.NATIVE)

    def test_mode_lists_are_sorted_checked_and_normalized(self):
        mode_files = {str(path.relative_to(ROOT))
                      for path in (ROOT / "data/axioms/modes").glob("*.txt")}
        self.assertTrue(mode_files <= set(GENERATOR.SORTED_LISTS))
        self.assertEqual(GENERATOR.list_problems(), [])
        with tempfile.TemporaryDirectory() as directory:
            relative = "data/axioms/modes/research.required.txt"
            path = Path(directory) / relative
            path.parent.mkdir(parents=True)
            path.write_text("# focused registry\nTest.z\nTest.a\nTest.z\n")
            with patch.object(GENERATOR, "ROOT", directory), \
                    patch.object(GENERATOR, "SORTED_LISTS", [relative]), \
                    patch.object(GENERATOR, "AXIOM_REPORTS", []):
                problems = GENERATOR.list_problems()
                self.assertTrue(any("duplicate entries" in problem for problem in problems))
                self.assertTrue(any("not sorted" in problem for problem in problems))
                with contextlib.redirect_stdout(io.StringIO()):
                    GENERATOR.normalize_lists()
                self.assertEqual(GENERATOR.list_problems(), [])
                self.assertEqual(GENERATOR.entries(relative), ["Test.a", "Test.z"])

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

    def test_combined_report_rejects_native_envelope_and_mass_axioms(self):
        for name in ("Grothe.Lower.certEnvelope", "Grothe.Lower.certMassRow", "Grothe.Lower.massCapsOK"):
            with self.subTest(name=name):
                fact = f"{name}._native.native_decide.ax_1_1"
                record = f"'{name}' depends on axioms: [{fact}]\n"
                code, stdout, _ = self.run_main([], self.report() + record)
                self.assertEqual(code, 1)
                self.assertIn(f"DISALLOWED AXIOM in {name}: {fact}", stdout)

    def test_combined_report_rejects_allowed_native_fact_in_mass_row_theorems(self):
        fact = "Grothe.Lower.certRow01._native.native_decide.ax_1_1"
        self.assertIn(fact, CHECKER.NATIVE)
        for name in ("Grothe.Lower.certMassRow", "Grothe.Lower.mass_law_bound"):
            with self.subTest(name=name):
                self.assertIn(name, CHECKER.REQUIRED)
                record = f"'{name}' depends on axioms: [propext, {fact}]\n"
                code, stdout, _ = self.run_main([], self.report() + record)
                self.assertEqual(code, 1)
                self.assertIn(f"DISALLOWED AXIOM in {name}: {fact}", stdout)

    def test_upper_six_rejects_native_fact_allowed_by_combined_report(self):
        fact = "Grothe.Lower.certRow01._native.native_decide.ax_1_1"
        record = f"'Grothe.UpperSix.bound' depends on axioms: [{fact}]\n"
        self.assertEqual(self.run_main([], self.report() + record)[0], 0)
        code, stdout, _ = self.run_main(["--upper-six"], self.report("upper-six") + record)
        self.assertEqual(code, 1)
        self.assertIn(f"DISALLOWED AXIOM in Grothe.UpperSix.bound: {fact}", stdout)

    def test_upper_six_requires_its_native_policy_file(self):
        theorem = "Grothe.UpperSix.bound"
        report = f"'{theorem}' does not depend on any axioms\n"
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "modes").mkdir()
            (root / "modes/upper-six.required.txt").write_text(theorem + "\n", encoding="utf-8")
            (root / "native.txt").write_text("Test.globalNative\n", encoding="utf-8")
            with patch.object(CHECKER, "AXDIR", root):
                code, _, stderr = self.run_main(["--upper-six"], report)
        self.assertEqual(code, 1)
        self.assertIn("upper-six.native.txt", stderr)

    def test_all_distinct_mode_pairs_are_rejected_in_both_orders(self):
        for first, second in itertools.permutations(MODES, 2):
            with self.subTest(first=first, second=second):
                self.assertEqual(self.run_main([f"--{first}", f"--{second}"], self.report())[0], 2)

    def test_unknown_abbreviated_and_positional_arguments_are_rejected(self):
        for arg in ("--unknown", "--response", "--haagerup-pow", "--phase", "--rese", "--hardy",
                    "--refined", "--law", "unexpected"):
            with self.subTest(arg=arg):
                self.assertEqual(self.run_main([arg], self.report())[0], 2)

    def test_multiline_standard_report_passes(self):
        text = self.report().replace("[propext, Classical.choice, Quot.sound]",
                                     "[propext,\n Classical.choice,\n Quot.sound]")
        self.assertEqual(self.run_main([], text)[0], 0)

    def test_archived_mode_is_not_an_active_policy(self):
        for arg in ("--haagerup-power", "--upper-comparison", "--hardy-budget"):
            with self.subTest(arg=arg):
                self.assertEqual(self.run_main([arg], self.report())[0], 2)

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

    def test_each_topic_mode_keeps_strict_report_consumption(self):
        for mode in MODES:
            for extra in ("error: failed to load module\n",
                          "'Extra.unchecked' depends on axioms: [sorryAx\n",
                          "'Extra.unchecked' depends on axioms: []junk\n"):
                with self.subTest(mode=mode, extra=extra):
                    self.assertEqual(self.run_main([f"--{mode}"], self.report(mode) + extra)[0], 1)

    def test_default_mode_keeps_strict_report_consumption(self):
        for extra in ("error: failed to load module\n",
                      "'Extra.unchecked' depends on axioms: [sorryAx\n",
                      "'Extra.unchecked' depends on axioms: []junk\n"):
            with self.subTest(extra=extra):
                self.assertEqual(self.run_main([], self.report() + extra)[0], 1)

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
