import Grothe.Lower.PrimalAudit
import Grothe.Lower.SteinFusion
import Grothe.LowerAnalytic.QuadraticFeatures
import Grothe.LowerAnalytic.ReplicaState
import Grothe.LowerAnalytic.ResponseGram
import Grothe.LowerAnalytic.TwoDisc
import Grothe.Upper.KernelScreen
import Grothe.Upper.SpectralScreen
import Grothe.Upper.CubicPhaseScreen

#print axioms Grothe.Lower.PrimalAudit.primal_le_dual
#print axioms Grothe.Lower.PrimalAudit.no_dual_below_primal
#print axioms Grothe.LowerAnalytic.ResponseGram.gram_qform
#print axioms Grothe.LowerAnalytic.ResponseGram.projection_gram_interval
#print axioms Grothe.LowerAnalytic.ResponseGram.nested_projection_gram_interval
#print axioms Grothe.LowerAnalytic.ResponseGram.reflection_cross_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.orthogonal_projection_cross_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.factored_price_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.moment_support_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.completion_screen
#print axioms Grothe.LowerAnalytic.ResponseGram.no_completion
#print axioms Grothe.LowerAnalytic.ResponseGram.priced_nearmax_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.weighted_alignment
#print axioms Grothe.LowerAnalytic.ResponseGram.regularized_alignment_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.inner_perturbation_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.disk_quadratic_bound
#print axioms Grothe.LowerAnalytic.ResponseGram.disk_quadratic_attained
#print axioms Grothe.LowerAnalytic.ResponseGram.two_disc_price_bound
#print axioms Grothe.LowerAnalytic.TwoDisc.slack_factorization
#print axioms Grothe.LowerAnalytic.TwoDisc.support_of_factor
#print axioms Grothe.LowerAnalytic.TwoDisc.bilinear_support
#print axioms Grothe.LowerAnalytic.TwoDisc.independent_interior_support
#print axioms Grothe.LowerAnalytic.TwoDisc.coupled_interior_support
#print axioms Grothe.LowerAnalytic.TwoDisc.complex_linear_support
#print axioms Grothe.LowerAnalytic.TwoDisc.sharp_examples_attained
#print axioms Grothe.LowerAnalytic.QuadraticFeatures.quadratic_mul_linear
#print axioms Grothe.LowerAnalytic.QuadraticFeatures.probe_projection_closure
#print axioms Grothe.LowerAnalytic.QuadraticFeatures.quadratic_remainder_budget
#print axioms Grothe.LowerAnalytic.QuadraticFeatures.affine_quadratic_remainder_budget
#print axioms Grothe.Lower.SteinFusion.perspective_variance
#print axioms Grothe.Lower.SteinFusion.perspective_fusion_le
#print axioms Grothe.Lower.SteinFusion.unit_fusion_identity
#print axioms Grothe.Lower.SteinFusion.specCellG_unit_fusion
#print axioms Grothe.Lower.SteinFusion.unit_fusion_le
#print axioms Grothe.Lower.SteinFusion.common_kernel_projection
#print axioms Grothe.LowerAnalytic.ReplicaState.firstCoeff_normSq
#print axioms Grothe.LowerAnalytic.ReplicaState.firstCoeff_cross
#print axioms Grothe.LowerAnalytic.ReplicaState.residual_nonneg
#print axioms Grothe.LowerAnalytic.ReplicaState.variance_identity
#print axioms Grothe.LowerAnalytic.ReplicaState.sqrt_variance_identity
#print axioms Grothe.LowerAnalytic.ReplicaState.scalar_surrogate_gap
#print axioms Grothe.LowerAnalytic.ReplicaState.scalar_surrogate_strict
#print axioms Grothe.Upper.KernelScreen.weighted_tail
#print axioms Grothe.Upper.KernelScreen.full_score_upper
#print axioms Grothe.Upper.KernelScreen.priced_score_upper
#print axioms Grothe.Upper.KernelScreen.all_level_price_bound
#print axioms Grothe.Upper.SpectralScreen.all_level_price_of_front_tail
#print axioms Grothe.Upper.SpectralScreen.common_tail_price
#print axioms Grothe.Upper.SpectralScreen.full_score_upper
#print axioms Grothe.Upper.SpectralScreen.affine_error_bound
#print axioms Grothe.Upper.SpectralScreen.finite_mixture_score_bound
#print axioms Grothe.Upper.CubicPhaseScreen.phase_conditions_unit
#print axioms Grothe.Upper.CubicPhaseScreen.phase_conditions
#print axioms Grothe.Upper.CubicPhaseScreen.real_polynomial_cap
#print axioms Grothe.Upper.CubicPhaseScreen.trigonometric_square_bound
#print axioms Grothe.Upper.CubicPhaseScreen.axis_nonneg
#print axioms Grothe.Upper.CubicPhaseScreen.axis_le_real_polynomial
#print axioms Grothe.Upper.CubicPhaseScreen.normalized_complex_cap
#print axioms Grothe.Upper.CubicPhaseScreen.complex_score_cap
#print axioms Grothe.Upper.CubicPhaseScreen.score_le_separator
#print axioms Grothe.Upper.CubicPhaseScreen.full_score_cap_of_low_identity
