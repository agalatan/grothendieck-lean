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
          "Grothe.haagerup_check._native.native_decide.ax_1_1",      # Haagerup route: residual of the cubic preprocessing
          "Grothe.UpperChaos.phi_cover_check._native.native_decide.ax_1_1",  # upper: phase cover φ² ≤ 3
          "Grothe.LowerAnalytic.capChords_check._native.native_decide.ax_1_1"}  # lower: chord nodes of the cap tables
# lower: node caps of the certified rows, four ranges of nodes per row (Grothe/LowerAnalytic/CapRowKK.lean)
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
NATIVE |= {f"Grothe.LowerAnalytic.capRange{k:02d}_{j}._native.native_decide.ax_1_1"
           for k in CAP_ROWS for j in range(4)}
# lower: the certificate check in 13 single-threaded chunks (Grothe/Lower/Cert/)
NATIVE |= {f"Grothe.Lower.{n}._native.native_decide.ax_1_1" for n in
           ['certRows0', 'certRows1', 'certRows2', 'certRows3', 'certRows4', 'certBatches0', 'certBatches1', 'certBatches2', 'certBoxes0', 'certBoxes1', 'certBoxes2', 'certBoxes3', 'certPartition']}
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
REQUIRED |= {
    'Grothe.Lower.PrimalAudit.no_dual_below_primal',
    'Grothe.Lower.PrimalAudit.primal_le_dual',
    'Grothe.Lower.SteinFusion.common_kernel_projection',
    'Grothe.Lower.SteinFusion.perspective_fusion_le',
    'Grothe.Lower.SteinFusion.perspective_variance',
    'Grothe.Lower.SteinFusion.specCellG_unit_fusion',
    'Grothe.Lower.SteinFusion.unit_fusion_identity',
    'Grothe.Lower.SteinFusion.unit_fusion_le',
    'Grothe.LowerAnalytic.QuadraticFeatures.affine_quadratic_remainder_budget',
    'Grothe.LowerAnalytic.QuadraticFeatures.probe_projection_closure',
    'Grothe.LowerAnalytic.QuadraticFeatures.quadratic_mul_linear',
    'Grothe.LowerAnalytic.QuadraticFeatures.quadratic_remainder_budget',
    'Grothe.LowerAnalytic.ReplicaState.firstCoeff_cross',
    'Grothe.LowerAnalytic.ReplicaState.firstCoeff_normSq',
    'Grothe.LowerAnalytic.ReplicaState.residual_nonneg',
    'Grothe.LowerAnalytic.ReplicaState.scalar_surrogate_gap',
    'Grothe.LowerAnalytic.ReplicaState.scalar_surrogate_strict',
    'Grothe.LowerAnalytic.ReplicaState.sqrt_variance_identity',
    'Grothe.LowerAnalytic.ReplicaState.variance_identity',
    'Grothe.LowerAnalytic.ResponseGram.completion_screen',
    'Grothe.LowerAnalytic.ResponseGram.disk_quadratic_attained',
    'Grothe.LowerAnalytic.ResponseGram.disk_quadratic_bound',
    'Grothe.LowerAnalytic.ResponseGram.factored_price_bound',
    'Grothe.LowerAnalytic.ResponseGram.gram_qform',
    'Grothe.LowerAnalytic.ResponseGram.inner_perturbation_bound',
    'Grothe.LowerAnalytic.ResponseGram.moment_support_bound',
    'Grothe.LowerAnalytic.ResponseGram.nested_projection_gram_interval',
    'Grothe.LowerAnalytic.ResponseGram.no_completion',
    'Grothe.LowerAnalytic.ResponseGram.orthogonal_projection_cross_bound',
    'Grothe.LowerAnalytic.ResponseGram.priced_nearmax_bound',
    'Grothe.LowerAnalytic.ResponseGram.projection_gram_interval',
    'Grothe.LowerAnalytic.ResponseGram.reflection_cross_bound',
    'Grothe.LowerAnalytic.ResponseGram.regularized_alignment_bound',
    'Grothe.LowerAnalytic.ResponseGram.two_disc_price_bound',
    'Grothe.LowerAnalytic.ResponseGram.weighted_alignment',
    'Grothe.LowerAnalytic.TwoDisc.bilinear_support',
    'Grothe.LowerAnalytic.TwoDisc.complex_linear_support',
    'Grothe.LowerAnalytic.TwoDisc.coupled_interior_support',
    'Grothe.LowerAnalytic.TwoDisc.independent_interior_support',
    'Grothe.LowerAnalytic.TwoDisc.sharp_examples_attained',
    'Grothe.LowerAnalytic.TwoDisc.slack_factorization',
    'Grothe.LowerAnalytic.TwoDisc.support_of_factor',
    'Grothe.Upper.CubicPhaseScreen.axis_le_real_polynomial',
    'Grothe.Upper.CubicPhaseScreen.axis_nonneg',
    'Grothe.Upper.CubicPhaseScreen.complex_score_cap',
    'Grothe.Upper.CubicPhaseScreen.full_score_cap_of_low_identity',
    'Grothe.Upper.CubicPhaseScreen.normalized_complex_cap',
    'Grothe.Upper.CubicPhaseScreen.phase_conditions',
    'Grothe.Upper.CubicPhaseScreen.phase_conditions_unit',
    'Grothe.Upper.CubicPhaseScreen.real_polynomial_cap',
    'Grothe.Upper.CubicPhaseScreen.score_le_separator',
    'Grothe.Upper.CubicPhaseScreen.trigonometric_square_bound',
    'Grothe.Upper.KernelScreen.all_level_price_bound',
    'Grothe.Upper.KernelScreen.full_score_upper',
    'Grothe.Upper.KernelScreen.priced_score_upper',
    'Grothe.Upper.KernelScreen.weighted_tail',
    'Grothe.Upper.SpectralScreen.affine_error_bound',
    'Grothe.Upper.SpectralScreen.all_level_price_of_front_tail',
    'Grothe.Upper.SpectralScreen.common_tail_price',
    'Grothe.Upper.SpectralScreen.finite_mixture_score_bound',
    'Grothe.Upper.SpectralScreen.full_score_upper',
}
# `--caps`: the report of scratch/AxiomsCaps.lean (separate target GrotheCaps, see README)
if "--caps" in sys.argv:
    REQUIRED = {"Grothe.LowerAnalytic.lower_bound_of_capsRest"}
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
