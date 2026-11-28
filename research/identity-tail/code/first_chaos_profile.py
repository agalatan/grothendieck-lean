#!/usr/bin/env python3
"""Replay the first-chaos retuning on the production row schedule.

Run from the repository root. Exact Fraction arithmetic determines every comparison.
Agent-ID: codex-a7c4
"""
from dataclasses import dataclass
from fractions import Fraction as Q
from itertools import groupby
from math import ceil
from pathlib import Path
import sys

# The upstream certificates resolve their inputs relative to the repository root.
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.append(str(Path.cwd() / "research/identity-tail/code"))

import curved_stein_profile as curved
from coupled_stein_profile import affine_pieces, checked, quadratic_maximum


NU = Q(47, 2000)
WEIGHT = Q(3645203, 50000000000)
CAP = Q(713254699303, 10**12)
OLD_HAT_CAP = Q(8829435313, 12500000000)


@dataclass(frozen=True)
class Segment:
    cell: int
    low: Q
    high: Q
    hat: tuple[Q, Q, Q]

    def transformed(self, scales):
        """Coefficients of A*hat(x) + B*t(x)^2 + C for 0 <= x <= 1."""
        A, B, C = scales
        a, b, c = self.hat
        width = self.high-self.low
        return (A*a + B*width**2, A*b + 2*B*self.low*width,
                A*c + B*self.low**2 + C)

    def at(self, t, scales):
        a, b, c = self.transformed(scales)
        x = (t-self.low)/(self.high-self.low)
        return (a*x+b)*x+c


def check_partition(segments, cells):
    groups = [(i, list(group)) for i, group in groupby(segments, lambda s: s.cell)]
    checked([i for i, _ in groups] == list(range(38)) and len(cells) == 38,
            "missing or reordered production cell")
    previous = Q(0)
    for i, group in groups:
        low, high = cells[i][:2]
        checked(low == previous and group[0].low == low and group[-1].high == high,
                "cell does not cover its prescribed closed interval")
        for s in group:
            checked(s.low == previous and s.low < s.high, "gap, overlap or empty segment")
            previous = s.high
    checked(previous == Q(9, 10), "wrong final amplitude")


def production_segments():
    base = curved.sparse.base.TestWeightedTightGate
    base.setUpClass()
    source = base()
    weights = {endpoint for low, high, i, j, old_weight in source.cells if {i, j} <= {8, 9}
               for _, _, a, b in affine_pieces(source.rows, 8, 9, low, high, old_weight)
               for endpoint in (a, b)}
    checked(len(weights) == 9, "incorrect number of central prices")
    law = curved.sparse.law(source, True)
    prices, curve = curved.production_deductions(law, weights, curved.curvature(8, 9))
    segments = [Segment(n, low, high, coeffs)
                for n, _, _, low, high, coeffs in curved.weighted_segments(source, prices, curve)]
    check_partition(segments, source.cells)
    checked(len(segments) == 49, "production subdivision changed")
    return segments


def physical_scales(weight):
    """Coefficients on the identity-tail hat payoff, visible amplitude squared and constant."""
    checked(0 <= weight <= 1, "invalid convex weight")
    return (1-weight)*(1-NU), weight, (1-weight)*NU


def peak(segments, scales):
    best = None
    for s in segments:
        value, x = quadratic_maximum(s.transformed(scales), Q(0), Q(1), True)
        trial = value, s.cell, s.low+x*(s.high-s.low)
        if best is None or trial > best:
            best = trial
    return best


def schedule_ceiling(segments):
    """Two fixed amplitudes bound the reciprocal obtainable by varying weight alone."""
    lines = []
    for t in (Q("0.838992436300"), Q("0.886176825774")):
        s, = [s for s in segments if s.low <= t <= s.high]
        intercept = s.at(t, physical_scales(Q(0)))
        slope = s.at(t, physical_scales(Q(1))) - intercept
        lines.append((intercept, slope))
    (a, b), (c, d) = lines
    checked(b < 0 < d, "the two amplitude slopes must have opposite signs")
    crossing = (c-a)/(b-d)
    checked(0 <= crossing <= 1 and a+b*crossing == c+d*crossing > 0,
            "invalid intersection of fixed-amplitude lines")
    return 1/(a+b*crossing)


def check():
    segments = production_segments()
    old, _, _ = peak(segments, physical_scales(Q(0)))
    rounded_hat = Q(ceil((old-NU)/(1-NU)*10**11), 10**11)
    checked(rounded_hat == OLD_HAT_CAP, "original hat cap changed")
    old_reciprocal = 1/(NU+(1-NU)*rounded_hat)
    checked(old_reciprocal == Q(25000000000000, 17831387166289), "original reciprocal changed")

    scales = physical_scales(WEIGHT)
    checked(scales == (Q(97642880918541, 10**14), WEIGHT, Q(2349828675459, 10**14)),
            "Lean mixedCheck coefficients changed")
    value, cell, t = peak(segments, scales)
    checked(cell == 34, "active production cell changed")
    checked(Q(ceil(value*10**12), 10**12) == CAP, "outward-rounded scalar cap changed")
    ceiling = schedule_ceiling(segments)
    checked(Q(ceil(10**12/ceiling), 10**12) == CAP, "a better grid cap might be possible")
    checked(Q("1.4020237104") < 1/CAP <= 1/value <= ceiling, "strict rounding or weight ceiling changed")

    print(f"{len(segments)} closed segments in 38 cells cover [0, 9/10]")
    print(f"First-chaos scalar cap {CAP}, reciprocal {float(1/CAP):.14f}")
    print(f"Active cell {cell}, t={float(t):.12f}, unrounded cap {float(value):.15f}")
    print(f"Lower bound on all fixed-schedule caps {float(1/ceiling):.15f}")
    print(f"Original identity-tail endpoint {old_reciprocal}")


if __name__ == "__main__":
    check()
