#!/usr/bin/env python3
"""Verify the two-row scale-transport overlay with 14 prospective nodes.
The eleven original plain polynomials supply fourteen ordinates on nineteen
common fourth-excess slabs. Standard library only.
Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import ceil, floor, isqrt
from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "research/identity-tail/code"))
import coupled_stein_profile as base
from coupled_stein_profile import checked
from test_tight_shared_gate import completed_gate, gate_minimum, header

C6 = Q(4045313, 100000)
# (shape interval, tight row number, new scale, plain row cell/node indices).
catalog = [
    ("0", "1/16", 8, "47/200", 5, 6),
    ("1/16", "1/10", 8, "47/200", 6, 6),
    ("1/10", "3/25", 8, "47/200", 6, 6),
    ("3/25", "9/50", 8, "47/200", 8, 6),
    ("9/50", "6/25", 8, "47/200", 8, 6),
    ("9/20", "1/2", 8, "9/40", 13, 6),
    ("1/2", "3/4", 8, "9/40", 15, 5),
    ("0", "1/16", 9, "49/200", 5, 11),
    ("1/16", "1/10", 9, "53/200", 6, 15),
    ("1/10", "3/25", 9, "53/200", 7, 18),
    ("3/25", "9/50", 9, "53/200", 8, 17),
    ("9/50", "6/25", 9, "53/200", 9, 21),
    ("6/25", "13/50", 9, "53/200", 10, 19),
    ("13/50", "8/25", 9, "53/200", 10, 19),
]


def sqrt_upper(s):
    n = isqrt(floor(s * 10**24))
    x = Q(n, 10**12)
    return x if x * x == s else x + Q(1, 10**12)


def transport(r, c, j, x, l, h):
    cell = r["cells"][c]
    node = cell["nodes"][j]
    sigma = Q(node["sigma"])
    a0, a2, a4, a6, a1 = map(Q, node["y"])
    ratio = x / sigma
    k = ratio**2
    offset = Q(0)
    checked(a1 >= 0 and a6 >= 0 and ratio > 0, "invalid moment-majorant coefficients or dilation")
    for index, mu in zip(node["cuts"], node["mu"], strict=True):
        z = cell["bank"][index]
        checked(len(z) == len(r["mesh"]) + 1 and mu >= 0, "invalid cut dimensions or weight")
        b, al = (Q(v, 10**7) for v in z[-2:])
        offset += Q(mu, 10**10) * (
            b * b - (b + (k - 1) * al) ** 2 + Q(2, 3) * al**2 * (k * k - 1)
        )

    def bound(s):
        return (
            a0
            + Q(93, 100) * ratio * a1
            + a2 * k
            + a4 * k * k * (2 + s)
            + a6 * k**3 * (6 + 9 * s + C6 * s * sqrt_upper(s))
            - offset
        )

    return Q(ceil(max(bound(l), bound(h)) * 10**12), 10**12)


def hull(points):
    out = []
    for x, y in sorted(points):
        while len(out) > 1:
            (a, b), (c, d) = out[-2:]
            if (y - d) * (c - a) > (d - b) * (x - c):
                break
            out.pop()
        out.append((x, y))
    return out


def extra():
    rows = {
        i: json.loads((ROOT / f"data/tail-rows/plain/row_{n}.json").read_text())
        for i, n in ((8, "0.835"), (9, "0.845"))
    }
    pts = {}
    for l, h, i, x, c, j in catalog:
        l, h, x = map(Q, (l, h, x))
        key = l, h, i
        pts.setdefault(key, {})[x] = transport(rows[i], c, j, x, l, h)
    return pts


def law(src, augmented):
    model = base.SharedLaw(src, include_faces=True)
    add = extra()
    shapes = sorted({s for row in model.rows for l, h, _ in row[3] for s in [l, h]})
    stop = model.delta * Q(93, 100)
    pcs = set()
    used = set()
    old_rows = {
        i: json.loads((ROOT / f"data/antistein-rows/antistein_{name}.json").read_text())
        for i, name in [(8, "0.835"), (9, "0.845")]
    }
    for l, h in zip(shapes, shapes[1:]):
        lines = []
        for i in (8, 9):
            row_cells = old_rows[i]["cells"]
            parents = [c for c in row_cells if Q(c["s_lo"]) <= l and h <= Q(c["s_hi"])]
            checked(len(parents) == 1, "shape slab does not have a unique source cell")
            parent = parents[0]
            zero = Q(old_rows[i]["nodes"][0][1])
            ns = dict(base.expected_value(n, parent, zero) for n in parent["nodes"])
            if augmented:
                for z, v in add.get((l, h, i), {}).items():
                    used.add((l, h, i, z))
                    ns[z] = min(ns.get(z, v), v)
            lines.append(base.chords(hull(ns.items()), stop))
        for x, y, a, b in lines[0]:
            for z, t, c, d in lines[1]:
                if max(x, z) <= min(y, t):
                    pcs.add((max(x, z), min(y, t), a, b, c, d))
    checked(len(shapes) == 20 and len(used) == (14 if augmented else 0), "unexpected shape-slab or transported-knot count")
    model.pieces = pcs
    return model


def outer_data(index, coeff, intercept):
    row, encoded = header(index)
    delta, kappa, slope, cap = row[2:6]
    pts = hull([tuple(map(Q, xy.split(":"))) for xy in encoded.split(";")])

    def check(x, y, b, stop=None):
        t = (
            max(x, b / (2 * coeff))
            if stop is None
            else max(x, min(stop, b / (2 * coeff)))
        )
        checked(y + b * (t - x) <= intercept + coeff * t * t, "outer quadratic fails to cover the chord")

    for (x, y), (xx, yy) in zip(pts, pts[1:]):
        check(x, y, (yy - y) / (xx - x), xx)
    check(*pts[-1], slope)
    gate = list(completed_gate(row))
    gate[0] -= kappa * delta**2 - delta
    H = cap - intercept
    K = (coeff - kappa) * delta**2
    checked(H > 0 and K > 0 and gate_minimum(gate) >= 0, "invalid common-gate saving")
    return gate, H, K


outer = [
    outer_data(6, Q(563, 500), Q(1306702479, 10**9)),
    outer_data(7, Q(227, 200), Q(132914743, 10**8)),
]


def outer_discount(w):
    a, h, k = outer[0]
    b, H, K = outer[1]
    mix = lambda u, v: (1 - w) * u + w * v
    g = gate_minimum([mix(x, y) for x, y in zip(a, b)])
    return min(mix(h, H), g * mix(h, H) / mix(k, K))


def combined(src, central):
    maxima = []
    for index, (lo, hi, i, j, w0) in enumerate(src.cells):
        rows = dict(src.rows)
        mid = (lo + hi) / 2
        rows[0] = (mid / 2, Q(0), Q(1, 2) + src.mass + mid**2 / 2)
        if {i, j} <= {8, 9}:
            i, j, price = 8, 9, central
        elif {i, j} <= {6, 7}:
            i, j, price = 6, 7, outer_discount
        else:
            price = lambda _: Q(0)
        ell, beta, cap = rows[i]
        ell2, beta2, cap2 = rows[j]
        pen = 2 * (beta2 - beta) ** 2 / base.EPS
        for l, h, w, z in base.affine_pieces(rows, i, j, lo, hi, w0):
            p, q = price(w), price(z)

            def val(x):
                t = l + x * (h - l)
                u = w + x * (z - w)
                return (
                    t * t
                    - 2 * ((1 - u) * ell + u * ell2) * t
                    + (1 - u) * cap
                    + u * cap2
                    - pen * u * (1 - u)
                    - ((1 - x) * p + x * q)
                )

            u, v, mid = map(val, [Q(0), Q(1), Q(1, 2)])
            a = 2 * (u + v - 2 * mid)
            v, x = base.quadratic_maximum((a, v - u - a, u), Q(0), Q(1), True)
            maxima.append((v, index, l + x * (h - l)))
    return max(maxima)


def run():
    base.TestWeightedTightGate.setUpClass()
    src = base.TestWeightedTightGate()
    W = sorted(
        {
            r
            for l, h, i, j, v in src.cells
            if {i, j} <= {8, 9}
            for _, _, w, z in base.affine_pieces(src.rows, 8, 9, l, h, v)
            for r in (w, z)
        }
    )
    checked(len(W) == 9, "unexpected number of mixture weights")
    orig = base.SharedLaw(src, include_faces=True)
    basic = law(src, False)
    modified = law(src, True)
    old = {w: Q(floor(orig.discount(w) * 10**13), 10**13) for w in W}
    target = dict(old)
    for idx, num in [
        (2, 665315),
        (3, 1049499),
        (4, 1055327),
        (5, 1081547),
        (6, 986298),
        (7, 898852),
    ]:
        target[W[idx]] = Q(num, 10**11)
    checked(all(modified.discount(w)>=t for w,t in target.items()), "certified central discount below its tabulated price")
    v, cell, t = combined(src, target.__getitem__)
    cap = Q(ceil(v * 10**11), 10**11)
    endpoint = 1 / (Q(1953, 2000) * cap + Q(47, 2000))
    fallback = combined(src, basic.discount)
    checked(
        cap == Q(70635503391, 10**11)
        and cell == 34
        and endpoint == Q(200000000000000, 142651138122623),
        "endpoint or critical amplitude cell changed",
    )
    checked(fallback[0] > v, "removing transported ordinates failed the negative control")
    checked((len(basic.pieces), len(modified.pieces)) == (929, 945), "closed-piece counts changed")
    checked(Q(ceil(fallback[0] * 10**11), 10**11) == Q(1412721229, 2*10**9), "no-dilation control changed")
    print(
        "pieces",
        len(basic.pieces),
        len(modified.pieces),
        "no extra knots",
        Q(ceil(fallback[0] * 10**11), 10**11),
        "new",
        cap,
        "endpoint",
        endpoint,
    )


if __name__ == "__main__":
    run()
