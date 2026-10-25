#!/usr/bin/env python3
"""Source hash of the separate target GrotheCaps (the node caps certified in Lean), recorded in the build cache.

The 15 heavy modules Grothe/LowerAnalytic/CapRowKK.lean (60 single-threaded native_decide facts, hours) are built only
on the droplet's self-hosted runner (lean.yml, job "heavy", modes warm/caps). After a successful build and both axiom
reports there, the runner records the hash of every source they depend on next to the build products:
    python3 scripts/caps_stamp.py --mark-cache          # writes .lake/build/caps-closure.sha
and saves .lake/build to the Actions cache. A CI run restores that cache and calls
    python3 scripts/caps_stamp.py --check-cache         # exit 0 iff the cached caps match the current sources
On a match the cached caps modules are exactly the verified ones for these sources, so CI builds GrotheCaps (Lake
replays them) and checks its axiom report; on a mismatch CI dispatches a caps run on the droplet instead of building.
--digest prints the hash. The hash covers the import closure of the CapRowKK modules plus CapNodes.lean,
GrotheCaps.lean, lean-toolchain and lake-manifest.json.
"""
import hashlib, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MARK = os.path.join(ROOT, ".lake", "build", "caps-closure.sha")
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
        for line in open(path, encoding="utf-8"):
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
        h.update(open(os.path.join(ROOT, f), "rb").read())
    return h.hexdigest(), len(files)


def main():
    d, n = digest()
    if "--digest" in sys.argv:
        print(d)
        return
    if "--mark-cache" in sys.argv:
        os.makedirs(os.path.dirname(MARK), exist_ok=True)
        with open(MARK, "w") as f:
            f.write(d + "\n")
        print(f"marked the cached GrotheCaps build as verified for sources {d} ({n} files)")
        return
    # --check-cache (default)
    if not os.path.exists(MARK):
        print(f"no verified GrotheCaps build in the cache (current sources {d}, {n} files)")
        sys.exit(1)
    rec = open(MARK).read().strip()
    if rec != d:
        print(f"the cached GrotheCaps build was verified for sources {rec}, current sources are {d} ({n} files)")
        sys.exit(1)
    print(f"the cached GrotheCaps build is verified for the current sources {d} ({n} files)")


main()
