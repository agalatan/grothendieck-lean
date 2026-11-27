#!/usr/bin/env python3
"""Exact replay of the curved 08/09 envelope with the cubic radius r in place of 93/100.

The committed node tables are kept (the antiholomorphic nodes do not use the radius; the
moment and quadratic nodes use it through a nonnegative coefficient of E sqrt(U); the
transported ordinates through 93/100 * ratio * a1).  Only the radius changes:
  * the stop scale  delta * r  of both chord banks,
  * the first-moment term of the moment nodes, the quadratic nodes and the transported
    ordinates.
r = 93/100 must reproduce master (hat cap 8829435313/12500000000).  Label: C (exact
rational arithmetic), conditional on a Lean radius theorem for r.  Standard library only.
Run from the repository root:  python3 -IBO research/identity-tail/code/radius-gain/central_replay.py
Agent-ID: claude-b9ee
"""
from copy import copy
from fractions import Fraction as Q
from math import ceil, floor
from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / "research/identity-tail/code"))
import coupled_stein_profile as base
import sparse_stein_dilation as sparse
import curved_stein_profile as curved

OLD = Q(93, 100)
RADIUS = [OLD]


def quad_bank(name):
    bank = json.loads((ROOT / f"data/antistein-rows/antistein_{name}.json").read_text())
    return bank["quad_bank"]


# (sigma, stored value) -> a1 for the quadratic nodes; QuadNode.val = a0 + a1 * 93/100 + a2
QUAD_A1 = {}
for _name in ("0.835", "0.845"):
    for _q in quad_bank(_name):
        _val = Q(_q["a0"]) + Q(_q["a1"]) * OLD + Q(_q["a2"])
        QUAD_A1[(Q(_q["sigma"]), _val)] = Q(_q["a1"])
_expected_old = base.expected_value


def expected_value(node, cell, zero):
    """base.expected_value with RADIUS[0] in the first-moment term."""
    r = RADIUS[0]
    kind = node["kind"]
    if kind == "moment":
        a0, a1, a2, a4, a6 = (Q(node[k]) for k in ("a0", "a1", "a2", "a4", "a6"))
        base.checked(a1 >= 0, "negative first-moment coefficient")

        def endpoint(side):
            s = Q(cell["s_" + side])
            return (a0 + r*a1 + a2 + a4*(2+s)
                    + a6*(6 + 9*s + Q(4045313, 100000)*s*Q(node["sb_" + side])))
        return Q(node["sigma"]), max(endpoint("lo"), endpoint("hi"))
    if kind == "quad":
        key = (Q(node["sigma"]), Q(node["val"]))
        base.checked(key in QUAD_A1 and QUAD_A1[key] >= 0, "quadratic node not found in its bank")
        return key[0], key[1] - QUAD_A1[key] * (OLD - r)
    return _expected_old(node, cell, zero)


_chords_old = base.chords


def chords(nodes, stop):
    # every caller passes stop = delta * 93/100
    return _chords_old(nodes, stop * RADIUS[0] / OLD)


_transport_old = sparse.transport


def transport(r, c, j, x, l, h):
    """sparse.transport with RADIUS[0]: subtract the first-moment saving before rounding."""
    node = r["cells"][c]["nodes"][j]
    a1 = Q(node["y"][4])
    ratio = x / Q(node["sigma"])
    base.checked(a1 >= 0 and ratio > 0, "sign")
    # recompute unrounded: the old function rounds up at 1e-12, so redo it exactly
    cell = r["cells"][c]
    sigma = Q(node["sigma"])
    a0, a2, a4, a6, a1 = map(Q, node["y"])
    k = ratio**2
    offset = Q(0)
    for index, mu in zip(node["cuts"], node["mu"], strict=True):
        z = cell["bank"][index]
        b, al = (Q(v, 10**7) for v in z[-2:])
        offset += Q(mu, 10**10) * (b*b - (b + (k-1)*al)**2 + Q(2, 3)*al**2*(k*k-1))

    def bound(s):
        return (a0 + RADIUS[0]*ratio*a1 + a2*k + a4*k*k*(2+s)
                + a6*k**3*(6 + 9*s + sparse.C6*s*sparse.sqrt_upper(s)) - offset)
    return Q(ceil(max(bound(l), bound(h)) * 10**12), 10**12)


