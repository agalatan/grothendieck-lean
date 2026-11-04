import Grothe.UpperChaos.OriginalRow227SelectedFields
import Grothe.UpperChaos.ConditionalKeyedErrorSum
import Grothe.UpperChaos.ConditionalSavedGrid
import Grothe.UpperChaos.ConditionalSelectedRecordBinding

/-!
Specialize the keyed integer-sum bridge
to all original selected records and the two actual generated totals.
These are exact budgets for the saved certificate fields. Actual Gaussian
enclosure and original payload bindings are still required by the final row
theorem; neither follows from the integer sums alone.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalRow227SelectedBudgets

open OriginalRow227SelectedError OriginalRow227SelectedError.Data
open OriginalRow227SelectedFields ConditionalNodeIndices

noncomputable section

/-- The complete selected radius sum, retaining the exact original key set.
The numerical guard is the balanced sum certificate, not a new large check. -/
theorem normalized_radius_budget :
    (∑ p ∈ modes, radiusQ p ^ 2) ≤ ((157 : ℚ) / 10 ^ 40) ^ 2 := by
  have h := ConditionalKeyedErrorSum.sum_sq_div_le_of_keyed_total
    entries entryKey modes entries_keys_nodup entries_keys_eq_modes
    radiusNumerator (fun e => e.radius) radiusNumerator_at_entry
    normalizedTotal (2 ^ 768) 157 (10 ^ 40)
    (by positivity) (by positivity) normalized_sum
    (by
      simpa only [Nat.cast_pow, Nat.cast_ofNat, ← pow_mul, Nat.reduceMul]
        using normalized_budget_checked)
  simpa only [radiusQ, Nat.cast_pow, Nat.cast_ofNat] using h

/-- The exact full saved-center residual budget on the 1792-bit product grid.
Its semantic equality to the production decoder is a separate binding step. -/
theorem saved_residual_budget :
    (∑ p ∈ modes, ((residualNumerator p : ℚ) / (2 : ℚ) ^ 1792) ^ 2) ≤
      ((13759969 : ℚ) / 10 ^ 24) ^ 2 := by
  have h := ConditionalKeyedErrorSum.sum_sq_div_le_of_keyed_total
    entries entryKey modes entries_keys_nodup entries_keys_eq_modes
    residualNumerator OriginalRow227ErrorBoundary.errorNumerator
    residualNumerator_at_entry savedTotal (2 ^ 1792) 13759969 (10 ^ 24)
    (by positivity) (by positivity) saved_sum
    (by
      simpa only [Nat.cast_pow, Nat.cast_ofNat, ← pow_mul, Nat.reduceMul]
        using saved_budget_checked)
  simpa only [Nat.cast_pow, Nat.cast_ofNat] using h

/-- Exact exponent range of every selected saved word, extracted from the
bounded representation checks without reducing the complete record list. -/
theorem exponent_le_of_entry (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (he : e ∈ entries) : Q0SourceExceptionCenters.exponent e.word ≤ 1023 := by
  have hv : e.d ≤ 250 ∧ e.c ≤ e.d + 1 ∧
      e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
      e.word < 2 ^ 64 ∧ 1 ≤ Q0SourceExceptionCenters.exponent e.word ∧
      Q0SourceExceptionCenters.exponent e.word ≤ 1023 ∧ 0 ≤ e.radius :=
    of_decide_eq_true ((List.all_eq_true.mp entries_valid) e he)
  exact hv.2.2.2.2.2.1

/-- Once every concrete word lookup is bound, the exact selected residual is
the difference from the actual production decoder, on the original grid. -/
theorem saved_identity_of_payload
    (hPayload : ConditionalSelectedRecordBinding.AllPayloadBound entries)
    (p : ℕ × ℕ) (hp : p ∈ modes) :
    ConditionalSourceRow227Scalar.shat * centerQ p -
      Q0SourceSavedLinearModel.storedScalar OriginalRow227Payload.row p =
        (residualNumerator p : ℚ) / (2 : ℚ) ^ 1792 := by
  let e := selectedEntry p hp
  have he : e ∈ entries := selectedEntry_mem p hp
  have hk : entryKey e = p := selectedEntry_key p hp
  have hb := hPayload e he
  rw [← hk, centerQ_at_entry e he, residualNumerator_at_entry e he]
  rw [ConditionalSelectedRecordBinding.storedScalar_eq e hb.1 hb.2]
  exact (ConditionalSavedGrid.errorNumerator_div_pow e
    (exponent_le_of_entry e he)).symm

/-- The selected complex saved-center estimate uses the complete original
row decoder. Only concrete successful payload bindings remain to discharge;
there is no numerical-accuracy premise in this implication. -/
theorem saved_vector_budget_of_payload
    (hPayload : ConditionalSelectedRecordBinding.AllPayloadBound entries) :
    (∑ p ∈ modes,
      ‖(ConditionalSourceRow227Scalar.shat : ℂ) * (centerQ p : ℂ) -
        Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row p‖ ^ 2) ≤
      ((13759969 : ℝ) / 10 ^ 24) ^ 2 := by
  rw [ConditionalCheckpointVector.sum_saved_row_error_sq_eq_rat]
  have hr : (∑ p ∈ modes,
      (ConditionalSourceRow227Scalar.shat * centerQ p -
        Q0SourceSavedLinearModel.storedScalar OriginalRow227Payload.row p) ^ 2) ≤
      ((13759969 : ℚ) / 10 ^ 24) ^ 2 := by
    calc
      _ = ∑ p ∈ modes, ((residualNumerator p : ℚ) / (2 : ℚ) ^ 1792) ^ 2 := by
        apply Finset.sum_congr rfl
        intro p hp
        rw [saved_identity_of_payload hPayload p hp]
      _ ≤ _ := saved_residual_budget
  simpa only [Rat.cast_pow, Rat.cast_div, Rat.cast_ofNat] using
    (Rat.cast_le (K := ℝ)).mpr hr

end
end Grothe.UpperChaos.OriginalRow227SelectedBudgets

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227SelectedBudgets.normalized_radius_budget,
      ``Grothe.UpperChaos.OriginalRow227SelectedBudgets.saved_residual_budget,
      ``Grothe.UpperChaos.OriginalRow227SelectedBudgets.exponent_le_of_entry,
      ``Grothe.UpperChaos.OriginalRow227SelectedBudgets.saved_identity_of_payload,
      ``Grothe.UpperChaos.OriginalRow227SelectedBudgets.saved_vector_budget_of_payload] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"unexpected axiom {dependency}"
