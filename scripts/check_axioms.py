#!/usr/bin/env python3
"""Check the axiom report (`lake env lean scratch/Axioms.lean`) read from stdin.

Fails unless
* every listed theorem uses only `propext`, `Classical.choice`, `Quot.sound` and the
  `native_decide` facts named in NATIVE (the finite exact computations documented in README.md),
* every theorem in REQUIRED (the headline results) appears in the report,
* the report contains no Lean errors.
"""
import re, sys
STANDARD = {"propext", "Classical.choice", "Quot.sound"}
NATIVE = {"Grothe.head_check._native.native_decide.ax_1_1",          # upper: head of the kernel
          "Grothe.Lower.cert_check._native.native_decide.ax_1_1",    # lower: rows, batches, cover
          "Grothe.LowerAnalytic.capChords_check._native.native_decide.ax_1_1"}  # lower: chord nodes of the cap tables
REQUIRED = {"Grothe.complex_grothendieck_upper", "Grothe.Lower.lower_bound_data",
            "Grothe.Lower.lower_endpoint", "Grothe.Lower.lower_bound_of_transferL2",
            "Grothe.LowerAnalytic.gaussian_steinInputs", "Grothe.LowerAnalytic.lower_bound_gaussian",
            "Grothe.LowerAnalytic.norm_pairVal_witness", "Grothe.LowerAnalytic.transferInputs_of_witnessCap",
            "Grothe.LowerAnalytic.witnessCap_of_reduction", "Grothe.LowerAnalytic.lower_bound_of_reduction",
            "Grothe.LowerAnalytic.normQk_le_rho"}
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
