#!/usr/bin/env python3
"""Stamp of the sources behind the separate target GrotheCaps (the node caps certified in Lean).

The 15 modules Grothe/LowerAnalytic/CapRowKK.lean are too heavy for CI. They are built on a
larger machine with
    lake build GrotheCaps && lake env lean scratch/AxiomsCaps.lean | python3 scripts/check_axioms.py --caps
and after a successful run the stamp is recorded with
    python3 scripts/caps_stamp.py --write "<machine, date, wall time>"
CI runs `python3 scripts/caps_stamp.py --check`. It fails if any file in the import closure of
the 15 row modules CapRowKK, plus CapNodes.lean, GrotheCaps.lean, lean-toolchain and lake-manifest.json, changed since the
recorded verification, or if the stamp is missing. Otherwise those modules need no rebuild.
With no arguments, the script checks the stamp. `--digest` prints the current source hash
and file count without reading or changing the stamp.
"""
import argparse, hashlib, os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STAMP = os.path.join(ROOT, "docs", "CAPS_VERIFIED.txt")
# the heavy modules (60 native range facts) and their import closure; CapNodes itself (a short combination
# proof) is hashed as a single file: changes elsewhere in the lower development only require re-checking it,
# which the verification command does anyway.
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
TOPS = [f"Grothe.LowerAnalytic.CapRow{k:02d}" for k in CAP_ROWS]


def closure(tops):
    seen, todo = set(), list(tops)
    while todo:
        m = todo.pop()
        if m in seen:
            continue
        path = os.path.join(ROOT, *m.split(".")) + ".lean"
        if not os.path.exists(path):  # Mathlib or core
            continue
        seen.add(m)
        with open(path, encoding="utf-8") as source:
            for line in source:
                mm = re.match(r"\s*import\s+(\S+)", line)
                if mm:
                    todo.append(mm.group(1))
    return sorted(seen)


def digest():
    h = hashlib.sha256()
    files = [os.path.join(*m.split(".")) + ".lean" for m in closure(TOPS)]
    files += ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCaps.lean"]
    files += ["lean-toolchain", "lake-manifest.json"]
    for f in files:
        h.update(f.encode() + b"\0")
        with open(os.path.join(ROOT, f), "rb") as source:
            h.update(source.read())
    return h.hexdigest(), len(files)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--check", action="store_true", help="check the verification stamp (default)")
    modes.add_argument("--digest", action="store_true", help="print the current source hash and file count")
    modes.add_argument("--write", metavar="NOTE", help="record a successful verification with its provenance")
    args = parser.parse_args(argv)
    if args.write is not None and not args.write.strip():
        parser.error("--write requires a nonempty verification note")

    d, n = digest()
    if args.digest:
        print(f"sha256 {d}\nfiles {n}")
        return 0
    if args.write is not None:
        with open(STAMP, "w") as f:
            f.write(f"sha256 {d}\nfiles {n}\nverified {args.write}\n")
        print(f"recorded {d} ({n} files)")
        return 0
    if not os.path.exists(STAMP):
        print(f"FAIL: GrotheCaps has no verification stamp (current sources {d}, {n} files)")
        return 1
    with open(STAMP) as stamp:
        rec = dict(l.split(" ", 1) for l in stamp.read().splitlines() if " " in l)
    if rec.get("sha256") != d:
        print(f"FAIL: sources of GrotheCaps changed since the recorded verification ({rec.get('verified', '?')}).")
        print(f"recorded {rec.get('sha256')}, current {d}. Rebuild GrotheCaps on a large machine and re-stamp.")
        return 1
    print(f"GrotheCaps sources unchanged since verification: {rec.get('verified', '?')} ({n} files)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
