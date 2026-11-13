import Grothe.UpperChaos.DampedCoherentKernel
import Grothe.UpperChaos.HermiteBasis

/-!
# Gaussian norm bounds from pointwise exponential growth

The weighted polynomial Mehler argument changes the Gaussian rate before bounding polynomial
coefficients. These lemmas supply its real-axis norm estimate with the repository's normalized
complex Gaussian. They do not estimate quadrature errors.

Agent-ID: codex-1a87. Refs #339, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianGrowth

open MeasureTheory Complex Grothe.LowerAnalytic Grothe.UpperChaos.WeightedHSMass
open scoped InnerProductSpace ComplexConjugate

noncomputable section

private lemma cexp_rate_eq (c : ℝ) (z : ℂ) :
    cexp (-((1 - c - 1 : ℝ) : ℂ) * (normSq z : ℂ) + 0 * z + 0 * conj z) =
      (Real.exp (c * normSq z) : ℂ) := by
  rw [Complex.ofReal_exp]
  congr 1
  push_cast
  ring

/-- The exponential radial moment of the normalized complex Gaussian. -/
theorem integral_exp_normSq (c : ℝ) (hc : c < 1) :
    (∫ z : ℂ, Real.exp (c * normSq z) ∂gaussC) = (1 - c)⁻¹ := by
  have h := integral_gaussC_cexp_linear (rate := 1 - c) (by linarith) 0 0
  simp_rw [cexp_rate_eq] at h
  simp only [zero_mul, zero_div, Complex.exp_zero, mul_one] at h
  rw [integral_complex_ofReal] at h
  exact_mod_cast h

theorem integrable_exp_normSq (c : ℝ) (hc : c < 1) :
    Integrable (fun z : ℂ ↦ Real.exp (c * normSq z)) gaussC := by
  have h := (integrable_gaussC_cexp_linear (rate := 1 - c) (by linarith) 0 0).norm
  simpa only [cexp_rate_eq, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (Real.exp_pos _)] using h

/-- The squared norm of a complex Gaussian `L²` representative. -/
theorem norm_toLp_sq {f : ℂ → ℂ} (hf : MemLp f 2 gaussC) :
    ‖hf.toLp f‖ ^ 2 = ∫ z, ‖f z‖ ^ 2 ∂gaussC := by
  calc
    ‖hf.toLp f‖ ^ 2 = RCLike.re ⟪hf.toLp f, hf.toLp f⟫_ℂ :=
      norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ z, RCLike.re ⟪hf.toLp f z, hf.toLp f z⟫_ℂ ∂gaussC := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hf.coeFn_toLp] with z hz
      rw [hz, ← norm_sq_eq_re_inner]

/-- Pointwise growth below the Gaussian integrability threshold controls the polynomial norm. -/
theorem norm_sq_le_of_exp_bound {f : ℂ → ℂ} (hf : MemLp f 2 gaussC)
    {c : ℝ} (hc : 2 * c < 1)
    (hbound : ∀ z, ‖f z‖ ≤ Real.exp (c * normSq z)) :
    ‖hf.toLp f‖ ^ 2 ≤ (1 - 2 * c)⁻¹ := by
  rw [norm_toLp_sq, ← integral_exp_normSq (2 * c) hc]
  refine integral_mono ((memLp_two_iff_integrable_sq_norm hf.aestronglyMeasurable).mp hf)
    (integrable_exp_normSq (2 * c) hc) fun z => ?_
  calc
    ‖f z‖ ^ 2 ≤ (Real.exp (c * normSq z)) ^ 2 :=
      pow_le_pow_left₀ (norm_nonneg _) (hbound z) 2
    _ = Real.exp ((2 * c) * normSq z) := by
      rw [sq, ← Real.exp_add]
      congr 1
      ring

end

end Grothe.UpperQuad.GaussianGrowth
