import GrotheSign.Basic
import Mathlib.Analysis.SpecialFunctions.Integrability.Basic
import Mathlib.Tactic.Linarith

/-!
# Positivity of the beta-preservation integral

The finite sum in the coefficient identity of issue #363 is multiplied by the integrable weight
`z ^ (s - 1)`. Every summand is nonnegative on `[0, 1]`, and the empty-subset summand is strictly
positive on `(0, 1)` when all labels are positive. No relation between `r` and the number of labels
is needed here; the intended coefficient identity takes `r = t.card - 2`.

Proof implementation: codex-1a87. Mathematical context: issues #362 and #363.
-/

set_option warningAsError true

namespace GrotheSign

open Finset MeasureTheory Set

variable {ι : Type*} [DecidableEq ι]

/-- The nonnegative integral kernel in the finite beta-preservation coefficient identity. -/
noncomputable def positiveIntegrand (t : Finset ι) (j : ι → ℕ) (s : ℝ) (r : ℕ)
    (z : ℝ) : ℝ :=
  z ^ (s - 1) *
    ∑ u ∈ t.powerset.filter (fun u ↦ u.card ≤ r),
      (ascPochhammer ℝ (r - u.card)).eval (2 * s) / (r - u.card).factorial *
        z ^ labelSum j u * ∏ a ∈ t \ u, (1 - z ^ j a)

private theorem pochhammer_div_factorial_pos {s : ℝ} (hs : 0 < s) (n : ℕ) :
    0 < (ascPochhammer ℝ n).eval (2 * s) / n.factorial := by
  exact div_pos (ascPochhammer_pos n (2 * s) (by linarith))
    (Nat.cast_pos.mpr (Nat.factorial_pos n))

private theorem positiveTerm_nonneg (t u : Finset ι) (j : ι → ℕ) {s z : ℝ}
    (r : ℕ) (hs : 0 < s) (hz : z ∈ Icc (0 : ℝ) 1) :
    0 ≤ (ascPochhammer ℝ (r - u.card)).eval (2 * s) / (r - u.card).factorial *
      z ^ labelSum j u * ∏ a ∈ t \ u, (1 - z ^ j a) := by
  refine mul_nonneg (mul_nonneg (pochhammer_div_factorial_pos hs _).le
    (pow_nonneg hz.1 _)) (Finset.prod_nonneg ?_)
  intro a _
  exact sub_nonneg.mpr (pow_le_one₀ hz.1 hz.2)

/-- Nonnegativity on the closed interval does not require the labels to be positive. -/
theorem positiveIntegrand_nonneg (t : Finset ι) (j : ι → ℕ) {s z : ℝ} (r : ℕ)
    (hs : 0 < s) (hz : z ∈ Icc (0 : ℝ) 1) :
    0 ≤ positiveIntegrand t j s r z := by
  unfold positiveIntegrand
  refine mul_nonneg (Real.rpow_nonneg hz.1 _) (Finset.sum_nonneg ?_)
  intro u _
  exact positiveTerm_nonneg t u j r hs hz

/-- The empty-subset term is strictly positive at every interior point. -/
theorem positiveIntegrand_pos (t : Finset ι) (j : ι → ℕ) {s z : ℝ} (r : ℕ)
    (hs : 0 < s) (hj : ∀ a ∈ t, 0 < j a) (hz : z ∈ Ioo (0 : ℝ) 1) :
    0 < positiveIntegrand t j s r z := by
  unfold positiveIntegrand
  refine mul_pos (Real.rpow_pos_of_pos hz.1 _) (Finset.sum_pos' ?_ ?_)
  · intro u _
    exact positiveTerm_nonneg t u j r hs ⟨hz.1.le, hz.2.le⟩
  · refine ⟨∅, by simp, ?_⟩
    simp only [Finset.card_empty, Nat.sub_zero, labelSum, Finset.sum_empty, pow_zero,
      mul_one, Finset.sdiff_empty]
    refine mul_pos (pochhammer_div_factorial_pos hs r) (Finset.prod_pos ?_)
    intro a ha
    exact sub_pos.mpr (pow_lt_one₀ hz.1.le hz.2 (hj a ha).ne')

/-- The polynomial factor is continuous, so the only endpoint singularity is the integrable
weight `z ^ (s - 1)`. -/
theorem intervalIntegrable_positiveIntegrand (t : Finset ι) (j : ι → ℕ) {s : ℝ}
    (r : ℕ) (hs : 0 < s) :
    IntervalIntegrable (positiveIntegrand t j s r) volume 0 1 := by
  unfold positiveIntegrand
  refine (intervalIntegral.intervalIntegrable_rpow' (by linarith : -1 < s - 1)).mul_continuousOn
    (Continuous.continuousOn ?_)
  apply continuous_finsetSum
  intro u _
  refine ((continuous_const.mul (continuous_id.pow _)).mul ?_)
  apply continuous_finsetProd
  intro a _
  exact continuous_const.sub (continuous_id.pow _)

/-- The beta-preservation kernel has a finite, strictly positive integral. -/
theorem integral_positiveIntegrand_pos (t : Finset ι) (j : ι → ℕ) {s : ℝ} (r : ℕ)
    (hs : 0 < s) (hj : ∀ a ∈ t, 0 < j a) :
    0 < ∫ z in (0 : ℝ)..1, positiveIntegrand t j s r z := by
  exact intervalIntegral.intervalIntegral_pos_of_pos_on
    (intervalIntegrable_positiveIntegrand t j r hs)
    (fun z hz ↦ positiveIntegrand_pos t j r hs hj hz) zero_lt_one

end GrotheSign
