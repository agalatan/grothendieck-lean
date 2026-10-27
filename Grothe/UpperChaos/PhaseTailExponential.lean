import Mathlib.Analysis.Complex.Exponential
import Mathlib.Tactic

/-! A short exponential certificate for the production phase's radial tail. -/

open Finset
namespace Grothe.UpperChaos

/-- The Taylor polynomial through degree twelve already exceeds 148 at 5. -/
theorem exp_five_gt_148 : (148 : ℝ) < Real.exp 5 := by
  have h := Real.sum_le_exp_of_nonneg (show (0 : ℝ) ≤ 5 by norm_num) 13
  norm_num [Finset.sum_range_succ, Nat.factorial] at h ⊢
  linarith

/-- A rational exponential bound for cutoff 50 at Gaussian rate 31/10. -/
theorem exp_neg_155_lt : Real.exp (-155) < 1 / (148 : ℝ) ^ 31 := by
  have hp : (148 : ℝ) ^ 31 < Real.exp 155 := by
    calc
      (148 : ℝ) ^ 31 < (Real.exp 5) ^ 31 := by
        gcongr
        exact exp_five_gt_148
      _ = Real.exp 155 := by
        rw [← Real.exp_nat_mul]
        norm_num
  simpa only [Real.exp_neg, one_div] using
    one_div_lt_one_div_of_lt (show (0 : ℝ) < 148 ^ 31 by positivity) hp

/-- Transfer an exact rational tail-factor bound to its Gaussian integral. -/
theorem phase_tail_scalar_bound {B : ℚ} (hB0 : 0 ≤ B)
    (hB : B < (148 : ℚ) ^ 31 * (5 / 10 ^ 15 : ℚ) ^ 2) :
    Real.exp (-155) * (B : ℝ) < (5 / 10 ^ 15 : ℝ) ^ 2 := by
  have hb0 : (0 : ℝ) ≤ B := by exact_mod_cast hB0
  have hb : (B : ℝ) < (148 : ℝ) ^ 31 * (5 / 10 ^ 15 : ℝ) ^ 2 := by
    have hc : (B : ℝ) < (((148 : ℚ) ^ 31 * (5 / 10 ^ 15 : ℚ) ^ 2 : ℚ) : ℝ) :=
      (Rat.cast_lt (K := ℝ)).2 hB
    push_cast at hc
    exact hc
  have hdiv : (B : ℝ) / 148 ^ 31 < (5 / 10 ^ 15 : ℝ) ^ 2 := by
    apply (div_lt_iff₀ (show (0 : ℝ) < 148 ^ 31 by positivity)).2
    simpa only [mul_comm] using hb
  calc
    Real.exp (-155) * (B : ℝ) ≤ (1 / (148 : ℝ) ^ 31) * B :=
      mul_le_mul_of_nonneg_right exp_neg_155_lt.le hb0
    _ = (B : ℝ) / 148 ^ 31 := by ring
    _ < _ := hdiv

end Grothe.UpperChaos
