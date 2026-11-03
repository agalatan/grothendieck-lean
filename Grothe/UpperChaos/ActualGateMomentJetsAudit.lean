import Grothe.UpperChaos.ActualProductionMomentCoefficients
import Grothe.UpperChaos.ActualCoherentHermiteJets
import Grothe.UpperChaos.ActualGateMatrixWeights
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for actual gate-ordered Gaussian moment jets

Agent-ID: codex-2ca4.

Finite source jets, production polynomial moments, physical Hermite factors
and exact source weights use only the standard Lean axioms. The final
normalized weighted matrix identification and numerical caps remain separate.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.gate_normalization_eq,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.integrable_actual_physical_jet,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.integral_actual_physical_jet,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.mixed_incoming_at_zero,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.mixed_outgoing_at_zero,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.mixed_outgoing_derivative,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.normalizedPhysicalJet_eq,
    ``Grothe.UpperChaos.ActualCoherentHermiteJets.pairJet_eq,
    ``Grothe.UpperChaos.ActualGateMatrixWeights.finite_weightedMatrixEntry_energy,
    ``Grothe.UpperChaos.ActualGateMatrixWeights.norm_weightedMatrixEntry_sq,
    ``Grothe.UpperChaos.ActualGateMatrixWeights.sourceWeight_nonneg,
    ``Grothe.UpperChaos.ActualGateMatrixWeights.sourceWeight_sq,
    ``Grothe.UpperChaos.ActualPairMomentCoefficients.integral_scaledPairMoment_eq_Hermite,
    ``Grothe.UpperChaos.ActualPairMomentCoefficients.integral_scaledPairMoment_eq_jet,
    ``Grothe.UpperChaos.ActualPairMomentCoefficients.memLp_scaledPairMoment,
    ``Grothe.UpperChaos.ActualPairMomentCoefficients.scaledPairMoment_eq_normalized,
    ``Grothe.UpperChaos.ActualPairMomentCoefficients.scaledPairMoment_eq_polynomial_kernel,
    ``Grothe.UpperChaos.ActualProductionMomentCoefficients.coefficient8_scaledTransform_eq_moment_sum,
    ``Grothe.UpperChaos.ActualProductionMomentCoefficients.coefficient8_scaledTransform_eq_physical,
    ``Grothe.UpperChaos.ActualProductionMomentCoefficients.scaledTransform_eq_moment_sum,
    ``Grothe.UpperChaos.ActualTensorMomentCoefficients.coefficient8_scaledTensorMoment,
    ``Grothe.UpperChaos.ActualTensorMomentCoefficients.coefficient8_scaledTensorMoment_eq_Hermite,
    ``Grothe.UpperChaos.ActualTensorMomentCoefficients.gateMatrixIndexEquiv_apply,
    ``Grothe.UpperChaos.ActualTensorMomentCoefficients.memLp_scaledTensorMoment,
    ``Grothe.UpperChaos.ActualTensorMomentCoefficients.tensorPhysicalMoment_eq_product,
    ``Grothe.UpperChaos.ActualTensorMomentCoefficients.tsum_gate_coefficient_sq_le,
    ``Grothe.UpperChaos.BipartiteCoefficientJets.innerJet_monomial_kernel,
    ``Grothe.UpperChaos.BipartiteCoefficientJets.integral_holEval_eq_outerJet,
    ``Grothe.UpperChaos.BipartiteCoefficientJets.integral_source_pair_eq_jet,
    ``Grothe.UpperChaos.BipartiteCoefficientJets.pairJet_monomial_kernel,
    ``Grothe.UpperChaos.HermiteFallingFactorial.H_eq_fallingFactorial,
    ``Grothe.UpperChaos.HermiteFallingFactorial.conj_ev_H_eq_fallingFactorial,
    ``Grothe.UpperChaos.HermiteFallingFactorial.ev_H_eq_fallingFactorial,
    ``Grothe.UpperChaos.HolomorphicCoefficientJets.integrable_polynomial_holomorphic_mixed,
    ``Grothe.UpperChaos.HolomorphicCoefficientJets.integral_holomorphic_mixed_eq_jet,
    ``Grothe.UpperChaos.HolomorphicCoefficientJets.integral_polynomial_holomorphic_eq_jet,
    ``Grothe.UpperChaos.HolomorphicCoefficientJets.iteratedDeriv_monomial_mul_zero,
    ``Grothe.UpperChaos.HolomorphicCoefficientJets.iteratedDeriv_polynomial_mul_zero,
    ``Grothe.UpperChaos.IndependentMomentJets.contDiff_momentValue_a,
    ``Grothe.UpperChaos.IndependentMomentJets.contDiff_momentValue_b,
    ``Grothe.UpperChaos.IndependentMomentJets.hasDerivAt_momentValue_a,
    ``Grothe.UpperChaos.IndependentMomentJets.hasDerivAt_momentValue_b,
    ``Grothe.UpperChaos.IndependentMomentJets.incoming_jet_eq_integral_hermite,
    ``Grothe.UpperChaos.IndependentMomentJets.incoming_jet_eq_sum,
    ``Grothe.UpperChaos.IndependentMomentJets.integrable_hermite_insertion,
    ``Grothe.UpperChaos.IndependentMomentJets.iteratedDeriv_momentValue_a,
    ``Grothe.UpperChaos.IndependentMomentJets.iteratedDeriv_momentValue_b,
    ``Grothe.UpperChaos.IndependentMomentJets.momentValue_swap,
    ``Grothe.UpperChaos.PairJetPolynomialOperations.contDiff_parameter_jet,
    ``Grothe.UpperChaos.PairJetPolynomialOperations.integral_source_pair_polynomial_eq_jet,
    ``Grothe.UpperChaos.PairJetPolynomialOperations.iteratedDeriv_comp_mul_left,
    ``Grothe.UpperChaos.PairJetPolynomialOperations.pairJet_finite_polynomial_kernel,
    ``Grothe.UpperChaos.PairJetPolynomialOperations.pairJet_finset_sum,
    ``Grothe.UpperChaos.PairJetPolynomialOperations.pairJet_scale,
    ``Grothe.UpperChaos.PhysicalGateJets.inner_yu_jet,
    ``Grothe.UpperChaos.PhysicalGateJets.integrable_physical_Hermite_product,
    ``Grothe.UpperChaos.PhysicalGateJets.outer_xv_finite_jet,
    ``Grothe.UpperChaos.PhysicalGateJets.pairJet_eq_integral_Hermite_product,
    ``Grothe.UpperChaos.PhysicalGateJets.pairJet_physicalCoherentMoment]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
