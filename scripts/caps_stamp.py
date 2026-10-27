#!/usr/bin/env python3
"""Source hash of the node-cap modules (CapRowKK, CapNodes), recorded in the verified build cache.

The 15 original CapRowKK modules contain 60 single-threaded native_decide facts. Activated row12 adds
1307 separate computation leaves, listed by the bounded-build registry. The droplet's self-hosted runner
builds Grothe (node caps included) and checks the axiom report before recording the sources beside the build products:
    python3 scripts/caps_stamp.py --mark-cache          # writes .lake/build/caps-closure.sha
CI restores the cache and calls
    python3 scripts/caps_stamp.py --check-cache         # (the default) exit 0 iff the verified caps match
On a match CI builds Grothe (Lake replays the verified facts) and checks the axiom report. On a mismatch or
missing marker it dispatches a runner caps build instead. --digest prints the hash and file count without reading
or writing the marker; --list also lists the exact hashed files.

The hash covers the computation import closure of the CapRowKK modules and every activated computation leaf,
plus CapNodes.lean, GrotheCapsKernel.lean, lean-toolchain, lake-manifest.json and lakefile.toml. Extras and
the activated row assembly and build registry are hashed directly,
without traversing their imports: lower-bound proof edits require re-checking the assembly, not the heavy facts.
The checker library root is pinned because its whole precompiled shared object is loaded by every importer, and
the Lake configuration controls native compilation. Analytic assembly imports are not traversed, so unrelated
proof-layer edits do not invalidate computation provenance. Import parsing fails closed on missing project modules (Grothe.*, GrotheKernel.* and
GrotheCapsKernel.*) or unsupported syntax. This is a cache provenance check, not a full build manifest; CI runs
its workflow and axiom-report checks separately.
Agent-ID: codex-0e12.
"""
import argparse, hashlib, json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MARK = os.path.join(ROOT, ".lake", "build", "caps-closure.sha")
PROJECT_PREFIXES = ("Grothe.", "GrotheKernel.", "GrotheCapsKernel.")
PROJECT_ROOTS = ("Grothe", "GrotheKernel", "GrotheCapsKernel")
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
TOPS = [f"Grothe.LowerAnalytic.CapRow{k:02d}" for k in CAP_ROWS]
EXTRA = ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCapsKernel.lean", "lean-toolchain", "lake-manifest.json",
         "lakefile.toml"]
BUILD_REGISTRY = "data/caps-m/plan/row-certificates/row12-build.json"
ROW_ASSEMBLY = "Grothe/LowerAnalytic/CapRow12/Assembly.lean"
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


def registry_module(path):
    """Require a normalized in-repository project Lean source path."""
    if not isinstance(path, str) or not path.endswith(".lean") or "\\" in path:
        raise ClosureError(f"invalid computation registry source path: {path!r}")
    parts = path.split("/")
    module = path[:-5].replace("/", ".")
    if any(part in {"", ".", ".."} for part in parts) or not MODULE.fullmatch(module) or not is_project(module):
        raise ClosureError(f"invalid computation registry project path: {path!r}")
    resolved = os.path.realpath(os.path.join(ROOT, path))
    if os.path.commonpath((os.path.realpath(ROOT), resolved)) != os.path.realpath(ROOT):
        raise ClosureError(f"computation registry path escapes the repository: {path}")
    return module


def activated_sources():
    """Read activated compute roots; never recurse into their analytic assembly."""
    path = os.path.join(ROOT, BUILD_REGISTRY)
    if not os.path.exists(path):
        if os.path.exists(os.path.join(ROOT, ROW_ASSEMBLY)):
            raise ClosureError(f"activated row12 assembly requires {BUILD_REGISTRY}")
        return [], []
    try:
        with open(path, encoding="utf-8") as stream:
            registry = json.load(stream)
    except (ValueError, OSError) as error:
        raise ClosureError(f"cannot read {BUILD_REGISTRY}: {error}") from error
    if not isinstance(registry, dict) or registry.get("format") != "caps-bounded-build-v1" or registry.get("row") != 12:
        raise ClosureError(f"unsupported activated computation registry: {BUILD_REGISTRY}")
    roots, direct = registry.get("compute_roots"), registry.get("direct_hash_roots")
    if not isinstance(roots, list) or not roots or not isinstance(direct, list):
        raise ClosureError("activated registry must list compute_roots and direct_hash_roots")
    modules = [registry_module(name) for name in roots]
    direct_modules = [registry_module(name) for name in direct]
    if len(modules) != len(set(modules)) or len(direct_modules) != len(set(direct_modules)):
        raise ClosureError("duplicate activated computation registry roots")
    if not set(TOPS) <= set(modules):
        raise ClosureError("activated registry omits an original cap-row computation root")
    if set(direct) != {EXTRA[0], ROW_ASSEMBLY}:
        raise ClosureError("activated direct hash roots must be CapNodes and the row12 assembly")
    if registry.get("compute_count") != len(roots) or registry.get("row12_compute_count") != len(set(modules) - set(TOPS)):
        raise ClosureError("activated computation registry census differs from its roots")
    return modules, direct


def source_files():
    """Sorted computation closure, followed by directly hashed assembly/config files."""
    roots, direct = activated_sources()
    files = [os.path.join(*module.split(".")) + ".lean" for module in closure(TOPS + roots)]
    extra = EXTRA + direct + ([BUILD_REGISTRY] if roots else [])
    return files + list(dict.fromkeys(name for name in extra if name not in files))


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
