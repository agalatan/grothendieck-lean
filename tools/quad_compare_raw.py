#!/usr/bin/env python3
"""Compare the checker's raw coefficient enclosures with the committed raw array (issue #303).

Inputs: `raw-final.txt` written by `quadrun merge` (5,365,627 lines `lo hi`, the enclosure
`[lo, hi] / 2^128` of each raw coefficient in the block layout of
`GrotheQuadKernel/Contract.lean`), and `data/retained-f0/raw_canonical_blocks.npy` (binary64).

For every entry: the committed value t, the enclosure [a, b]; the excursion
d = max(a − t, t − b, 0) (0 when t is inside), the midpoint difference m = |(a+b)/2 − t|, and
the binary64 half-ulp of t.  Reports max/ℓ²/ℓ¹ of d and of m, the distribution by charge k,
the entries with d above the half-ulp, and the two layout hypotheses (row-major in j, or in c)
decided on the blocks.  Pure Python (numpy optional): about a minute.
Agent-ID: claude-b9ee. Refs #303, #21.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import struct
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RAW = os.path.join(ROOT, "data", "retained-f0", "raw_canonical_blocks.npy")
SIDES = [251] + [252 - k for k in range(1, 252)]
OFFS = [0]
for n in SIDES:
    OFFS.append(OFFS[-1] + n * n)
assert OFFS[-1] == 5365627


def half_ulp(t: float) -> float:
    if t == 0.0:
        return 2.0 ** -1075
    m, e = math.frexp(abs(t))      # t = m·2^e, m ∈ [0.5, 1)
    return 2.0 ** (e - 54)


def load_npy(path: str) -> list[float]:
    raw = open(path, "rb").read()
    assert raw[:6] == b"\x93NUMPY"
    hlen = struct.unpack("<H", raw[8:10])[0]
    data = raw[10 + hlen:]
    n = len(data) // 8
    return list(struct.unpack("<%dd" % n, data))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("raw_final", help="raw-final.txt of quadrun merge")
    ap.add_argument("--json", default=None, help="write the summary here")
    ap.add_argument("--layout", default="auto", choices=["auto", "j", "c"],
                    help="row index of the committed blocks: j (radial) or c (pair)")
    args = ap.parse_args()

    t = load_npy(RAW)
    sha = hashlib.sha256(open(RAW, "rb").read()).hexdigest()
    print(f"committed array: {len(t)} entries, sha256 {sha}")
    lo = [0] * len(t)
    hi = [0] * len(t)
    with open(args.raw_final, encoding="utf-8") as f:
        for i, line in enumerate(f):
            a, b = line.split()
            lo[i] = int(a)
            hi[i] = int(b)
    assert i + 1 == len(t), i
    scale = 2.0 ** -128

    def entry(idx: int, layout: str, k: int, r: int, c: int) -> int:
        n = SIDES[k]
        return OFFS[k] + (r * n + c if layout == "j" else c * n + r)

    # decide the layout on block k = 1 (side 251): compare midpoints under both hypotheses
    if args.layout == "auto":
        best = None
        for layout in ("j", "c"):
            err = 0.0
            for k in (1, 2, 100):
                n = SIDES[k]
                for r in range(n):
                    for c in range(n):
                        idx_c = OFFS[k] + r * n + c              # committed index (row-major as stored)
                        idx_m = entry(0, layout, k, r, c)       # our index under the hypothesis
                        err = max(err, abs((lo[idx_m] + hi[idx_m]) / 2 * scale - t[idx_c]))
            print(f"layout hypothesis '{layout}': max midpoint difference on blocks 1, 2, 100 = {err:.3e}")
            if best is None or err < best[1]:
                best = (layout, err)
        layout = best[0]
    else:
        layout = args.layout
    print(f"using layout '{layout}' (our blocks are row-major in j; '{layout}' means the committed rows are indexed by {layout})")

    # statistics
    n_tot = 0
    max_d = 0.0; max_d_idx = -1
    max_m = 0.0; max_m_idx = -1
    sum_d1 = 0.0; sum_d2 = 0.0; sum_m1 = 0.0; sum_m2 = 0.0
    above = []
    max_w = 0.0
    by_k = []
    extra_max_t = 0.0
    extra_max_m = 0.0
    sum_t2 = 0.0
    for k in range(252):
        n = SIDES[k]
        kmax_d = 0.0; kmax_m = 0.0; kcnt = 0; kmax_w = 0.0
        for r in range(n):
            for c in range(n):
                idx_c = OFFS[k] + r * n + c
                idx_m = entry(0, layout, k, r, c)
                tv = t[idx_c]
                a = lo[idx_m] * scale
                b = hi[idx_m] * scale
                w = b - a
                mid = (a + b) / 2
                d = max(a - tv, tv - b, 0.0)
                m = abs(mid - tv)
                j = r if layout == "j" else c
                cc = c if layout == "j" else r
                cval = cc + 1 if k == 0 else cc
                in_tri = (j + cval + k <= 251) if k >= 1 else (j + cval <= 251)
                if not in_tri:
                    extra_max_t = max(extra_max_t, abs(tv))
                    extra_max_m = max(extra_max_m, m)
                    continue
                n_tot += 1
                kcnt += 1
                sum_t2 += tv * tv
                sum_d1 += d; sum_d2 += d * d; sum_m1 += m; sum_m2 += m * m
                kmax_d = max(kmax_d, d); kmax_m = max(kmax_m, m); kmax_w = max(kmax_w, w)
                max_w = max(max_w, w)
                if d > max_d:
                    max_d, max_d_idx = d, idx_c
                if m > max_m:
                    max_m, max_m_idx = m, idx_c
                if d > half_ulp(tv):
                    above.append((idx_c, k, j, cval, tv, a, b, d))
        by_k.append((k, kcnt, kmax_d, kmax_m, kmax_w))
    summary = {
        "layout": layout,
        "entries_in_triangle": n_tot,
        "excursion_max": max_d, "excursion_max_index": max_d_idx,
        "excursion_l1": sum_d1, "excursion_l2": math.sqrt(sum_d2),
        "mid_diff_max": max_m, "mid_diff_max_index": max_m_idx,
        "mid_diff_l1": sum_m1, "mid_diff_l2": math.sqrt(sum_m2),
        "max_width": max_w,
        "committed_l2_norm": math.sqrt(sum_t2),
        "entries_above_half_ulp": len(above),
        "extra_entries_max_abs_committed": extra_max_t,
        "extra_entries_max_mid_diff": extra_max_m,
        "committed_sha256": sha,
        "by_charge": [{"k": k, "count": c, "max_excursion": d, "max_mid_diff": m, "max_width": w}
                      for (k, c, d, m, w) in by_k],
    }
    print(f"entries in the degree-501 triangle: {n_tot}")
    print(f"excursion (distance of the committed value to the enclosure): max {max_d:.3e} at {max_d_idx}, "
          f"ℓ² {math.sqrt(sum_d2):.3e}, ℓ¹ {sum_d1:.3e}")
    print(f"midpoint difference: max {max_m:.3e} at {max_m_idx}, ℓ² {math.sqrt(sum_m2):.3e}, ℓ¹ {sum_m1:.3e}")
    print(f"max enclosure width {max_w:.3e}; committed ℓ² norm {math.sqrt(sum_t2):.6f}")
    print(f"entries whose committed value lies outside the enclosure by more than its half-ulp: {len(above)}")
    for row in above[:20]:
        print("   idx %d k=%d j=%d c=%d t=%.17g encl=[%.17g, %.17g] d=%.3e" % row)
    print(f"extra (outside-triangle) entries: max |committed| {extra_max_t:.3e}, max midpoint diff {extra_max_m:.3e}")
    print("by charge k (count, max excursion, max mid diff, max width):")
    for (k, c, d, m, w) in by_k:
        if k < 6 or k % 25 == 0 or k > 248:
            print(f"   k={k:3d} n={c:6d} exc {d:.2e} mid {m:.2e} width {w:.2e}")
    if args.json:
        with open(args.json, "w", encoding="utf-8") as f:
            json.dump(summary, f, indent=1)
        print(f"wrote {args.json}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
