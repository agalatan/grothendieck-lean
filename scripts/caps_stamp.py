#!/usr/bin/env python3
"""Source hash of the node-cap modules (CapRowKK, CapNodes), recorded in the verified build cache.

The 15 heavy CapRowKK modules contain 60 single-threaded native_decide facts. The droplet's self-hosted runner
builds Grothe (node caps included) and checks the axiom report before recording the sources beside the build products:
    python3 scripts/caps_stamp.py --mark-cache          # writes .lake/build/caps-closure.sha
CI restores the cache and calls
    python3 scripts/caps_stamp.py --check-cache         # (the default) exit 0 iff the verified caps match
On a match CI builds Grothe (Lake replays the verified facts) and checks the axiom report. On a mismatch or
missing marker it dispatches a runner caps build instead. --digest prints the hash and file count without reading
or writing the marker; --list also lists the exact hashed files.

The hash covers the computation import closure of the CapRowKK modules and completed localized-node
checks, plus CapNodes.lean,
GrotheCapsKernel.lean, lean-toolchain, lake-manifest.json and lakefile.toml. These five extras are hashed directly,
without traversing their imports: lower-bound proof edits require re-checking the assembly, not the heavy facts.
The checker library root is pinned because its whole precompiled shared object is loaded by every importer, and
the Lake configuration controls native compilation. The computation boundary excludes analytic soundness imports. Import parsing fails closed on missing project modules (Grothe.*, GrotheKernel.* and
GrotheCapsKernel.*) or unsupported syntax. This is a cache provenance check, not a full build manifest; CI runs
its workflow and axiom-report checks separately.
"""
import argparse, hashlib, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MARK = os.path.join(ROOT, ".lake", "build", "caps-closure.sha")
PROJECT_PREFIXES = ("Grothe.", "GrotheKernel.", "GrotheCapsKernel.")
PROJECT_ROOTS = ("Grothe", "GrotheKernel", "GrotheCapsKernel")
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
# The first completed localized node also has heavy finite checks. Include their
# computation closure so a cold piece build is routed to the caps runner.
PIECE_TOPS = [f"Grothe.LowerAnalytic.CapPieces.{name}" for name in
              ("C14x150", "R14x150_0", "R14x150_1", "R14x150p0Repair")]
TOPS = [f"Grothe.LowerAnalytic.CapRow{k:02d}" for k in CAP_ROWS] + PIECE_TOPS
EXTRA = ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCapsKernel.lean", "lean-toolchain", "lake-manifest.json",
         "lakefile.toml"]
IMPORT = re.compile(r"\s*(?:public\s+)?(?:meta\s+)?import(?:\s+(.*))?$")
MODULE = re.compile(r"[A-Za-z_][A-Za-z0-9_']*(\.[A-Za-z_][A-Za-z0-9_']*)*$")


class ClosureError(Exception):
    pass


def is_project(module):
    return module in PROJECT_ROOTS or module.startswith(PROJECT_PREFIXES)


def imports_of(path):
    """Read the import header, ignoring line and nested block comments."""
    out = []
    depth = 0
    with open(path, encoding="utf-8") as source:
        for n, line in enumerate(source, 1):
            code = []
            i = 0
            while i < len(line):
                if depth:
                    if line.startswith("/-", i):
                        depth += 1
                        i += 2
                    elif line.startswith("-/", i):
                        depth -= 1
                        i += 2
                        code.append(" ")
                    else:
                        i += 1
                elif line.startswith("--", i):
                    break
                elif line.startswith("/-", i):
                    depth = 1
                    code.append(" ")
                    i += 2
                else:
                    code.append(line[i])
                    i += 1
            code = "".join(code)
            stripped = code.strip()
            if not stripped or stripped in {"module", "prelude"}:
                continue
            match = IMPORT.fullmatch(code.rstrip())
            if not match:
                if re.match(r"\s*(?:(?:public|meta)\s+)*import\b", code):
                    raise ClosureError(f"{os.path.relpath(path, ROOT)}:{n}: unsupported import syntax: {line.rstrip()}")
                break  # first body command: subsequent text is not an import header
            names = (match.group(1) or "").split()
            if not names or any(not MODULE.fullmatch(name) for name in names):
                raise ClosureError(f"{os.path.relpath(path, ROOT)}:{n}: unsupported import syntax: {line.rstrip()}")
            out.extend(names)
        else:
            if depth:
                raise ClosureError(f"{os.path.relpath(path, ROOT)}: unterminated block comment in import header")
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


def source_files():
    """Sorted computation closure, then the directly hashed assembly/config files."""
    return [os.path.join(*module.split(".")) + ".lean" for module in closure(TOPS)] + EXTRA


def digest():
    h = hashlib.sha256()
    files = source_files()
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
                       help="check that the cached node-cap build is verified for these sources (default)")
    modes.add_argument("--digest", action="store_true", help="print the current source hash and file count")
    modes.add_argument("--list", action="store_true", help="list the exact hashed source files, hash and count")
    modes.add_argument("--mark-cache", action="store_true",
                       help="record that the node-cap build in .lake/build was verified for these sources")
    args = parser.parse_args(argv)
    try:
        d, n = digest()
    except ClosureError as e:
        print(f"FAIL: {e}")
        return 1
    if args.list:
        print("\n".join(source_files()))
        print(f"{n} files; sha256 {d}")
        return 0
    if args.digest:
        print(f"sha256 {d}\nfiles {n}")
        return 0
    if args.mark_cache:
        os.makedirs(os.path.dirname(MARK), exist_ok=True)
        with open(MARK, "w") as f:
            f.write(d + "\n")
        print(f"marked the cached node-cap build as verified for sources {d} ({n} files)")
        return 0
    if not os.path.exists(MARK):
        print(f"FAIL: no verified node-cap build in the cache (current sources {d}, {n} files)")
        return 1
    with open(MARK) as mark:
        rec = mark.read().strip()
    if rec != d:
        print(f"FAIL: the cached node-cap build was verified for sources {rec}; current sources are {d} ({n} files)")
        return 1
    print(f"the cached node-cap build is verified for the current sources {d} ({n} files)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
