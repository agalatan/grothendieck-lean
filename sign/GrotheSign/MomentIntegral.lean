import GrotheSign.Basic
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Exact moments in the beta-preservation coefficient identity

The weight `z ^ (s - 1)` has moment `1 / (s + n)`. This identifies the rational finite sum
`shiftedSum` with the integral of its finite polynomial numerator, for every natural degree `r`.

Proof implementation: codex-1a87. Mathematical context: issues #362 and #363.
-/

set_option warningAsError true

namespace GrotheSign

open Finset MeasureTheory Set

/-- A nonnegative integer power can be multiplied into the integrable endpoint weight. -/
theorem intervalIntegrable_rpow_mul_natPow {s : ℝ} (hs : 0 < s) (n : ℕ) :
    IntervalIntegrable (fun z : ℝ ↦ z ^ (s - 1) * z ^ n) volume 0 1 := by
  exact (intervalIntegral.intervalIntegrable_rpow' (by linarith : -1 < s - 1)).mul_continuousOn
    (continuous_id.pow n).continuousOn

/-- The exact natural moments of the weight `z ^ (s - 1)`. -/
theorem integral_rpow_mul_natPow {s : ℝ} (hs : 0 < s) (n : ℕ) :
    (∫ z in (0 : ℝ)..1, z ^ (s - 1) * z ^ n) = 1 / (s + n) := by
  have hpos : 0 < s + (n : ℝ) := add_pos_of_pos_of_nonneg hs (Nat.cast_nonneg n)
  calc
    (∫ z in (0 : ℝ)..1, z ^ (s - 1) * z ^ n) =
        ∫ z in (0 : ℝ)..1, z ^ (s + (n : ℝ) - 1) := by
      apply intervalIntegral.integral_congr_Ioo_of_le zero_le_one
      intro z hz
      dsimp only
      rw [← Real.rpow_natCast, ← Real.rpow_add hz.1]
      congr 1
      ring
    _ = 1 / (s + n) := by
      rw [integral_rpow (Or.inl (by linarith : -1 < s + (n : ℝ) - 1))]
      simp only [sub_add_cancel, Real.one_rpow, Real.zero_rpow hpos.ne', sub_zero]

/-- Integrating a finite polynomial against the endpoint weight is a finite rational sum. -/
theorem integral_rpow_mul_finsetSum {ι : Type*} (t : Finset ι) (c : ι → ℝ)
    (n : ι → ℕ) {s : ℝ} (hs : 0 < s) :
    (∫ z in (0 : ℝ)..1, z ^ (s - 1) * ∑ a ∈ t, c a * z ^ n a) =
      ∑ a ∈ t, c a / (s + n a) := by
  calc
    (∫ z in (0 : ℝ)..1, z ^ (s - 1) * ∑ a ∈ t, c a * z ^ n a) =
        ∫ z in (0 : ℝ)..1, ∑ a ∈ t, c a * (z ^ (s - 1) * z ^ n a) := by
      apply intervalIntegral.integral_congr
      intro z _
      dsimp only
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro a _
      ring
    _ = ∑ a ∈ t, c a * (∫ z in (0 : ℝ)..1, z ^ (s - 1) * z ^ n a) := by
      rw [intervalIntegral.integral_finsetSum]
      · simp only [intervalIntegral.integral_const_mul]
      · intro a _
        exact (intervalIntegrable_rpow_mul_natPow hs (n a)).const_mul (c a)
    _ = ∑ a ∈ t, c a / (s + n a) := by
      simp only [integral_rpow_mul_natPow hs, div_eq_mul_inv, one_mul]

variable {ι : Type*}

/-- The shifted alternating coefficient is the integral of its finite polynomial numerator. -/
theorem shiftedSum_eq_integral (t : Finset ι) (j : ι → ℕ) {s : ℝ} (r : ℕ) (hs : 0 < s) :
    shiftedSum t j s r =
      ∫ z in (0 : ℝ)..1, z ^ (s - 1) *
        ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
          (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s) * z ^ labelSum j u := by
  exact (integral_rpow_mul_finsetSum t.powerset
    (fun u ↦ (-1 : ℝ) ^ (t.card - u.card) *
      (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s))
    (labelSum j) hs).symm

end GrotheSign
