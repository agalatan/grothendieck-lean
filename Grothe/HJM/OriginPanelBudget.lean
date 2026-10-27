import Grothe.HJM.OriginPanelsChecks
import Grothe.HJM.OriginApproximationBudget
import Grothe.HJM.Origin

/-!
# A proved polynomial approximation budget for the actual origin pair

Agent-ID: codex-aa04.

The finite residual checks approximate the actual phases on radii [0,8].
The Gaussian approximants are cut off strictly below radius 8, so the
spatial theorem also covers the outer endpoint. Bessel prices every mode
jointly. This is not yet an enclosure of a polynomial coefficient integral.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.HJM.OriginPanels

open OriginPanel

noncomputable section

def radialApprox (re im : List ℚ) (ps : List Panel) (z : ℂ) : ℂ :=
  if ‖z‖ < 8 then Grothe.Haag.ph z * approxList re im ps ‖z‖ else 0

theorem measurable_radialApprox (re im : List ℚ) (ps : List Panel) :
    Measurable (radialApprox re im ps) := by
  exact (Grothe.Haag.measurable_ph.mul
    ((measurable_approxList re im ps).comp measurable_norm)).ite
      (measurableSet_lt measurable_norm measurable_const) measurable_const

theorem radialApprox_zero (re im : List ℚ) (ps : List Panel) (z : ℂ) (hz : 8 ≤ ‖z‖) :
    radialApprox re im ps z = 0 := by
  simp only [radialApprox, ite_eq_right (not_lt_of_ge hz)]

theorem radialApprox_error (re im : List ℚ) (ps : List Panel)
    (hchecks : ps.all (panelCheck re im epsilon) = true)
    (hcover : covers 0 8 ps = true) (z : ℂ) (hz : ‖z‖ < 8) :
    ‖Grothe.Haag.ph z * Grothe.Haag.ph (evalC ⟨re, im⟩ (‖z‖ ^ 2)) -
      radialApprox re im ps z‖ ≤ (epsilon : ℝ) := by
  have h := approxList_uniform_error re im epsilon ps hchecks hcover (by norm_num)
    ‖z‖ (by simpa using norm_nonneg z) (by simpa using hz.le)
  rw [radialApprox, ite_eq_left hz, ← mul_sub, norm_mul]
  have hreverse : ‖Grothe.Haag.ph (evalC ⟨re, im⟩ (‖z‖ ^ 2)) -
      approxList re im ps ‖z‖‖ ≤ (epsilon : ℝ) := by
    rw [norm_sub_rev]
    exact h
  exact (mul_le_mul (Grothe.Haag.norm_ph_le z) hreverse (norm_nonneg _) zero_le_one).trans
    (by simp)

def leftApprox : ℂ → ℂ := radialApprox OriginData.leftReal OriginData.leftImag leftPanels
def rightApprox : ℂ → ℂ := radialApprox OriginData.rightReal OriginData.rightImag rightPanels

theorem leftApprox_error (z : ℂ) (hz : ‖z‖ < 8) :
    ‖Origin.F z - leftApprox z‖ ≤ (epsilon : ℝ) := by
  simpa only [evalC_left, Origin.F, Origin.f, leftApprox] using
    radialApprox_error OriginData.leftReal OriginData.leftImag leftPanels left_checks left_cover z hz

theorem rightApprox_error (z : ℂ) (hz : ‖z‖ < 8) :
    ‖Origin.G z - rightApprox z‖ ≤ (epsilon : ℝ) := by
  simpa only [evalC_right, Origin.G, Origin.g, rightApprox] using
    radialApprox_error OriginData.rightReal OriginData.rightImag rightPanels right_checks right_cover z hz

theorem memLp_leftApprox : MemLp leftApprox 2 gaussC :=
  memLp_of_spatial_approximation (measurable_radialApprox _ _ _) Origin.norm_F_le
    (by norm_num [epsilon]) leftApprox_error (radialApprox_zero _ _ _)

theorem memLp_rightApprox : MemLp rightApprox 2 gaussC :=
  memLp_of_spatial_approximation (measurable_radialApprox _ _ _) Origin.norm_G_le
    (by norm_num [epsilon]) rightApprox_error (radialApprox_zero _ _ _)

