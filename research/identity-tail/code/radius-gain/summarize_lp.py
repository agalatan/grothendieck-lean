#!/usr/bin/env python3
"""Summarise the output of node_sdp.py: per row and scale, the largest difference over the sampled
shapes x (maxima of the samples, rounded upward; not bounds between the samples).
Usage: summarize_lp.py OUT_DIR      Agent-ID: claude-b9ee
"""
import json
import math
import sys
from pathlib import Path

RADII = ["0.93", "0.9148", "0.9142", "0.9", "0.88623"]
recs = [json.loads(l) for f in sorted(Path(sys.argv[1]).glob("sdp_*.jsonl")) for l in open(f)]
def up(z):
    """Round a nonnegative float upward to three significant digits (as text)."""
    if z <= 0:
        return "0"
    e = math.floor(math.log10(z))
    m = math.ceil(z / 10 ** e * 100 - 1e-9) / 100
    return f"{m:.2f}e{e:+03d}"


print("Every figure is a maximum over the sampled (row, sigma, x) records of the difference of two\n"
      "finite-support LP values on the pooled cut bank of the row, rounded upward; it is not an upper\n"
      "bound for shapes or scales between the samples, nor for the continuous problem.")
for row in sorted({r["row"] for r in recs}):
    print(f"row {row}: sigma | sampled x | first moment of the unconstrained optimiser (min..max) | "
          f"largest sampled difference for r = {', '.join(RADII)}")
    for sigma in sorted({r["sigma"] for r in recs if r["row"] == row}):
        rs = [r for r in recs if r["row"] == row and r["sigma"] == sigma]
        fm = [r["first_moment"] for r in rs]
        sav = [max(r["constrained"][k]["saving"] for r in rs) for k in RADII]
        xs = ",".join(f"{x:g}" for x in sorted(r["x"] for r in rs))
        print(f"  {sigma:6.4f} | {xs} | {min(fm):.4f}..{max(fm):.4f} | " + "  ".join(up(s) for s in sav))
print("maxima over all four rows:")
for label, pick in (("sigma <= 0.33", lambda s: s <= 0.33), ("sigma = 0.6", lambda s: s == 0.6),
                    ("sigma = 0.7377", lambda s: s == 0.7377)):
    rs = [r for r in recs if pick(r["sigma"])]
    fm = [r["first_moment"] for r in rs]
    print(f"  {label}: {len(rs)} records, first moment {min(fm):.4f}..{max(fm):.4f} | " + "  ".join(
        up(max(r["constrained"][k]["saving"] for r in rs)) for k in RADII))

# Weak duality check: where (sigma, x) is a committed node of a cell containing x, the node
# certificate must be at least the value of the linear programme.
from fractions import Fraction as Q

ROOT = Path(__file__).resolve().parents[4]
C6, RHO = Q(4045313, 100000), Q(973612157, 10**9)
gaps = []
for name in sorted({r["row"] for r in recs}):
    row = json.loads((ROOT / f"data/tail-rows/plain/row_{name}.json").read_text())
    for r in (r for r in recs if r["row"] == name):
        x, s = Q(str(r["x"])), Q(str(r["sigma"]))
        for c in row["cells"]:
            lo, hi = map(Q, c["x"])
            for n in c["nodes"]:
                if lo <= x <= hi and Q(n["sigma"]) == s:
                    a0, a2, a4, a6, a1 = map(Q, n["y"])
                    cert = a0 + RHO*a1 + a2 + a4*(2 + x*x) + a6*(6 + 9*x*x + C6*x**3)
                    gaps.append(float(cert) - r["value"])
print(f"node certificate minus LP value at {len(gaps)} committed nodes: "
      f"min {min(gaps):.2e}, median {sorted(gaps)[len(gaps)//2]:.2e}, max {max(gaps):.2e}")
