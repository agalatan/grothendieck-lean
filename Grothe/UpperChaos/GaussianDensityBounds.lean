import Mathlib.Analysis.Complex.Exponential
import Mathlib.Tactic

/-!
Pointwise estimates for the universal Gaussian small-ball argument and
soft-phase approximation. Agent-ID: codex-e4b7.
-/

namespace Grothe.UpperChaos

/-- A Gaussian density is bounded uniformly in its variance away from its center. -/
theorem exp_neg_div_div_le_inv (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    Real.exp (-(a / b)) / b ≤ 1 / a := by
  let x : ℝ := a / b
  have hbound : x * Real.exp (-x) ≤ 1 := by
    rw [Real.exp_neg, ← div_eq_mul_inv, div_le_one₀ (Real.exp_pos x)]
    linarith [Real.add_one_le_exp x]
  calc
    Real.exp (-(a / b)) / b = (x * Real.exp (-x)) / a := by
      dsimp [x]
      field_simp [ne_of_gt ha, ne_of_gt hb]
    _ ≤ 1 / a := div_le_div_of_nonneg_right hbound ha.le

/-- A point in the affine small-ball event lies in the Gaussian tail. -/
theorem gaussian_affine_small_ball_density_bound
    (z w : ℂ) (σ r : ℝ) (hr : 0 ≤ r) (hz : 2 * r < ‖z‖)
    (hσ : σ ≠ 0) (hw : ‖z + (σ : ℂ) * w‖ ≤ r) :
    Real.exp (-‖w‖ ^ 2) / σ ^ 2 ≤ 4 / ‖z‖ ^ 2 := by
  let d : ℝ := ‖z‖ - r
  have hzpos : 0 < ‖z‖ := by linarith
  have hd : 0 < d := by dsimp [d]; linarith
  have hσ2 : 0 < σ ^ 2 := sq_pos_of_ne_zero hσ
  have htriangle : ‖z‖ ≤ ‖z + (σ : ℂ) * w‖ + ‖(σ : ℂ) * w‖ := by
    have h := norm_add_le (z + (σ : ℂ) * w) (-((σ : ℂ) * w))
    simpa only [add_neg_cancel_right, norm_neg] using h
  have htail : d ≤ |σ| * ‖w‖ := by
    dsimp [d]
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs] at htriangle
    linarith
  have hsq : d ^ 2 ≤ σ ^ 2 * ‖w‖ ^ 2 := by
    have ht0 : 0 ≤ |σ| * ‖w‖ := mul_nonneg (abs_nonneg _) (norm_nonneg _)
    have hp := sq_le_sq₀ hd.le ht0 |>.2 htail
    simpa only [mul_pow, sq_abs] using hp
  have hfrac : d ^ 2 / σ ^ 2 ≤ ‖w‖ ^ 2 := by
    apply (div_le_iff₀ hσ2).2
    simpa only [mul_comm] using hsq
  have hexp : Real.exp (-‖w‖ ^ 2) ≤ Real.exp (-(d ^ 2 / σ ^ 2)) :=
    Real.exp_le_exp.mpr (neg_le_neg hfrac)
  calc
    Real.exp (-‖w‖ ^ 2) / σ ^ 2 ≤ Real.exp (-(d ^ 2 / σ ^ 2)) / σ ^ 2 :=
      div_le_div_of_nonneg_right hexp hσ2.le
    _ ≤ 1 / d ^ 2 := exp_neg_div_div_le_inv (d ^ 2) (σ ^ 2) (sq_pos_of_pos hd) hσ2
    _ ≤ 1 / (‖z‖ ^ 2 / 4) := by
      apply one_div_le_one_div_of_le (by positivity : 0 < ‖z‖ ^ 2 / 4)
      dsimp [d]
      nlinarith [sq_nonneg (‖z‖ - 2 * r),
        mul_nonneg (le_of_lt hzpos) (show 0 ≤ ‖z‖ - 2 * r by linarith)]
    _ = 4 / ‖z‖ ^ 2 := by field_simp [ne_of_gt (sq_pos_of_pos hzpos)]

end Grothe.UpperChaos

namespace Grothe.UpperChaos

/-- The softening deficit has a uniform quadratic bound away from zero. -/
theorem sqrt_ratio_deficit_le (x y : ℝ) (hx : 0 < x) (hy : 0 ≤ y) :
    0 ≤ 1 - Real.sqrt x / Real.sqrt (x + y) ∧
      1 - Real.sqrt x / Real.sqrt (x + y) ≤ y / (2 * x) := by
  let a : ℝ := Real.sqrt x
  let b : ℝ := Real.sqrt (x + y)
  have ha : 0 < a := Real.sqrt_pos.2 hx
  have hb : 0 < b := Real.sqrt_pos.2 (by linarith)
  have hab : a ≤ b := Real.sqrt_le_sqrt (by linarith)
  have ha2 : a ^ 2 = x := Real.sq_sqrt hx.le
  have hb2 : b ^ 2 = x + y := Real.sq_sqrt (by linarith)
  have hbplus : 0 < b * (b + a) := by positivity
  have hfactor : 1 - a / b = y / (b * (b + a)) := by
    field_simp [ne_of_gt hb, ne_of_gt (show 0 < b + a by positivity)]
    nlinarith
  have hden : 2 * x ≤ b * (b + a) := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hab) (show 0 ≤ b + 2 * a by positivity)]
  constructor
  · rw [hfactor]
    exact div_nonneg hy hbplus.le
  · rw [hfactor]
    exact div_le_div_of_nonneg_left hy (by positivity) hden

end Grothe.UpperChaos
