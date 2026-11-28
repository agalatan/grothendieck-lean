#!/usr/bin/env python3
"""Replay the attainable Gaussian scales of the identity-tail witness. Agent-ID: codex-a7c4."""

from copy import copy
from fractions import Fraction as Q
from functools import lru_cache
from math import floor
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from curved_stein_profile import curvature, weighted_profile
import sparse_stein_dilation as sparse
from coupled_stein_profile import affine_pieces, checked

MU_UP = Q(886227, 10**6)
SMALL = Q(21, 100)
CUTS = {21: Q(".242"), 22: Q(".242"), 23: Q(".242"), 24: Q(".242"),
        25: Q(".2358"), 26: Q(".2355")}
CAP = Q(35317721199, 50000000000)
ENDPOINT = Q(100000000000000, 71325509501647)


def clipped_model(model, cut):
    restricted = copy(model)
    restricted.pieces = [(lo, min(hi, cut), a, b, c, d)
                         for lo, hi, a, b, c, d in model.pieces if lo <= cut]
    checked(restricted.pieces and cut >= 0, "empty physical scale interval")
    return restricted


def verify():
    sparse.base.TestWeightedTightGate.setUpClass()
    source = sparse.base.TestWeightedTightGate()
    model = sparse.law(source, True)
    checked(len(model.pieces) == 945, "unexpected common chord bank")
    # pi < 3.141592654 (also follows from Real.pi_lt_d9).
    checked(4 * MU_UP**2 > Q(3141592654, 10**9), "Gaussian mean rounded down")
    coeff = curvature(8, 9)
    checked(coeff == Q(2019911, 10**10), "wrong curvature for rows 08/09")
    last = Q(0)
    for lo, hi, *_ in source.cells:
        checked(lo == last and lo < hi, "gap in the amplitude domain")
        last = hi
    checked(last == Q(9, 10), "incomplete amplitude domain")

    @lru_cache(maxsize=None)
    def price(cut, mix):
        bank = model if cut is None else clipped_model(model, cut)
        return Q(floor(bank.discount(mix) * 10**13), 10**13)

    weights = {a for l, h, i, j, old in source.cells if {i, j} <= {8, 9}
               for _, _, b, c in affine_pieces(source.rows, 8, 9, l, h, old) for a in (b, c)}
    checked(len(weights) == 9, "unexpected mixing weights")
    full = {w: price(None, w) for w in weights}

    def bonus(cut, w, z):
        return min(4 * (price(SMALL, w) - price(cut, w)),
                   4 * (price(SMALL, z) - price(cut, z)),
                   coeff * (w - z)**2 * (SMALL / model.delta)**2)

    def replay(cuts):
        visited = set()

        def endpoints(index, lo, hi, w, z):
            cut = cuts.get(index)
            if cut is not None:
                checked(SMALL <= cut and lo <= MU_UP, "invalid scale or amplitude")
                checked(2 * MU_UP * (MU_UP - lo) * model.delta**2 <= cut**2,
                        "scale cut excludes a possibly admissible response")
                visited.add(index)
            gain = bonus(cut, w, z)
            checked(gain >= 0, "rounding reversed the two-scale price order")
            return price(cut, w), price(cut, z), gain

        result = weighted_profile(source, full, lambda w, z: bonus(None, w, z),
                                  central_endpoints=endpoints)
        checked(visited == set(cuts), "physical cut assigned to a noncentral cell")
        return result

    cap, cell, endpoint = replay(CUTS)
    checked((cap, cell, endpoint) == (CAP, 14, ENDPOINT), "physical Rice ceiling changed")
    old = replay({})
    checked(old == (Q(8829435313, 12500000000), 23, Q(25000000000000, 17831387166289)),
            "deleting all physical cuts must recover the old profile")
    # Positive control at the former binding amplitude; all near-binding ordinates
    # of its active slab had sigma >= 10/41. The entire chord is now infeasible.
    old_scale = Q(10, 41)
    lo = source.cells[23][0]
    checked((old_scale/model.delta)**2 - 2*MU_UP*(MU_UP-lo) > Q(44, 10000),
            "the former high-scale chord is no longer separated")
    invalid = dict(CUTS)
    invalid[26] = Q(".234")
    try:
        replay(invalid)
    except ValueError as error:
        checked("excludes a possibly admissible" in str(error), "wrong negative control")
    else:
        raise ValueError("an unjustified cut was accepted")
    print(f"{len(CUTS)} physical cuts, {len(model.pieces)} chords and {len(weights)} weights.")
    print(f"All amplitudes through 9/10: hat cap {cap}, outer cell {cell}, transfer {endpoint}.")
    print("Removing all cuts recovers the prior endpoint; the undersized cut is rejected.")


if __name__ == "__main__":
    verify()
