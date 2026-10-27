#!/usr/bin/env python3
"""Check an axiom report (`lake env lean scratch/Axioms.lean`, or another report) read from stdin.

Stdin must be the complete `#print axioms` output: only records and whitespace.
Diagnostics, malformed or truncated records, and unknown or conflicting modes fail.

Fails unless
* every listed theorem uses only `propext`, `Classical.choice`, `Quot.sound` and the allowed `native_decide` facts
  (the finite exact computations documented in README.md and docs/LEAN_NATIVE_INVENTORY.md),
* every required theorem (the headline results) appears in the report,
* the complete input consists of well-formed axiom reports and whitespace only.

The lists are data files, one name per line, sorted, union-merged by git (.gitattributes), checked for order and
duplicates by `tools/gen_root_imports.py --check`:
* default report: data/axioms/required.txt, data/axioms/native.txt;
* audit modes (one flag at most): data/axioms/modes/<mode>.required.txt, and <mode>.native.txt if present
  (otherwise the default native list). Modes: --upper-comparison, --hardy-budget, --refined-cover,
  --law-nodes.
"""
import argparse, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
AXDIR = os.path.join(ROOT, "data", "axioms")
STANDARD = {"propext", "Classical.choice", "Quot.sound"}
MODES = ("upper-comparison", "hardy-budget", "refined-cover", "law-nodes")


def names(path):
    with open(path, encoding="utf-8") as f:
        return {l.split("#", 1)[0].strip() for l in f if l.split("#", 1)[0].strip()}


def audit_policy(mode):
    """The required results and the native allowlist of one mode, from the data files."""
    native = names(os.path.join(AXDIR, "native.txt"))
    if mode == "default":
        return names(os.path.join(AXDIR, "required.txt")), native
    required = names(os.path.join(AXDIR, "modes", f"{mode}.required.txt"))
    mode_native = os.path.join(AXDIR, "modes", f"{mode}.native.txt")
    return required, (names(mode_native) if os.path.exists(mode_native) else native)


# the default lists, as module constants (used by the tests and by other tools)
REQUIRED, NATIVE = audit_policy("default")
UPPER_COMPARISON = audit_policy("upper-comparison")[0]
HARDY_BUDGET = audit_policy("hardy-budget")[0]
REFINED_LOWER = audit_policy("refined-cover")[0]
LAW_NODES = audit_policy("law-nodes")[0]


# A name may contain apostrophes; its closing quote precedes the report phrase.
# Lean pretty-prints long axiom lists over several lines.
REPORT = re.compile(
    r"'(?P<name>(?:[^\s«»]|«[^»]*»)+?)'\s+"
    r"(?:depends\s+on\s+axioms:\s*\[(?P<axioms>[^\[\]]*)\]"
    r"|does\s+not\s+depend\s+on\s+any\s+axioms)(?=\s|$)"
)


def parse_reports(text):
    """Consume every input character; diagnostics and partial records are errors."""
    reports = []
    pos = 0
    while pos < len(text):
        if text[pos].isspace():
            pos += 1
            continue
        match = REPORT.match(text, pos)
        if match is None:
            line = text.count("\n", 0, pos) + 1
            raise ValueError(f"unexpected or malformed output at line {line}: {text[pos:pos + 80]!r}")
        raw = match.group("axioms")
        axioms = [] if raw is None or not raw.strip() else [a.strip() for a in raw.split(",")]
        if any(not a or any(c.isspace() for c in a) for a in axioms):
            raise ValueError(f"malformed axiom list for {match.group('name')}")
        reports.append((match.group("name"), axioms))
        pos = match.end()
    if not reports:
        raise ValueError("no axiom reports found")
    return reports


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    modes = parser.add_mutually_exclusive_group()
    for mode in MODES:
        modes.add_argument(f"--{mode}", action="store_const", const=mode, dest="mode",
                           help=f"check the {mode} report")
    parser.set_defaults(mode="default")
    args = parser.parse_args(argv)
    required, native = audit_policy(args.mode)
    try:
        reports = parse_reports(sys.stdin.read())
    except ValueError as error:
        print(f"invalid axiom report: {error}", file=sys.stderr)
        return 1
    bad = [(n, a) for n, axioms in reports for a in axioms if a not in STANDARD | native]
    for n, a in bad:
        print(f"DISALLOWED AXIOM in {n}: {a}")
    missing = required - {n for n, _ in reports}
    for n in sorted(missing):
        print(f"MISSING from the report: {n}")
    used = {a for _, axioms in reports for a in axioms} & native
    print(f"checked {len(reports)} theorems; native_decide facts used: {len(used)} of {len(native)}")
    return 1 if bad or missing else 0


if __name__ == "__main__":
    raise SystemExit(main())
