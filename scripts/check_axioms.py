#!/usr/bin/env python3
"""Check an axiom report (`lake env lean scratch/Axioms.lean`, or another report) read from stdin.

Fails unless
* every listed theorem uses only `propext`, `Classical.choice`, `Quot.sound` and the allowed `native_decide` facts
  (the finite exact computations documented in README.md and docs/LEAN_NATIVE_INVENTORY.md),
* every required theorem (the headline results) appears in the report,
* the report contains no Lean errors.

The lists are data files, one name per line, sorted, union-merged by git (.gitattributes), checked for order and
duplicates by `tools/gen_root_imports.py --check`:
* default report:  data/axioms/required.txt, data/axioms/native.txt
* audit modes (at most one flag): data/axioms/modes/<mode>.required.txt, and <mode>.native.txt if present
  (otherwise the default native list). Modes: --caps (scratch/AxiomsCaps.lean, target GrotheCaps), --responses,
  --response-geometry, --phase-response, --haagerup-power, --upper-comparison.
"""
import os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
AXDIR = os.path.join(ROOT, "data", "axioms")
STANDARD = {"propext", "Classical.choice", "Quot.sound"}
MODES = ["caps", "responses", "response-geometry", "phase-response", "haagerup-power", "upper-comparison"]


def names(path):
    with open(path, encoding="utf-8") as f:
        return {l.split("#", 1)[0].strip() for l in f if l.split("#", 1)[0].strip()}


flags = [a[2:] for a in sys.argv[1:]]
unknown = [f for f in flags if f not in MODES]
if unknown:
    sys.exit(f"unknown option(s) {unknown}; modes: {MODES}")
if len(flags) > 1:
    sys.exit("choose one axiom audit mode")
NATIVE = names(os.path.join(AXDIR, "native.txt"))
REQUIRED = names(os.path.join(AXDIR, "required.txt"))
if flags:
    mode = flags[0]
    REQUIRED = names(os.path.join(AXDIR, "modes", f"{mode}.required.txt"))
    mode_native = os.path.join(AXDIR, "modes", f"{mode}.native.txt")
    if os.path.exists(mode_native):
        NATIVE = names(mode_native)

text = sys.stdin.read()
if re.search(r"(^|\n)[^\n]*: error", text):
    sys.exit("the axiom report contains Lean errors")
flat = text.replace("\n", " ")
reports = re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", flat)
reports += [(n, "") for n in re.findall(r"'([^']+)' does not depend on any axioms", flat)]
if not reports:
    sys.exit("no axiom reports found")
bad = [(n, a) for n, axs in reports for a in (x.strip() for x in axs.split(",")) if a and a not in STANDARD | NATIVE]
for n, a in bad:
    print(f"DISALLOWED AXIOM in {n}: {a}")
missing = REQUIRED - {n for n, _ in reports}
for n in sorted(missing):
    print(f"MISSING from the report: {n}")
used = {a.strip() for _, axs in reports for a in axs.split(",")} & NATIVE
print(f"checked {len(reports)} theorems; native_decide facts used: {len(used)} of {len(NATIVE)}")
sys.exit(1 if bad or missing else 0)
