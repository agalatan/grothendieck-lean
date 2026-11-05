#!/usr/bin/env python3
"""Compare the kernel's twisted node (`quadrun twistnode <j> <ordinal>`, dump
`handoff/quad-checker/twistnode-j<j>-<ordinal>.txt`) with the float64 prototype
(`tools/upper_closure_spike.py`, `Node.J` with the `checker` preset).

    python3 tools/quad_twist_compare.py node handoff/quad-checker/twistnode-j3-227.txt

Prints the maximal difference between the kernel's enclosure midpoints and the prototype's
`J[c,d]` over the low band and over the whole output triangle, the prototype's radial term
`W e^{-s} G` against the kernel's `I`-part, and whether every prototype value lies within the
enclosure widened by `tol`.  Agent-ID: claude-b9ee. Refs #41, #313.
"""
import math
import os
import re
import sys

import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import upper_closure_spike as spk  # noqa: E402


def parse_interval(txt):
    m = re.match(r"\[(\S+), (\S+)\]", txt)
    return float(m.group(1)), float(m.group(2))


def cmd_node(path, tol=1e-13):
    with open(path, encoding="utf-8") as f:
        head = f.readline().split()
        j, Dout = int(head[3]), int(head[5])
        s_lo, s_hi = parse_interval(head[7] + " " + head[8])
        w_lo, w_hi = parse_interval(head[10] + " " + head[11])
        i_lo, i_hi = parse_interval(head[13] + " " + head[14])
        J = np.zeros((Dout + 1, Dout + 1))
        W = np.zeros((Dout + 1, Dout + 1))
        for line in f:
            c, d, lo, hi = line.replace("[", "").replace(",", "").replace("]", "").split()
            J[int(c), int(d)] = (float(lo) + float(hi)) / 2
            W[int(c), int(d)] = float(hi) - float(lo)
    s = (s_lo + s_hi) / 2
    r = math.sqrt(s)
    R = spk.Rounding(spk.load_data_lean(ROOT))
    cfg = spk.load_cfg("checker", ROOT)
    prm = {1: (181, 51, 91), 2: (91, 51, 46), 3: (51, 11, 26)}[j]
    Dw = prm[0]
    node = spk.Node(R, j, r, cfg, Dw)
    Jp, imax, tau, wtau = node.J(Dw)
    center = spk.load_center(j, ROOT)
    Qc = len(center)
    Hz = spk.hermite_table_scalar(r, Qc, Qc - 1)
    Vh = np.zeros((Qc + 1, Qc))
    for q in range(Qc):
        C = center[q]
        cs = np.arange(q + 2)[:, None]
        ds = np.arange(q + 1)[None, :]
        Vh[:q + 2, :q + 1] += C * Hz[q + 1 - cs, q - ds]
    G = float(np.sum(Vh * Jp[:Qc + 1, :Qc]))
    Ws = (w_lo + w_hi) / 2
    ipart_proto = Ws * math.exp(-s) * G
    mask_all = np.add.outer(np.arange(Dout + 1), np.arange(Dout + 1)) <= Dout
    mask_low = np.add.outer(np.arange(Dout + 1), np.arange(Dout + 1)) <= prm[1]
    diff = np.abs(J - Jp[:Dout + 1, :Dout + 1])
    print(f"node: j={j}, s={s:.12f}, r={r:.12f}, A={node.A:.6e}, prototype imag residual {imax:.2e}")
    print(f"  max |J_kernel - J_proto| over c+d <= {prm[1]}: {diff[mask_low].max():.3e}  "
          f"(max |J| there {np.abs(Jp[:Dout+1,:Dout+1])[mask_low].max():.3e})")
    print(f"  max |J_kernel - J_proto| over c+d <= {Dout}: {diff[mask_all].max():.3e}  "
          f"(max |J| {np.abs(Jp[:Dout+1,:Dout+1])[mask_all].max():.3e}); max enclosure width {W[mask_all].max():.2e}")
    inside = np.all((Jp[:Dout + 1, :Dout + 1] >= J - W / 2 - tol) & (Jp[:Dout + 1, :Dout + 1] <= J + W / 2 + tol) | ~mask_all)
    print(f"  every prototype value inside the enclosure widened by {tol:.0e}: {inside}")
    print(f"  I-part: kernel [{i_lo:.18e}, {i_hi:.18e}], prototype W e^-s G = {ipart_proto:.18e}, "
          f"difference {ipart_proto - (i_lo + i_hi) / 2:.3e} (relative {(ipart_proto - (i_lo + i_hi) / 2) / ipart_proto:.2e})")
    print(f"  Parseval at the node: sum J^2 = {float(np.sum(Jp * Jp)):.6e}  vs  E_w[phi^{2 * j}] = {node.moment(2 * j):.6e}")


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "node":
        cmd_node(sys.argv[2])
    else:
        print(__doc__)
