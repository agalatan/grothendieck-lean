#!/usr/bin/env python3
"""Summarise the output of node_sdp.py: per row and scale, the largest saving over the shapes x.
Usage: summarize_lp.py OUT_DIR      Agent-ID: claude-b9ee
"""
import json
import sys
from pathlib import Path

RADII = ["0.93", "0.9148", "0.9142", "0.9", "0.88623"]
recs = [json.loads(l) for f in sorted(Path(sys.argv[1]).glob("sdp_*.jsonl")) for l in open(f)]
for row in sorted({r["row"] for r in recs}):
    print(f"row {row}: sigma | first moment of the unconstrained optimiser (min..max over x) | "
          f"largest saving over x for r = {', '.join(RADII)}")
    for sigma in sorted({r["sigma"] for r in recs if r["row"] == row}):
        rs = [r for r in recs if r["row"] == row and r["sigma"] == sigma]
        fm = [r["first_moment"] for r in rs]
        sav = [max(r["constrained"][k]["saving"] for r in rs) for k in RADII]
        print(f"  {sigma:6.4f} | {min(fm):.4f}..{max(fm):.4f} | " + "  ".join(f"{s:9.2e}" for s in sav))

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
