#!/usr/bin/env python3
"""Compare kernel dumps (`quadrun twistdump`) with the prototype's per-node arrays
(`nodes-j<j>-checker-<i>of8.npz`, the `checker` run of tools/upper_closure_spike.py).

    python3 tools/quad_twist_sample.py <j> <dumpdir> <npzdir>

For every dump `twistnode-j<j>-<ordinal>.txt` in `dumpdir`: the prototype's node of the same ordinal
(its `s` must agree), the maximal difference of the enclosure midpoints from the prototype's J over
the low band and over the whole triangle, whether every prototype value lies inside the enclosure
(widened by 1e-13), and the `I`-part against `W_s e^{-s} G` (`G` from the prototype's record).
Agent-ID: claude-b9ee. Refs #41, #313.
"""
import glob
import json
import math
import os
import re
import sys

import numpy as np


def load_proto(j, npzdir):
    files = sorted(glob.glob(os.path.join(npzdir, f"nodes-j{j}-checker-*of8.npz")))
    J, ids, recs, Dw = [], [], {}, None
    for f in files:
        z = np.load(f)
        J.append(z["J"]); ids.append(z["ids"]); Dw = int(z["Dw"])
        for rec in json.loads(str(z["meta"]))["recs"]:
            recs[rec["i"]] = rec
    J = np.concatenate(J); ids = np.concatenate(ids)
    idx = np.array([(c, d) for c in range(Dw + 1) for d in range(Dw + 1 - c)])
    return J, {int(i): n for n, i in enumerate(ids)}, recs, Dw, idx


def main(j, dumpdir, npzdir):
    Jp, pos, recs, Dw, idx = load_proto(j, npzdir)
    Dlow = {1: 51, 2: 51, 3: 11}[j]
    worst_low = worst_all = worst_i = 0.0
    n = 0
    for path in sorted(glob.glob(os.path.join(dumpdir, f"twistnode-j{j}-*.txt")),
                       key=lambda p: int(re.search(r"-(\d+)\.txt$", p).group(1))):
        with open(path, encoding="utf-8") as f:
            head = f.readline().split()
            ordinal, Dout = int(head[1]), int(head[5])
            s = (float(head[7][1:-1]) + float(head[8][:-1])) / 2
            ilo, ihi = float(head[13][1:-1]), float(head[14][:-1])
            Jk = np.zeros((Dout + 1, Dout + 1)); Wk = np.zeros((Dout + 1, Dout + 1))
            for line in f:
                c, d, lo, hi = line.replace("[", "").replace(",", "").replace("]", "").split()
                Jk[int(c), int(d)] = (float(lo) + float(hi)) / 2; Wk[int(c), int(d)] = float(hi) - float(lo)
        if ordinal not in pos:
            print(f"node {ordinal}: not in the prototype's shards"); continue
        rec = recs[ordinal]
        if abs(rec["s"] - s) > 1e-9 * max(1.0, s):
            print(f"node {ordinal}: s mismatch kernel {s} proto {rec['s']}"); continue
        P = np.zeros((Dw + 1, Dw + 1)); P[idx[:, 0], idx[:, 1]] = Jp[pos[ordinal]]
        D = min(Dout, Dw)
        deg = np.add.outer(np.arange(D + 1), np.arange(D + 1))
        diff = np.abs(Jk[:D + 1, :D + 1] - P[:D + 1, :D + 1])
        dl = diff[deg <= Dlow].max(); da = diff[deg <= D].max()
        inside = np.all((P[:D + 1, :D + 1] >= Jk[:D + 1, :D + 1] - Wk[:D + 1, :D + 1] / 2 - 1e-13) &
                        (P[:D + 1, :D + 1] <= Jk[:D + 1, :D + 1] + Wk[:D + 1, :D + 1] / 2 + 1e-13) | (deg > D))
        ipart_proto = rec["w"] * 2 * rec["r"] * math.exp(-0.5 * rec["r"] ** 2) * rec["G"]
        di = abs(ipart_proto - (ilo + ihi) / 2)
        worst_low = max(worst_low, dl); worst_all = max(worst_all, da); worst_i = max(worst_i, di)
        n += 1
        print(f"node {ordinal:5d} s={s:9.5f} A={rec['A']:.3e}: max|dJ| low {dl:.2e} all {da:.2e} (max|J| {np.abs(P[:D+1,:D+1]).max():.2e}), "
              f"inside {inside}, dI {di:.2e} (I {ipart_proto:.6e}), width<=2^{int(np.log2(Wk.max())) if Wk.max() > 0 else -9999}")
    print(f"{n} nodes: worst |dJ| low band {worst_low:.3e}, whole triangle {worst_all:.3e}, worst |dI| {worst_i:.3e}")


if __name__ == "__main__":
    main(int(sys.argv[1]), sys.argv[2], sys.argv[3])
