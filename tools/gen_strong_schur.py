#!/usr/bin/env python3
"""Reproduce and check the exact polynomial coefficients in StrongSchur.lean.

Reads the committed headers of `row08` (`Grothe/Lower/RowData08.lean`) and
`row09` (`Grothe/Lower/RowData09.lean`), forms their mixed Schur gate on
`t ∈ [0, 1]` as in `Grothe/Lower/WeightedSchur.lean`, computes the degree-6
Bernstein curvature floor `2019911 / 10^10`, and emits or checks the generated
block in `Grothe/LowerAnalytic/StrongSchur.lean:59-63`:

  - `DenP = D = a*c - b^2` (degree 2, 3 coefficients)
  - `NumP = N = (n - B)*D - c*x^2 + 2*b*x*y - a*y^2` (degree 3, 4 coefficients)
  - `curvature = floor(min_i B_6(-g'' * D^3)_i / B_6(2 * D^3)_i * 10^10) / 10^10`
  - `lowerDet = D - 1/2` (3 coefficients)
  - `negResidual = 2*F*D' - F'*D - 2*curvature*D^3`, where `F = N'*D - N*D'`
    (7 coefficients)

Standard library only; works identically with or without `-O`.

Agent-ID: gemini-60f6
"""
from __future__ import annotations

import argparse
from fractions import Fraction as Q
from math import comb, floor
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
EPS = Q(25, 31)
CURVATURE_GRID = 10**10
GENERATED_MARKER = "/- GENERATED: exact coefficients, all identities and signs checked below. -/"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def poly_add(a: tuple[Q, ...], b: tuple[Q, ...]) -> tuple[Q, ...]:
    length = max(len(a), len(b))
    return tuple((a[i] if i < len(a) else Q(0)) + (b[i] if i < len(b) else Q(0))
                 for i in range(length))


def poly_sub(a: tuple[Q, ...], b: tuple[Q, ...]) -> tuple[Q, ...]:
    return poly_add(a, tuple(-x for x in b))


def poly_mul(a: tuple[Q, ...], b: tuple[Q, ...]) -> tuple[Q, ...]:
    require(bool(a) and bool(b), "empty polynomial")
    return tuple(
        sum(
            (a[j] * b[i - j]
             for j in range(max(0, i - len(b) + 1), min(len(a) - 1, i) + 1)),
            Q(0),
        )
        for i in range(len(a) + len(b) - 1)
    )


def poly_deriv(p: tuple[Q, ...]) -> tuple[Q, ...]:
    if len(p) <= 1:
        return (Q(0),)
    return tuple(i * coeff for i, coeff in enumerate(p[1:], 1))


def bernstein(p: tuple[Q, ...], degree: int) -> list[Q]:
    require(len(p) - 1 <= degree, "polynomial degree exceeds Bernstein degree")
    return [
        sum(
            (p[j] * Q(comb(i, j), comb(degree, j)) for j in range(min(i + 1, len(p)))),
            Q(0),
        )
        for i in range(degree + 1)
    ]


def parse_row_header(root: Path, index: int) -> list[Q]:
    name = f"row{index:02d}"
    path = root / "Grothe" / "Lower" / f"RowData{index:02d}.lean"
    source = path.read_text(encoding="utf-8")
    parts = source.split(f"def {name} : Row :=", 1)
    require(len(parts) == 2, f"missing `def {name} : Row :=` in {path}")
    header_parts = parts[1].split('"', 2)
    require(len(header_parts) >= 2, f"malformed {name} literal in {path}")
    fields = [
        Q(int(num), int(den or 1))
        for num, den in re.findall(r"\((-?\d+) : ℚ\)(?: / (\d+))?", header_parts[0])
    ]
    require(len(fields) == 15, f"expected 15 rational header fields in {name}, got {len(fields)}")
    return fields


def row_gate_and_baseline(fields: list[Q]) -> tuple[tuple[Q, Q, Q, Q, Q, Q], Q]:
    """Match `WeightedSchur.ofRow` and `SharedGate.baseline` in WeightedSchur.lean."""
    delta, kappa = fields[2], fields[3]
    n11, n12, n13, n22, n23, n33 = fields[6:12]
    b1, b2, b3 = fields[12:15]
    g1, g2, g3 = delta * b1, delta * b2, delta * b3
    gate = (n11 - (EPS - delta) + 2 * g1, n12 + g2, n13 + g3, n22, n23, n33)
    require(gate[3] > 0 and gate[3] * gate[5] - gate[4] ** 2 > 0,
            "trailing 2x2 gate block is not positive definite")
    base = kappa * delta ** 2 - delta
    return gate, base


def fmt_q(value: Q) -> str:
    return f"({value.numerator}/{value.denominator})"


def fmt_poly_lean(coeffs: tuple[Q, ...]) -> str:
    terms = []
    for deg, coeff in enumerate(coeffs):
        c_term = f"C {fmt_q(coeff)}"
        if deg == 0:
            terms.append(c_term)
        elif deg == 1:
            terms.append(f"{c_term}*X")
        else:
            terms.append(f"{c_term}*X^{deg}")
    return " + ".join(terms)


def fmt_list_lean(coeffs: tuple[Q, ...]) -> str:
    return "[" + ", ".join(fmt_q(c) for c in coeffs) + "]"


