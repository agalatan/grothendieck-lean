#!/usr/bin/env python3
"""The committed partial tables of the upper-closure port facts (docs/UPPER_CLOSURE.md §8.5: node ranges with committed partials).

The native facts `Grothe.UpperQuad.PortFacts.J<j>Range<rr>` run the kernel's twisted node loop
(`GrotheQuad.twistSpecs`) over one range `[lo, hi)` of the 21,577 nodes of the committed partition
and check that the kernel's enclosures of the range's Gauss–Legendre partial sums (the `I_j`-partial
`Σ_n W e^{−s} Σ_{c,d} V_{c,d} J_{c,d}` and the low-band coefficients `Σ_n W e^{−s} ψ_i J_{c,d}`) lie in
the committed table of that range: midpoints `m · 2^{−64}` and one radius per table.  The final fact
adds the tables and runs the kernel's checks `iPartialOK`/`lowBandOK` on the sum.  Nothing here is
trusted: a wrong table makes a fact fail, never a false theorem.

The midpoints come from the float64 prototype (`tools/upper_closure_spike.py`, preset `checker`, the
per-node arrays `nodes-j<j>-checker-<i>of8.npz` of PR #316), which agrees with the kernel to the
prototype's own accuracy (§8.8: `≤ 10⁻¹⁴` on `J`, `≤ 3·10⁻²³` on the per-node `I`-terms).  The radii
are fixed after `--check`, which compares the prototype's partial sums over the residue classes
mod 8 with the kernel's exact accumulators of the full run (`quadrun twistshard j i 8`, files
`twist-j<j>-<i>.txt` at the scale `2^512`).

    python3 tools/port_facts_tables.py check  <j> <npzdir> <kerneldir>
    python3 tools/port_facts_tables.py bounds <j> <timesfile> <hours> [<mean s>]  # range boundaries
    python3 tools/port_facts_tables.py tables <j> <npzdir>                # data/port-facts/j<j>-tables.txt

`bounds` reads per-node times (`ordinal ms` per line, the `twist-j<j>-nodes-<i>.txt` of the full run)
(optionally rescaled to a measured mean per node, `quadrun twistnode` samples on an idle big core)
and cuts contiguous ranges of at most `<hours>` each; the boundaries go to `data/port-facts/ranges.json`.
`tables` writes, for every range of `ranges.json`, the line `range <rr> <lo> <hi> <iMid> <iRad> <lowRad>`
followed by one line of comma-separated low-band midpoints (flat graded order `q < Qlow, c ≤ q+1,
d ≤ q`), all at the scale `2^64`.  `tools/gen_port_facts.py` turns the tables into the Lean modules.

Agent-ID: claude-b9ee.  Refs #41, #313.
"""
import json
import math
import os
import re
import sys
from fractions import Fraction

import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import upper_closure_spike as spk  # noqa: E402

NNODES = 21577
KT = 64                     # scale of the committed tables
KACC = 512                  # scale of the kernel accumulators (2 KOut)
PARAMS = {1: dict(Dout=181, Dlow=51, Q=91), 2: dict(Dout=91, Dlow=51, Q=46), 3: dict(Dout=51, Dlow=11, Q=26)}
# radii of the tables, in units of 2^-64 (fixed after `check`: 70x and 4000x the worst prototype-kernel difference of the mod-8 classes)
I_RAD = 2 ** 8              # 1.4e-17 on every range's I-partial
LOW_RAD = 2 ** 11           # 1.1e-16 on every low-band entry of every range
DATA = os.path.join(ROOT, "data/port-facts")


def qlow(j):
    return (PARAMS[j]["Dlow"] + 1) // 2


def flat_low(j):
    return [(q, c, d) for q in range(qlow(j)) for c in range(q + 2) for d in range(q + 1)]


def node_terms(j, npzdir):
    """Yield (ordinal, I-term, low-band terms) per node of the prototype, in file order."""
    pat = re.compile(rf"nodes-j{j}-checker-(\d+)of8\.npz$")
    files = sorted((f for f in os.listdir(npzdir) if pat.match(f)), key=lambda f: int(pat.match(f).group(1)))
    assert len(files) == 8, files
    Ql = qlow(j)
    low = flat_low(j)
    cs = np.array([c for _, c, _ in low])
    ds = np.array([d for _, _, d in low])
    ps = np.array([q + 1 - c for q, c, _ in low])
    pps = np.array([q - d for q, _, d in low])
    for f in files:
        z = np.load(os.path.join(npzdir, f))
        Dw = int(z["Dw"])
        _, idx = spk.tri_pack(np.zeros((Dw + 1, Dw + 1)), Dw)
        pos = {(int(c), int(d)): n for n, (c, d) in enumerate(idx)}
        jcol = np.array([pos[(int(c), int(d))] for c, d in zip(cs, ds)])
        recs = json.loads(str(z["meta"]))["recs"]
        J = z["J"]
        for n, rec in enumerate(recs):
            assert rec["i"] == int(z["ids"][n])
            r, w = rec["r"], rec["w"]
            rw = w * 2 * r * math.exp(-0.5 * r * r)
            H = spk.hermite_table_scalar(r, Ql, max(Ql - 1, 0))
            lowv = rw * H[ps, pps] * J[n, jcol]
            yield rec["i"], rw * rec["G"], lowv


