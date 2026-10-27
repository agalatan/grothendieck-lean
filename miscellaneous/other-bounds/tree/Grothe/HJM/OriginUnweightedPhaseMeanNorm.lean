import Grothe.HJM.OriginPhaseMeanIntegral
import Grothe.HJM.OriginResidualCoefficients

/-!
# Residual norm from the actual signed phase mean

The phase mean and shared L² approximation error give an upper bound for the
actual unweighted residual norm. No numerical phase-mean lower bound is
asserted here.
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- A pointwise unit-disk bound implies the corresponding Gaussian L² norm
bound because `gaussC` is a probability measure. -/
theorem norm_toLp_le_one_of_pointwise {F : ℂ → ℂ} (hF : MemLp F 2 gaussC)
    (hunit : ∀ z, ‖F z‖ ≤ 1) : ‖hF.toLp F‖ ≤ 1 := by
  have hae : ∀ᵐ z ∂gaussC, ‖(hF.toLp F) z‖ ≤ 1 := by
    filter_upwards [hF.coeFn_toLp] with z hz
    rw [hz]
    exact hunit z
  have h := Lp.norm_le_of_ae_bound (show (0 : ℝ) ≤ 1 by norm_num) hae
  have hprob : measureUnivNNReal gaussC = 1 := by simp [measureUnivNNReal]
  simpa [hprob] using h

/-- The actual coefficient magnitude is retained: an L² approximation of
F transports its phase mean with error `‖u‖ * δ`. No bound on V itself is
required. -/
theorem residual_norm_sq_le_of_approx_phase_mean
    (F V P : Lp ℂ 2 gaussC) (u : ℂ) (δ : ℝ)
    (hF : ‖F‖ ≤ 1) (hP : ‖P‖ ≤ 1) (hclose : ‖F - V‖ ≤ δ) :
    ‖F - u • P‖ ^ 2 ≤
      1 + ‖u‖ ^ 2 - 2 * (⟪u • P, V⟫_ℂ).re + 2 * ‖u‖ * δ := by
  have hU : ‖u • P‖ ≤ ‖u‖ := by
    rw [norm_smul]
    simpa only [mul_one] using mul_le_mul_of_nonneg_left hP (norm_nonneg u)
  have hF2 : ‖F‖ ^ 2 ≤ (1 : ℝ) := by
    simpa using pow_le_pow_left₀ (norm_nonneg F) hF 2
  have hU2 : ‖u • P‖ ^ 2 ≤ ‖u‖ ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) hU 2
  have hδ : 0 ≤ δ := (norm_nonneg (F - V)).trans hclose
  have hinner : |(⟪u • P, F⟫_ℂ).re - (⟪u • P, V⟫_ℂ).re| ≤ ‖u‖ * δ := by
    rw [← Complex.sub_re, ← inner_sub_right]
    calc
      _ ≤ ‖⟪u • P, F - V⟫_ℂ‖ := Complex.abs_re_le_norm _
      _ ≤ ‖u • P‖ * ‖F - V‖ := norm_inner_le_norm _ _
      _ ≤ ‖u‖ * δ := mul_le_mul hU hclose (norm_nonneg _) (norm_nonneg u)
  have hlower := (abs_le.mp hinner).1
  rw [norm_sub_sq (𝕜 := ℂ), inner_re_symm (𝕜 := ℂ) F (u • P)]
  simp only [RCLike.re_to_complex]
  nlinarith [mul_nonneg (norm_nonneg u) hδ]

/-- The left actual residual norm is bounded by its actual signed mean of
the panel approximant and the shared approximation error. -/
theorem left_residual_norm_sq_le_signedPhaseMean :
    ‖fResidualLp‖ ^ 2 ≤
      2 - 2 * signedPhaseMean (f 0) OriginData.leftReal OriginData.leftImag
        OriginPanels.leftPanels + 2 * (OriginPanels.responseError : ℝ) := by
  have hF : ‖FLp‖ ≤ 1 := norm_toLp_le_one_of_pointwise memLp_F norm_F_le
  have hP : ‖Grothe.Haag.phaseLp‖ ≤ 1 :=
    norm_toLp_le_one_of_pointwise Grothe.Haag.memLp_ph Grothe.Haag.norm_ph_le
  have h := residual_norm_sq_le_of_approx_phase_mean FLp OriginPanels.leftApproxLp
    Grothe.Haag.phaseLp (f 0) OriginPanels.responseError hF hP OriginPanels.leftApprox_norm_error
  rw [← fResidualLp_eq_sub, ← left_signedPhaseMean_eq_inner, norm_f_zero] at h
  norm_num at h ⊢
  exact h

/-- The right actual residual satisfies the same identity with its own
endpoint and its own signed phase mean. -/
theorem right_residual_norm_sq_le_signedPhaseMean :
    ‖gResidualLp‖ ^ 2 ≤
      2 - 2 * signedPhaseMean (g 0) OriginData.rightReal OriginData.rightImag
        OriginPanels.rightPanels + 2 * (OriginPanels.responseError : ℝ) := by
  have hF : ‖GLp‖ ≤ 1 := norm_toLp_le_one_of_pointwise memLp_G norm_G_le
  have hP : ‖Grothe.Haag.phaseLp‖ ≤ 1 :=
    norm_toLp_le_one_of_pointwise Grothe.Haag.memLp_ph Grothe.Haag.norm_ph_le
  have hu : ‖g 0‖ = 1 := norm_g_eq_one 0 (by norm_num)
  have h := residual_norm_sq_le_of_approx_phase_mean GLp OriginPanels.rightApproxLp
    Grothe.Haag.phaseLp (g 0) OriginPanels.responseError hF hP OriginPanels.rightApprox_norm_error
  rw [← gResidualLp_eq_sub, ← right_signedPhaseMean_eq_inner, hu] at h
  norm_num at h ⊢
  exact h

/-- Only a verified lower phase-mean enclosure is needed to discharge the
left numerical total-norm hypothesis used by the 64-mode tail theorem. -/
theorem left_totalNorm_of_signedPhaseMean
    (hmean : (76703243 / 10 ^ 8 : ℝ) ≤ signedPhaseMean (f 0)
      OriginData.leftReal OriginData.leftImag OriginPanels.leftPanels) :
    ‖fResidualLp‖ ^ 2 ≤ (46593520 / 10 ^ 8 : ℝ) := by
  have h := left_residual_norm_sq_le_signedPhaseMean
  norm_num [OriginPanels.responseError] at h ⊢
  linarith

/-- The corresponding right total-norm input, conditional on its own mean. -/
theorem right_totalNorm_of_signedPhaseMean
    (hmean : (76711144 / 10 ^ 8 : ℝ) ≤ signedPhaseMean (g 0)
      OriginData.rightReal OriginData.rightImag OriginPanels.rightPanels) :
    ‖gResidualLp‖ ^ 2 ≤ (46577720 / 10 ^ 8 : ℝ) := by
  have h := right_residual_norm_sq_le_signedPhaseMean
  norm_num [OriginPanels.responseError] at h ⊢
  linarith

end
end Grothe.HJM.Origin