def compute_strong_schur(root: Path = ROOT) -> dict[str, object]:
    gate8, base8 = row_gate_and_baseline(parse_row_header(root, 8))
    gate9, base9 = row_gate_and_baseline(parse_row_header(root, 9))

    n, x, y, a, b, c = [(lo, hi - lo) for lo, hi in zip(gate8, gate9, strict=True)]
    baseline = (base8, base9 - base8)

    den_p = poly_sub(poly_mul(a, c), poly_mul(b, b))
    quad_num = poly_add(
        poly_sub(poly_mul(c, poly_mul(x, x)), poly_mul((Q(2),), poly_mul(b, poly_mul(x, y)))),
        poly_mul(a, poly_mul(y, y)),
    )
    num_p = poly_sub(poly_mul(poly_sub(n, baseline), den_p), quad_num)
    lower_det = poly_sub(den_p, (Q(1, 2),))
    require(min(bernstein(lower_det, 2)) > 0, "lowerDet = DenP - 1/2 is not positive on [0, 1]")

    first_num = poly_sub(poly_mul(poly_deriv(num_p), den_p), poly_mul(num_p, poly_deriv(den_p)))
    neg_second = poly_sub(
        poly_mul((Q(2),), poly_mul(first_num, poly_deriv(den_p))),
        poly_mul(poly_deriv(first_num), den_p),
    )
    two_den_cubed = poly_mul((Q(2),), poly_mul(den_p, poly_mul(den_p, den_p)))

    nb = bernstein(neg_second, 6)
    db = bernstein(two_den_cubed, 6)
    require(min(db) > 0, "Bernstein denominator coefficients are not strictly positive")
    ratios = [num / den for num, den in zip(nb, db, strict=True)]
    best = min(ratios)
    require(best in (ratios[0], ratios[-1]), "endpoint does not attain the Bernstein ratio minimum")
    curv = Q(floor(best * CURVATURE_GRID), CURVATURE_GRID)
    require(curv == Q(2019911, CURVATURE_GRID), f"unexpected curvature floor {curv}")
    require(ratios[-1] < curv + Q(1, CURVATURE_GRID), "curvature floor is not tight at 10^-10")

    neg_residual = poly_sub(neg_second, poly_mul((curv,), two_den_cubed))
    require(len(den_p) == 3 and len(num_p) == 4 and len(lower_det) == 3 and len(neg_residual) == 7,
            "unexpected coefficient lengths")
    require(min(bernstein(neg_residual, 6)) >= 0,
            "Bernstein certificate for negResidual failed nonnegativity")

    lines = [
        f"private noncomputable def NumP : ℝ[X] := {fmt_poly_lean(num_p)}",
        f"private noncomputable def DenP : ℝ[X] := {fmt_poly_lean(den_p)}",
        f"private def curvature : ℚ := {fmt_q(curv)}",
        f"private def lowerDet : List ℚ := {fmt_list_lean(lower_det)}",
        f"private def negResidual : List ℚ := {fmt_list_lean(neg_residual)}",
    ]
    return {
        "gate8": gate8,
        "base8": base8,
        "gate9": gate9,
        "base9": base9,
        "NumP": num_p,
        "DenP": den_p,
        "curvature": curv,
        "lowerDet": lower_det,
        "negResidual": neg_residual,
        "lines": lines,
        "block": "\n".join(lines),
    }


def replace_generated_block(lean_text: str, block: str) -> str:
    lines = lean_text.splitlines()
    matches = [idx for idx, line in enumerate(lines) if line == GENERATED_MARKER]
    require(len(matches) == 1,
            f"expected exactly one `{GENERATED_MARKER}` marker in StrongSchur.lean, found {len(matches)}")
    start = matches[0] + 1
    end = start + 5
    require(end <= len(lines), "StrongSchur.lean ends inside the generated block")
    updated = lines[:start] + block.splitlines() + lines[end:]
    return "\n".join(updated) + ("\n" if lean_text.endswith("\n") else "")


def check_strong_schur(root: Path = ROOT) -> str:
    computed = compute_strong_schur(root)
    block = str(computed["block"])
    lean_path = root / "Grothe" / "LowerAnalytic" / "StrongSchur.lean"
    lean_text = lean_path.read_text(encoding="utf-8")
    expected_text = replace_generated_block(lean_text, block)
    require(lean_text == expected_text,
            f"{lean_path} generated coefficient block (lines 59-63) does not match row headers")

    for name, gate in (("gate8", computed["gate8"]), ("gate9", computed["gate9"])):
        row_tag = "row08" if name == "gate8" else "row09"
        expected_gate = (
            f"private theorem {name} : ofRow {row_tag} = "
            f"⟨{', '.join(fmt_q(q) for q in gate)}⟩ := by"
        )
        require(expected_gate in lean_text, f"{name} statement in {lean_path} does not match {row_tag}")

    for name, base in (("base8", computed["base8"]), ("base9", computed["base9"])):
        row_tag = "row08" if name == "base8" else "row09"
        expected_base = (
            f"private theorem {name} : baseline {row_tag} = ({fmt_q(base)} : ℚ) := by decide +kernel"
        )
        require(expected_base in lean_text, f"{name} statement in {lean_path} does not match {row_tag}")

    return block


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument(
        "--check",
        action="store_true",
        help="verify StrongSchur.lean:59-63 and row-binding theorems against RowData08/09",
    )
    mode.add_argument(
        "--write",
        action="store_true",
        help="rewrite StrongSchur.lean:59-63 in place from RowData08/09",
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=ROOT,
        help="repository root (defaults to parent of tools/)",
    )
    args = parser.parse_args(argv)
    root = args.root.resolve()

    if args.check:
        check_strong_schur(root)
        print("StrongSchur.lean:59-63 matches RowData08/RowData09 byte for byte.")
        return 0

    computed = compute_strong_schur(root)
    block = str(computed["block"])
    if args.write:
        lean_path = root / "Grothe" / "LowerAnalytic" / "StrongSchur.lean"
        lean_text = lean_path.read_text(encoding="utf-8")
        lean_path.write_text(replace_generated_block(lean_text, block), encoding="utf-8")
        return 0

    sys.stdout.write(block + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
