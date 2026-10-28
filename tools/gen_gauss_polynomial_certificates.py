#!/usr/bin/env python3
"""Render finite Gauss polynomial witnesses for LeanCert kernel replay.

The JSON is untrusted input. Generated proofs use `decide +kernel` and the
QPoly semantic bridge; Python does not discharge any Lean obligation.
Agent-ID: codex-2ca4.
"""
from __future__ import annotations

import argparse
from fractions import Fraction
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "data/gauss-polynomial-certificates/certificate.json"
OUT = ROOT / "Grothe/UpperChaos"
BASE = "Grothe.UpperChaos"
NS = f"{BASE}.Q0GaussExactness.QPolyCertificates"
ORDERS = range(1, 65)


def coefficients(value: dict) -> list[Fraction]:
    if set(value) != {"denominator", "numerators"}:
        raise ValueError("unexpected polynomial fields")
    denominator = int(value["denominator"])
    if denominator <= 0:
        raise ValueError("polynomial denominator must be positive")
    nums = [int(n) for n in value["numerators"]]
    if nums and nums[-1] == 0:
        raise ValueError("polynomial must not have trailing zero coefficients")
    return [Fraction(n, denominator) for n in nums]


def literal(q: Fraction) -> str:
    if q.denominator == 1:
        return str(q.numerator)
    return f"({q.numerator} / {q.denominator})"


def polynomial(name: str, value: dict) -> str:
    coeffs = coefficients(value)
    rows = [", ".join(literal(c) for c in coeffs[i:i + 4])
            for i in range(0, len(coeffs), 4)]
    body = ",\n  ".join(rows)
    return f"def {name} : QPoly := ⟨#[{body}]⟩\n"


def header(digest: str) -> str:
    return ("/-! Generated from exact rational witnesses; Lean must check every proof.\n"
            f"Input SHA256: {digest}\n"
            "Regenerate with tools/gen_gauss_polynomial_certificates.py.\n"
            "Agent-ID: codex-2ca4. -/\n")


def theorem_statement(n: int, name: str) -> str:
    return f"""theorem {name}
    (node : Fin {n} → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) {n - 1}).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < {2 * n}) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        (({n} : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) {n - 1}).1) ^ 2)) *
        f.eval (node i) := by
"""


