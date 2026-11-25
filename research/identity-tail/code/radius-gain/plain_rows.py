#!/usr/bin/env python3
"""Plain Stein rows 03-14 with the cubic radius r in place of Lean's rho = 973612157/10^9.

For each row of data/tail-rows/plain the committed certificate is re-evaluated with the same
nodes, rectangles and chords (the rule of `checkCell` in Grothe/Lower/Rows.lean):
  * first moment  E sqrt(U) <= r  in the node values and the rectangles,
  * stop scale  delta * r  instead of  delta * rho.
Everything is exact rational arithmetic.  The chords have exact maxima.  A small rectangle is
a polynomial of degree 6 in the scale; at both shape endpoints of every rectangle (three per
shape cell: 54 or 90 in a row) it is enclosed by Bernstein subdivision: the largest value at a subdivision point is a
lower bound of its maximum, the largest Bernstein coefficient an upper bound, and the two are
driven within TOL of each other.

Output per row: an enclosure of the certified worst value, where it is attained, and an
enclosure of the saving at each r.  Rows 03-13 bind on a chord (the rectangles are proved to
lie below it), so their numbers are exact; row 14 binds on a rectangle.
Run from the repository root:  python3 -IBO research/identity-tail/code/radius-gain/plain_rows.py
Agent-ID: claude-b9ee
"""
from fractions import Fraction as Q
from math import comb
from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / "scripts"))
from test_tight_shared_gate import header
from test_weighted_tight_gate import quadratic_maximum

RHO = Q(973612157, 10**9)
C6 = Q(4045313, 100000)
TOL = Q(1, 10**15)
NAMES = {3: "0.7", 4: "0.78", 5: "0.8", 6: "0.82", 7: "0.83", 8: "0.835", 9: "0.845",
         10: "0.85", 11: "0.86", 12: "0.87", 13: "0.885", 14: "0.8875"}


def require(condition, message):
    """An explicit check: unlike `assert` it survives `python3 -O`."""
    if not condition:
        raise ValueError(message)


def node_value(y, x, r):
    a0, a2, a4, a6, a1 = y
    return a0 + r*a1 + a2 + a4*(2 + x*x) + a6*(6 + 9*x*x + C6*x**3)


def bernstein(coeffs, lo, hi):
    """Bernstein coefficients on [lo, hi] of the polynomial sum coeffs[k] s^k."""
    n = len(coeffs) - 1
    w = hi - lo
    # coefficients in t of p(lo + w t)
    shifted = [sum(coeffs[k] * comb(k, j) * lo**(k - j) for k in range(j, n + 1)) * w**j
               for j in range(n + 1)]
    return [sum(shifted[j] * Q(comb(i, j), comb(n, j)) for j in range(i + 1))
            for i in range(n + 1)]


def split(b):
    """De Casteljau at 1/2: Bernstein coefficients on the two halves."""
    left, right, cur = [b[0]], [b[-1]], list(b)
    while len(cur) > 1:
        cur = [(u + v) / 2 for u, v in zip(cur, cur[1:])]
        left.append(cur[0])
        right.append(cur[-1])
    return left, right[::-1]


def poly_max(coeffs, lo, hi):
    """Enclosure (lower, upper, argument of lower) of max p on [lo, hi], upper - lower <= TOL."""
    require(lo <= hi, "empty scale interval")
    if lo == hi:
        v = sum(c * lo**k for k, c in enumerate(coeffs))
        return v, v, lo
    stack = [(bernstein(coeffs, lo, hi), lo, hi)]
    lower, at = max((stack[0][0][0], lo), (stack[0][0][-1], hi))
    upper_done = lower
    while stack:
        b, u, v = stack.pop()
        if b[0] > lower:
            lower, at = b[0], u
        if b[-1] > lower:
            lower, at = b[-1], v
        top = max(b)
        if top <= lower + TOL:
            upper_done = max(upper_done, top)
            continue
        left, right = split(b)
        mid = (u + v) / 2
        stack.append((left, u, mid))
        stack.append((right, mid, v))
    return lower, max(upper_done, lower), at


