import Grothe.Haagerup.Phase
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum

/-!
# A Laplace representation of complex phase

Agent-ID: codex-6f91. Exact analytic identities for the phase map.
No numerical Gaussian quadrature or approximation-error bound is asserted.
-/

open MeasureTheory Set

namespace Grothe.Haag

noncomputable section

/-- The phase singularity represented by one positive auxiliary parameter. -/
def phaseLaplaceKernel (z : ℂ) (t : ℝ) : ℂ :=
  ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(‖z‖ ^ 2 * t)) : ℝ) : ℂ) * z

/-- The scalar Laplace integral at a nonzero phase argument. -/
theorem integral_phaseLaplace_weight {z : ℂ} (hz : z ≠ 0) :
    (∫ t : ℝ in Ioi 0, t ^ (-(1 / 2 : ℝ)) * Real.exp (-(‖z‖ ^ 2 * t))) =
      Real.sqrt Real.pi / ‖z‖ := by
  have hnorm : 0 < ‖z‖ ^ 2 := sq_pos_of_pos (norm_pos_iff.mpr hz)
  have hsqrt : (1 / ‖z‖ ^ 2 : ℝ) ^ (1 / 2 : ℝ) = ‖z‖⁻¹ := by
    rw [← Real.sqrt_eq_rpow]
    simp only [one_div, Real.sqrt_inv, Real.sqrt_sq (norm_nonneg z)]
  have h := Real.integral_rpow_mul_exp_neg_mul_Ioi
    (a := (1 / 2 : ℝ)) (r := ‖z‖ ^ 2) (by norm_num) hnorm
  have hexp : (1 / 2 : ℝ) - 1 = -(1 / 2 : ℝ) := by norm_num
  rw [hexp, hsqrt, Real.Gamma_one_half_eq] at h
  simpa only [div_eq_mul_inv, mul_comm] using h

/-- Complex phase, including its assigned value at zero, as a Gaussian Laplace mixture. -/
theorem ph_eq_phaseLaplace (z : ℂ) :
    ph z = (Real.sqrt Real.pi : ℂ)⁻¹ *
      ∫ t : ℝ in Ioi 0, phaseLaplaceKernel z t := by
  by_cases hz : z = 0
  · subst z
    simp [ph, phaseLaplaceKernel]
  · have hnormC : (‖z‖ : ℂ) ≠ 0 := by
      exact_mod_cast (norm_ne_zero_iff.mpr hz)
    have hpiC : (Real.sqrt Real.pi : ℂ) ≠ 0 := by
      exact_mod_cast (Real.sqrt_pos.mpr Real.pi_pos).ne'
    simp only [phaseLaplaceKernel]
    rw [integral_mul_const, integral_complex_ofReal, integral_phaseLaplace_weight hz,
      Complex.ofReal_div]
    unfold ph
    field_simp [hnormC, hpiC]


/-- The auxiliary kernel is integrable even at the assigned phase value at zero. -/
theorem integrableOn_phaseLaplaceKernel (z : ℂ) :
    IntegrableOn (phaseLaplaceKernel z) (Ioi 0) := by
  by_cases hz : z = 0
  · subst z
    have he : phaseLaplaceKernel 0 = fun _ : ℝ => (0 : ℂ) := by
      funext t
      simp [phaseLaplaceKernel]
    rw [he]
    exact integrable_zero ℝ ℂ (volume.restrict (Ioi 0))
  · apply Integrable.of_integral_ne_zero
    intro h
    have hp := ph_eq_phaseLaplace z
    rw [h, mul_zero] at hp
    have hnormC : (‖z‖ : ℂ) ≠ 0 := by
      exact_mod_cast (norm_ne_zero_iff.mpr hz)
    exact (div_ne_zero hz hnormC) hp

/-- Its exact absolute integral at a nonzero phase argument. -/
theorem integral_norm_phaseLaplaceKernel {z : ℂ} (hz : z ≠ 0) :
    (∫ t : ℝ in Ioi 0, ‖phaseLaplaceKernel z t‖) = Real.sqrt Real.pi := by
  have ht (t : ℝ) (ht : t ∈ Ioi (0 : ℝ)) :
      ‖phaseLaplaceKernel z t‖ =
        (t ^ (-(1 / 2 : ℝ)) * Real.exp (-(‖z‖ ^ 2 * t))) * ‖z‖ := by
    have hw : 0 ≤ t ^ (-(1 / 2 : ℝ)) * Real.exp (-(‖z‖ ^ 2 * t)) :=
      mul_nonneg (Real.rpow_nonneg ht.le _) (Real.exp_pos _).le
    rw [phaseLaplaceKernel, norm_mul, Complex.norm_real, Real.norm_eq_abs,
      abs_of_nonneg hw]
  calc
    _ = ∫ t : ℝ in Ioi 0,
        (t ^ (-(1 / 2 : ℝ)) * Real.exp (-(‖z‖ ^ 2 * t))) * ‖z‖ :=
      setIntegral_congr_fun measurableSet_Ioi ht
    _ = (Real.sqrt Real.pi / ‖z‖) * ‖z‖ := by
      rw [integral_mul_const, integral_phaseLaplace_weight hz]
    _ = Real.sqrt Real.pi := div_mul_cancel₀ _ (norm_ne_zero_iff.mpr hz)

/-- A uniform bound for Tonelli/Fubini against any integrable polynomial source. -/
theorem integral_norm_phaseLaplaceKernel_le (z : ℂ) :
    (∫ t : ℝ in Ioi 0, ‖phaseLaplaceKernel z t‖) ≤ Real.sqrt Real.pi := by
  by_cases hz : z = 0
  · subst z
    calc
      (∫ t : ℝ in Ioi 0, ‖phaseLaplaceKernel 0 t‖) = 0 := by simp [phaseLaplaceKernel]
      _ ≤ Real.sqrt Real.pi := Real.sqrt_nonneg Real.pi
  · exact (integral_norm_phaseLaplaceKernel hz).le

/-- The denominator-free completion of squares needed by the conditional Gaussian integral. -/
theorem affine_phase_complete_square (α a t : ℝ) (z w : ℂ) :
    (α + a ^ 2 * t) * (α * ‖w‖ ^ 2 + t * ‖z + (a : ℂ) * w‖ ^ 2) =
      ‖((α + a ^ 2 * t : ℝ) : ℂ) * w + ((a * t : ℝ) : ℂ) * z‖ ^ 2 +
        α * t * ‖z‖ ^ 2 := by
  simp only [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, Complex.add_re,
    Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im]
  ring

end
end Grothe.Haag
