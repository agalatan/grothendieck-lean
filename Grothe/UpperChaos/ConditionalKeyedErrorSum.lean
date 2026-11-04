import Grothe.UpperChaos.ConditionalIntegerErrorSum
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
Exact selected-error sum transport for task #293.
The exact list totals become vector budgets only after unique key coverage
and every field binding have been proved. This bridge works with symbolic
lists and finite sets, so its proof never normalizes the full original table.
No default lookup, coefficient-accuracy premise, or floating computation is used.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.ConditionalKeyedErrorSum

/-- A unique keyed record list is an exact enumeration of the supplied set.
The last hypothesis is essential: key coverage alone does not identify fields. -/
theorem sum_eq_map {E ι α : Type*} [DecidableEq ι] [AddCommMonoid α]
    (es : List E) (key : E → ι) (S : Finset ι)
    (hkeys : (es.map key).Nodup) (hcover : (es.map key).toFinset = S)
    (f : ι → α) (g : E → α) (hfield : ∀ e ∈ es, f (key e) = g e) :
    (∑ i ∈ S, f i) = (es.map g).sum := by
  rw [← hcover, List.sum_toFinset f hkeys, List.map_map]
  exact congrArg List.sum (List.map_congr_left hfield)

/-- Move a checked integer total to the exact rational selected sum.
Both the list field and its function on the selected set are explicitly bound. -/
theorem sum_sq_div_le_of_keyed_total {E ι : Type*} [DecidableEq ι]
    (es : List E) (key : E → ι) (S : Finset ι)
    (hkeys : (es.map key).Nodup) (hcover : (es.map key).toFinset = S)
    (n : ι → ℤ) (field : E → ℤ) (hfield : ∀ e ∈ es, n (key e) = field e)
    (total : ℤ) (D N B : ℕ) (hD : 0 < D) (hB : 0 < B)
    (htotal : (es.map fun e => field e ^ 2).sum = total)
    (hcheck : total * (B : ℤ) ^ 2 ≤ (N : ℤ) ^ 2 * (D : ℤ) ^ 2) :
    (∑ i ∈ S, ((n i : ℚ) / (D : ℚ)) ^ 2) ≤ ((N : ℚ) / (B : ℚ)) ^ 2 := by
  apply ConditionalIntegerErrorSum.sum_sq_div_le_of_total S n total D N B hD hB
  · exact (sum_eq_map es key S hkeys hcover (fun i => n i ^ 2)
      (fun e => field e ^ 2)
      (fun e he => congrArg (fun z : ℤ => z ^ 2) (hfield e he))).trans htotal
  · exact hcheck

noncomputable section

/-- The normalized complex error includes the imaginary-part obligation.
Signed interval enclosures and the keyed integer radius sum give the complete
selected squared norm; the scalar uncertainty is not charged here. -/
theorem normalized_vector_le {E ι : Type*} [DecidableEq ι]
    (es : List E) (key : E → ι) (S : Finset ι)
    (hkeys : (es.map key).Nodup) (hcover : (es.map key).toFinset = S)
    (z : ι → ℂ) (I : ι → LeanCert.Core.IntervalDyadic)
    (center radius : ι → ℤ) (radiusField : E → ℤ)
    (hfield : ∀ e ∈ es, radius (key e) = radiusField e)
    (D N B : ℕ) (hD : 0 < D) (hB : 0 < B)
    (hmem : ∀ i ∈ S, (z i).re ∈ I i)
    (him : ∀ i ∈ S, (z i).im = 0)
    (hlo : ∀ i ∈ S, (center i : ℚ) / D - (radius i : ℚ) / D ≤ (I i).lo.toRat)
    (hhi : ∀ i ∈ S, (I i).hi.toRat ≤ (center i : ℚ) / D + (radius i : ℚ) / D)
    (total : ℤ) (htotal : (es.map fun e => radiusField e ^ 2).sum = total)
    (hcheck : total * (B : ℤ) ^ 2 ≤ (N : ℤ) ^ 2 * (D : ℤ) ^ 2) :
    (∑ i ∈ S, ‖z i - (((center i : ℚ) / D : ℚ) : ℂ)‖ ^ 2) ≤
      (((N : ℚ) / B : ℚ) : ℝ) ^ 2 := by
  apply ConditionalCheckpointVector.sum_norm_sub_rat_sq_le_of_enclosures
    S z I (fun i => (center i : ℚ) / D) (fun i => (radius i : ℚ) / D)
    ((N : ℚ) / B) hmem him hlo hhi
  exact sum_sq_div_le_of_keyed_total es key S hkeys hcover radius radiusField
    hfield total D N B hD hB htotal hcheck

/-- The saved comparison is an exact rational identity on the product grid.
The decoded source value is supplied explicitly and must equal that identity
at every selected key. No historical decimal is used as an enclosure. -/
theorem saved_vector_le {E ι : Type*} [DecidableEq ι]
    (es : List E) (key : E → ι) (S : Finset ι)
    (hkeys : (es.map key).Nodup) (hcover : (es.map key).toFinset = S)
    (center saved : ι → ℚ) (scalar : ℚ)
    (error : ι → ℤ) (errorField : E → ℤ)
    (hfield : ∀ e ∈ es, error (key e) = errorField e)
    (D N B : ℕ) (hD : 0 < D) (hB : 0 < B)
    (hdecode : ∀ i ∈ S, scalar * center i - saved i = (error i : ℚ) / D)
    (total : ℤ) (htotal : (es.map fun e => errorField e ^ 2).sum = total)
    (hcheck : total * (B : ℤ) ^ 2 ≤ (N : ℤ) ^ 2 * (D : ℤ) ^ 2) :
    (∑ i ∈ S, ‖(scalar : ℂ) * (center i : ℂ) - (saved i : ℂ)‖ ^ 2) ≤
      (((N : ℚ) / B : ℚ) : ℝ) ^ 2 := by
  apply ConditionalCheckpointVector.sum_scaled_center_error_sq_le
    S center saved scalar ((N : ℚ) / B)
  calc
    _ = ∑ i ∈ S, ((error i : ℚ) / D) ^ 2 := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [hdecode i hi]
    _ ≤ _ := sum_sq_div_le_of_keyed_total es key S hkeys hcover error errorField
      hfield total D N B hD hB htotal hcheck

end
end Grothe.UpperChaos.ConditionalKeyedErrorSum

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.ConditionalKeyedErrorSum.sum_eq_map,
      ``Grothe.UpperChaos.ConditionalKeyedErrorSum.sum_sq_div_le_of_keyed_total,
      ``Grothe.UpperChaos.ConditionalKeyedErrorSum.normalized_vector_le,
      ``Grothe.UpperChaos.ConditionalKeyedErrorSum.saved_vector_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"unexpected axiom {dependency}"