def row_worst(index, r):
    """(chord maximum with its location, rectangle enclosure with its location, cap, delta)."""
    row = json.loads((ROOT / f"data/tail-rows/plain/row_{NAMES[index]}.json").read_text())
    raw, _ = header(index)
    delta, kappa, cap = raw[2], raw[3], raw[5]
    require(kappa == Q(row["kappa"]), "row curvature differs from the Lean header")
    stop = delta * r
    chord = rect = None
    count = 0
    for cell in row["cells"]:
        xlo, xhi = map(Q, cell["x"])
        for piece in cell["small"]:
            slo, shi = map(Q, piece["s"])
            a0, a1, a2, a4, a6 = map(Q, piece["P"])
            require(a1 >= 0 and slo >= 0, "rectangle outside the rule of checkRect")
            count += 1
            if slo > stop:
                continue
            for x in (xlo, xhi):
                coeffs = [a0, r*a1, a2 - kappa, Q(0), a4*(2 + x*x), Q(0),
                          a6*(6 + 9*x*x + C6*x**3)]
                lo, hi, at = poly_max(coeffs, slo, min(shi, stop))
                if rect is None:
                    rect = (lo, hi, at, xlo)
                else:                                    # max of the lower and of the upper bounds
                    rect = ((lo, hi if hi > rect[1] else rect[1], at, xlo) if lo > rect[0]
                            else (rect[0], max(hi, rect[1]), rect[2], rect[3]))
        nodes = [(Q(n["sigma"]), max(node_value(list(map(Q, n["y"])), x, r) for x in (xlo, xhi)))
                 for n in cell["nodes"]]
        require(nodes[-1][0] >= delta * RHO, "the chords do not reach the stop scale")
        for (s0, v0), (s1, v1) in zip(nodes, nodes[1:]):
            if s0 >= stop:
                continue
            m = (v1 - v0) / (s1 - s0)
            v, at = quadratic_maximum((-kappa, m, v0 - m*s0), s0, min(s1, stop), True)
            if chord is None or v > chord[0]:
                chord = (v, at, xlo)
    require(count == 3 * len(row["cells"]), "three small rectangles per shape cell")
    return chord, rect, cap, delta


def main():
    rs = [RHO, Q(93, 100), Q(2287, 2500), Q(4571, 5000), Q(9, 10), Q(88623, 100000)]
    print("radii:", ", ".join(str(r) for r in rs))
    for i in NAMES:
        base = None
        savings = []
        for r in rs:
            chord, rect, cap, delta = row_worst(i, r)
            if rect[1] < chord[0]:                       # the chord binds: exact
                lo = hi = chord[0]
                where = f"chord at sigma={float(chord[1]):.4f} (tau={float(chord[1]/delta):.4f}) x_lo={float(chord[2]):.3f}"
            else:
                require(rect[0] > chord[0], "undecided between chord and rectangle: lower TOL")
                lo, hi = rect[0], rect[1]
                where = f"rectangle at sigma={float(rect[2]):.6f} (tau={float(rect[2]/delta):.6f}) x_lo={float(rect[3]):.3f}"
            if r == RHO:
                base = (lo, hi)
                require(hi <= cap, f"row {i}: worst value above the Lean cap")
                print(f"row{i:02d} t={NAMES[i]:6s} binds on a {where}; "
                      f"cap - worst(rho) in [{float(cap - hi):.3e}, {float(cap - lo):.3e}]"
                      f"{' (exact)' if lo == hi else ''}")
            savings.append((base[0] - hi, base[1] - lo))
        require(all(s[1] >= 0 for s in savings), "negative saving")
        print("    saving:", "  ".join(
            "0" if a == b == 0 else f"[{float(a):.7e}, {float(b):.7e}]" for a, b in savings))


if __name__ == "__main__":
    main()
