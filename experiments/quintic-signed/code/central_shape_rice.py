"""Common-shape Rice constraints on each closed central 08/09 interval.

Agent-ID: codex-a7c4
"""

import json, sys
from fractions import Fraction as Q
from functools import cache
from math import ceil, floor
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from joint_outer_schedule import first, checked, segment, sparse, header, chords, gate_minimum
from gaussian_quadrature_rice import polynomial, majorant, low_sqrt, MU_UP
from joint_outer_stein import joint_pieces, outer_pieces
from coupled_stein_profile import expected_value
from sixth_angular_profile import price as signed_price
from tilted_signed_schedule import envelope, high
from one_coordinate_multiplier import pi_interval

PI_HI = Q("3.14159265358979324")
LAMBDAS = tuple(Q(x, 250) for x in range(55, 108, 2))
SUPPORT_DEN = 10**12


def up(x):
    return Q(ceil(x * SUPPORT_DEN), SUPPORT_DEN)


def sqrt_up(x):
    return low_sqrt(x, SUPPORT_DEN) + Q(1, SUPPORT_DEN)


@cache
def setup():
    case = first.curved.sparse.base.TestWeightedTightGate
    case.setUpClass()
    s = case()
    raw = {
        i: json.loads(Path(f"data/antistein-rows/antistein_{v}.json").read_text())
        for i, v in ((8, "0.835"), (9, "0.845"))
    }
    rows = {i: (*header(i)[0][:5], Q(raw[i]["cap"])) for i in raw}
    delta = rows[8][2]
    checked(rows[8][2] == rows[9][2] and delta > 0, "different scale maps")
    checked(all(Q(raw[i]["kappa"]) == rows[i][3] for i in rows), "row curvature")
    extra = sparse.extra()
    knots = sorted({Q(c[k]) for v in raw.values() for c in v["cells"] for k in ("s_lo", "s_hi")})
    checked(len(knots) == 20 and knots[0] == 0 and knots[-1] == 42, "incomplete shape cover")
    banks = []
    for lo, hi in zip(knots, knots[1:]):
        lines = []
        for i, bank in raw.items():
            (cell,) = [c for c in bank["cells"] if Q(c["s_lo"]) <= lo and hi <= Q(c["s_hi"])]
            x = dict(expected_value(n, cell, Q(bank["nodes"][0][1])) for n in cell["nodes"])
            for (l, h, j), xs in extra.items():
                if l <= lo and hi <= h and i == j:
                    for z, v in xs.items():
                        x[z] = min(v, x.get(z, v))
            lines.append(chords(sparse.hull(x.items()), delta * Q(".93")))
        tiles = [
            (max(l, x), min(h, y), a, b, c, d)
            for l, h, a, b in lines[0]
            for x, y, c, d in lines[1]
            if max(l, x) < min(h, y)
        ]
        # Both row chord sets are continuous. Nondegenerate intersections cover both faces.
        checked(
            tiles[0][0] == 0
            and tiles[-1][1] == delta * Q(".93")
            and all(x[1] == y[0] for x, y in zip(tiles, tiles[1:])),
            "incomplete common scale range",
        )
        supp = []
        if hi <= 2:
            for lam in LAMBDAS:
                p = polynomial(lam, (lo + hi) / 2)
                supp.append((lam, up(MU_UP * max(majorant(p, lo), majorant(p, hi)))))
        banks.append((lo, hi, tiles, supp))
    return s, rows, delta, banks


@cache
def bank(t, with_reserve=False):
    s, rows, delta, banks = setup()
    # A legal fixed Gaussian support test for every t. On the upper disk arm use
    # its exact remote supremum with t at this t-cell's lower endpoint.
    z = Q(".4082")
    rad = min(Q(".93"), (sqrt_up(PI_HI * (1 + z * z) / 4) - t) / z)
    if 7 * t * t >= 6 * PI_HI / 4 and 4 * t * t < PI_HI:
        rad = min(rad, sqrt_up(PI_HI / 4 - t * t))
    checked(z * z <= Q(1, 6), "buffered comparison range")
    out = []
    for lo, hi, tiles, supp in banks:
        limit = min([rad] + [(u - t) / r for r, u in supp])
        if with_reserve:
            from shape_identity_reserve import cut

            limit = cut(t, lo, hi, limit)
        stop = delta * limit
        checked(stop > 0, "nonpositive scale")
        out.extend((l, min(h, stop), a, b, c, d) for l, h, a, b, c, d in tiles if l <= stop)
    return tuple(out)


@cache
def coeffs(w):
    s, rs, delta, _ = setup()
    g = gate_minimum([(1 - w) * a + w * b for a, b in zip(s.gates[8], s.gates[9])])
    checked(g >= 0, "negative common gate")
    return (1 - w) * rs[8][3] + w * rs[9][3] + g / delta**2, (1 - w) * rs[8][5] + w * rs[9][5]


def discount(t, w, with_reserve=False):
    k, base = coeffs(w)
    checked(k > 0, "nonpositive quadratic price")
    worst = 0
    for l, h, a, b, c, d in bank(t, with_reserve):
        u = (1 - w) * b + w * d
        z = min(max(l, u / (2 * k)), h)
        worst = max(worst, (1 - w) * a + w * c + (u - k * z) * z)
    return Q(floor((base - worst) * 10**13), 10**13)


