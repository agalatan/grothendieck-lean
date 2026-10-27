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
MODES = ("responses", "response-geometry", "haagerup-power", "upper-comparison",
         "phase-response", "research", "hardy-budget", "refined-cover", "law-nodes")


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
            "default": {"Grothe.fresh_upper", "Grothe.haagerup_bound", "Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data"},
            "responses": {"Grothe.LowerAnalytic.ResponseGram.gram_qform",
                          "Grothe.LowerAnalytic.DiffuseCubicObstruction.above_target"},
            "response-geometry": {"Grothe.LowerAnalytic.DiffuseCubicObstruction.above_target"},
            "haagerup-power": {"Grothe.HaagerupCanonical.upper"},
            "upper-comparison": {"Grothe.fresh_upper"},
            "phase-response": {"Grothe.Upper.ResponseGeometry.full_energy_comparison",
                               "Grothe.HaagerupPhaseGeometry.harmonic_lower"},
        }
        for mode, expected in headlines.items():
            with self.subTest(mode=mode):
                self.assertTrue(expected <= CHECKER.audit_policy(mode)[0])
        self.assertIn("Grothe.LowerAnalytic.lower_bound_of_capsRest", CHECKER.audit_policy("default")[0])
        self.assertEqual(CHECKER.audit_policy("default")[1], CHECKER.NATIVE)
        for mode in ("responses", "response-geometry", "phase-response"):
            self.assertEqual(CHECKER.audit_policy(mode)[1], set())
        self.assertEqual(CHECKER.audit_policy("phase-response")[0], CHECKER.PHASE_RESPONSE)
        self.assertTrue(CHECKER.PHASE_RESPONSE <= CHECKER.audit_policy("default")[0])
        self.assertEqual(CHECKER.audit_policy("haagerup-power")[1],
                         set())
        self.assertEqual(CHECKER.audit_policy("upper-comparison")[1],
                         {"Grothe.head_check._native.native_decide.ax_1_1",
                          "Grothe.Upper.comparison_check._native.native_decide.ax_1_1",
                          *(f"Grothe.UpperChaos.phi_cover_check_{j}._native.native_decide.ax_1_1" for j in range(6)),
                          *(f"Grothe.UpperChaos.hardy_arc_part_{j}._native.native_decide.ax_1_1" for j in range(4)),
                          "Grothe.UpperChaos.hardy_region_check._native.native_decide.ax_1_1"})

    def test_topic_policies_preserve_required_families(self):
        for mode, expected in (("research", CHECKER.RESEARCH_CORE),
                               ("hardy-budget", CHECKER.HARDY_BUDGET),
                               ("refined-cover", CHECKER.REFINED_LOWER),
                               ("law-nodes", CHECKER.LAW_NODES)):
            with self.subTest(mode=mode):
                required,native=CHECKER.audit_policy(mode)
                self.assertEqual(required, expected)
                self.assertTrue(expected <= CHECKER.REQUIRED)
                self.assertEqual(native, set() if mode == "research" else CHECKER.NATIVE)

    def test_data_registries_preserve_topic_modes_and_local_native_facts(self):
        self.assertEqual(set(CHECKER.MODES), set(MODES))
        for mode in MODES:
            with self.subTest(mode=mode):
                path = ROOT / "data/axioms/modes" / f"{mode}.required.txt"
                self.assertEqual(CHECKER.names(path), CHECKER.audit_policy(mode)[0])
        research_native = ROOT / "data/axioms/modes/research.native.txt"
        self.assertTrue(research_native.is_file())
        self.assertEqual(CHECKER.names(research_native), set())
        local_native = {f"Grothe.Research.RefinedLowerCheck.{name}._native.native_decide.ax_1_1"
                        for name in ("certRefinedBoxes0", "certRefinedBoxes1", "certRefinedBoxes2",
                                     "certRefinedBoxes3", "certRefinedPartition")}
        local_native.add("Grothe.Research.LawNodeCheck.certLawNodes._native.native_decide.ax_1_1")
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

    def test_focused_modes_reject_native_axioms_from_other_routes(self):
        head = "Grothe.head_check._native.native_decide.ax_1_1"
        power = "Grothe.HaagerupPower.check._native.native_decide.ax_1_1"
        for mode, foreign in [("responses", head), ("response-geometry", head),
                              ("phase-response", head), ("research", head),
                              ("haagerup-power", head), ("haagerup-power", power), ("upper-comparison", power)]:
            with self.subTest(mode=mode):
                extra = f"'Test.foreignRoute' depends on axioms: [{foreign}]\n"
                self.assertEqual(self.run_main([f"--{mode}"], self.report(mode) + extra)[0], 1)

    def test_all_distinct_mode_pairs_are_rejected_in_both_orders(self):
        for first, second in itertools.permutations(MODES, 2):
            with self.subTest(first=first, second=second):
                self.assertEqual(self.run_main([f"--{first}", f"--{second}"], self.report())[0], 2)

    def test_unknown_abbreviated_and_positional_arguments_are_rejected(self):
        for arg in ("--unknown", "--response", "--haagerup-pow", "--phase", "--rese", "--hardy",
                    "--refined", "--law", "unexpected"):
            with self.subTest(arg=arg):
                self.assertEqual(self.run_main([arg], self.report())[0], 2)

    def test_saved_multiline_power_report_passes(self):
        path = ROOT / "docs/verification/haagerup-canonical-20261026/axioms.log"
        text = path.read_text()
        reports = CHECKER.parse_reports(text)
        self.assertEqual(len(reports), 96)
        # Preserve the historical multiline fixture while testing today's policy.
        required, _ = CHECKER.audit_policy("haagerup-power")
        missing = required - {name for name, _ in reports}
        text += "".join(f"'{name}' depends on axioms: [propext, Classical.choice, Quot.sound]\n"
                        for name in sorted(missing))
        code, stdout, stderr = self.run_main(["--haagerup-power"], text)
        self.assertEqual(code, 0, stderr)
        self.assertIn(f"checked {96 + len(missing)} theorems; native_decide facts used: 0 of 0", stdout)

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
        for mode in ("research", "hardy-budget", "refined-cover", "law-nodes"):
            for extra in ("error: failed to load module\n",
                          "'Extra.unchecked' depends on axioms: [sorryAx\n",
                          "'Extra.unchecked' depends on axioms: []junk\n"):
                with self.subTest(mode=mode, extra=extra):
                    self.assertEqual(self.run_main([f"--{mode}"], self.report(mode) + extra)[0], 1)

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
