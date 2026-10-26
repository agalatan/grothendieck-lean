#!/usr/bin/env python3
"""Strictly verify the scalar-tail Lean report and its registry bindings.

This checks an existing report; it does not compile Lean. The complete input
must contain exactly the sixteen scalar-tail results, using only the
repository's standard axioms and the single generated native power fact.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PREFIX = "Grothe.ScalarTailRefinement."
EXPECTED = {PREFIX + name for name in (
    "power_check", "norm_P", "degree_P", "norm_power",
    "compTerm_arbitrary_power_bound", "supported_composition_arbitrary_power_bound",
    "outer_composition_saving", "outer_composition_bound", "branch5_outer_bound",
    "ledger_acceptance", "score_acceptance", "normalized_score_of_published_budgets",
    "refined_score_of_published_inputs",
    "wallis_rational_check", "wallis_tail_bound", "refined_score_of_published_budgets",
)}
NATIVE = PREFIX + "power_check._native.native_decide.ax_1_1"
STANDARD_ONLY = {PREFIX + "wallis_rational_check", PREFIX + "wallis_tail_bound"}


def load_checker():
    path = ROOT / "scripts/check_axioms.py"
    spec = importlib.util.spec_from_file_location("scalar_tail_report_checker", path)
    if spec is None or spec.loader is None:
        raise ValueError("cannot load the repository axiom checker")
    checker = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(checker)
    return checker


def verify_report(text, checker):
    required, native = checker.audit_policy("default")
    registered = {name for name in required if name.startswith(PREFIX)}
    if registered != EXPECTED:
        raise ValueError("scalar-tail required registry differs from the sixteen expected results")
    registered_native = {name for name in native if name.startswith(PREFIX)}
    if registered_native != {NATIVE}:
        raise ValueError("scalar-tail native registry must contain exactly the generated power axiom")

    reports = checker.parse_reports(text)
    names = [name for name, _ in reports]
    if len(names) != len(set(names)):
        raise ValueError("duplicate theorem names in scalar-tail report")
    missing, extra = EXPECTED - set(names), set(names) - EXPECTED
    if missing or extra:
        raise ValueError(f"report theorem set differs: missing={sorted(missing)}, extra={sorted(extra)}")
    allowed = checker.STANDARD | {NATIVE}
    disallowed = [(name, axiom) for name, axioms in reports for axiom in axioms if axiom not in allowed]
    if disallowed:
        raise ValueError(f"disallowed scalar-tail axioms: {disallowed}")
    if any(name in STANDARD_ONLY and not set(axioms) <= checker.STANDARD
           for name, axioms in reports):
        raise ValueError("Wallis proofs must use only standard axioms")
    observed = {axiom for _, axioms in reports for axiom in axioms if axiom not in checker.STANDARD}
    if observed != {NATIVE}:
        raise ValueError("the generated native power axiom was not observed")
    return {"status": "PASS_STRICT_SCALAR_TAIL_LEAN_REPORT", "theorems": len(reports),
            "native_facts_observed": sorted(observed), "required_registry_matches": True,
            "native_registry_matches": True, "wallis_standard_axioms_only": True,
            "scope": "Existing axiom report and registry consistency only; no Lean compilation performed."}


def main():
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument("report", type=Path, nargs="?", default=HERE / "production-axioms.log")
    arguments = parser.parse_args()
    try:
        contents = arguments.report.read_text(encoding="utf-8")
        result = verify_report(contents, load_checker())
        result["report"] = str(arguments.report.resolve())
        result["report_sha256"] = hashlib.sha256(contents.encode("utf-8")).hexdigest()
        print(json.dumps(result, indent=2))
    except (OSError, ValueError) as error:
        print(f"FAIL {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
