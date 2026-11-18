#!/usr/bin/env python3
"""Export the audited dyadic response pair as exact, compact Lean input data.

Agent-ID: codex-a7c4.
Only Python's standard library is used. No floating-point values are read or rounded.
Each emitted entry is decoded again and checked against the signed 64-bit source integer.
This certifies data transport, not the analytical coefficient or Grothendieck bound.
"""

import argparse
import array
import ast
import hashlib
import json
import struct
import sys
import tempfile
import zipfile
from pathlib import Path


ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
SCALE = 1 << 26
SHAPE = (64, 128, 128)
COUNT = 64 * 128 * 128


def read_int64(archive, key, shape):
    with archive.open(key + ".npy") as stream:
        prefix = stream.read(8)
        if prefix[:6] != b"\x93NUMPY" or prefix[6:] not in (b"\x01\x00", b"\x02\x00"):
            raise ValueError(f"Unsupported NPY header: {key}")
        size_format = "<H" if prefix[6] == 1 else "<I"
        size_bytes = struct.calcsize(size_format)
        header_size = struct.unpack(size_format, stream.read(size_bytes))[0]
        header = ast.literal_eval(stream.read(header_size).decode("latin1"))
        if header != {"descr": "<i8", "fortran_order": False, "shape": shape}:
            raise ValueError(f"Unexpected exact-integer layout: {key}: {header}")
        values = array.array("q")
        if values.itemsize != 8:
            raise ValueError("This platform does not supply 64-bit array('q')")
        values.frombytes(stream.read())
        if sys.byteorder != "little":
            values.byteswap()
        expected = 1
        for n in shape:
            expected *= n
        if len(values) != expected:
            raise ValueError(f"Wrong number of integers: {key}")
        return values


def encode_entry(x, y):
    if not (-SCALE <= x < SCALE and -SCALE <= y < SCALE):
        raise ValueError("A coordinate does not fit the exact 27-bit encoding")
    value = ((x + SCALE) << 27) | (y + SCALE)
    text = "".join(ALPHABET[(value >> shift) & 63] for shift in range(48, -1, -6))
    # Independent positional reconstruction, matching the Lean decoder.
    decoded = 0
    for char in text:
        decoded = 64 * decoded + ALPHABET.index(char)
    if (decoded // (1 << 27) - SCALE, decoded % (1 << 27) - SCALE) != (x, y):
        raise AssertionError("Encoding round trip failed")
    return text


def emit_pair(stream, name, re, im):
    # Keep each native static array below the generated C header's size field.
    # Chunking preserves the row order and does not alter any encoded byte.
    stream.write(f"def {name} : Array String := (#[\n  #[\n")
    maximum = 0
    digest = hashlib.sha256()
    for first in range(0, COUNT, 128):
        row = []
        for k in range(first, first + 128):
            x, y = re[k], im[k]
            square = x * x + y * y
            maximum = max(maximum, square)
            if square > SCALE * SCALE:
                raise ValueError(f"{name} cell {k} is outside the disk")
            row.append(encode_entry(x, y))
        encoded = "".join(row)
        digest.update(encoded.encode("ascii"))
        chunk_end = (first // 128 + 1) % 512 == 0
        stream.write('    "' + encoded + ('"\n' if chunk_end else '",\n'))
        if chunk_end:
            stream.write("  ]" + (",\n  #[\n" if first + 128 < COUNT else "\n"))
    stream.write("] : Array (Array String)).flatMap id\n\n")
    return maximum, digest.hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--sha256", help="Optional additional check on the supplied archive")
    parser.add_argument("--check", action="store_true", help="Check byte-for-byte regeneration")
    args = parser.parse_args()
    manifest = Path(__file__).resolve().parents[1] / "data/upper-replacement/manifest.json"
    record = next(item for item in json.loads(manifest.read_text())["inputs"]
                  if item["path"] == "cell-inputs.npz")
    source_hash = record["audited_source_sha256"]
    with args.source.open("rb") as stream:
        archive_hash = hashlib.file_digest(stream, "sha256").hexdigest()
    if archive_hash not in {record["sha256"], source_hash} or (
        args.sha256 is not None and archive_hash != args.sha256
    ):
        raise SystemExit("Unrecognized cell archive")
    with zipfile.ZipFile(args.source) as archive:
        for name, expected in record["members_sha256"].items():
            with archive.open(name) as member:
                if hashlib.file_digest(member, "sha256").hexdigest() != expected:
                    raise SystemExit(f"Audited integer input differs: {name}")
        if list(read_int64(archive, "q_shift", ())) != [26]:
            raise ValueError("Expected dyadic denominator 2^26")
        arrays = {name: read_int64(archive, name, SHAPE)
                  for name in ("F_re_i", "F_im_i", "G_re_i", "G_im_i")}
    # Use a sibling temporary file and replace only after every integer has been checked.
    with tempfile.NamedTemporaryFile(dir=args.output.parent, delete=False) as stub:
        temporary = Path(stub.name)
    try:
        with temporary.open("w", encoding="ascii", newline="\n") as stream:
            stream.write("import Grothe.UpperReplacement.CellEncoding\n\n")
            stream.write("/-! Exact private cell data. Agent-ID: codex-a7c4.\n")
            stream.write(f"Source SHA256: {source_hash}\n")
            stream.write("Generated by tools/gen_private_upper_cells.py; no numerical bound is asserted. -/\n\n")
            stream.write("namespace Grothe.UpperReplacement.Certificate\n\n")
            stream.write("set_option maxRecDepth 50000\nset_option maxHeartbeats 0\n\n")
            f_max, f_digest = emit_pair(stream, "leftCellRows", arrays["F_re_i"], arrays["F_im_i"])
            g_max, g_digest = emit_pair(stream, "rightCellRows", arrays["G_re_i"], arrays["G_im_i"])
            stream.write("end Grothe.UpperReplacement.Certificate\n")
        if args.check:
            with temporary.open("rb") as generated, args.output.open("rb") as existing:
                if hashlib.file_digest(generated, "sha256").digest() != \
                        hashlib.file_digest(existing, "sha256").digest():
                    raise SystemExit(f"Generated cells differ: {args.output}")
        else:
            temporary.replace(args.output)
    finally:
        temporary.unlink(missing_ok=True)
    print(f"Exported {2 * COUNT} exact complex cells; all integer round trips passed.")
    print(f"Left: max square {f_max}/{SCALE*SCALE}; encoded SHA256 {f_digest}")
    print(f"Right: max square {g_max}/{SCALE*SCALE}; encoded SHA256 {g_digest}")


if __name__ == "__main__":
    main()
