#!/usr/bin/env python3
"""Generate the milestone-3 inputs of `quadrun rotate` (issue #303) from committed data.

Writes, under handoff/quad-checker/ (git-ignored; regenerated from committed files, SHA-256
printed and recorded in data/quad-checker/README.md):
  frozen.txt        the frozen correction `v` (`frozenCorrectionCoeff q c d`, q < 91): one line
                    `q c d m e` per coefficient with the exact dyadic value m·2^(-e), decoded bit
                    for bit from the binary64 matrices C0..C90 of
                    data/taylor-approximants/inputs/frozen_taylor_correction_D201.npz
                    (`tools/gen_frozen_integer_data.py` decodes the same words at 2^-206);
  energy-table.txt  the 21,168 head entries of `energyTable` from
                    data/upper-preprocess/certificate.json: lines `n m num den`.
Agent-ID: claude-b9ee. Refs #303, #21.
"""
from __future__ import annotations

import hashlib
import json
import os
import struct
import sys
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NPZ = os.path.join(ROOT, "data", "taylor-approximants", "inputs", "frozen_taylor_correction_D201.npz")
CERT = os.path.join(ROOT, "data", "upper-preprocess", "certificate.json")
OUT = os.path.join(ROOT, "handoff", "quad-checker")
GRADES = 91


def read_grade(archive: zipfile.ZipFile, q: int) -> list[int]:
    raw = archive.read(f"C{q}.npy")
    assert raw[:6] == b"\x93NUMPY"
    width = 2 if raw[6] == 1 else 4
    hlen = int.from_bytes(raw[8:8 + width], "little")
    header = raw[8 + width:8 + width + hlen].decode()
    assert "'<f8'" in header and "'fortran_order': False" in header, header
    data = raw[8 + width + hlen:]
    n = len(data) // 8
    assert n == (q + 2) * (q + 1), (q, n)
    return list(struct.unpack("<%dQ" % n, data))


def dyadic(word: int) -> tuple[int, int]:
    """(m, e) with value m·2^(-e) of a finite binary64 word."""
    sign = word >> 63
    ex = (word >> 52) & 0x7FF
    fr = word & ((1 << 52) - 1)
    assert ex != 0x7FF
    if ex == 0:
        m, e = fr, 1074
    else:
        m, e = (1 << 52) + fr, 1075 - ex
    if m == 0:
        return 0, 0
    while m % 2 == 0 and e > 0:
        m //= 2
        e -= 1
    return (-m if sign else m), e


def main() -> int:
    os.makedirs(OUT, exist_ok=True)
    lines = ["# frozen correction v: q c d m e (value m*2^-e), grades q < 91; from frozen_taylor_correction_D201.npz"]
    count = 0
    with zipfile.ZipFile(NPZ) as z:
        for q in range(GRADES):
            words = read_grade(z, q)
            for c in range(q + 2):
                for d in range(q + 1):
                    m, e = dyadic(words[c * (q + 1) + d])
                    assert e <= 206, (q, c, d, e)
                    lines.append(f"{q} {c} {d} {m} {e}")
                    count += 1
    assert count == 259532, count
    text = "\n".join(lines) + "\n"
    path = os.path.join(OUT, "frozen.txt")
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"wrote {path}: {count} coefficients, sha256 {hashlib.sha256(text.encode()).hexdigest()}")
    with open(CERT, encoding="utf-8") as f:
        cert = json.load(f)
    rows = ["# energyTable head: n m num den (certificate.json energies, n + 3m <= 501)"]
    for n, m, v in cert["energies"]:
        num, den = v.split("/") if "/" in v else (v, "1")
        assert n + 3 * m <= 501
        rows.append(f"{n} {m} {num} {den}")
    assert len(rows) == 21169, len(rows)
    text = "\n".join(rows) + "\n"
    path = os.path.join(OUT, "energy-table.txt")
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"wrote {path}: {len(rows) - 1} entries, sha256 {hashlib.sha256(text.encode()).hexdigest()}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
