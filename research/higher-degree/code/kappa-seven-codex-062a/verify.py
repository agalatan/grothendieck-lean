"""Evaluate the dimension-seven spherical witness with Gaussian integer arithmetic."""

import json
from collections import defaultdict
from fractions import Fraction
from functools import cache
from itertools import combinations_with_replacement, product
from math import lcm
from pathlib import Path

SOURCE = Path(__file__).resolve().parents[1] / "degree5-attack/ref/bulk/bulk_c7.json"


def integer_terms(data):
    """Use signed local coordinates 1 through c, in x, y, w order."""
    c = data["c"]
    terms = {}
    for label, coefficient in zip(data["labels"], data["coef"], strict=True):
        kind, i, j, k = label
        if kind != "mix" or not (0 <= i < j < 3 * c and 0 <= k < 3 * c):
            raise ValueError(f"invalid monomial {label}")
        slots = [0, 0, 0]
        for index, sign in ((i, 1), (j, 1), (k, -1)):
            slots[index // c] = sign * (1 + index % c)
        key = tuple(slots)
        if 0 in key or key in terms:
            raise ValueError(f"repeated cluster or monomial {label}")
        real, imag = coefficient
        terms[key] = (real, imag)
    if len(terms) != 3 * c**3:
        raise ValueError("incomplete coefficient table")
    scale = lcm(*(v.denominator for pair in terms.values() for v in pair))
    return {
        key: tuple(v.numerator * (scale // v.denominator) for v in pair)
        for key, pair in terms.items()
    }


@cache
def wick_terms(a, b):
    """A same-coordinate z times conjugate-z contributes H_11 and 1."""
    pair = tuple(sorted((a, b)))
    if a == -b:
        return (pair, ())
    return (pair,)


def spherical_kappa(c, terms):
    """Return (c/(c+1))^3 times the Gaussian fourth-to-second moment ratio."""
    squared = defaultdict(lambda: [0, 0])
    for (u, (a, b)), (v, (d, e)) in combinations_with_replacement(terms.items(), 2):
        multiplicity = 1 if u == v else 2
        real = multiplicity * (a * d - b * e)
        imag = multiplicity * (a * e + b * d)
        for key in product(*(wick_terms(i, j) for i, j in zip(u, v))):
            coeff = squared[key]
            coeff[0] += real
            coeff[1] += imag
    second = sum(a * a + b * b for a, b in terms.values())
    fourth = 0
    for key, (a, b) in squared.items():
        doubled = sum(1 for pair in key if pair and pair[0] == pair[1])
        fourth += (2**doubled) * (a * a + b * b)
    return Fraction(c, c + 1)**3 * Fraction(fourth, second**2)


def check_controls():
    # The sharp c=2 form of #508 after rotating its first x coordinate by i.
    terms = {(-1, 1, 2): (0, -1), (-2, 2, 2): (1, 0),
             (1, 2, -1): (0, 1), (2, 1, -1): (-1, 0)}
    if spherical_kappa(2, terms) != Fraction(4, 3):
        raise ValueError("dimension-two extremal failed")
    terms[2, 1, -1] = (1, 0)
    if spherical_kappa(2, terms) != Fraction(44, 27):
        raise ValueError("dimension-two sign control failed")


def main():
    check_controls()
    data = json.loads(SOURCE.read_text(), parse_float=Fraction)
    if data["c"] != 7:
        raise ValueError("expected dimension seven")
    kappa = spherical_kappa(7, integer_terms(data))
    expected = Fraction(
        229501961275182140618752923233296492656641562028889,
        128000000000024216465428993145385152096806036316672,
    )
    if kappa != expected:
        raise ValueError(f"dimension-seven witness changed: {kappa}")
    if not Fraction("1.79298407246202125") < kappa < Fraction("1.79298407246202126"):
        raise ValueError(f"dimension-seven enclosure failed: {kappa}")
    print(f"kappa(R_7) = {kappa}")
    print("1.79298407246202125 < kappa(R_7) < 1.79298407246202126")


if __name__ == "__main__":
    main()
