#!/usr/bin/env python3
"""Compare recomputed cell grades (cell_grades.py) with the Lean-verified enclosures
(HeadWitnessFacts.Group00-07 of the eighteen-channel branch, scale 2^128).
Usage: cmp_grades.py GRADES.json SRC18_DIR"""
import json, re, sys
from fractions import Fraction as Q
from pathlib import Path
from flint import arb, fmpq, ctx
ctx.prec = 512
IV = re.compile(r"⟨(-?\d+),\s*(-?\d+)⟩")
def lean_grades(root):
    res = []
    for g in range(8):
        text = (Path(root) / f"Grothe/UpperReplacement/HeadWitnessFacts/Group{g:02d}.lean").read_text()
        iv = [(int(x), int(y)) for x, y in IV.findall(text[text.index("def group"):])]
        assert len(iv) == 8 * 126
        res += [iv[i * 126:(i + 1) * 126] for i in range(8)]
    return [(sum(x for x, _ in col), sum(y for _, y in col)) for col in zip(*res)]
if __name__ == "__main__":
    d = json.load(open(sys.argv[1])); mu = [arb(s) for s in d["grades"]]
    g = lean_grades(sys.argv[2]); D = 1 << 128
    inside = 0; worst = 0.0; wmax = 0
    n = min(len(mu), len(g))
    for k in range(n):
        lo, hi = arb(fmpq(g[k][0], D)), arb(fmpq(g[k][1], D))
        ok = bool(mu[k] > lo) and bool(mu[k] < hi)       # the whole ball strictly inside the interval
        inside += ok
        dist = max(abs(float(mu[k] - lo)), abs(float(mu[k] - hi)))
        worst = max(worst, dist); wmax = max(wmax, g[k][1] - g[k][0])
        if not ok: print("grade", k, "NOT inside:", d["grades"][k][:50], float(lo), float(hi))
    print("grades compared: %d ; ball strictly inside the Lean interval: %d ; largest Lean interval width %.3e ; "
          "largest ball radius %.3e ; largest distance to an endpoint %.3e" % (n, inside, wmax / D, d["max_radius"], worst))
    print("mu_0 =", d["grades"][0][:70])
