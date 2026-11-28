"""Replay the 16 new row mixtures on the physical Rice schedule using exact rational arithmetic.

Agent-ID: codex-a7c4.
"""

from fractions import Fraction as Q
from functools import cache
from math import ceil, floor
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import priced_rice_profile as rice
from physical_rice_scale import CUTS, clipped_model

DEN = 10**13
W = Q(49315639, 10**12)
D = Q(1, 10**8)
BUDGET = Q(713252930042, 10**12)
RADIAL = Q(885868, 10**6)


def read_shares():
    text = Path("Grothe/Lower/SparseSteinEnvelope.lean").read_text()
    body = text.split("def signedShares : List (ℚ × ℚ × ℚ) := [", 1)[1].split("]", 1)[0]
    rows = [
        (Q(l), Q(w), Q(z))
        for l, w, z in re.findall(r"\(([0-9/]+), ([0-9/]+), ([0-9/]+)\)", body)
    ]
    rice.checked(
        len(rows) == 16 and rows == sorted(rows) and len({l for l, _, _ in rows}) == 16,
        "invalid central mixture path",
    )
    return {l: (w, z) for l, w, z in rows}


def candidates():
    first = rice.first
    case = first.curved.sparse.base.TestWeightedTightGate
    case.setUpClass()
    source = case()
    law = first.curved.sparse.law(source, True)
    cuts = first.curved.refinement_knots(source)
    cuts[24] = (sum(source.cells[24][:2]) / 2,)
    cuts[25] = (Q(".83835"),)
    old = first.curved.central_weights(source, cuts)
    old_prices, old_small = first.curved.price_tables(law, old)
    pieces, old_bands = rice.physical_pieces(source, law, cuts, old_prices, old_small)
    shares = read_shares()
    weights = set(old) | {w for pair in shares.values() for w in pair}
    prices, small = first.curved.price_tables(law, weights)
    first.curved.check_lean_prices("prices", prices)
    first.curved.check_lean_prices("smallPrices", small)
    old_keys = sorted(old)
    expected = {
        s: {old_keys[i]: d for i, d in ws.items()} for s, ws in old_bands.items()
    }
    el, bl, cl = source.rows[8]
    er, br, cr = source.rows[9]
    penalty = 2 * (bl - br) ** 2 / first.curved.EPS

    @cache
    def model(stop):
        return clipped_model(law, stop)

    changed = []
    for segment in pieces:
        if segment.low not in shares:
            changed.append(segment)
            continue
        rice.checked(segment.cell in range(20, 27), "outside the central cells")
        w, z = shares[segment.low]
        if segment.cell in CUTS:
            stop = rice.terminal(law, segment.low, rice.INTERCEPT, rice.SLOPE)
            local = {q: Q(floor(DEN * model(stop).discount(q)), DEN) for q in (w, z)}
            expected[stop].update(local)
        else:
            local = prices

        def value(x):
            t = segment.low + x * (segment.high - segment.low)
            m = w + x * (z - w)
            return (
                t * t
                - 2 * t * ((1 - m) * el + m * er)
                + (1 - m) * cl
                + m * cr
                - penalty * m * (1 - m)
                - (1 - x) * local[w]
                - x * local[z]
            )

        start, mid, end = map(value, (Q(0), Q(1, 2), Q(1)))
        a = 2 * (start + end - 2 * mid)
        changed.append(
            first.Segment(
                segment.cell, segment.low, segment.high, (a, end - start - a, start)
            )
        )
    first.check_partition(changed, source.cells)
    rice.checked(
        len(changed) == 57 and {s.low for s in pieces} & shares.keys() == shares.keys(),
        "incomplete physical schedule",
    )
    rice.checked(
        rice.restricted_tables() == {s: sorted(v.items()) for s, v in expected.items()},
        "restricted price differs from the original Stein data",
    )
    return pieces, changed


def worst(pieces, weight, debit):
    scales = rice.first.physical_scales(weight)
    a, b, c = scales
    high = rice.high_arm(rice.SWITCH, scales) - Q(13, 500) * debit
    values = [high]
    for s in pieces:
        if s.low >= rice.SWITCH:
            continue
        coefficients = (
            (a, b, c - Q(13, 500) * debit)
            if s.low >= RADIAL
            else (a, b - Q(41, 20) * debit, c + Q(3371, 2000) * debit)
        )
        end = (min(s.high, rice.SWITCH) - s.low) / (s.high - s.low)
        values.append(
            rice.quadratic_maximum(s.transformed(coefficients), Q(0), end, True)[0]
        )
    return max(values)


def main():
    old, new = candidates()
    value = worst(new, W, D)
    rice.checked(
        Q(ceil(value * 10**12), 10**12) == BUDGET and 1 / BUDGET > Q("1.4020271882"),
        "signed physical budget",
    )
    rice.checked(
        worst(old, W, D) > BUDGET and rice.CAP > BUDGET,
        "original schedule deletion control",
    )
    zero_at_w = worst(new, W, Q(0))
    zero_retuned = worst(new, Q(9856587, 200000000000), Q(0))
    rice.checked(
        ceil(zero_at_w * 10**12) == 713252930302 and zero_at_w > BUDGET,
        "zero signed coefficient at the same weight",
    )
    rice.checked(
        ceil(zero_retuned * 10**12) == 713252927947 and zero_retuned < value,
        "independently retuned zero-fifth comparison",
    )
    print(
        "57 intervals and 16 repriced central mixtures. Signed reciprocal > 1.4020271882."
    )


if __name__ == "__main__":
    main()
