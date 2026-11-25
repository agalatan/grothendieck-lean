#!/usr/bin/env python3
"""Exact shared-scale replay of the two checked Stein row tables, for task #674.

Run from any directory. The program uses the row data and envelope of PR #672.
Its output is a research result pending end-to-end Lean integration.
Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import lru_cache
import json
from math import ceil
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "scripts"))
from test_tight_shared_gate import EPS, gate_minimum, header
from test_weighted_tight_gate import TestWeightedTightGate, quadratic_maximum


def checked(condition, message):
    if not condition:
        raise ValueError(message)


def expected_value(node, cell, zero):
    """RowSigmaNode.val in AntiSteinRowCheck.lean, including its moment convention."""
    kind = node["kind"]
    if kind == "zero":
        return Q(0), zero
    sigma = Q(node["sigma"])
    if kind in ("quad", "anti"):
        return sigma, Q(node["val"])
    checked(kind == "moment", f"unrecognized node {kind}")
    a0, a1, a2, a4, a6 = (Q(node[key]) for key in ("a0", "a1", "a2", "a4", "a6"))

    def endpoint(side):
        s = Q(cell["s_" + side])
        sqrt_bound = Q(node["sb_" + side])
        return (a0 + Q(93, 100)*a1 + a2 + a4*(2+s)
                + a6*(6 + 9*s + Q(4045313, 100000)*s*sqrt_bound))

    return sigma, max(endpoint("lo"), endpoint("hi"))


def chords(nodes, stop):
    checked(nodes[0][0] == 0 and nodes[-1][0] >= stop, "incomplete scale cover")
    lines = []
    for (x, y), (xx, yy) in zip(nodes, nodes[1:]):
        checked(xx > x, "reversed scale knots")
        if x < stop:
            slope = (yy-y)/(xx-x)
            lines.append((x, min(xx, stop), y-slope*x, slope))
    return lines


def load_bank(index, name):
    path = ROOT / "data" / "antistein-rows" / f"antistein_{name}.json"
    bank = json.loads(path.read_text())
    raw, _ = header(index)
    delta, kappa = raw[2:4]
    cap = Q(bank["cap"])
    zero = Q(bank["nodes"][0][1])
    checked(bank["row"] == name and Q(bank["nodes"][0][0]) == 0, "wrong bank")
    checked(kappa == Q(bank["kappa"]), "row curvature mismatch")
    cells = []
    maximum = None
    previous = Q(0)
    for cell in bank["cells"]:
        lo, hi = Q(cell["s_lo"]), Q(cell["s_hi"])
        checked(lo == previous and lo < hi, "incomplete fourth-excess cover")
        nodes = [expected_value(node, cell, zero) for node in cell["nodes"]]
        lines = chords(nodes, delta*Q(93, 100))
        for l, h, a, b in lines:
            value, _ = quadratic_maximum((-kappa, b, a), l, h, True)
            maximum = value if maximum is None else max(value, maximum)
        cells.append((lo, hi, lines))
        previous = hi
    checked(previous == 42 and maximum <= cap, "single-row cap failed")
    return delta, kappa, cap, cells


class SharedLaw:
    def __init__(self, source, shared_excess=True):
        self.gates = source.gates
        self.rows = [load_bank(8, "0.835"), load_bank(9, "0.845")]
        self.delta = self.rows[0][0]
        checked(self.delta == self.rows[1][0] and self.delta > 0, "different scale maps")
        self.pieces = []
        for sl, sh, left in self.rows[0][3]:
            for tl, th, right in self.rows[1][3]:
                if shared_excess and max(sl, tl) >= min(sh, th):
                    continue
                # Closed segments of positive length cover all boundaries of both partitions.
                for l, h, a, b in left:
                    for ll, hh, aa, bb in right:
                        lo, hi = max(l, ll), min(h, hh)
                        if lo < hi:
                            self.pieces.append((lo, hi, a, b, aa, bb))

    @lru_cache(maxsize=None)
    def discount(self, w, use_gate=True):
        checked(0 <= w <= 1, "mixture outside [0,1]")
        gate = tuple((1-w)*a+w*b for a, b in zip(self.gates[8], self.gates[9]))
        gain = gate_minimum(gate) if use_gate else Q(0)
        checked(gain >= 0, "negative gate surplus")
        kappa = (1-w)*self.rows[0][1]+w*self.rows[1][1]+gain/self.delta**2
        baseline = (1-w)*self.rows[0][2]+w*self.rows[1][2]
        worst = max(quadratic_maximum(
            (-kappa, (1-w)*b+w*bb, (1-w)*a+w*aa), lo, hi, True)[0]
            for lo, hi, a, b, aa, bb in self.pieces)
        return baseline-worst


def affine_pieces(rows, i, j, lo, hi, fallback):
    ell, beta, cap = rows[i]
    ell2, beta2, cap2 = rows[j]
    penalty = 2*(beta2-beta)**2/EPS
    if penalty:
        offset = (cap-cap2+penalty)/(2*penalty)
        speed = (ell2-ell)/penalty
    else:
        offset, speed = fallback, Q(0)
    knots = {lo, hi}
    if speed:
        knots.update(t for t in (-offset/speed, (1-offset)/speed) if lo < t < hi)
    ordered = sorted(knots)
    for l, h in zip(ordered, ordered[1:]):
        yield l, h, max(0, min(1, offset+speed*l)), max(0, min(1, offset+speed*h))


def envelope(source, discount, affine_everywhere):
    maxima = []
    previous = Q(0)
    for index, (lo, hi, i, j, weight) in enumerate(source.cells):
        checked(lo == previous and lo < hi, "incomplete amplitude cover")
        previous = hi
        rows = dict(source.rows)
        mid = (lo+hi)/2
        rows[0] = (mid/2, Q(0), Q(1, 2)+source.mass+mid**2/2)
        central = {i,j} <= {8,9}
        if central:
            i, j = 8, 9
        pieces = affine_pieces(rows, i, j, lo, hi, weight) if (central or affine_everywhere) else [
            (lo, hi, weight, weight)]
        ell, beta, cap = rows[i]
        ell2, beta2, cap2 = rows[j]
        penalty = 2*(beta2-beta)**2/EPS
        for l, h, w, z in pieces:
            dl, dh = (discount(w), discount(z)) if central else (Q(0), Q(0))

            def value(x):
                t = (1-x)*l+x*h
                p = (1-x)*w+x*z
                base = t*t-2*((1-p)*ell+p*ell2)*t+(1-p)*cap+p*cap2
                return base-penalty*p*(1-p)-((1-x)*dl+x*dh)

            left, right, midpoint = value(Q(0)), value(Q(1)), value(Q(1,2))
            a = 2*(left+right-2*midpoint)
            top, x = quadratic_maximum((a, right-left-a, left), Q(0), Q(1), True)
            maxima.append((top, index, (1-x)*l+x*h))
    checked(previous == Q(9,10), "wrong upper amplitude")
    return max(maxima)


def main():
    TestWeightedTightGate.setUpClass()
    source = TestWeightedTightGate()
    law = SharedLaw(source)
    independent = SharedLaw(source, shared_excess=False)
    half = Q(1, 2)
    checked(len(law.pieces) == 1051 and len(independent.pieces) == 7973, "wrong overlay")
    checked(law.discount(half) > independent.discount(half) > source.discount(half),
            "sharing scale and fourth excess must both help at half weight")
    checked(law.discount(half, use_gate=False) < law.discount(half), "gate control")
    checked(law.discount(half) > Q(5128, 10**9), "joint discount regression")
    for label, f, affine, expected, cell in [
        ("prior law", source.discount, False, Q(176590771,250000000), 23),
        ("shared law, prior outer weights", law.discount, False, Q(706362761,10**9), 29),
        ("shared law, affine outer weights", law.discount, True, Q(1412721229,2*10**9), 23),
    ]:
        top, binding, amplitude = envelope(source, f, affine)
        cap = Q(ceil(top*10**10), 10**10)
        checked(cap == expected and binding == cell, f"{label} cap or binding cell")
        transfer = 1/(Q(1953,2000)*cap+Q(47,2000))
        print(f"{label}: cell {binding}, t={float(amplitude):.12f}, cap={cap}, endpoint={transfer}")
    checked(transfer == Q(4000000000000,2853044560237), "transfer normalization")


if __name__ == "__main__":
    main()
