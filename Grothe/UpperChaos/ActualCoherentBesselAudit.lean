import Grothe.UpperChaos.GateFockCoefficients
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for actual coherent source-space L2 and Bessel bounds

Agent-ID: codex-2ca4.

The Gaussian monomial family, positive-kernel domination, actual multiplier
scaling and gate-order coefficient bounds use only the three standard axioms.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.GaussianFockBessel.orthonormal_monomialVector8,
    ``Grothe.UpperChaos.GaussianFockBessel.summable_coefficient8_sq,
    ``Grothe.UpperChaos.GaussianFockBessel.finite_coefficient8_sq_le,
    ``Grothe.UpperChaos.GaussianFockBessel.tsum_coefficient8_sq_le,
    ``Grothe.UpperChaos.GaussianFockBessel.summable_matrix_coefficient_sq,
    ``Grothe.UpperChaos.GaussianFockBessel.tsum_matrix_coefficient_sq_le,
    ``Grothe.UpperChaos.BipartitePolynomialL2.source_coercive,
    ``Grothe.UpperChaos.BipartitePolynomialL2.norm_kernel_sq_le,
    ``Grothe.UpperChaos.BipartitePolynomialL2.memLp_finite_polynomial_kernel,
    ``Grothe.UpperChaos.BipartitePolynomialL2.memLp_tensor_polynomial,
    ``Grothe.UpperChaos.ScaledActualCoherentL2.map_liftedMoment,
    ``Grothe.UpperChaos.ScaledActualCoherentL2.eval_actualSourcePolynomial,
    ``Grothe.UpperChaos.ScaledActualCoherentL2.scaled_pair_coupling,
    ``Grothe.UpperChaos.ScaledActualCoherentL2.scaledTransform_eq,
    ``Grothe.UpperChaos.ScaledActualCoherentL2.memLp_scaledTransform,
    ``Grothe.UpperChaos.GateFockCoefficients.monomial8_gate_eq_coherent,
    ``Grothe.UpperChaos.GateFockCoefficients.tsum_gate_coefficient_sq_eq,
    ``Grothe.UpperChaos.GateFockCoefficients.summable_scaledTransform_coefficients,
    ``Grothe.UpperChaos.GateFockCoefficients.tsum_scaledTransform_coefficients_le]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
