import Grothe.UpperChaos.AdaptiveRectangleEnclosure
import Grothe.UpperChaos.Q0SourceSavedLinearModel
import LeanCert.Core.IntervalDyadic
import Mathlib.Data.Rat.BigOperators

/-!
# Exact finite checkpoint budgets for the actual coefficient vector

Finite-vector interfaces for the actual row227 selected-vector check.

Actual complex coefficients are first proved real and enclosed by the signed
recurrence certificate. Rational endpoint guards and one squared sum then
bound exactly the selected vector. A separate rational identity compares
the normalized centers, multiplied by the one common scalar center, with the
existing decoded source words. No cutoff-at-most-two validity premise occurs.

This file does not instantiate the recurrence transcript, certify its finite
sums, or identify an arbitrary payload row with original row227. The common
scalar error is charged separately by ConditionalSeedVectorError, once for
the whole vector. Physical transport and the final endpoint remain open.

Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators
open LeanCert.Core

namespace Grothe.UpperChaos.ConditionalCheckpointVector

noncomputable section

/-- Reality is necessary: an interval for the real part alone does not bound
the complex error. Both endpoints remain exact rational numbers. -/
theorem norm_sub_rat_le_of_enclosure {z : ℂ} {I : IntervalDyadic}
    (hz : z.re ∈ I) (him : z.im = 0) (q r : ℚ)
    (hlo : q - r ≤ I.lo.toRat) (hhi : I.hi.toRat ≤ q + r) :
    ‖z - (q : ℂ)‖ ≤ (r : ℝ) := by
  have h := AdaptiveRectanglePartition.abs_sub_le_of_mem
    (IntervalDyadic.mem_toIntervalRat.mp hz) q r hlo hhi
  have heq : z - (q : ℂ) = (((z.re - (q : ℝ)) : ℝ) : ℂ) := by
    apply Complex.ext <;> simp [him]
  rw [heq, Complex.norm_real, Real.norm_eq_abs]
  exact h

/-- The sum is over the supplied finite set itself; no prefix replacement or
mode-count estimate occurs. The final vector consumer separately requires
the nonnegative choice of e, since this theorem concerns its square. -/
theorem sum_norm_sub_rat_sq_le_of_enclosures {ι : Type*}
    (S : Finset ι) (z : ι → ℂ) (I : ι → IntervalDyadic)
    (q r : ι → ℚ) (e : ℚ)
    (hmem : ∀ i ∈ S, (z i).re ∈ I i)
    (him : ∀ i ∈ S, (z i).im = 0)
    (hlo : ∀ i ∈ S, q i - r i ≤ (I i).lo.toRat)
    (hhi : ∀ i ∈ S, (I i).hi.toRat ≤ q i + r i)
    (hbudget : (∑ i ∈ S, r i ^ 2) ≤ e ^ 2) :
    (∑ i ∈ S, ‖z i - (q i : ℂ)‖ ^ 2) ≤ (e : ℝ) ^ 2 := by
  have hpoint : ∀ i ∈ S, ‖z i - (q i : ℂ)‖ ≤ (r i : ℝ) := by
    intro i hi
    exact norm_sub_rat_le_of_enclosure (hmem i hi) (him i hi)
      (q i) (r i) (hlo i hi) (hhi i hi)
  calc
    _ ≤ ∑ i ∈ S, (r i : ℝ) ^ 2 := by
      apply Finset.sum_le_sum
      intro i hi
      exact (sq_le_sq₀ (norm_nonneg _) ((norm_nonneg _).trans (hpoint i hi))).2
        (hpoint i hi)
    _ ≤ (e : ℝ) ^ 2 := by
      simpa only [Rat.cast_sum, Rat.cast_pow] using
        (Rat.cast_le (K := ℝ)).mpr hbudget

/-- Exact rational comparison of the scaled centers; the scalar center is
common to all entries and its own uncertainty is not inserted here. -/
theorem sum_scaled_center_error_sq_eq_rat {ι : Type*}
    (S : Finset ι) (u v : ι → ℚ) (shat : ℚ) :
    (∑ i ∈ S, ‖(shat : ℂ) * (u i : ℂ) - (v i : ℂ)‖ ^ 2) =
      ((∑ i ∈ S, (shat * u i - v i) ^ 2 : ℚ) : ℝ) := by
  symm
  rw [Rat.cast_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [Rat.cast_pow, ← Rat.cast_mul (α := ℂ), ← Rat.cast_sub (α := ℂ),
    Complex.norm_ratCast, sq_abs]

/-- A closed rational error-sum check supplies the saved-center squared
budget without introducing any approximate floating-point operation. -/
theorem sum_scaled_center_error_sq_le {ι : Type*}
    (S : Finset ι) (u v : ι → ℚ) (shat e : ℚ)
    (hbudget : (∑ i ∈ S, (shat * u i - v i) ^ 2) ≤ e ^ 2) :
    (∑ i ∈ S, ‖(shat : ℂ) * (u i : ℂ) - (v i : ℂ)‖ ^ 2) ≤ (e : ℝ) ^ 2 := by
  rw [sum_scaled_center_error_sq_eq_rat]
  simpa only [Rat.cast_pow] using (Rat.cast_le (K := ℝ)).mpr hbudget

/-- Reuse the production decoder at arbitrary storage cutoffs. Metadata and
original-byte agreement must still bind the supplied row at the call site. -/
theorem sum_saved_row_error_sq_eq_rat
    (row : Q0SourceExceptionCenters.Row) (S : Finset (ℕ × ℕ))
    (u : ℕ × ℕ → ℚ) (shat : ℚ) :
    (∑ i ∈ S, ‖(shat : ℂ) * (u i : ℂ) -
      Q0SourceExceptionCenters.storedModeCenter row i‖ ^ 2) =
      ((∑ i ∈ S, (shat * u i -
        Q0SourceSavedLinearModel.storedScalar row i) ^ 2 : ℚ) : ℝ) := by
  simp_rw [← Q0SourceSavedLinearModel.storedScalar_cast row]
  exact sum_scaled_center_error_sq_eq_rat S u
    (Q0SourceSavedLinearModel.storedScalar row) shat

end
end Grothe.UpperChaos.ConditionalCheckpointVector

/-- info: 'Grothe.UpperChaos.ConditionalCheckpointVector.sum_norm_sub_rat_sq_le_of_enclosures' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalCheckpointVector.sum_norm_sub_rat_sq_le_of_enclosures

/-- info: 'Grothe.UpperChaos.ConditionalCheckpointVector.sum_scaled_center_error_sq_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalCheckpointVector.sum_scaled_center_error_sq_le

/-- info: 'Grothe.UpperChaos.ConditionalCheckpointVector.sum_saved_row_error_sq_eq_rat' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalCheckpointVector.sum_saved_row_error_sq_eq_rat