def leftApproxLp : Lp ℂ 2 gaussC := memLp_leftApprox.toLp leftApprox
def rightApproxLp : Lp ℂ 2 gaussC := memLp_rightApprox.toLp rightApprox

/-- One exact rational allowance for the pointwise error and omitted Gaussian mass. -/
def responseError : ℚ := 1001 / 10 ^ 15

theorem exp_neg_sixtyfour_le : Real.exp (-64) ≤ (1 / 10 ^ 27 : ℝ) := by
  have hbase : (8 / 3 : ℝ) ≤ Real.exp 1 := by linarith [Real.exp_one_gt_d9]
  have hpow : (8 / 3 : ℝ) ^ 64 ≤ Real.exp 64 := by
    calc
      _ ≤ Real.exp 1 ^ 64 := pow_le_pow_left₀ (by norm_num) hbase 64
      _ = Real.exp 64 := by rw [← Real.exp_nat_mul]; norm_num
  calc
    Real.exp (-64) = (Real.exp 64)⁻¹ := Real.exp_neg _
    _ ≤ ((8 / 3 : ℝ) ^ 64)⁻¹ := by
      simpa only [one_div] using one_div_le_one_div_of_le (by norm_num : (0 : ℝ) < (8 / 3 : ℝ) ^ 64) hpow
    _ ≤ _ := by norm_num

theorem spatial_error_budget : (epsilon : ℝ) ^ 2 + Real.exp (- (8 : ℝ) ^ 2) ≤
    (responseError : ℝ) ^ 2 := by
  have h := exp_neg_sixtyfour_le
  norm_num [epsilon, responseError] at h ⊢
  linarith

theorem leftApprox_norm_sq_error : ‖Origin.FLp - leftApproxLp‖ ^ 2 ≤ (responseError : ℝ) ^ 2 :=
  (spatial_approximation_norm_sq_le Origin.memLp_F memLp_leftApprox Origin.norm_F_le
    (by norm_num) (by norm_num [epsilon]) leftApprox_error (radialApprox_zero _ _ _)).trans spatial_error_budget

theorem rightApprox_norm_sq_error : ‖Origin.GLp - rightApproxLp‖ ^ 2 ≤ (responseError : ℝ) ^ 2 :=
  (spatial_approximation_norm_sq_le Origin.memLp_G memLp_rightApprox Origin.norm_G_le
    (by norm_num) (by norm_num [epsilon]) rightApprox_error (radialApprox_zero _ _ _)).trans spatial_error_budget

theorem leftApprox_norm_error : ‖Origin.FLp - leftApproxLp‖ ≤ (responseError : ℝ) :=
  (sq_le_sq₀ (norm_nonneg _) (by norm_num [responseError])).mp leftApprox_norm_sq_error

theorem rightApprox_norm_error : ‖Origin.GLp - rightApproxLp‖ ≤ (responseError : ℝ) :=
  (sq_le_sq₀ (norm_nonneg _) (by norm_num [responseError])).mp rightApprox_norm_sq_error

/-- The entire left charge-one coefficient sequence uses this one squared budget. -/
theorem leftApprox_coeff_budget :
    ∑' n, ‖chargeOneCoeff Origin.FLp n - chargeOneCoeff leftApproxLp n‖ ^ 2 ≤
      (responseError : ℝ) ^ 2 := by
  have h := chargeOneCoeff_tsum_sq_le (Origin.FLp - leftApproxLp)
  simp only [chargeOneCoeff_sub] at h
  exact h.trans leftApprox_norm_sq_error

theorem rightApprox_coeff_budget :
    ∑' n, ‖chargeOneCoeff Origin.GLp n - chargeOneCoeff rightApproxLp n‖ ^ 2 ≤
      (responseError : ℝ) ^ 2 := by
  have h := chargeOneCoeff_tsum_sq_le (Origin.GLp - rightApproxLp)
  simp only [chargeOneCoeff_sub] at h
  exact h.trans rightApprox_norm_sq_error

end

end Grothe.HJM.OriginPanels
