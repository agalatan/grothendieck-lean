#!/usr/bin/env python3
"""Export the GT energy table of the grothendieck-lean repository to gt_energy.npz: exact integers, fixed bytes.

usage:  python3 export_gt_energy.py PATH/TO/Grothe/Upper/Data.lean gt_energy.npz

Data.lean (generated in the repository by tools/gen_upper_data.py) stores, in `energyStrs`, the 21,168 exact dyadic
energies of the truncated GT rounder as rows "m:n,a,k;n,a,k;...", one row per m: the entry E[n, m] = a / 2^k. It also
defines the exact rationals bQ (the smoothing parameter b), etaQ (eta) and energyErrQ (the table error).

The output is an ordinary .npz archive with these arrays, in the order of Data.lean:
  m, n, a, k                  int64, length 21168   entry E[n, m] = a / 2^k  (0 <= a < 2^63)
  bQ, etaQ, energyErrQ        int64, [numerator, denominator]
Every member is stored uncompressed with a fixed timestamp, so the bytes depend only on the table: running the export
again on the same Data.lean gives the same SHA-256.
"""
import io
import re
import sys
import zipfile
from fractions import Fraction

import numpy as np


def main(src, out):
    text = open(src, encoding="utf-8").read()

    def rat_def(name):
        m = re.search(r"def " + name + r" : ℚ := \((-?\d+) : ℚ\) / (\d+)", text)
        q = Fraction(int(m.group(1)), int(m.group(2)))
        return np.array([q.numerator, q.denominator], dtype="<i8")

    blk = re.search(r"def energyStrs\s*:\s*List String\s*:=\s*\[(.*?)\]", text, re.S)
    ms, ns, avals, ks = [], [], [], []
    for line in re.findall(r'"(\d+:[^"]+)"', blk.group(1)):
        mstr, rest = line.split(":")
        for item in rest.split(";"):
            n, a, k = (int(x) for x in item.split(","))
            ms.append(int(mstr))
            ns.append(n)
            avals.append(a)
            ks.append(k)
    assert len(ms) == 21168, len(ms)
    assert all(0 <= a < 2 ** 63 for a in avals) and all(0 <= k < 2 ** 31 for k in ks)
    arrays = [
        ("m", np.array(ms, dtype="<i8")),
        ("n", np.array(ns, dtype="<i8")),
        ("a", np.array(avals, dtype="<i8")),
        ("k", np.array(ks, dtype="<i8")),
        ("bQ", rat_def("bQ")),
        ("etaQ", rat_def("etaQ")),
        ("energyErrQ", rat_def("energyErrQ")),
    ]
    with zipfile.ZipFile(out, "w", compression=zipfile.ZIP_STORED) as zf:
        for name, arr in arrays:
            buf = io.BytesIO()
            np.lib.format.write_array(buf, np.ascontiguousarray(arr), version=(1, 0), allow_pickle=False)
            info = zipfile.ZipInfo(name + ".npy", date_time=(1980, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_STORED
            info.external_attr = 0o644 << 16
            zf.writestr(info, buf.getvalue())
    print(f"wrote {out}: {len(ms)} entries, rows m = {min(ms)}..{max(ms)}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    main(sys.argv[1], sys.argv[2])
