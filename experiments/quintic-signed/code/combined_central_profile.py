"""The joint high multiplier and the repriced central rows, including their optimized-price obstruction.

Agent-ID: codex-a7c4.
"""

from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from joint_cubic_schedule import joint_coefficients
from repriced_signed import repriced_segments
from tilted_signed_schedule import (
    first,
    high,
    envelope,
    checked,
    quadratic_maximum,
    MU,
    PI_LO,
)

LOW_SWITCH = Q(".885773796365757")
ZERO_SWITCH = Q(".885773796896554")
PURE_CAP = Q(7132526460178, 10**13)


def polynomial_from_values(y0, ym, y1):
    a = 2 * (y0 + y1 - 2 * ym)
    return a, y1 - y0 - a, y0


def maximum(piece, poly, lo, hi):
    width = piece.high - piece.low
    return quadratic_maximum(
        poly, (lo - piece.low) / width, (hi - piece.low) / width, True
    )[0]


def obstruction(pieces, residual):
    contacts = (Q(167530517578123, 200000000000000), Q(43091569, 50000000))
    lines = []
    for t in contacts:
        rows = [p for p in pieces if p.low <= t <= p.high]
        checked(
            len(rows) == 1 and rows[0].low < t < rows[0].high,
            "contact is not strictly interior",
        )
        a = rows[0].at(t, first.physical_scales(0))
        slope = t * t - a
        penalty = Q(3371, 2000) - Q(41, 20) * t * t
        checked(
            penalty > 0
            and high(0, 0, t, residual=residual) - a
            > (3 * PI_LO / 256 + penalty) / 10000,
            "tilted alternative may remove a central supporting line",
        )
        lines.append((a, slope, penalty))
    (a, m, z), (b, n, y) = lines
    checked(m < 0 < n, "central weight slopes")
    share = n / (n - m)
    cap_floor = share * a + (1 - share) * b
    fifth_cost = share * z + (1 - share) * y
    checked(
        cap_floor > Q(7132526460176, 10**13) and fifth_cost > Q(".2233320"),
        "central two-point price",
    )
    left, right, cut = Q(".000052"), Q(".000054"), Q(".88")
    checked(
        a + m * left > PURE_CAP and b + n * right > PURE_CAP,
        "localization of competitive weights",
    )
    inner_gaps = []
    outer_prices = []
    for p in pieces:
        if p.low < cut:

            def difference(t):
                return p.at(t, first.physical_scales(0)) - high(
                    0, 0, t, residual=residual
                )

            diff = polynomial_from_values(
                difference(p.low), difference((p.low + p.high) / 2), difference(p.high)
            )
            inner_gaps.append(-maximum(p, diff, p.low, min(p.high, cut)))
        if p.high >= cut and p.low <= ZERO_SWITCH:
            for w in [left, right]:
                outer_prices.append(
                    maximum(
                        p,
                        p.transformed(first.physical_scales(w)),
                        max(p.low, cut),
                        min(p.high, ZERO_SWITCH),
                    )
                )
    for w in [left, right]:
        outer_prices.extend(high(w, 0, t, residual=residual) for t in [ZERO_SWITCH, MU])
    checked(
        min(inner_gaps) > Q(".00156403") > 3 * PI_LO / 256 / 10000,
        "high price on the lower arm",
    )
    checked(
        max(outer_prices) < Q(".71325239734") < cap_floor,
        "upper arm cannot bind near the optimum",
    )
    checked(
        Q(41, 20) * cut**2 - Q(3371, 2000) < 0,
        "the quadratic fifth floor has the wrong sign",
    )
    return cap_floor, fifth_cost


def main():
    _, _, opts = joint_coefficients()
    pieces = repriced_segments()
    rows = [
        (".0000533005", "1e-8", 7132526482511),
        (".0000533005", "0", 7132526466222),
        (".00005328", "0", 7132526460178),
        (".000054", ".000000025", 7132526713346),
        (".000054", "0", 7132526672639),
        (".0000605074", "1e-8", 7132528613915),
        (".0000605074", "0", 7132528616190),
    ]
    for w, d, num in rows:
        debit = Q(d)
        price = envelope(
            pieces, Q(w), debit, LOW_SWITCH if debit else ZERO_SWITCH, **opts
        )
        checked(
            ceil(price * 10**13) == num,
            "registered 117-piece signed or zero-debit price",
        )
    lower, penalty = obstruction(pieces, opts["residual"])
    checked(
        1 / PURE_CAP > Q("1.40202774652") and 1 / lower < Q("1.40202774653"),
        "optimized envelope window",
    )
    checked(Q(10**13, 7132526482511) > Q("1.40202774213"), "signed reciprocal")
    print(
        "117 pieces: signed >1.40202774213, matched pure >1.40202774533, retuned pure >1.40202774652."
    )
    print(
        "All admissible weights and debits: scalar price >.7132526460176 + .2233320*d."
    )
    print(
        "Every positive debit loses to a pure setting under the combined 117-piece pricing rules."
    )


if __name__ == "__main__":
    main()
