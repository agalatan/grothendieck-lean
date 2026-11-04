import Grothe.UpperChaos.ConditionalSeedVectorError
import Grothe.UpperChaos.ConditionalSourceRow227Scalar
import Grothe.UpperChaos.OriginalRow227Payload
import Grothe.UpperChaos.ConditionalNodeIndices

/-!
Assembly of the scalar, normalized-vector and saved-vector budgets.
The two remaining premises are the exact finite sums that the complete numeric
certificate must discharge. No endpoint or complete row theorem is asserted.
The accepted common scalar is charged once for the whole selected vector.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalRow227VectorAssembly

noncomputable section

open ConditionalSeedNormalization ConditionalNodeIndices
open ConditionalSourceRow227Scalar OriginalMomentSeedData

/-- The fixed candidate budgets leave a strictly positive reserve below the
proposed row radius. This arithmetic contains no coefficient-accuracy claim. -/
theorem scalar_and_vector_budget {t : ℝ} (ht : |t| ≤ 1) :
    (784 : ℝ) / 10 ^ 24 / (49 / 50) + |t| * (157 / 10 ^ 40) +
      13759969 / 10 ^ 24 < 14 / 10 ^ 18 := by
  have hterm : |t| * (157 / 10 ^ 40) ≤ (157 : ℝ) / 10 ^ 40 := by
    simpa only [one_mul] using
      mul_le_mul_of_nonneg_right ht (by positivity : (0 : ℝ) ≤ 157 / 10 ^ 40)
  have hbound : (784 : ℝ) / 10 ^ 24 / (49 / 50) + |t| * (157 / 10 ^ 40) +
      13759969 / 10 ^ 24 ≤
        784 / 10 ^ 24 / (49 / 50) + 157 / 10 ^ 40 + 13759969 / 10 ^ 24 :=
    add_le_add (add_le_add le_rfl hterm) le_rfl
  apply hbound.trans_lt
  norm_num

/-- Once the two complete selected sums have been certified, the already
proved actual scalar closes the original row's midpoint error contract.
The saved vector is the production decoder of the full original payload. -/
theorem midpoint_saved_error_of_two_checks (u : ℕ × ℕ → ℂ)
    (hNormalized : (∑ i ∈ modes,
      ‖normalizedCoefficient (midpointQ : ℝ) i - u i‖ ^ 2) ≤
        ((157 : ℝ) / 10 ^ 40) ^ 2)
    (hSaved : (∑ i ∈ modes,
      ‖(shat : ℂ) * u i -
        Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row i‖ ^ 2) ≤
        ((13759969 : ℝ) / 10 ^ 24) ^ 2) :
    (∑ i ∈ modes,
      ‖F0ConditionalEvaluator.canonicalCoefficient (midpointQ : ℝ) i -
        Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row i‖ ^ 2) ≤
        ((14 : ℝ) / 10 ^ 18) ^ 2 := by
  have hAq : (0 : ℚ) < midpointQ := by decide +kernel
  have hA : (0 : ℝ) < (midpointQ : ℝ) := (Rat.cast_pos (K := ℝ)).mpr hAq
  have hLower : (49 : ℝ) / 50 ≤ seedScalar (midpointQ : ℝ) := by
    simpa only [midpointQ, Rat.cast_div, Rat.cast_intCast] using seedScalar_gt.le
  have hScalar : |seedScalar (midpointQ : ℝ) - (shat : ℝ)| ≤
      (784 : ℝ) / 10 ^ 24 := by
    simpa only [midpointQ, Rat.cast_div, Rat.cast_intCast] using seedScalar_sub_shat_abs_le
  have hshatq : |shat| ≤ 1 := by decide +kernel
  have hshat : |(shat : ℝ)| ≤ 1 := by
    simpa only [Rat.cast_abs, Rat.cast_one] using (Rat.cast_le (K := ℝ)).mpr hshatq
  apply ConditionalSeedVectorError.sum_sq_actual_saved_error_le hA modes u
    (Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row)
    (sLo := 49 / 50) (shat := (shat : ℝ)) (eS := 784 / 10 ^ 24)
    (eU := 157 / 10 ^ 40) (eSaved := 13759969 / 10 ^ 24)
    (by positivity) hLower hScalar (by positivity) hNormalized (by positivity)
  · simpa only [Complex.ofReal_ratCast] using hSaved
  · exact (scalar_and_vector_budget hshat).le

end
end Grothe.UpperChaos.OriginalRow227VectorAssembly

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227VectorAssembly.scalar_and_vector_budget,
      ``Grothe.UpperChaos.OriginalRow227VectorAssembly.midpoint_saved_error_of_two_checks] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"unexpected axiom {dependency}"
