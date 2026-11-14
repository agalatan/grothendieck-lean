import GrotheSign

/-! Separate axiom report for the independent positivity target (issue #363). -/

#print axioms GrotheSign.alternatingSum_eval_eq_zero
#print axioms GrotheSign.resolventSum_eq_shiftedSum
#print axioms GrotheSign.numerator_identity
#print axioms GrotheSign.integral_positiveIntegrand_pos
#print axioms GrotheSign.resolventSum_eq_positiveIntegral
#print axioms GrotheSign.resolventCoefficient_eq_positiveIntegral
#print axioms GrotheSign.resolventCoefficient_pos

/-! Inverse-flow connection and beta preservation (issue #365). -/

#print axioms GrotheSign.Lagrange.coeff_subst_jacobian
#print axioms GrotheSign.Lagrange.lagrange_power
#print axioms GrotheSign.oddLift_inverseRadial_eq_inverseSeries
#print axioms GrotheSign.forward_coeff_eq_inverse_power
#print axioms GrotheSign.inverse_power_coeff_transport
#print axioms GrotheSign.inverse_flow_convolution
#print axioms GrotheSign.coefficient_weighted_split
#print axioms GrotheSign.generatorCoefficient_resolvent
#print axioms GrotheSign.hasSum_betaResolventTerm
#print axioms GrotheSign.betaGeneratorCoefficient_pos
#print axioms GrotheSign.hasDerivAt_coeff_inverseProfile_betaFamily
#print axioms GrotheSign.inverseFlowConvolution_eq_orderedFlow
#print axioms GrotheSign.hasDerivAt_inverseProfile_beta_equation
#print axioms GrotheSign.beta_preserves_inverse_nonneg
#print axioms GrotheSign.beta_preserves_inverseSeries_sign
#print axioms GrotheSign.beta_preserves_inverse_pos
#print axioms GrotheSign.beta_preserves_inverseSeries_strict_sign

/-! Hypergeometric specialization and finite Haagerup starting case (issue #367). -/

#print axioms GrotheSign.betaFamily_hypergeometricRadial
#print axioms GrotheSign.coeff_one_inverseProfile_hypergeometricRadial_two
#print axioms GrotheSign.coeff_hypergeometricRadial_succ
#print axioms GrotheSign.hypergeometric_dimension_inverseSeries_sign_of_base
#print axioms GrotheSign.hypergeometric_dimension_inverseSeries_strict_sign_of_base
#print axioms GrotheSign.coeff_inv_pow_recurrence
#print axioms GrotheSign.coeff_haagerup_reciprocal
#print axioms GrotheSign.haagerup_base_nonneg_first_eight
#print axioms GrotheSign.haagerup_base_second_eq_zero
#print axioms GrotheSign.beta_preserves_inverse_nonneg_up_to
#print axioms GrotheSign.beta_preserves_inverse_pos_up_to
#print axioms GrotheSign.hypergeometric_dimension_inverseSeries_sign_first_eight
#print axioms GrotheSign.hypergeometric_dimension_inverseSeries_strict_sign_first_eight
#print axioms GrotheSign.coeff_inverseSeries_C_mul
#print axioms GrotheSign.kernelScale_pos
#print axioms GrotheSign.kernelScale_two
#print axioms GrotheSign.kernel_inverseSeries_linear_pos
#print axioms GrotheSign.kernel_inverseSeries_even_eq_zero
#print axioms GrotheSign.kernel_inverseSeries_sign_of_base
#print axioms GrotheSign.kernel_inverseSeries_strict_sign_of_base
#print axioms GrotheSign.kernel_inverseSeries_sign_first_eight
#print axioms GrotheSign.kernel_inverseSeries_strict_sign_first_eight
#print axioms GrotheSign.haagerup_tail_ratio_lt_real
#print axioms GrotheSign.haagerup_exponential_factor_lt
#print axioms GrotheSign.haagerup_prefactor_gt
