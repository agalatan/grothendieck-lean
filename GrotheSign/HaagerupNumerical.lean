import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.Real.Pi.Bounds

/-!
# Exact numerical estimates for the Haagerup contour argument

The upper estimate uses the corrected constant `0.851`. The lower estimate keeps its
analytic input `1.205 ≤ c` explicit; it does not identify or estimate the contour quantity `c`.

Proof implementation: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

/-- The corrected elementary exponential factor in the contour tail estimate. -/
theorem haagerup_exponential_factor_lt :
    (5 / Real.sqrt 3) * Real.exp (-7 * Real.pi / 18) < 851 / 1000 := by
  have hx : (24433 / 20000 : ℝ) < 7 * Real.pi / 18 := by
    linarith [Real.pi_gt_d4]
  have htaylor : (1357 / 400 : ℝ) <
      ∑ i ∈ Finset.range 8, (24433 / 20000 : ℝ) ^ i / i.factorial := by
    norm_num [Finset.sum_range_succ, Nat.factorial]
  have he : (1357 / 400 : ℝ) < Real.exp (7 * Real.pi / 18) :=
    (htaylor.trans_le (Real.sum_le_exp_of_nonneg (by norm_num) 8)).trans
      (Real.exp_lt_exp.mpr hx)
  have hs : (433 / 250 : ℝ) < Real.sqrt 3 :=
    Real.lt_sqrt_of_sq_lt (by norm_num)
  have hspos : 0 < Real.sqrt (3 : ℝ) := Real.sqrt_pos.mpr (by norm_num)
  have hprod : (5 : ℝ) < (851 / 1000) * Real.sqrt 3 *
      Real.exp (7 * Real.pi / 18) := by
    calc
      (5 : ℝ) < (851 / 1000) * (433 / 250) * (1357 / 400) := by norm_num
      _ < (851 / 1000) * Real.sqrt 3 * (1357 / 400) :=
        mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left hs (by norm_num)) (by norm_num)
      _ < (851 / 1000) * Real.sqrt 3 * Real.exp (7 * Real.pi / 18) :=
        mul_lt_mul_of_pos_left he (mul_pos (by norm_num) hspos)
  calc
    (5 / Real.sqrt 3) * Real.exp (-7 * Real.pi / 18) =
        5 / (Real.sqrt 3 * Real.exp (7 * Real.pi / 18)) := by
      rw [show -7 * Real.pi / 18 = -(7 * Real.pi / 18) by ring, Real.exp_neg]
      simp only [div_eq_mul_inv, mul_inv_rev]
      ring
    _ < 851 / 1000 :=
      (div_lt_iff₀ (mul_pos hspos (Real.exp_pos _))).mpr (by nlinarith [hprod])

/-- The contour prefactor estimate, conditional on its separate analytic lower bound for `c`. -/
theorem haagerup_prefactor_gt {c : ℝ} (hc : 241 / 200 ≤ c) :
    14 / 25 < (2 * c / Real.pi) ^ 2 * (1 + Real.exp (-Real.pi / 2)) / (5 / 4) := by
  have hlog : Real.pi / 2 < Real.log 5 := by
    linarith [Real.pi_lt_d4, Real.log_five_gt_d9]
  have heupper : Real.exp (Real.pi / 2) < 5 := by
    simpa only [Real.exp_log (by norm_num : (0 : ℝ) < 5)] using
      Real.exp_lt_exp.mpr hlog
  have helower : (1 / 5 : ℝ) < Real.exp (-Real.pi / 2) := by
    rw [show -Real.pi / 2 = -(Real.pi / 2) by ring, Real.exp_neg]
    simpa only [one_div] using
      one_div_lt_one_div_of_lt (Real.exp_pos (Real.pi / 2)) heupper
  have hpi : Real.pi < (22 / 7 : ℝ) := by linarith [Real.pi_lt_d4]
  have hr : (1687 / 2200 : ℝ) < 2 * c / Real.pi :=
    (lt_div_iff₀ Real.pi_pos).mpr (by nlinarith [hpi, hc])
  have hrpos : 0 < 2 * c / Real.pi := lt_trans (by norm_num) hr
  have hrsq : (1687 / 2200 : ℝ) ^ 2 < (2 * c / Real.pi) ^ 2 := by
    nlinarith
  have hprod : (1687 / 2200 : ℝ) ^ 2 * (6 / 5) <
      (2 * c / Real.pi) ^ 2 * (1 + Real.exp (-Real.pi / 2)) := by
    calc
      (1687 / 2200 : ℝ) ^ 2 * (6 / 5) < (2 * c / Real.pi) ^ 2 * (6 / 5) :=
        mul_lt_mul_of_pos_right hrsq (by norm_num)
      _ < (2 * c / Real.pi) ^ 2 * (1 + Real.exp (-Real.pi / 2)) :=
        mul_lt_mul_of_pos_left (by linarith [helower]) (sq_pos_of_pos hrpos)
  apply (lt_div_iff₀ (by norm_num : (0 : ℝ) < 5 / 4)).mpr
  exact lt_trans (by norm_num) hprod

end GrotheSign