def segments(choices, *, with_reserve=False):
    s, _, _, _ = setup()
    pieces = [v for v in joint_pieces(outer_pieces()) if v.cell not in range(18, 28)]
    total = 0
    for i, row in enumerate(choices, 18):
        l, h, left, right, _ = s.cells[i]
        checked({left, right} <= {8, 9}, "unexpected central row")
        n = len(row)
        for j, (p, q) in enumerate(row):
            a, b = l + (h - l) * j / n, l + (h - l) * (j + 1) / n
            w, z = Q(p, 10000), Q(q, 10000)
            checked(0 <= w <= 1 and 0 <= z <= 1, "inadmissible shares")
            pieces.append(
                segment(s, i, a, b, 8, 9, w, z, discount(a, w, with_reserve), discount(a, z, with_reserve))
            )
            total += 1
    pieces.sort(key=lambda p: p.low)
    first.check_partition(pieces, s.cells)
    checked(len(choices) == 10 and len(pieces) == 46 + total, "incomplete grid")
    return pieces


# Row 09 shares at the two ends of each closed interval, in ten-thousandths.
CHOICES = (
    ((0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (217, 749)),
    ((749, 887), (887, 901), (901, 901), (901, 901), (901, 902), (902, 902), (902, 902), (902, 902)),
    (
        (839, 980),
        (980, 1138),
        (1138, 1302),
        (1302, 1468),
        (1468, 1630),
        (1630, 1804),
        (1804, 1945),
        (1945, 2122),
    ),
    (
        (2122, 2274),
        (2274, 2443),
        (2443, 2614),
        (2614, 2790),
        (2790, 2927),
        (2942, 3106),
        (3109, 3278),
        (3298, 3459),
    ),
    (
        (3444, 3535),
        (3532, 3610),
        (3584, 3660),
        (3642, 3722),
        (3703, 3786),
        (3759, 3840),
        (3797, 3878),
        (3867, 3937),
    ),
    (
        (3938, 4017),
        (4008, 4091),
        (4091, 4161),
        (4138, 4232),
        (4220, 4302),
        (4291, 4373),
        (4373, 4444),
        (4445, 4513),
    ),
    (
        (4503, 4570),
        (4559, 4636),
        (4625, 4713),
        (4687, 4779),
        (4743, 4848),
        (4800, 4887),
        (4851, 4946),
        (4906, 4995),
    ),
    (
        (4962, 5061),
        (5026, 5109),
        (5131, 5153),
        (5167, 5211),
        (5371, 5454),
        (5464, 5515),
        (5531, 5607),
        (5617, 5697),
    ),
    (
        (5697, 5993),
        (5993, 6292),
        (6292, 6598),
        (6598, 6905),
        (6905, 7222),
        (7222, 7529),
        (7529, 7829),
        (7829, 8129),
    ),
    (
        (8129, 8742),
        (8742, 9365),
        (9365, 9938),
        (9938, 9947),
        (9947, 9982),
        (9982, 9996),
        (9996, 10000),
        (10000, 10000),
    ),
)


def verify_control(
    pieces, weight, pure_weight, signed_num, matched_num, pure_num, signed_floor, pure_floor, *, with_reserve
):
    debit = Q(1, 10**8)
    switch, pure_switch = Q(".885773796378757"), Q(".885773796896554")
    bound = signed_price(pieces, weight, debit, switch=switch)
    options = dict(residual=Q(".149"), radial_start=Q(".88575"), radial_floor=Q(".023"))
    matched = envelope(pieces, weight, 0, pure_switch, **options)
    pure = envelope(pieces, pure_weight, 0, pure_switch, **options)
    if with_reserve:
        from shape_identity_reserve import LIMIT

        # The discarded large-scale responses satisfy the physical identity price
        # outright; include them in all three control witnesses.
        def direct(w, d):
            return (1 - w) * LIMIT + w * PI_HI / 4 + d

        bound = max(bound, direct(weight, debit))
        matched = max(matched, direct(weight, 0))
        pure = max(pure, direct(pure_weight, 0))
    den = 10**14
    checked(ceil(bound * den) == signed_num and Q(den, signed_num) > signed_floor, "signed endpoint")
    checked(ceil(matched * den) == matched_num, "matched zero-debit endpoint")
    checked(ceil(pure * den) == pure_num and Q(den, pure_num) > pure_floor, "retuned pure endpoint")
    at_switch = [
        p.at(pure_switch, first.physical_scales(weight)) for p in pieces if p.low <= pure_switch <= p.high
    ]
    checked(
        at_switch
        and min(at_switch + [high(weight, 0, pure_switch, residual=Q(".149"))]) > Q(signed_num, den),
        "both high-amplitude control prices at the matched weight",
    )
    print(
        f"All 126 closed intervals, physical reserve {with_reserve}: signed cap {signed_num}/10^14, reciprocal >{signed_floor}."
    )
    print(f"Matched zero-debit cap {matched_num}/10^14; retuned pure cap {pure_num}/10^14.")


def main():
    _, pi_hi = pi_interval()
    checked(pi_hi < PI_HI, "outward Gaussian radius")
    from shape_identity_reserve import feasible_score

    score = feasible_score(Q(137187, 163840), Q(".2901603"), Q(".12"), Q(".18"))
    checked(score is not None and score < Q(".712527"), "same-response central price on the active shape")
    verify_control(
        segments(CHOICES),
        Q(64121281, 2000000000000),
        Q(640942269, 20000000000000),
        71325083185779,
        71325083203731,
        71325083107221,
        Q("1.402031312596"),
        Q("1.402031314140"),
        with_reserve=False,
    )
    verify_control(
        segments(CHOICES, with_reserve=True),
        Q(3204349893, 100000000000000),
        Q(1601498597, 50000000000000),
        71325083063479,
        71325083081431,
        71325082984922,
        Q("1.402031315000"),
        Q("1.402031316544"),
        with_reserve=True,
    )


if __name__ == "__main__":
    main()
