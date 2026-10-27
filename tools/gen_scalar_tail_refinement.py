#!/usr/bin/env python3
"""Verify exact scalar-tail arithmetic and render its Lean certificate.

Only Python's standard library is used. Polynomial powers are computed by
integer convolution after clearing one common denominator. This verifies
the finite power norm and rational ledger; the paper's analytic inputs are
explicit hypotheses in Lean and are not established by parsing this JSON.
"""
from __future__ import annotations

import argparse
import copy
from fractions import Fraction
import json
import math
from pathlib import Path
import re
import sys


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data/scalar-tail-refinement/certificate.json"
TEMPLATE = ROOT / "tools/templates/scalar_tail_refinement.lean.in"
OUTPUT = ROOT / "Grothe/Haagerup/ScalarTailRefinement.lean"


def rational(value: object, name: str) -> Fraction:
    """Require a canonical exact rational string, never a JSON float."""
    if not isinstance(value, str) or not re.fullmatch(r"-?\d+(?:/\d+)?", value):
        raise ValueError(f"{name}: expected an exact rational string")
    result = Fraction(value)
    if str(result) != value:
        raise ValueError(f"{name}: rational string is not canonical")
    return result


def natural(value: object, name: str, *, positive: bool = False) -> int:
    if type(value) is not int or value < int(positive):
        raise ValueError(f"{name}: expected a {'positive ' if positive else ''}natural number")
    return value


def convolve(left: list[int], right: list[int]) -> list[int]:
    """Exact, sequential integer polynomial multiplication."""
    result = [0] * (len(left) + len(right) - 1)
    for i, a in enumerate(left):
        if a:
            for j, b in enumerate(right):
                if b:
                    result[i + j] += a * b
    return result


