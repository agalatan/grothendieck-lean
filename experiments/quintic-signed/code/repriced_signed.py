"""Rebuild the repriced central intervals and check the signed and control witnesses.

Run at the repository root. Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import cache
from math import ceil, floor, isqrt
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))

from tilted_signed_schedule import (
    BETA, MU, MU_UP, PI_HI, PI_LO, R, SMALL, check_prices, checked,
    clipped_model, envelope, first, high, physical_segments, pi_interval,
)

# Row 9's share, in units of 1/200, on successive eighths of cells 18 through 27.
WEIGHTS = (
    (0, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 5, 18, 18, 18, 18, 18),
    (19, 23, 26, 29, 33, 36, 39, 42),
    (46, 49, 52, 56, 59, 62, 65, 69),
    (70, 72, 74, 75, 77, 79, 80, 82),
    (83, 85, 87, 88, 90, 92, 93, 95),
    (97, 99, 100, 102, 103, 105, 106, 107),
    (107, 109, 110, 112, 113, 114, 116, 117),
    (120, 123, 127, 131, 138, 144, 150, 156),
    (163, 175, 187, 198, 199, 200, 200, 200),
)
DENOM = 10**13


def repriced_segments():
    case = first.curved.sparse.base.TestWeightedTightGate
    case.setUpClass()
    source = case()
    law = first.curved.sparse.law(source, True)
    ell8, beta8, cap8 = source.rows[8]
    ell9, beta9, cap9 = source.rows[9]
    pieces = [s for s in physical_segments() if not 18 <= s.cell <= 27]

    @cache
    def clipped(stop):
        return clipped_model(law, stop)

    for i, numerators in enumerate(WEIGHTS, start=18):
        lo, hi = source.cells[i][:2]
        width = (hi-lo)/len(numerators)
        for j, num in enumerate(numerators):
            l = lo + j*width
            w = Q(num, 200)
            checked(0 <= w <= 1, "inadmissible mixture")
            limit = 2*Q(2129,2166)*MU_UP*(Q(2167,2166)*MU_UP-l)*law.delta**2
            checked(limit >= 0, "negative terminal-scale budget")
            stop = max(SMALL, Q(1+isqrt(floor(limit*10**8)), 10000))
            checked(limit <= stop**2, "unsafe terminal scale")
            debit = Q(floor(DENOM*clipped(stop).discount(w)), DENOM)
            ell = (1-w)*ell8 + w*ell9
            cap = ((1-w)*cap8 + w*cap9
                   - 2/first.curved.EPS*w*(1-w)*(beta8-beta9)**2 - debit)
            coeffs = width**2, 2*(l-ell)*width, l*l-2*ell*l+cap
            pieces.append(first.Segment(i, l, l+width, coeffs))
    pieces.sort(key=lambda s: s.low)
    first.check_partition(pieces, source.cells)
    checked(len(pieces) == 117, "incomplete partition")
    return pieces


def main():
    checked(check_prices(Q(".09"), Q(1), Q(".0001"), Q(".485"), uniform=True)
            and R == BETA-Q(".485")-Q(".09"), "high-amplitude multiplier")
    pi_lo, pi_hi = pi_interval()
    checked(PI_LO < pi_lo < pi_hi < PI_HI < 4*MU**2 and MU < MU_UP,
            "Gaussian mean enclosure")
    pieces = repriced_segments()
    w, d = Q(".000054"), Q(".000000025")
    price = envelope(pieces, w, d, Q(".885908228150563"))
    cap = Q(7132526748816, DENOM)
    checked(Q(ceil(price*DENOM), DENOM) == cap and 1/cap > Q("1.40202768978"),
            "signed bound")
    t = Q(".885908228863324")
    rows = [s.at(t, first.physical_scales(w)) for s in pieces if s.low <= t <= s.high]
    checked(rows and min([*rows, high(w, 0, t)]) > cap, "matched control")
    pure_price = envelope(pieces, Q(".00005324"), 0, Q(".885908161642537"))
    checked(1/pure_price > Q("1.40202774561"), "retuned control")
    print(f"117 pieces. Signed cap {cap}, reciprocal > 1.40202768978.")
    print(f"At t={t} the two matched zero-debit prices both exceed the signed cap.")
    print("Retuned zero-debit reciprocal > 1.40202774561.")


if __name__ == "__main__":
    main()
