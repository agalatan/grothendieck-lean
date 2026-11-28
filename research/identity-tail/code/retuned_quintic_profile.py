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
WEIGHT = Q(3645203, 50000000000)
QUINTIC = Q(1, 50000000)
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
    for t in (Q("0.838992436300"), Q("0.886176825774")):
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
    checked(rounded_hat == OLD_HAT_CAP, "original hat cap changed")
    old_reciprocal = 1/(NU+(1-NU)*rounded_hat)
    checked(old_reciprocal == Q(25000000000000, 17831387166289), "original reciprocal changed")

    pure_scales = physical_scales(WEIGHT, Q(0), Q(0))
    companion_scales = physical_scales(WEIGHT, Q(0), QUINTIC)
    checked(companion_scales == (Q(97642880918541, 10**14),
            Q(182260146354797, 2500000000000000000),
            Q(58745716890120203, 2500000000000000000)), "Lean mixedCheck coefficients changed")
    pure, pure_cell, pure_t = peak(segments, pure_scales)
    perturbed, companion_cell, companion_t = peak(segments, companion_scales)
    checked((pure_cell, companion_cell) == (34, 26) and pure < perturbed,
            "maximizing cells or the unrounded ablation comparison changed")
    checked(pure_scales[0] == companion_scales[0] and
            pure_scales[1] - companion_scales[1] == companion_scales[2] - pure_scales[2] == WEIGHT*QUINTIC,
            "the allowance must equal the extra fifth multiplier times 1-t²")
    for value in (pure, perturbed):
        checked(Q(ceil(value*10**12), 10**12) == CAP, "outward-rounded scalar cap changed")
    checked(perturbed > max(s.at(t, companion_scales) for s in segments for t in (s.low, s.high)),
            "the interior maximum must exceed every segment endpoint")
    ceiling = schedule_ceiling(segments, Q(0), Q(0))
    checked(Q(ceil(10**12/ceiling), 10**12) == CAP, "a better grid cap might be possible")
    checked(Q("1.4020237104") < 1/CAP <= 1/pure <= ceiling, "strict rounding or weight ceiling changed")

    old_w, old_e, old_eta = Q(3693, 50000000), Q(1, 100), Q(1, 2000)
    old_scales = physical_scales(old_w, old_e, old_eta)
    checked(old_scales == physical_scales(old_w, old_e, Q(0)), "previous same-weight ablation changed")
    previous = peak(segments, old_scales)[0]
    checked(ceil(previous*10**12) == 713254705661 and CAP < previous,
            "the preceding mixed-witness comparison changed")

    print(f"{len(segments)} closed segments in 38 cells cover [0, 9/10]")
    print(f"Both witnesses: cap {CAP}, reciprocal {float(1/CAP):.14f}")
    print(f"First-chaos control: cell {pure_cell}, t={float(pure_t):.12f}, cap {float(pure):.15f}")
    print(f"Positive fifth coefficient: cell {companion_cell}, t={float(companion_t):.12f}, "
          f"cap {float(perturbed):.15f}")
    print(f"Smallest 10^-12-grid cap for the fixed first-chaos schedule: {CAP}")
    print(f"Original identity-tail endpoint: {old_reciprocal}; previous mixed cap: 713254705661/10^12")


if __name__ == "__main__":
    check()