def render(data: dict, digest: str) -> dict[Path, str]:
    rows = data["witnesses"]
    if data["degrees"] != [1, 64] or [r["n"] for r in rows] != list(ORDERS):
        raise ValueError("expected each order 1 through 64 exactly once")
    for row in rows:
        n = row["n"]
        if len(coefficients(row["P"])) != n + 1:
            raise ValueError(f"unexpected coefficient count for order {n}")
        for key in ("W", "R"):
            coefficients(row[key])
    result: dict[Path, str] = {}
    data_text = ("import LeanCert.Engine.Algebra.QPoly\n\n" + header(digest)
                 + "\nopen LeanCert.Engine\n\n"
                 + f"namespace {BASE}.Q0GaussPolynomialData\n\n"
                 + polynomial("p00", data["P0"]) + "\n")
    for row in rows:
        n = row["n"]
        for key, prefix in (("P", "p"), ("W", "w"), ("R", "r")):
            data_text += polynomial(f"{prefix}{n:02}", row[key]) + "\n"
    data_text += f"end {BASE}.Q0GaussPolynomialData\n"
    result[OUT / "Q0GaussPolynomialData.lean"] = data_text

    for n in ORDERS:
        module = f"Q0GaussPolynomialOrder{n:02}"
        row = rows[n - 1]
        leading = literal(Fraction(row["leading_coefficient"]))
        text = (f"import {BASE}.Q0GaussQPoly\n"
                f"import {BASE}.Q0GaussPolynomialData\n\n" + header(digest)
                + f"\nnamespace {BASE}.{module}\n\n"
                + "open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData\n\n")
        if n > 1:
            text += f"""theorem recurrence_checked :
    checkEq p{n:02} (recurrenceStep {n - 2} p{n - 2:02} p{n - 1:02}) = true := by
  decide +kernel

"""
        text += f"""theorem identities_checked :
    check {n - 1} p{n - 1:02} p{n:02} w{n:02} r{n:02} = true := by
  decide +kernel

theorem square_integral_checked :
    (p{n:02}.mul p{n:02}).integralRat (-1) 1 = (2 / {2 * n + 1} : ℚ) := by
  decide +kernel

theorem leading_coefficient_checked :
    coeff p{n:02} {n} = ({leading} : ℚ) := by
  decide +kernel

end {BASE}.{module}
"""
        result[OUT / f"{module}.lean"] = text

    assembled = "".join(f"import {BASE}.Q0GaussPolynomialOrder{n:02}\n" for n in ORDERS)
    assembled += ("\n" + header(digest) + "\nopen Polynomial MeasureTheory\n\n"
                  + f"namespace {BASE}.Q0GaussPolynomialCertificates\n\n"
                  + "open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData\n\n")
    for n in ORDERS:
        assembled += f"theorem source{n:02} : SourcePair {n - 1} p{n - 1:02} p{n:02} :=\n"
        if n == 1:
            assembled += "  sourcePair_zero\n\n"
        else:
            assembled += (f"  sourcePair_step {n - 2} p{n - 2:02} p{n - 1:02} p{n:02}\n"
                          f"    source{n - 1:02} Q0GaussPolynomialOrder{n:02}.recurrence_checked\n\n")
        assembled += theorem_statement(n, f"exactness{n:02}")
        # Real's literal one and the natural cast of one need an explicit bridge.
        proof = "simpa only [Nat.cast_one] using" if n == 1 else "exact"
        assembled += (f"  {proof} actual_exactness_of_check {n - 1} p{n - 1:02} p{n:02} w{n:02} r{n:02}\n"
                      f"    source{n:02} Q0GaussPolynomialOrder{n:02}.identities_checked\n"
                      "    node hinj hroot f hf\n\n")
    assembled += """/-- Every order used by the production rule, with finite polynomial inputs discharged. -/
theorem exactness (k : Fin 64)
    (node : Fin (k.val + 1) → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) k.val).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 2 * (k.val + 1)) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        (((k.val + 1 : ℕ) : ℝ) ^ 2 *
          ((Q0LegendreInteger.realPair (node i) k.val).1) ^ 2)) * f.eval (node i) := by
  fin_cases k
"""
    for n in ORDERS:
        proof = "simpa only [Nat.cast_one] using" if n == 1 else "exact"
        assembled += f"  · {proof} exactness{n:02} node hinj hroot f hf\n"
    assembled += f"\nend {BASE}.Q0GaussPolynomialCertificates\n"
    result[OUT / "Q0GaussPolynomialCertificates.lean"] = assembled

    audit = (f"import {BASE}.Q0GaussPolynomialCertificates\n"
             "import Lean.Util.CollectAxioms\nimport Lean.Elab.Command\n\n"
             + header(digest) + "\nopen Lean Elab Command\nrun_cmd do\n"
             "  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]\n"
             "  let targets : Array Name := #[\n")
    names = []
    for n in ORDERS:
        if n > 1:
            names.append(f"{BASE}.Q0GaussPolynomialOrder{n:02}.recurrence_checked")
        names.extend([f"{BASE}.Q0GaussPolynomialOrder{n:02}.identities_checked",
                      f"{BASE}.Q0GaussPolynomialOrder{n:02}.square_integral_checked",
                      f"{BASE}.Q0GaussPolynomialOrder{n:02}.leading_coefficient_checked",
                      f"{BASE}.Q0GaussPolynomialCertificates.exactness{n:02}"])
    names.append(f"{BASE}.Q0GaussPolynomialCertificates.exactness")
    audit += ",\n".join(f"    ``{name}" for name in names) + "]\n"
    audit += """  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Finite Gauss certificate audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
"""
    result[OUT / "Q0GaussPolynomialCertificatesAudit.lean"] = audit
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    raw = INPUT.read_bytes()
    files = render(json.loads(raw), hashlib.sha256(raw).hexdigest())
    if args.check:
        mismatched = [str(p.relative_to(ROOT)) for p, t in files.items()
                      if not p.exists() or p.read_text() != t]
        if mismatched:
            raise SystemExit("Generated files differ:\n" + "\n".join(mismatched))
        print(f"All {len(files)} Gauss certificate files match their exact inputs.")
    else:
        for path, text in files.items():
            path.write_text(text)
        print(f"Generated {len(files)} Lean files; Lean verification is still required.")


if __name__ == "__main__":
    main()
