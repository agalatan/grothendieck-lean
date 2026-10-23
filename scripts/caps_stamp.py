#!/usr/bin/env python3
"""Stamp of the sources behind the separate target GrotheCaps (the node caps certified in Lean).

The 15 modules Grothe/LowerAnalytic/CapRowKK.lean are too heavy for CI. They are built on a
larger machine with
    lake build GrotheCaps && lake env lean scratch/AxiomsCaps.lean | python3 scripts/check_axioms.py --caps
and after a successful run the stamp is recorded with
    python3 scripts/caps_stamp.py --write "<machine, date, wall time>"
CI runs `python3 scripts/caps_stamp.py --check`. It fails if any file in the import closure of
Grothe.LowerAnalytic.CapNodes (plus lean-toolchain and lake-manifest.json) changed since the
recorded verification. Otherwise those modules need no rebuild.
"""
import hashlib, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STAMP = os.path.join(ROOT, "docs", "CAPS_VERIFIED.txt")
TOP = "Grothe.LowerAnalytic.CapNodes"


def closure(top):
    seen, todo = set(), [top]
    while todo:
        m = todo.pop()
        if m in seen:
            continue
        path = os.path.join(ROOT, *m.split(".")) + ".lean"
        if not os.path.exists(path):  # Mathlib or core
            continue
        seen.add(m)
        for line in open(path, encoding="utf-8"):
            mm = re.match(r"\s*import\s+(\S+)", line)
            if mm:
                todo.append(mm.group(1))
    return sorted(seen)


def digest():
    h = hashlib.sha256()
    files = [os.path.join(*m.split(".")) + ".lean" for m in closure(TOP)]
    files += ["lean-toolchain", "lake-manifest.json"]
    for f in files:
        h.update(f.encode() + b"\0")
        h.update(open(os.path.join(ROOT, f), "rb").read())
    return h.hexdigest(), len(files)


def main():
    d, n = digest()
    if "--write" in sys.argv:
        note = sys.argv[sys.argv.index("--write") + 1] if len(sys.argv) > sys.argv.index("--write") + 1 else ""
        with open(STAMP, "w") as f:
            f.write(f"sha256 {d}\nfiles {n}\nverified {note}\n")
        print(f"recorded {d} ({n} files)")
        return
    if not os.path.exists(STAMP):
        print(f"WARNING: GrotheCaps has never been verified (current sources {d}, {n} files)")
        return
    rec = dict(l.split(" ", 1) for l in open(STAMP).read().splitlines() if " " in l)
    if rec.get("sha256") != d:
        print(f"FAIL: sources of GrotheCaps changed since the recorded verification ({rec.get('verified', '?')}).")
        print(f"recorded {rec.get('sha256')}, current {d}. Rebuild GrotheCaps on a large machine and re-stamp.")
        sys.exit(1)
    print(f"GrotheCaps sources unchanged since verification: {rec.get('verified', '?')} ({n} files)")


main()
