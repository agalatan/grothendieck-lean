#!/usr/bin/env python3
"""Replay the physical affine Rice debit in the first-chaos identity-tail witness.

The kernel checks the Lean prices independently. Run this numerical replay at the repository root.
Agent-ID: codex-a7c4
"""
import ast
import re
import sys
from fractions import Fraction as Q
from functools import cache
from math import ceil, floor, isqrt
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import first_chaos_profile as first
from coupled_stein_profile import checked, quadratic_maximum
from physical_rice_scale import CUTS, MU_UP, SMALL, clipped_model


K = Q(1, 19)
INTERCEPT = 1 + K**2/6
SLOPE = 1 - (2*K-K**2)/6
SWITCH = Q("0.886151109950")
PI_HIGH = Q("3.141592654")
MU_LOW = Q(".886226925")
WEIGHT = Q(391473741, 6250000000000)
CAP = Q(713253889546, 10**12)


def terminal(shape_law, lo, intercept, slope):
    limit = 2*slope*MU_UP*(intercept*MU_UP-lo)*shape_law.delta**2
    checked(limit >= 0, "negative physical scale budget")
    cutoff = max(SMALL, Q(1+isqrt(floor(limit*10**8)), 10**4))
    checked(limit <= cutoff**2, "scale cut excludes a feasible response")
    return cutoff


def physical_pieces(source, law, cuts, prices, small, use_affine=True):
    @cache
    def at(stop, w):
        return Q(floor(clipped_model(law, stop).discount(w)*10**13), 10**13)

    kappa = first.curved.curvature(8, 9)*(SMALL/law.delta)**2
    indexed = {w: i for i, w in enumerate(sorted(prices))}
    used = {}
    def endpoints(n, lo, hi, w, z):
        if n in CUTS:
            a, c = (INTERCEPT, SLOPE) if use_affine else (Q(1), Q(1))
            stop = terminal(law, lo, a, c)
            dw, dz = at(stop, w), at(stop, z)
            used.setdefault(stop, {}).update({indexed[w]: dw, indexed[z]: dz})
        else:
            dw, dz = prices[w], prices[z]
        curve = min(4*(small[w]-dw), 4*(small[z]-dz), kappa*(w-z)**2)
        checked(curve >= 0, "negative interpolation bonus")
        return dw, dz, curve

    old_curve = first.curved.curvature_deduction(law, first.curved.curvature(8,9), prices, small)
    pieces = [first.Segment(n,l,h,v) for n,_,_,l,h,v in
              first.curved.weighted_segments(source, prices, old_curve, cuts=cuts, central_endpoints=endpoints)]
    first.check_partition(pieces,source.cells)
    return pieces, used


def verify_restricted(used):
    source = Path("Grothe/LowerAnalytic/SparseSteinWeights.lean").read_text()
    tables = {Q(int(stop), 10000): [(i,Q(n,10**13)) for i,n in ast.literal_eval(values)]
              for stop,values in re.findall(r"\| \.cut(\d+) => entries (\[[^\n]*\])",source)}
    checked(tables == {s: sorted(ws.items()) for s,ws in used.items()},
            "Lean restricted weights, cutoffs or discounts differ from the physical replay")


def high_arm(t, scales):
    a, b, c = scales
    eps = first.curved.EPS
    p = eps-2*first.NU/(1-first.NU)
    checked(t >= 0 and a > 0 and a*(1-2*p)+b <= 0 and eps > 0 and p > 0,
            "wrong high-amplitude price signs")
    return ((a*(1-2*p)+b)*t*t + a*(7*eps/32+p/2)*PI_HIGH - a*eps*MU_LOW*t+c)


def endpoint(pieces, w, with_high=True):
    scal = first.physical_scales(w)
    if not with_high:
        return first.peak(pieces,scal)
    candidates = [(high_arm(SWITCH,scal), -1, SWITCH)]
    for segment in pieces:
        if segment.low <= SWITCH:
            stop = min(segment.high, SWITCH)
            bound, x = quadratic_maximum(segment.transformed(scal), Q(0),
                                         (stop-segment.low)/(segment.high-segment.low), True)
            candidates.append((bound, segment.cell, segment.low+x*(segment.high-segment.low)))
    return max(candidates)


def main():
    test = first.curved.sparse.base.TestWeightedTightGate
    test.setUpClass()
    source = test()
    law = first.curved.sparse.law(source, True)
    cuts = first.curved.refinement_knots(source)
    cuts[24] = (sum(source.cells[24][:2])/2,)
    cuts[25] = (Q(".83835"),)
    weights = first.curved.central_weights(source, cuts)
    prices, small = first.curved.price_tables(law, weights)
    first.curved.check_lean_prices("prices", prices)
    first.curved.check_lean_prices("smallPrices", small)
    pieces, used = physical_pieces(source, law, cuts, prices, small)
    verify_restricted(used)
    checked((len(pieces), len(weights), len(used), sum(map(len,used.values()))) == (57,17,13,27),
            "physical schedule changed")
    checked(4*MU_LOW**2 < Q("3.141592653") < PI_HIGH < 4*MU_UP**2,
            "outward bounds for the Gaussian mean changed")
    checked((INTERCEPT, SLOPE) == (Q(2167,2166), Q(2129,2166)), "real tangent price changed")
    bound, cell, t = endpoint(pieces, WEIGHT)
    checked(Q(ceil(bound*10**12),10**12)==CAP and Q("1.4020253021")<1/CAP,
            "certified first-chaos endpoint changed")
    quadratic, _ = physical_pieces(source, law, cuts, prices, small, use_affine=False)
    without_affine, affine_cell, _ = endpoint(quadratic, WEIGHT)
    without_high, high_cell, _ = endpoint(pieces, WEIGHT, with_high=False)
    checked(affine_cell == 26 and without_affine > CAP + Q(284, 10**9),
            "removing the quartic debit should fail in cell 26")
    checked(high_cell == 34 and without_high > CAP + Q(69, 10**9),
            "removing the high arm should fail in cell 34")
    print(f"57 closed segments, 17 weights and 27 restricted prices. Cap {CAP}, reciprocal {float(1/CAP):.13f}.")
    print(f"Active cell {cell}, t={float(t):.12f}; both physical ablations rejected.")


if __name__ == "__main__":
    main()
