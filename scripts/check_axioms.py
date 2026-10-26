#!/usr/bin/env python3
"""Check the axiom report (`lake env lean scratch/Axioms.lean`) read from stdin.

Stdin must be the complete `#print axioms` output: only records and whitespace.
Diagnostics, malformed or truncated records, and unknown or conflicting modes fail.

Fails unless
* every listed theorem uses only `propext`, `Classical.choice`, `Quot.sound` and the
  `native_decide` facts named in NATIVE (the finite exact computations documented in README.md),
* every theorem in REQUIRED (the headline results) appears in the report,
* the complete input consists of well-formed axiom reports and whitespace only.
"""
import argparse, re, sys
STANDARD = {"propext", "Classical.choice", "Quot.sound"}
NATIVE = {"Grothe.head_check._native.native_decide.ax_1_1",          # upper: head of the kernel
          "Grothe.Upper.comparison_check._native.native_decide.ax_1_1", # upper: selected-band masses and comparison assembly
          "Grothe.HaagerupPower.check._native.native_decide.ax_1_1",      # Haagerup route: finite residual, power norm, inverse defect, seed and signed tail
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
            "Grothe.Upper.comparison_check", "Grothe.Upper.actual_band_mass",
            "Grothe.Upper.BandComparison.compare", "Grothe.Upper.BandComparison.weighted_compare",
            "Grothe.Upper.headWeight_sound", "Grothe.Upper.comparisonWeight_sound",
            "Grothe.Upper.head_residual_le_weighted", "Grothe.UpperChaos.norm_energyBlock_sq",
            "Grothe.UpperChaos.localized_comparison",
            "Grothe.Lower.lower_endpoint", "Grothe.Lower.lower_bound_of_transferL2",
            "Grothe.LowerAnalytic.gaussian_steinInputs", "Grothe.LowerAnalytic.lower_bound_gaussian",
            "Grothe.LowerAnalytic.norm_pairVal_witness", "Grothe.LowerAnalytic.transferInputs_of_witnessCap",
            "Grothe.LowerAnalytic.witnessCap_of_reduction", "Grothe.LowerAnalytic.lower_bound_of_reduction",
            "Grothe.LowerAnalytic.normQk_le_rho", "Grothe.LowerAnalytic.lower_bound_of_nodeCaps",
            "Grothe.haagerup_bound", "Grothe.HaagerupPower.upper",
            "Grothe.Upper.PowerTail.weighted_tail_bound",
            "Grothe.Upper.PowerTail.compTerm_power_bound",
            "Grothe.Upper.PowerTail.no_power_saving_of_boundary",
            "Grothe.LowerAnalytic.JointSixth.gram_j_eta",
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
JOINT_RESPONSE = {
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
    'Grothe.Upper.SpectralScreen.l1_anchor_price_bound',
    'Grothe.Upper.SpectralScreen.full_score_l1_lower',
    'Grothe.Upper.SpectralScreen.all_level_price_of_front_tail',
    'Grothe.Upper.SpectralScreen.common_tail_price',
    'Grothe.Upper.SpectralScreen.finite_mixture_score_bound',
    'Grothe.Upper.SpectralScreen.full_score_upper',
}
REQUIRED |= JOINT_RESPONSE
POWER_HAAGERUP = {
    'Grothe.HaagerupPower.check',
    'Grothe.HaagerupPower.composed_tail',
    'Grothe.HaagerupPower.degree_P',
    'Grothe.HaagerupPower.exact_upper',
    'Grothe.HaagerupPower.finite_identity',
    'Grothe.HaagerupPower.finite_residual',
    'Grothe.HaagerupPower.gamma_bound',
    'Grothe.HaagerupPower.norm_P',
    'Grothe.HaagerupPower.norm_fourth',
    'Grothe.HaagerupPower.residual',
    'Grothe.HaagerupPower.upper',
    'Grothe.HaagerupPower.value_lt',
    'Grothe.Upper.PowerTail.compTerm_power_bound',
    'Grothe.Upper.PowerTail.eval_neg_one_le',
    'Grothe.Upper.PowerTail.mem_polyPowI',
    'Grothe.Upper.PowerTail.mem_powIval',
    'Grothe.Upper.PowerTail.mem_telescope',
    'Grothe.Upper.PowerTail.no_power_saving_of_boundary',
    'Grothe.Upper.PowerTail.power_norm_of_check',
    'Grothe.Upper.PowerTail.summable_weighted',
    'Grothe.Upper.PowerTail.tail_numeric_of_check',
    'Grothe.Upper.PowerTail.weightedTail_pair',
    'Grothe.Upper.PowerTail.weighted_composition',
    'Grothe.Upper.PowerTail.weighted_tail_bound',
    'Grothe.haagerup_bound',
    'Grothe.HaagerupPower.norm_defect',
    'Grothe.HaagerupPower.norm_seed',
    'Grothe.HaagerupPower.R_succ_le',
    'Grothe.Upper.ResolventTail.l1_neg',
    'Grothe.Upper.ResolventTail.l1_sub_le',
    'Grothe.Upper.ResolventTail.l1_smul_le',
    'Grothe.Upper.ResolventTail.inverse_defect_bound',
    'Grothe.Upper.ResolventTail.geometric_difference',
    'Grothe.Upper.ResolventTail.geometric_prefix_bound',
    'Grothe.Upper.ResolventTail.decreasing_weights_bound',
    'Grothe.Upper.ResolventTail.compTerm_geometric',
    'Grothe.Upper.ResolventTail.seed_power_bound',
    'Grothe.Upper.ResolventTail.compTerm_coeff_zero',
    'Grothe.Upper.ResolventTail.composition_tail_bound',
    'Grothe.Upper.ResolventTail.memB_neg',
    'Grothe.Upper.ResolventTail.defect_of_check',
    'Grothe.Upper.ResolventTail.seed_of_check',
    'Grothe.Upper.ResolventTail.tail_numeric_of_check',
}
REQUIRED |= POWER_HAAGERUP
UPPER_COMPARISON = {
    'Grothe.fresh_upper', 'Grothe.upper_value_lt',
    'Grothe.Upper.comparison_check', 'Grothe.Upper.actual_band_mass',
    'Grothe.Upper.BandComparison.compare', 'Grothe.Upper.BandComparison.weighted_compare',
    'Grothe.Upper.headWeight_sound', 'Grothe.Upper.comparisonWeight_sound',
    'Grothe.Upper.head_residual_le_weighted',
    'Grothe.UpperChaos.norm_energyBlock_sq', 'Grothe.UpperChaos.localized_comparison',
    'Grothe.UpperChaos.fresh_upper_of_rounding',
    'Grothe.UpperChaos.fresh_upper_concrete', 'Grothe.UpperChaos.fresh_upper_rounder',
}
REQUIRED |= UPPER_COMPARISON

def audit_policy(mode):
    """Return the existing required results and native allowlist for one mode."""
    policies = {
        "default": (REQUIRED, NATIVE),
        # Separate GrotheCaps target: scratch/AxiomsCaps.lean.
        "caps": ({"Grothe.LowerAnalytic.lower_bound_of_capsRest"}, NATIVE),
        # Generic response results must use no numerical native facts.
        "responses": (RESPONSE_GEOMETRY | JOINT_RESPONSE, set()),
        "response-geometry": (RESPONSE_GEOMETRY, set()),
        "haagerup-power": (POWER_HAAGERUP,
                           {"Grothe.HaagerupPower.check._native.native_decide.ax_1_1"}),
        "upper-comparison": (UPPER_COMPARISON,
                             {"Grothe.head_check._native.native_decide.ax_1_1",
                              "Grothe.Upper.comparison_check._native.native_decide.ax_1_1",
                              "Grothe.UpperChaos.phi_cover_check._native.native_decide.ax_1_1"}),
    }
    required, native = policies[mode]
    return set(required), set(native)


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
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    modes = parser.add_mutually_exclusive_group()
    for mode in ("caps", "responses", "response-geometry", "haagerup-power", "upper-comparison"):
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
