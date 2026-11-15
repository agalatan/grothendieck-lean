-- Grothe/Upper/PolynomialHeadTail.lean
import Grothe.ListPoly
import Mathlib.Algebra.Polynomial.Eval.Degree
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith

/-! A weighted Wiener norm controls every coefficient beyond a short prefix.
This permits finite head costs to retain cancellation without computing long
polynomial products. Agent-ID: codex-9b17. -/

set_option warningAsError true

namespace Grothe.Upper

open Polynomial Finset

noncomputable section

/-- Dilation by `r ≥ 1` bounds an arbitrary finite coefficient tail. -/
theorem sum_abs_coeff_Ico_le_dilated (P : ℝ[X]) {r : ℝ} (hr : 1 ≤ r)
    (L K : ℕ) :
    ∑ j ∈ Ico L K, |P.coeff j| ≤ l1 (P.comp (C r * X)) / r ^ L := by
  have hr0 : 0 < r := lt_of_lt_of_le zero_lt_one hr
  apply (le_div_iff₀ (pow_pos hr0 L)).mpr
  rw [sum_mul]
  calc
    _ ≤ ∑ j ∈ Ico L K, |P.coeff j| * r ^ j := by
      apply sum_le_sum
      intro j hj
      exact mul_le_mul_of_nonneg_left
        (pow_le_pow_right₀ hr (mem_Ico.mp hj).1) (abs_nonneg _)
    _ = ∑ j ∈ Ico L K, |(P.comp (C r * X)).coeff j| := by
      apply sum_congr rfl
      intro j _
      rw [comp_C_mul_X_coeff, abs_mul, abs_of_nonneg (pow_nonneg hr0.le _)]
    _ ≤ ∑ j ∈ range K, |(P.comp (C r * X)).coeff j| :=
      sum_le_sum_of_subset_of_nonneg
        (fun j hj ↦ mem_range.mpr (mem_Ico.mp hj).2) (fun _ _ _ ↦ abs_nonneg _)
    _ ≤ l1 (P.comp (C r * X)) := sum_abs_coeff_le_l1 _ _

/-- A short prefix plus a dilation bound controls any longer finite head. -/
theorem sum_abs_coeff_le_prefix_tail (P : ℝ[X]) {r B : ℝ} (hr : 1 ≤ r)
    (L K : ℕ) (hB : l1 (P.comp (C r * X)) / r ^ L ≤ B) :
    ∑ j ∈ range K, |P.coeff j| ≤
      (∑ j ∈ range (min K L), |P.coeff j|) + if L < K then B else 0 := by
  by_cases hLK : L < K
  · rw [ite_eq_left hLK, min_eq_right hLK.le,
      ← sum_range_add_sum_Ico (fun j ↦ |P.coeff j|) hLK.le]
    exact add_le_add le_rfl ((sum_abs_coeff_Ico_le_dilated P hr L K).trans hB)
  · simp only [ite_eq_right hLK, min_eq_left (Nat.le_of_not_gt hLK), add_zero, le_refl]

/-- A product of powers admits a uniform dilation bound over bounded exponents. -/
theorem l1_dilated_pow_mul_le (P Q : ℝ[X]) {r a b : ℝ}
    (ha : 1 ≤ a) (hb : 1 ≤ b)
    (hP : l1 (P.comp (C r * X)) ≤ a) (hQ : l1 (Q.comp (C r * X)) ≤ b)
    {n m N M : ℕ} (hn : n ≤ N) (hm : m ≤ M) :
    l1 ((P ^ n * Q ^ m).comp (C r * X)) ≤ a ^ N * b ^ M := by
  rw [mul_comp, pow_comp, pow_comp]
  apply (l1_mul_le _ _).trans
  apply mul_le_mul
  · exact (l1_pow_le _ _).trans
      ((pow_le_pow_left₀ (l1_nonneg _) hP n).trans (pow_le_pow_right₀ ha hn))
  · exact (l1_pow_le _ _).trans
      ((pow_le_pow_left₀ (l1_nonneg _) hQ m).trans (pow_le_pow_right₀ hb hm))
  · exact l1_nonneg _
  · positivity

end
end Grothe.Upper
