#!/usr/bin/env python3
"""Replay the retuned degree-five witness and its controls on the production row schedule.

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
from coupled_stein_profile import EPS, affine_pieces, checked, quadratic_maximum


NU = Q(47, 2000)
WEIGHT = Q(3693, 50000000)
CUBIC = Q(1, 100)
QUINTIC = Q(1, 2000)
CAP = Q(713254705661, 10**12)
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


def physical_scales(weight, cubic, quintic):
    """Weights on the hat payoff, t² and the constant after eliminating residual energy."""
    checked(0 <= weight <= 1 and 0 <= cubic <= EPS and quintic >= 0,
            "invalid convex weight or signed witness coefficients")
    alpha = cubic/EPS
    debit = 2*alpha*NU/(1-NU)
    residual_price = max(debit, quintic)
    A = (1-weight)*(1-NU) + weight*alpha
    B = weight*(1-alpha-residual_price)
    C = (1-weight)*NU + weight*residual_price
    checked(A >= 0 and A+B+C == 1, "invalid normalized payoff coefficients")
    return A, B, C


def peak(segments, scales):
    best = None
    for s in segments:
        value, x = quadratic_maximum(s.transformed(scales), Q(0), Q(1), True)
        trial = value, s.cell, s.low+x*(s.high-s.low)
        if best is None or trial > best:
            best = trial
    return best


def schedule_ceiling(segments, cubic, quintic):
    """Two fixed amplitudes bound the reciprocal obtainable by varying weight alone."""
    lines = []
    for t in (Q("0.83899243"), Q("0.886176826")):
        s, = [s for s in segments if s.low <= t <= s.high]
        intercept = s.at(t, physical_scales(Q(0), cubic, quintic))
        slope = s.at(t, physical_scales(Q(1), cubic, quintic)) - intercept
        lines.append((intercept, slope))
    (a, b), (c, d) = lines
    checked(b < 0 < d, "the two amplitude slopes must have opposite signs")
    crossing = (c-a)/(b-d)
    checked(0 <= crossing <= 1 and a+b*crossing == c+d*crossing > 0,
            "invalid intersection of fixed-amplitude lines")
    return 1/(a+b*crossing)


def check():
    segments = production_segments()
    old, _, _ = peak(segments, physical_scales(Q(0), Q(0), Q(0)))
    rounded_hat = Q(ceil((old-NU)/(1-NU)*10**11), 10**11)
    checked(rounded_hat == OLD_HAT_CAP, "production cap control changed")
    old_reciprocal = 1/(NU+(1-NU)*rounded_hat)
    checked(old_reciprocal == Q(25000000000000, 17831387166289),
            "production reciprocal control changed")

    checked(EPS == Q(25, 31) and CUBIC/EPS == Q(31, 2500)
            and 2*(CUBIC/EPS)*NU/(1-NU) == Q(47, 78750) > QUINTIC,
            "fifth-chaos price exceeds the signed half-difference allowance")
    scales = physical_scales(WEIGHT, CUBIC, QUINTIC)
    checked(scales == (Q(488214395787, 500000000000), Q(191362643, 2625000000000),
                       Q(246732237901, 10500000000000)), "production scale factors changed")
    checked(physical_scales(WEIGHT, CUBIC, 0) == scales,
            "the same-parameter zero-fifth control should agree on every segment")
    checked(physical_scales(WEIGHT, CUBIC, 2*QUINTIC) != scales,
            "an over-budget fifth coefficient was incorrectly absorbed")
    mixed, cell, t = peak(segments, scales)
    checked(Q(ceil(mixed*10**12), 10**12) == CAP and cell == 26,
            "outward physical cap or maximizing cell changed")
    endpoints_only = max(s.at(endpoint, scales) for s in segments for endpoint in (s.low, s.high))
    checked(mixed-endpoints_only > Q(3, 10**10),
            "checking only segment endpoints must miss the maximizing vertex")
    checked(Q("1.4020236979") < 1/CAP <= 1/mixed <= schedule_ceiling(segments, CUBIC, QUINTIC)
            < Q("1.4020236981"), "retuned fixed-schedule bounds changed")
    p1, _, _ = peak(segments, physical_scales(Q(729, 10**7), Q(0), Q(0)))
    checked(Q("1.4020237103") < 1/p1 <= schedule_ceiling(segments, Q(0), Q(0))
            < Q("1.4020237105"), "reoptimized first-chaos control changed")

    print(f"{len(segments)} closed segments in 38 cells cover [0, 9/10]")
    print(f"Previous rounded production reciprocal: {old_reciprocal}")
    print(f"Retuned physical cap: {CAP}, reciprocal {float(1/CAP):.13f}")
    print(f"Maximum in zero-based cell {cell} at t approximately {float(t):.11f}")
    print("At fixed cubic and mixture weights, setting the fifth weight to zero gives the same cap.")
    print("Varying only the mixture weight with the first-chaos partner: "
          "1.4020237103 < best schedule reciprocal < 1.4020237105")


if __name__ == "__main__":
    check()
