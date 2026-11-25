#!/usr/bin/env python3
"""Scalar (plain Stein) rows with the cubic radius r in place of Lean's rho = 973612157/10^9.

For each plain row of data/tail-rows/plain the committed certificate is re-evaluated with the
same nodes, rectangles and chords (the rule of `checkCell` in Grothe/Lower/Rows.lean):
  * first moment  E sqrt(U) <= r  in the node values and the rectangles,
  * stop scale  delta * r  instead of  delta * rho.
Output per row: the certified worst value (must be <= the Lean cap at r = rho), where it is
attained, and the saving at each r.  Chords are exact; rectangles are sampled (label N).
Run from the repository root:  python3 -IBO research/identity-tail/code/radius-gain/plain_rows.py
Agent-ID: claude-b9ee
"""
from fractions import Fraction as Q
from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / "scripts"))
from test_tight_shared_gate import header
from test_weighted_tight_gate import quadratic_maximum

RHO = Q(973612157, 10**9)
C6 = Q(4045313, 100000)
NAMES = {3: "0.7", 4: "0.78", 5: "0.8", 6: "0.82", 7: "0.83", 8: "0.835", 9: "0.845",
         10: "0.85", 11: "0.86", 12: "0.87", 13: "0.885", 14: "0.8875"}


def third(x):
    """Upper bound of x^3 for rational x (exact)."""
    return x**3


def node_value(y, x, r):
    a0, a2, a4, a6, a1 = y
    return a0 + r*a1 + a2 + a4*(2 + x*x) + a6*(6 + 9*x*x + C6*third(x))


def row_worst(index, r):
    row = json.loads((ROOT / f"data/tail-rows/plain/row_{NAMES[index]}.json").read_text())
    raw, _ = header(index)
    delta, kappa, cap = raw[2], raw[3], raw[5]
    assert kappa == Q(row["kappa"])
    stop = delta * r
    best = None
    for cell in row["cells"]:
        xlo, xhi = map(Q, cell["x"])
        # rectangles (small scales): J(sigma, x) - kappa sigma^2, sampled
        top = Q(0)
        for rect in cell["small"]:
            slo, shi = map(Q, rect["s"])
            a0, a1, a2, a4, a6 = map(Q, rect["P"])
            top = max(top, shi)
            hi = min(shi, stop)
            if slo > stop:
                continue
            for k in range(41):
                s = slo + (hi - slo) * Q(k, 40)
                for x in (xlo, xhi):
                    v = (a0 + r*a1*s + (a2 - kappa)*s**2 + a4*(2 + x*x)*s**4
                         + a6*(6 + 9*x*x + C6*third(x))*s**6)
                    if best is None or v > best[0]:
                        best = (v, float(s), float(xlo), "rect")
        nodes = [(Q(n["sigma"]), max(node_value(list(map(Q, n["y"])), x, r) for x in (xlo, xhi)))
                 for n in cell["nodes"]]
        assert nodes[-1][0] >= delta * RHO
        for (s0, v0), (s1, v1) in zip(nodes, nodes[1:]):
            if s0 >= stop:
                continue
            m = (v1 - v0) / (s1 - s0)
            v, at = quadratic_maximum((-kappa, m, v0 - m*s0), s0, min(s1, stop), True)
            if v > best[0]:
                best = (v, float(at), float(xlo), "chord")
    return best, cap, delta


def main():
    rs = [RHO, Q(93, 100), Q(2287, 2500), Q(4571, 5000), Q(9, 10), Q(88623, 100000)]
    out = {}
    for i in NAMES:
        base = None
        line = []
        for r in rs:
            (v, at, x, kind), cap, delta = row_worst(i, r)
            if r == RHO:
                base = v
                assert v <= cap, (i, float(v), float(cap))
                head = (f"row{i:02d} t={NAMES[i]:6s} cap-worst(rho)={float(cap - v):.2e} "
                        f"binding {kind} at sigma={at:.4f} (tau={at/float(delta):.4f}) x_lo={x:.3f}")
            line.append(float(base - v))
            out[(i, r)] = base - v
        print(head)
        print("    saving for r = rho, .93, .9148, .9142, .9, .88623:",
              " ".join(f"{z:.3e}" for z in line))
    return out


if __name__ == "__main__":
    main()