base.expected_value = expected_value
base.chords = chords
sparse.transport = transport


def quad_dependence():
    """How many quadratic nodes carry a first-moment coefficient (their stored val uses 93/100)."""
    out = {}
    for name in ("0.835", "0.845"):
        qb = quad_bank(name)
        out[name] = (len(qb), sum(1 for q in qb if Q(q["a1"]) != 0),
                     max(Q(q["a1"]) for q in qb))
    return out


def run(r, cut=Q(21, 100)):
    RADIUS[0] = Q(r)
    coeff = curved.curvature(8, 9)
    sparse.base.TestWeightedTightGate.setUpClass()
    src = sparse.base.TestWeightedTightGate()
    weights = sorted({p for lo, hi, i, j, w in src.cells if {i, j} <= {8, 9}
                      for _, _, a, b in base.affine_pieces(src.rows, 8, 9, lo, hi, w) for p in (a, b)})
    law = sparse.law(src, True)
    small = copy(law)
    small.pieces = [(l, min(h, cut), a, b, c, d) for l, h, a, b, c, d in law.pieces if l <= cut]
    prices = {w: Q(floor(law.discount(w)*10**13), 10**13) for w in weights}
    small_prices = {w: Q(floor(small.discount(w)*10**13), 10**13) for w in weights}
    margins = {w: small_prices[w]-d for w, d in prices.items()}
    base.checked(min(margins.values()) >= 0, "invalid small-scale margins")

    def bend(w, z):
        return min(4*margins[w], 4*margins[z], coeff*(w-z)**2*(cut/law.delta)**2)
    cap, cell, endpoint = curved.weighted_profile(src, prices, bend)
    return dict(r=Q(r), cap=cap, cell=cell, endpoint=endpoint, prices=prices,
                stop=law.delta*Q(r), pieces=len(law.pieces))


def worst_piece(r, w):
    """Location (sigma interval, maximiser) of the binding piece of the discount at weight w."""
    RADIUS[0] = Q(r)
    sparse.base.TestWeightedTightGate.setUpClass()
    src = sparse.base.TestWeightedTightGate()
    law = sparse.law(src, True)
    gate = tuple((1-w)*a+w*b for a, b in zip(law.gates[8], law.gates[9]))
    kappa = (1-w)*law.rows[0][1]+w*law.rows[1][1]+base.gate_minimum(gate)/law.delta**2
    best = max((base.quadratic_maximum((-kappa, (1-w)*b+w*bb, (1-w)*a+w*aa), lo, hi, True), lo, hi)
               for lo, hi, a, b, aa, bb in law.pieces)
    return best


if __name__ == "__main__":
    print("quadratic nodes (count, with a1 != 0, max a1):", quad_dependence())
    master = Q(25000000000000, 17831387166289)
    rs = [Q(93, 100), Q(2287, 2500), Q(4571, 5000), Q(9, 10), Q(88623, 100000), Q(88622, 100000)]
    for r in rs:
        o = run(r)
        if r == OLD:
            base.checked(o["cap"] == Q(8829435313, 12500000000) and o["endpoint"] == master,
                         "control does not reproduce master")
        print(f"r={r} ({float(r):.5f}) stop={float(o['stop']):.6f} pieces={o['pieces']} "
              f"cap={o['cap']} cell={o['cell']} endpoint={o['endpoint']} "
              f"= {float(o['endpoint']):.13f} gain={float(o['endpoint']-master):.3e}")
        print("   prices*1e9:", [round(float(p)*1e9, 3) for p in o["prices"].values()])
    # negative control: a radius below the binding scales (tau = 0.27 to 0.33) must move the cap
    for r in (Q(3, 10), Q(1, 4)):
        o = run(r)
        base.checked(o["cap"] < Q(8829435313, 12500000000), "the radius parameter has no effect")
        print(f"control r={r}: pieces={o['pieces']} cap={float(o['cap']):.11f} cell={o['cell']} "
              f"endpoint={float(o['endpoint']):.13f}")
    for r in (Q(93, 100), Q(2287, 2500)):
        for w in (Q(0), Q(1, 2), Q(1)):
            (val, at), lo, hi = worst_piece(r, w)
            print(f"   r={r} w={w}: binding piece sigma in [{float(lo):.5f},{float(hi):.5f}] at {float(at):.5f}")
