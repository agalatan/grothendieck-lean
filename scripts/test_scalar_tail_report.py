#!/usr/bin/env python3
"""Regressions for the scalar-tail kernel-only trust policy; no Lean build.

Agent-ID: codex-9f31
"""
import importlib.util
from pathlib import Path
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / "data/scalar-tail-refinement/verification/verify_lean_report.py"
SPEC = importlib.util.spec_from_file_location("scalar_tail_report", SCRIPT)
VERIFIER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(VERIFIER)
CHECKER = VERIFIER.load_checker()
POWER_CHECK = VERIFIER.PREFIX + "power_check"
OLD_NATIVE = POWER_CHECK + "._native.native_decide.ax_1_1"
FOREIGN_NATIVE = "Grothe.HaagerupPower.check._native.native_decide.ax_1_1"


class ScalarTailReportTests(unittest.TestCase):
    def records(self):
        return {name: ([] if name == POWER_CHECK else sorted(CHECKER.STANDARD))
                for name in VERIFIER.EXPECTED}

    def render(self, records=None):
        if records is None:
            records = self.records()
        return "".join(
            f"'{name}' depends on axioms: [{', '.join(axioms)}]\n" if axioms else
            f"'{name}' does not depend on any axioms\n"
            for name, axioms in sorted(records.items()))

    def verify(self, text, required=None, native=None):
        # Exercise the real strict parser independently of concurrent registry edits.
        policy = (set(VERIFIER.EXPECTED) if required is None else required,
                  {FOREIGN_NATIVE} if native is None else native)
        with patch.object(CHECKER, "audit_policy", return_value=policy):
            return VERIFIER.verify_report(text, CHECKER)

    def test_complete_standard_only_report_passes(self):
        result = self.verify(self.render())
        self.assertEqual(result["theorems"], 16)
        self.assertEqual(result["native_facts_observed"], [])
        self.assertTrue(result["all_standard_axioms_only"])

    def test_empty_axiom_lists_and_multiline_records_pass(self):
        text = self.render().replace("does not depend on any axioms", "depends on axioms: []")
        text = text.replace(", ", ",\n ", 1)
        self.assertEqual(self.verify(text)["theorems"], 16)
        all_empty = self.render({name: [] for name in VERIFIER.EXPECTED})
        self.assertEqual(self.verify(all_empty)["theorems"], 16)

    def test_native_registry_reintroduction_is_rejected(self):
        for native in (OLD_NATIVE, VERIFIER.PREFIX + "newNative._native.native_decide.ax_1_1"):
            with self.subTest(native=native), self.assertRaisesRegex(ValueError, "registry must be empty"):
                self.verify(self.render(), native={native})

    def test_required_registry_must_match_exactly(self):
        for required in (VERIFIER.EXPECTED - {POWER_CHECK},
                         VERIFIER.EXPECTED | {VERIFIER.PREFIX + "unexpected"}):
            with self.subTest(required=required), self.assertRaisesRegex(ValueError, "required registry"):
                self.verify(self.render(), required=required)

    def test_nonstandard_axioms_are_rejected_in_every_result(self):
        for name in VERIFIER.EXPECTED:
            for axiom in (OLD_NATIVE, FOREIGN_NATIVE, "sorryAx"):
                with self.subTest(name=name, axiom=axiom):
                    records = self.records()
                    records[name] = [axiom]
                    with self.assertRaisesRegex(ValueError, "disallowed scalar-tail axioms"):
                        self.verify(self.render(records))

    def test_actual_repository_policy_accepts_standard_axioms_for_power_check(self):
        records = self.records()
        records[POWER_CHECK] = sorted(CHECKER.STANDARD)
        result = VERIFIER.verify_report(self.render(records), CHECKER)
        self.assertEqual(result["theorems"], 16)
        self.assertEqual(result["native_facts_observed"], [])
        self.assertTrue(result["required_registry_matches"])
        self.assertTrue(result["native_registry_matches"])

    def test_missing_extra_and_duplicate_results_are_rejected(self):
        records = self.records()
        del records[POWER_CHECK]
        extra = "'Unrelated.result' does not depend on any axioms\n"
        duplicate = f"'{POWER_CHECK}' does not depend on any axioms\n"
        for text in (self.render(records), self.render() + extra, self.render() + duplicate):
            with self.subTest(text=text), self.assertRaises(ValueError):
                self.verify(text)

    def test_empty_malformed_and_diagnostic_inputs_are_rejected(self):
        for text in ("", " \n\t",
                     self.render() + "'Unfinished.result' depends on axioms: [propext\n",
                     self.render().replace("Classical.choice,", "Classical.choice,,", 1),
                     "error: unknown identifier\n" + self.render(),
                     self.render() + "warning: declaration uses sorry\n",
                     self.render() + "unexpected trailing output\n"):
            with self.subTest(text=text), self.assertRaises(ValueError):
                self.verify(text)


if __name__ == "__main__":
    unittest.main()
