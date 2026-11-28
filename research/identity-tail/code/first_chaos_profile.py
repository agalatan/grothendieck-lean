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
WEIGHT = Q(358503031, 5000000000000)
CAP = Q(713254612582, 10**12)
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


def load_schedule():
    test = curved.sparse.base.TestWeightedTightGate
    test.setUpClass()
    source = test()
    law = curved.sparse.law(source, True)
    cuts = curved.refinement_knots(source)
    weights = curved.central_weights(source, cuts)
    checked(len(weights) == 15, "expected nine original and six new weights")
    prices, small = curved.price_tables(law, weights)
    curved.check_lean_prices("prices", prices)
    curved.check_lean_prices("smallPrices", small)
    curve = curved.curvature_deduction(law, curved.curvature(8,9), prices, small)
    return source, law, cuts, prices, curve


def segments_for(source, cuts, prices, curve):
    segments = [Segment(n, l, h, coeffs)
                for n, _, _, l, h, coeffs in curved.weighted_segments(source, prices, curve, cuts=cuts)]
    check_partition(segments, source.cells)
    checked(len(segments) == 49 + sum(map(len, cuts.values())), "wrong subdivision count")
    return segments


def production_segments():
    source, _, cuts, prices, curve = load_schedule()
    return segments_for(source, cuts, prices, curve)


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


def refinement_floor(source, law, segments):
    """Lower bound for any chord refinement and weight on the fixed central affine path."""
    t = Q(".83743659")
    low, high, i, j, fallback = source.cells[23]
    l,h,w,z = next(piece for piece in affine_pieces(source.rows, i, j, low, high, fallback)
                   if piece[0] < t < piece[1])
    theta = w + (z-w)*(t-l)/(h-l)
    ell, beta, c = source.rows[i]
    er, br, d = source.rows[j]
    # Even the exact, unrounded sparse price is an upper bound on each valid chord deduction
    # at this weight. Subtracting it gives a lower bound on this schedule's scalar majorant.
    hat = (t*t - 2*((1-theta)*ell+theta*er)*t + (1-theta)*c+theta*d
           - 2*(br-beta)**2*theta*(1-theta)/curved.EPS - law.discount(theta))
    high_peak, _, u = peak([s for s in segments if s.cell == 34], physical_scales(WEIGHT))
    high_segment, = [s for s in segments if s.cell == 34 and s.low < u < s.high]
    checked(high_segment.at(u, physical_scales(WEIGHT)) == high_peak, "upper witness changed")
    def lines(weight):
        a,b,c = physical_scales(weight)
        return a*hat+b*t*t+c, high_segment.at(u, (a,b,c))
    x0,y0 = lines(Q(0))
    x1,y1 = lines(Q(1))
    down,up = x1-x0,y1-y0
    crossing = (y0-x0)/(down-up)
    checked(down < 0 < up and 0 <= crossing <= 1 and x0+down*crossing == y0+up*crossing,
            "inconsistent opposite slopes at the fixed witness amplitudes")
    return x0+down*crossing


def check():
    source, law, cuts, prices, curve = load_schedule()
    original = segments_for(source, {}, prices, curve)
    baseline = Q(3645203,50000000000)
    old = peak(original, physical_scales(baseline))[0]
    checked(ceil(old*10**12) == 713254699303, "original retuned cap changed")
    zero = peak(original, physical_scales(Q(0)))[0]
    checked(Q(ceil((zero-NU)/(1-NU)*10**11),10**11) == OLD_HAT_CAP, "original hat cap changed")

    segments = segments_for(source, cuts, prices, curve)
    scales = physical_scales(WEIGHT)
    checked(scales == (Q(9764299843580457,10**16), WEIGHT, Q(234983150357543,10**16)),
            "normalized physical scale coefficients changed")
    value, cell, t = peak(segments, scales)
    checked(ceil(value*10**12) == CAP*10**12 and value <= CAP, "rounded cap changed")
    checked(Q("1.4020238808") < 1/CAP, "rounded finite-matrix endpoint changed")
    floor_cap = refinement_floor(source, law, segments)
    checked(CAP-Q(1,10**12) < floor_cap <= value, "lower adjacent grid budget should be impossible")

    for n, added in cuts.items():
        for drop in added:
            remaining = {**cuts, n: tuple(t for t in added if t != drop)}
            without = segments_for(source, remaining, prices, curve)
            checked(peak(without, scales)[0] > CAP, "deleting a cut did not lose the fixed-weight budget")

    print(f"{len(segments)} closed amplitude segments in 38 cells, with {len(prices)} central weights")
    print(f"First-chaos scalar cap {CAP}, reciprocal {float(1/CAP):.14f}")
    print(f"Active cell {cell}, t={float(t):.12f}, unrounded cap {float(value):.15f}")
    print(f"Any refinement on the same central path has cap >= {float(floor_cap):.15f}")
    print("All six single-cut deletions exceed the stated budget at the fixed weight.")


if __name__ == "__main__":
    check()
