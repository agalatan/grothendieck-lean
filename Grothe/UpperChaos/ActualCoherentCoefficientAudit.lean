import Grothe.UpperChaos.ActualMatrixFiniteComparison
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for finite actual coherent coefficient evaluation

Agent-ID: codex-2ca4.

Finite Hermite blocks, source-space coefficient extraction, physical Wick
moments and the ground-entry identification use only the standard axioms.
No all-index Hermite coefficient identity or numerical cap is assumed.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.integrable_polynomial_multiplier,
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.matrixEntry_zero,
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.integrable_matrixEntry,
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.matrixEntry_eq_unnormalized,
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.finiteTransform_eq_sum,
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.memLp_finiteTransform,
    ``Grothe.UpperChaos.ActualTaylorFiniteCoefficients.coefficient8_finiteTransform,
    ``Grothe.UpperChaos.ActualSourceCoefficientExtraction.momentValue_one_zero,
    ``Grothe.UpperChaos.ActualSourceCoefficientExtraction.integral_holomorphic_mixed,
    ``Grothe.UpperChaos.ActualSourceCoefficientExtraction.integral_source_pair,
    ``Grothe.UpperChaos.ActualSourceCoefficientExtraction.coefficient8_tensor_polynomial,
    ``Grothe.UpperChaos.ActualSourceCoefficientExtraction.coefficient8_scaledTransform,
    ``Grothe.UpperChaos.ActualMatrixFiniteComparison.momentValue_zero_sources,
    ``Grothe.UpperChaos.ActualMatrixFiniteComparison.integral_physical_polynomial,
    ``Grothe.UpperChaos.ActualMatrixFiniteComparison.matrixEntry_eq_finite_moments,
    ``Grothe.UpperChaos.ActualMatrixFiniteComparison.gatePairValue_ground,
    ``Grothe.UpperChaos.ActualMatrixFiniteComparison.coefficient8_tensor_polynomial_ground,
    ``Grothe.UpperChaos.ActualMatrixFiniteComparison.coefficient8_scaledTransform_ground_matrixEntry]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
