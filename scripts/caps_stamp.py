#!/usr/bin/env python3
"""Source hash of the separate target GrotheCaps (the node caps certified in Lean), recorded in the build cache.

The 15 heavy modules Grothe/LowerAnalytic/CapRowKK.lean (60 single-threaded native_decide facts, hours) are built only
on the droplet's self-hosted runner (lean.yml, job "heavy", modes warm/caps). After a successful build and both axiom
reports there, the runner records the hash of every source they depend on next to the build products:
    python3 scripts/caps_stamp.py --mark-cache          # writes .lake/build/caps-closure.sha
and saves .lake/build to the Actions cache. A CI run restores that cache and calls
    python3 scripts/caps_stamp.py --check-cache         # (the default) exit 0 iff the cached caps match the sources
On a match the cached caps modules are exactly the verified ones for these sources, so CI builds GrotheCaps (Lake
replays them) and checks its axiom report; on a mismatch, or when the marker is missing, it fails closed and CI
dispatches a caps run on the droplet instead of building. `--digest` prints the hash and file count.

The hash covers the import closure of the CapRowKK modules, plus CapNodes.lean, GrotheCaps.lean, lean-toolchain,
lake-manifest.json and lakefile.toml. Import parsing is strict: an import line naming a project module (Grothe.*,
GrotheKernel.*) whose file does not exist, or syntax this parser does not understand, is an error, never silently
skipped. It is a provenance check for the cached caps, not a full reproducibility manifest (it does not cover the
workflow or the report scripts, which CI re-runs on every check anyway).
"""
import argparse, hashlib, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MARK = os.path.join(ROOT, ".lake", "build", "caps-closure.sha")
PROJECT_PREFIXES = ("Grothe.", "GrotheKernel.")
PROJECT_ROOTS = ("Grothe", "GrotheKernel", "GrotheCaps")
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
TOPS = [f"Grothe.LowerAnalytic.CapRow{k:02d}" for k in CAP_ROWS]
EXTRA = ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCaps.lean", "lean-toolchain", "lake-manifest.json",
         "lakefile.toml"]
IMPORT = re.compile(r"\s*import\s+(.*)$")
MODULE = re.compile(r"[A-Za-z_][A-Za-z0-9_']*(\.[A-Za-z_][A-Za-z0-9_']*)*$")


class ClosureError(Exception):
    pass


def is_project(module):
    return module in PROJECT_ROOTS or module.startswith(PROJECT_PREFIXES)


def imports_of(path):
    """Module names imported by a Lean file (its header: the import lines before the first other code)."""
    out = []
    with open(path, encoding="utf-8") as source:
        for n, line in enumerate(source, 1):
            stripped = line.strip()
            if not stripped or stripped.startswith("--"):
                continue
            m = IMPORT.match(line)
            if not m:
                break  # end of the import header
            for name in m.group(1).split("--")[0].split():
                if not MODULE.match(name):
                    raise ClosureError(f"{os.path.relpath(path, ROOT)}:{n}: unsupported import syntax: {line.rstrip()}")
                out.append(name)
    return out


def closure(tops):
    seen, todo = set(), list(tops)
    while todo:
        m = todo.pop()
        if m in seen:
            continue
        path = os.path.join(ROOT, *m.split(".")) + ".lean"
        if not os.path.exists(path):
            if is_project(m):
                raise ClosureError(f"project module {m} is imported but {os.path.relpath(path, ROOT)} does not exist")
            continue  # Mathlib, Lean core or another dependency
        seen.add(m)
        todo.extend(imports_of(path))
    return sorted(seen)


def digest():
    h = hashlib.sha256()
    files = [os.path.join(*m.split(".")) + ".lean" for m in closure(TOPS)] + EXTRA
    for f in files:
        h.update(f.encode() + b"\0")
        with open(os.path.join(ROOT, f), "rb") as source:
            h.update(source.read())
    return h.hexdigest(), len(files)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--check-cache", action="store_true",
                       help="check that the cached GrotheCaps build is verified for these sources (default)")
    modes.add_argument("--digest", action="store_true", help="print the current source hash and file count")
    modes.add_argument("--mark-cache", action="store_true",
                       help="record that the GrotheCaps build in .lake/build was verified for these sources")
    args = parser.parse_args(argv)
    try:
        d, n = digest()
    except ClosureError as e:
        print(f"FAIL: {e}")
        return 1
    if args.digest:
        print(f"sha256 {d}\nfiles {n}")
        return 0
    if args.mark_cache:
        os.makedirs(os.path.dirname(MARK), exist_ok=True)
        with open(MARK, "w") as f:
            f.write(d + "\n")
        print(f"marked the cached GrotheCaps build as verified for sources {d} ({n} files)")
        return 0
    if not os.path.exists(MARK):
        print(f"FAIL: no verified GrotheCaps build in the cache (current sources {d}, {n} files)")
        return 1
    with open(MARK) as mark:
        rec = mark.read().strip()
    if rec != d:
        print(f"FAIL: the cached GrotheCaps build was verified for sources {rec}; current sources are {d} ({n} files)")
        return 1
    print(f"the cached GrotheCaps build is verified for the current sources {d} ({n} files)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
