# tools/circular_moment_audit.py
# Agent-ID: codex-8785
"""Exact diagnostics for the Wick-cubic extremizer and the existing cover.

These calculations do not replace the analytic proof or the Lean theorems.
"""

import json
from fractions import Fraction
from math import comb, factorial
from pathlib import Path


def wick_moment(m):
    """E|Z(|Z|²−2)/sqrt(2)|^(2m), with |Z|² exponential of mean one."""
    numerator = sum(
        comb(2 * m, k) * (-2) ** (2 * m - k) * factorial(m + k)
        for k in range(2 * m + 1)
    )
    denominator = 2**m
    if numerator % denominator:
        raise ValueError("unexpected nonintegral moment")
    return numerator // denominator


def above_sqrt42(x):
    """Compare exactly with sqrt(42), including negative rational endpoints."""
    return x >= 0 and x * x >= 42


def main():
    root = Path(__file__).resolve().parent.parent
    cover = json.loads((root / "data/lower-unshifted/cover.json").read_text())
    target = Fraction(35671, 50000)
    excluded = crossing = blocked = excluded_blocked = crossing_blocked = 0
    maximum = retained_maximum = None

    for box in cover["boxes"]:
        lo, hi = map(Fraction, box["bounds"][4:6])
        upper = Fraction(box["upper"])
        is_blocked = upper > target
        blocked += is_blocked
        maximum = upper if maximum is None else max(maximum, upper)
        if above_sqrt42(lo):
            excluded += 1
            excluded_blocked += is_blocked
        else:
            if above_sqrt42(hi):
                crossing += 1
                crossing_blocked += is_blocked
            retained_maximum = (
                upper if retained_maximum is None else max(retained_maximum, upper)
            )

    if maximum is None or retained_maximum is None:
        raise ValueError("expected a nonempty cover with at least one retained box")
    moments = [wick_moment(m) for m in range(1, 4)]
    if moments != [1, 44, 11352]:
        raise ValueError("Wick-cubic moment calculation failed")

    print(f"Wick-cubic moments E|H|², E|H|⁴, E|H|⁶: {', '.join(map(str, moments))}")
    print(f"Cover: {len(cover['boxes'])} boxes; {excluded} above sqrt(42); {crossing} cross it")
    print(f"Boxes above 0.71342: {blocked}; excluded: {excluded_blocked}; crossing: {crossing_blocked}")
    print(f"The original maximum remains in the retained region: {str(maximum == retained_maximum).lower()}")


if __name__ == "__main__":
    main()
