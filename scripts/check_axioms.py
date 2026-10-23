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
          "Grothe.haagerup_check._native.native_decide.ax_1_1",      # Haagerup route: residual of the cubic preprocessing
          "Grothe.UpperChaos.phi_cover_check._native.native_decide.ax_1_1"}  # upper: phase cover φ² ≤ 3
REQUIRED = {"Grothe.fresh_upper", "Grothe.Lower.lower_bound_data",
            "Grothe.Lower.lower_endpoint", "Grothe.Lower.lower_bound_of_transferL2",
            "Grothe.LowerAnalytic.gaussian_steinInputs", "Grothe.LowerAnalytic.lower_bound_gaussian",
            "Grothe.LowerAnalytic.norm_pairVal_witness", "Grothe.LowerAnalytic.transferInputs_of_witnessCap",
            "Grothe.LowerAnalytic.witnessCap_of_reduction", "Grothe.LowerAnalytic.lower_bound_of_reduction",
            "Grothe.LowerAnalytic.normQk_le_rho", "Grothe.LowerAnalytic.lower_bound_of_nodeCaps",
            "Grothe.haagerup_bound", "Grothe.LowerAnalytic.JointSixth.gram_j_eta",
            "Grothe.LowerAnalytic.JointSixth.gram_j2_shifted",
            "Grothe.LowerAnalytic.joint_eta_budget", "Grothe.Lower.MPoly.momentLift_majorant",
            "Grothe.LowerAnalytic.MomentCone.gram_node_of_check",
            "Grothe.Lower.gram_joint_of_scalars", "Grothe.LowerAnalytic.Circular.joint_sixth",
            "Grothe.LowerAnalytic.gaussian_gramInputs",
            "Grothe.LowerAnalytic.MomentCone.Feasible.boundary_lower",
            "Grothe.LowerAnalytic.MomentCone.boundary_attained",
            "Grothe.LowerAnalytic.MomentCone.boundary_node",
            "Grothe.LowerAnalytic.MomentCone.exists_feasible_iff",
            "Grothe.LowerAnalytic.MomentCone.boundaryChecked_node",
            "Grothe.LowerAnalytic.SphericalTransfer.cubicAmp_recurrence",
            "Grothe.LowerAnalytic.SphericalTransfer.cubicAmp_tail",
            "Grothe.LowerAnalytic.SphericalTransfer.cubic_tail_32_12",
            "Grothe.LowerAnalytic.SphericalTransfer.global_cap_from_truncation"}
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