def exact_power_norm(coefficients: list[Fraction], power: int) -> Fraction:
    denominator = math.lcm(*(x.denominator for x in coefficients))
    integers = [x.numerator * (denominator // x.denominator) for x in coefficients]
    result = [1]
    for _ in range(power):
        result = convolve(result, integers)
    return Fraction(sum(abs(x) for x in result), denominator**power)


def weighted_phase_tail(ratio: Fraction, power: int, start: int, split: int) -> Fraction:
    """Finite indexed power savings followed by the proved Haagerup tail majorant."""
    coefficient = Fraction(1)
    finite = Fraction(0)
    for k in range(split):
        if k >= start:
            finite += coefficient * ratio**((2*k + 1)//power)
        coefficient *= Fraction((2*k + 1)**2, 4*(k + 1)*(k + 2))
    majorant = coefficient * (split + 1)*(2*split + 1)
    suffix = ratio**((2*split + 1)//power) * majorant/(2*split)
    return Fraction(355, 113)/4 * (finite + suffix)


def verify(certificate: dict) -> dict:
    """Fail closed before rendering if any exact arithmetic check fails."""
    expected = {"schema_version", "P", "power", "ratio", "outer_start", "quotient",
                "wallis_denominator", "weighted_split", "reciprocal_claim", "paper_budgets",
                "exact_arithmetic", "provenance", "scope"}
    if set(certificate) != expected or certificate["schema_version"] != 2:
        raise ValueError("unsupported scalar-tail certificate schema")
    raw = certificate["P"]
    if not isinstance(raw, list) or len(raw) != 38:
        raise ValueError("P: expected the complete 38-coefficient scalar polynomial")
    coefficients = [rational(x, f"P[{i}]") for i, x in enumerate(raw)]
    if coefficients[-1] == 0:
        raise ValueError("P: trailing zero contradicts the degree bound")
    power = natural(certificate["power"], "power", positive=True)
    start = natural(certificate["outer_start"], "outer_start", positive=True)
    quotient = natural(certificate["quotient"], "quotient")
    wallis = natural(certificate["wallis_denominator"], "wallis_denominator", positive=True)
    split = natural(certificate["weighted_split"], "weighted_split", positive=True)
    if split <= start:
        raise ValueError("weighted_split: must follow the first omitted outer index")
    if quotient != (2 * start + 1) // power:
        raise ValueError("quotient: inconsistent with the first omitted outer power")
    if wallis != 4 * start:
        raise ValueError("wallis_denominator: expected four times outer_start")
    ratio = rational(certificate["ratio"], "ratio")
    if not 0 < ratio < 1:
        raise ValueError("ratio: expected a strict contraction between zero and one")
    polynomial_norm = sum(abs(x) for x in coefficients)
    if polynomial_norm > 1:
        raise ValueError("P: Wiener norm exceeds one")
    power_norm = exact_power_norm(coefficients, power)
    if power_norm > ratio:
        raise ValueError("ratio: exact polynomial power norm exceeds the proposed cap")

    budget_names = {"branch5_weight", "slope_lower", "prefix_upper", "finite67_upper",
                    "other_tails_upper", "selector_mass"}
    if set(certificate["paper_budgets"]) != budget_names:
        raise ValueError("paper_budgets: missing or unexpected budget")
    budgets = {key: rational(value, key) for key, value in certificate["paper_budgets"].items()}
    if any(value < 0 for value in budgets.values()) or budgets["selector_mass"] == 0:
        raise ValueError("paper_budgets: nonnegative budgets and positive selector mass required")
    outer_bound = weighted_phase_tail(ratio, power, start, split)
    reserve = budgets["branch5_weight"] * outer_bound
    residual = (budgets["prefix_upper"] + budgets["finite67_upper"]
                + budgets["other_tails_upper"] + reserve)
    score = (budgets["slope_lower"] - residual) / budgets["selector_mass"]
    claim = rational(certificate["reciprocal_claim"], "reciprocal_claim")
    if claim <= 0 or score <= 0 or claim * score <= 1:
        raise ValueError("reciprocal_claim: exact normalized score does not meet the claim")
    arithmetic = {"P_l1": polynomial_norm, "power_l1": power_norm,
                  "weighted_outer_bound": outer_bound,
                  "outer_reserve": reserve, "residual_upper": residual, "score_lower": score}
    if set(certificate["exact_arithmetic"]) != set(arithmetic):
        raise ValueError("exact_arithmetic: missing or unexpected receipt field")
    for name, value in arithmetic.items():
        if rational(certificate["exact_arithmetic"][name], name) != value:
            raise ValueError(f"exact_arithmetic: {name} does not match independent recomputation")

    provenance = certificate["provenance"]
    for key in ("paper_url", "upstream_repository_url", "coefficient_source_url"):
        if not isinstance(provenance[key], str) or not provenance[key].startswith("https://"):
            raise ValueError(f"provenance: {key} must be a direct HTTPS source")
    commit = provenance["upstream_commit"]
    if not re.fullmatch(r"[0-9a-f]{40}", commit):
        raise ValueError("provenance: invalid pinned upstream commit")
    if f"/blob/{commit}/" not in provenance["coefficient_source_url"]:
        raise ValueError("provenance: coefficient source is not pinned to the stated commit")
    if not re.fullmatch(r"[0-9a-f]{64}", provenance["coefficient_source_sha256"]):
        raise ValueError("provenance: invalid coefficient source SHA-256")
    if not certificate["scope"]:
        raise ValueError("scope: an explicit analytic-input limitation is required")
    return {"status": "PASS_EXACT_SCALAR_TAIL_ARITHMETIC", "coefficient_count": len(coefficients),
            "degree": len(coefficients) - 1, "power": power,
            "power_degree": power * (len(coefficients) - 1),
            "power_norm": str(power_norm), "power_cap": str(ratio),
            "outer_start": start, "quotient": quotient, "weighted_split": split,
            "weighted_outer_bound": str(outer_bound), "outer_reserve": str(reserve),
            "residual_upper": str(residual), "score_lower": str(score),
            "reciprocal_claim": str(claim), "strict_product_margin": str(claim * score - 1),
            "scope": "Exact finite arithmetic only; published scalar analytic inputs remain hypotheses."}


def generate(certificate: dict, template: str) -> tuple[str, dict]:
    receipt = verify(certificate)
    budget = certificate["paper_budgets"]
    substitutions = {
        "PL": ",\n  ".join(certificate["P"]), "RATIO": certificate["ratio"],
        "POWER": str(certificate["power"]), "START": str(certificate["outer_start"]),
        "WEIGHTED_SPLIT": str(certificate["weighted_split"]),
        "WALLIS_DENOMINATOR": str(certificate["wallis_denominator"]),
        "DEGREE": str(receipt["degree"]), "CUTOFF": str(receipt["power_degree"] + 1),
        "WEIGHT": budget["branch5_weight"], "SLOPE": budget["slope_lower"],
        "PREFIX": budget["prefix_upper"], "FINITE": budget["finite67_upper"],
        "OTHER": budget["other_tails_upper"], "MASS": budget["selector_mass"],
        "CLAIM": certificate["reciprocal_claim"],
    }
    markers = set(re.findall(r"@([A-Z_]+)@", template))
    if markers != set(substitutions):
        raise ValueError("template: missing or unexpected substitution marker")
    for key, value in substitutions.items():
        template = template.replace(f"@{key}@", value)
    if re.search(r"@[A-Z_]+@", template):
        raise ValueError("template: unresolved substitution marker")
    return template, receipt


def self_test(certificate: dict) -> dict:
    assert convolve([2, -3], [1, 4]) == [2, 5, -12]
    verify(certificate)
    for key, value in (("ratio", "1/100"), ("reciprocal_claim", "1"),
                       ("quotient", certificate["quotient"] + 1),
                       ("weighted_split", certificate["outer_start"])):
        bad = copy.deepcopy(certificate)
        bad[key] = value
        try:
            verify(bad)
        except ValueError:
            continue
        raise AssertionError(f"negative control accepted invalid {key}")
    return {"status": "PASS", "controls": ["exact_integer_convolution", "canonical_certificate",
            "reject_understated_power_cap", "reject_unmet_reciprocal", "reject_wrong_quotient",
            "reject_invalid_weighted_split"]}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify arithmetic and byte-for-byte generated Lean")
    parser.add_argument("--self-test", action="store_true", help="Run exact positive and negative controls")
    parser.add_argument("--data", type=Path, default=DATA)
    parser.add_argument("--template", type=Path, default=TEMPLATE)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    arguments = parser.parse_args()
    try:
        certificate = json.loads(arguments.data.read_text(encoding="utf-8"))
        if arguments.self_test:
            print(json.dumps(self_test(certificate), sort_keys=True))
            return
        output, receipt = generate(certificate, arguments.template.read_text(encoding="utf-8"))
        if arguments.check:
            if not arguments.output.exists() or arguments.output.read_text(encoding="utf-8") != output:
                raise ValueError("generated Lean certificate is stale or missing")
            print("PASS exact scalar-tail arithmetic and byte-for-byte generated Lean")
        else:
            arguments.output.parent.mkdir(parents=True, exist_ok=True)
            arguments.output.write_text(output, encoding="utf-8")
            print(json.dumps(receipt, sort_keys=True))
    except (ValueError, KeyError, TypeError, OSError, ZeroDivisionError) as error:
        print(f"FAIL {error}", file=sys.stderr)
        raise SystemExit(1) from error


if __name__ == "__main__":
    main()