def read_kernel_acc(path, j):
    low = {}
    with open(path, encoding="utf-8") as f:
        for line in f:
            p = line.split()
            if p[0] == "I":
                iacc = (int(p[1]), int(p[2]))
            else:
                low[(int(p[0]), int(p[1]), int(p[2]))] = (int(p[3]), int(p[4]))
    return iacc, [low[k] for k in flat_low(j)]


def mid(p, k):
    return float(Fraction(p[0] + p[1], 2 * (1 << k)))


def cmd_check(j, npzdir, kdir):
    nlow = len(flat_low(j))
    I8 = np.zeros(8)
    L8 = np.zeros((8, nlow))
    for i, it, lowv in node_terms(j, npzdir):
        I8[i % 8] += it
        L8[i % 8] += lowv
    worst_i = worst_l = 0.0
    width_i = width_l = 0.0
    for i in range(8):
        iacc, lacc = read_kernel_acc(os.path.join(kdir, f"twist-j{j}-{i}.txt"), j)
        di = abs(mid(iacc, KACC) - I8[i])
        dl = max(abs(mid(p, KACC) - L8[i][n]) for n, p in enumerate(lacc))
        wi = float(Fraction(iacc[1] - iacc[0], 1 << KACC))
        wl = max(float(Fraction(p[1] - p[0], 1 << KACC)) for p in lacc)
        worst_i, worst_l = max(worst_i, di), max(worst_l, dl)
        width_i, width_l = max(width_i, wi), max(width_l, wl)
        print(f"j={j} class {i}: |I_proto - I_kernel| = {di:.3e} (I = {I8[i]:.6e}, kernel width {wi:.1e}); "
              f"max |a_proto - a_kernel| = {dl:.3e} (kernel width {wl:.1e})")
    print(f"j={j}: worst I difference {worst_i:.3e}, worst low-band difference {worst_l:.3e}; radii "
          f"I {I_RAD / 2 ** KT:.2e}, low {LOW_RAD / 2 ** KT:.2e}")


def cmd_bounds(j, timesfile, hours, mean_s=None):
    t = np.zeros(NNODES)
    with open(timesfile, encoding="utf-8") as f:
        for line in f:
            o, ms = line.split()
            t[int(o)] = int(ms)
    if mean_s is not None:          # rescale to a measured mean per node (seconds)
        t *= mean_s * 1000.0 / t.mean()
    cap = hours * 3.6e6
    bounds, acc = [0], 0.0
    for o in range(NNODES):
        if acc + t[o] > cap and o > bounds[-1]:
            bounds.append(o)
            acc = 0.0
        acc += t[o]
    bounds.append(NNODES)
    path = os.path.join(DATA, "ranges.json")
    allb = json.load(open(path)) if os.path.exists(path) else {}
    allb[str(j)] = bounds
    os.makedirs(DATA, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(allb, f, indent=1, sort_keys=True)
        f.write("\n")
    times = [t[a:b].sum() / 3.6e6 for a, b in zip(bounds, bounds[1:])]
    print(f"j={j}: {len(bounds) - 1} ranges, {t.sum() / 3.6e6:.1f} CPU-h measured, max {max(times):.2f} h, "
          f"min {min(times):.2f} h")


def cmd_tables(j, npzdir):
    bounds = json.load(open(os.path.join(DATA, "ranges.json")))[str(j)]
    nr = len(bounds) - 1
    nlow = len(flat_low(j))
    IR = np.zeros(nr)
    LR = np.zeros((nr, nlow))
    seen = np.zeros(NNODES, dtype=bool)
    for i, it, lowv in node_terms(j, npzdir):
        r = int(np.searchsorted(bounds, i, side="right")) - 1
        IR[r] += it
        LR[r] += lowv
        seen[i] = True
    assert seen.all(), "missing prototype nodes"
    path = os.path.join(DATA, f"j{j}-tables.txt")
    with open(path, "w", encoding="utf-8") as f:
        f.write(f"# power {j}: {nr} node ranges; midpoints at the scale 2^{KT} from the float64 prototype "
                f"(tools/port_facts_tables.py tables {j}); radii I {I_RAD}, low {LOW_RAD}\n")
        for r in range(nr):
            im = round(IR[r] * 2.0 ** KT)
            f.write(f"range {r} {bounds[r]} {bounds[r + 1]} {im} {I_RAD} {LOW_RAD}\n")
            f.write(",".join(str(int(round(x * 2.0 ** KT))) for x in LR[r]) + "\n")
    print(f"wrote {path}: {nr} ranges, I = {IR.sum():.16e}")


def main():
    cmd = sys.argv[1]
    if cmd == "check":
        cmd_check(int(sys.argv[2]), sys.argv[3], sys.argv[4])
    elif cmd == "bounds":
        cmd_bounds(int(sys.argv[2]), sys.argv[3], float(sys.argv[4]),
                   float(sys.argv[5]) if len(sys.argv) > 5 else None)
    elif cmd == "tables":
        cmd_tables(int(sys.argv[2]), sys.argv[3])
    else:
        raise SystemExit(__doc__)


if __name__ == "__main__":
    main()
