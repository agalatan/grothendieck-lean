#!/usr/bin/env python3
"""Stamp of the computation sources behind the separate target GrotheCaps.

The 15 heavy CapRowKK modules contain 60 single-threaded native_decide facts. CI checks
    python3 scripts/caps_stamp.py --check
against docs/CAPS_VERIFIED.txt. On a changed ready/ delivery, CI dispatches the droplet runner to build GrotheCaps
and check both axiom reports, then record the successful verification with
    python3 scripts/caps_stamp.py --write "<machine, date, run>"
and re-dispatch the ready/ check. With no arguments the script checks the stamp; --digest prints the current hash
and file count without reading or writing the stamp, and --list also lists the exact hashed files.

The hash covers the computation import closure of the CapRowKK modules, plus CapNodes.lean, GrotheCaps.lean,
lean-toolchain, lake-manifest.json and lakefile.toml. These five extras are hashed directly, without traversing
their imports: lower-bound proof edits require re-checking the assembly, not the heavy numerical facts. The current
decoupled boundary is 48 local computation modules plus five extras (53). The Lake configuration is pinned because
it controls compilation of the native checker. Import parsing fails closed on missing project modules (Grothe.*
and GrotheKernel.*) or unsupported import syntax. This is a verification stamp, not a full build manifest; CI runs
its workflow and axiom-report checks separately.
"""
import argparse, hashlib, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STAMP = os.path.join(ROOT, "docs", "CAPS_VERIFIED.txt")
PROJECT_PREFIXES = ("Grothe.", "GrotheKernel.")
PROJECT_ROOTS = ("Grothe", "GrotheKernel", "GrotheCaps")
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
TOPS = [f"Grothe.LowerAnalytic.CapRow{k:02d}" for k in CAP_ROWS]
EXTRA = ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCaps.lean", "lean-toolchain", "lake-manifest.json",
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
    """Sorted computation closure, then the five directly hashed assembly/config files."""
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
    modes.add_argument("--check", action="store_true", help="check the verification stamp (default)")
    modes.add_argument("--digest", action="store_true", help="print the current source hash and file count")
    modes.add_argument("--list", action="store_true", help="list the exact hashed source files, hash and count")
    modes.add_argument("--write", metavar="NOTE", help="record a successful verification with its provenance")
    args = parser.parse_args(argv)
    if args.write is not None and not args.write.strip():
        parser.error("--write requires a nonempty verification note")
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
    sys.exit(main())
