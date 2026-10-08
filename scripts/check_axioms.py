#!/usr/bin/env python3
"""Fail unless every theorem in the axiom report uses only the standard axioms and
`native_decide` facts (finite exact computations, documented in README.md)."""
import re, sys
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}
text = sys.stdin.read()
reports = re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", text.replace("\n", " "))
if not reports:
    sys.exit("no axiom reports found")
bad = []
for name, axioms in reports:
    for ax in (a.strip() for a in axioms.split(",") if a.strip()):
        if ax in ALLOWED or ax.endswith("._native.native_decide.ax_1_1"):
            continue
        bad.append((name, ax))
for name, ax in bad:
    print(f"DISALLOWED AXIOM in {name}: {ax}")
print(f"checked {len(reports)} theorems")
sys.exit(1 if bad else 0)
