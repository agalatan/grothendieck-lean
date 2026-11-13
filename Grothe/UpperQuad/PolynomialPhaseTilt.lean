import Grothe.UpperQuad.PolynomialPhaseExpansion
import Grothe.UpperQuad.PolynomialRescale
import Grothe.UpperChaos.DampedMoments

/-!
# Finite polynomial phase integrals after Gaussian damping

The Gaussian change of scale contributes exactly one inverse-rate Jacobian. The polynomial
is rescaled by the positive square root and the real phase shift is multiplied by that root.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialPhase

open MeasureTheory Grothe.LowerAnalytic Grothe.UpperChaos PolynomialRescale

noncomputable section

private lemma phase_pos_mul (t : ℝ) (ht : 0 < t) (z : ℂ) :
    Grothe.Haag.ph ((t : ℂ) * z) = Grothe.Haag.ph z := by
  simp only [Grothe.Haag.ph, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos ht, Complex.ofReal_mul]
  exact mul_div_mul_left z (↑‖z‖) (by exact_mod_cast ht.ne')

/-- Gaussian damping rescales the polynomial and the shift, with one inverse-rate factor. -/
theorem integral_damped_phase (rate : ℝ) (hrate : 0 < rate) (A : ℝ) (P : CPoly) :
    (∫ w, (Real.exp (-(rate - 1) * Complex.normSq w) : ℂ) *
      (ev w P * Grothe.Haag.ph ((A : ℂ) + w)) ∂gaussC) =
      (rate : ℂ)⁻¹ * phaseMoment (A * Real.sqrt rate) (rescale (Real.sqrt rate) P) := by
  have hF : Measurable (fun w ↦ ev w P * Grothe.Haag.ph ((A : ℂ) + w)) :=
    (continuous_ev P).measurable.mul (Grothe.Haag.measurable_ph.comp (by fun_prop))
  have ht := integral_gaussC_tilt
    (fun w ↦ ev w P * Grothe.Haag.ph ((A : ℂ) + w)) hF hrate
  simp only [Complex.real_smul, Complex.ofReal_inv] at ht
  rw [ht, phaseMoment_apply]
  congr 1
  apply integral_congr_ae
  filter_upwards with w
  rw [ev_rescale]
  congr 1
  have hs : (Real.sqrt rate : ℂ) ≠ 0 := by exact_mod_cast (Real.sqrt_pos.mpr hrate).ne'
  have he : (A : ℂ) + (Real.sqrt rate : ℂ)⁻¹ * w =
      ((Real.sqrt rate)⁻¹ : ℝ) * (((A * Real.sqrt rate : ℝ) : ℂ) + w) := by
    push_cast
    field_simp
  rw [he]
  exact phase_pos_mul _ (inv_pos.mpr (Real.sqrt_pos.mpr hrate)) _

/-- The damped phase integral is the finite entire extension at its rescaled real shift. -/
theorem integral_damped_phase_eq_extension (rate : ℝ) (hrate : 0 < rate) (A : ℝ)
    (hA : A ≠ 0) (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) :
    (∫ w, (Real.exp (-(rate - 1) * Complex.normSq w) : ℂ) *
      (ev w P * Grothe.Haag.ph ((A : ℂ) + w)) ∂gaussC) =
      (rate : ℂ)⁻¹ * phaseExtension N (rescale (Real.sqrt rate) P)
        ((A * Real.sqrt rate : ℝ) : ℂ) := by
  rw [integral_damped_phase rate hrate A P,
    phaseExtension_real _ ((totalDegree_rescale_le _ P).trans hP) _
      (mul_ne_zero hA (Real.sqrt_pos.mpr hrate).ne')]

end

end Grothe.UpperQuad.PolynomialPhase
