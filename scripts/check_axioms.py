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
# Generic response geometry: every exported theorem is audited by default CI.
RESPONSE_GEOMETRY = {
    'Grothe.LowerAnalytic.DiffuseCubicObstruction.finite_bridge_lower',
    'Grothe.LowerAnalytic.DiffuseCubicObstruction.above_target',
    'Grothe.LowerAnalytic.DiffuseCubicObstruction.reciprocal_ceiling',
    'Grothe.LowerAnalytic.JointRowRepricing.visible_completion',
    'Grothe.LowerAnalytic.JointRowRepricing.invQuad_shift',
    'Grothe.LowerAnalytic.JointRowRepricing.price_shift',
    'Grothe.LowerAnalytic.JointRowRepricing.dual_constant_is_row',
    'Grothe.LowerAnalytic.JointRowRepricing.forcing_scale',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_apply',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.coefficient_le_projected_norm',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.preserves_coefficient_of_selfadjoint',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.gateEnergy_lower',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_norm_sq',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.gateEnergy_rankOne',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_preserves_coefficient',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_selfadjoint',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_contraction',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_idempotent',
    'Grothe.LowerAnalytic.ProjectionGateCeiling.rankOne_c0',
    'Grothe.LowerAnalytic.QuinticTransferAudit.diagonal_error_bound',
    'Grothe.LowerAnalytic.QuinticTransferAudit.diagonal_one_sided_bounds',
    'Grothe.LowerAnalytic.QuinticTransferAudit.negative_of_error_bound',
    'Grothe.LowerAnalytic.QuinticTransferAudit.strict_interval_convex_mix',
    'Grothe.LowerAnalytic.QuinticTransferAudit.signed_step_decreases',
    'Grothe.LowerAnalytic.QuinticTransferAudit.signed_step_margin',
    'Grothe.LowerAnalytic.QuinticTransferAudit.cramer_three_column_cancellation',
    'Grothe.LowerAnalytic.QuinticTransferAudit.linear_necessary_score_affine_bound',
    'Grothe.LowerAnalytic.QuinticTransferAudit.linear_necessary_score_bound',
    'Grothe.LowerAnalytic.QuinticTransferAudit.zero_cubic_necessary_score_bound',
    'Grothe.LowerAnalytic.ResponseCompression.norm_sq_sum',
    'Grothe.LowerAnalytic.ResponseCompression.compression_bessel',
    'Grothe.LowerAnalytic.ResponseCompression.compression_block_nonneg',
    'Grothe.LowerAnalytic.ResponseCompression.three_grade_cut',
    'Grothe.LowerAnalytic.ResponseCompression.three_grade_cut_unnormalized',
    'Grothe.LowerAnalytic.ResponseCompression.two_by_two_moment_cut',
    'Grothe.LowerAnalytic.ResponseCompression.fake_radial_parseval',
    'Grothe.LowerAnalytic.ResponseCompression.fake_radial_rejected',
    'Grothe.LowerAnalytic.ResponseCompression.fake_radial_repair_energy',
    'Grothe.LowerAnalytic.ResponseCompression.fake_radial_repair',
    'Grothe.LowerAnalytic.ResponseCompression.fake_visible_parseval',
    'Grothe.LowerAnalytic.ResponseCompression.fake_visible_rejected',
    'Grothe.LowerAnalytic.ResponseCompression.forced_visible_companion',
    'Grothe.LowerAnalytic.ResponseCompression.mulResponse_ae',
    'Grothe.LowerAnalytic.ResponseCompression.mulResponse_contracts',
    'Grothe.LowerAnalytic.ResponseCompression.bounded_response_compression',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.affine_cancel',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.mixed_floor_le_max',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.family_floor',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.opposite_slopes',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.rounded_mix_floor',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.floor_positive',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.reciprocal_ceiling',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.ceiling_below_140226',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.spectral_ratio_ceiling',
    'Grothe.LowerAnalytic.ScalarCubicFamilyCeiling.pure_cubic_coefficient_above_floor'}
REQUIRED |= RESPONSE_GEOMETRY
# `--caps`: the report of scratch/AxiomsCaps.lean (separate target GrotheCaps, see README)
if "--caps" in sys.argv:
    REQUIRED = {"Grothe.LowerAnalytic.lower_bound_of_capsRest"}
elif "--response-geometry" in sys.argv:
    REQUIRED = RESPONSE_GEOMETRY
    NATIVE = set()
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
