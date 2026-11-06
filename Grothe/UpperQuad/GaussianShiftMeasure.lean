import Grothe.UpperChaos.LinearTiltedMoments

/-!
# Real translations of the standard complex Gaussian

Specializing the existing linear tilt to a real shift gives an exact change of variables for
every measurable complex source. These identities concern totalized Bochner integrals and
therefore do not assume integrability.

Agent-ID: codex-2f3d. Refs #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open MeasureTheory Complex Grothe.LowerAnalytic

noncomputable section

/-- A real linear tilt translates the Gaussian source by the same signed real amount. -/
theorem integral_real_tilt (F : ℂ → ℂ) (hF : Measurable F) (a : ℝ) :
    (∫ w, F w * (Real.exp (2 * a * w.re) : ℂ) ∂gaussC) =
      (Real.exp (a ^ 2) : ℂ) * ∫ w, F (w + (a : ℂ)) ∂gaussC := by
  simpa only [UpperChaos.LinearTiltedMoments.mean, inv_one, Complex.ofReal_one,
    Complex.conj_ofReal, one_mul, sub_self, zero_mul, neg_zero, zero_add,
    Real.exp_zero, Complex.ofReal_one, mul_one, Complex.normSq_ofReal, div_one,
    Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero,
    mul_assoc, pow_two] using
    UpperChaos.LinearTiltedMoments.integral_linear_tilt F hF (rate := 1)
      (by norm_num) (a : ℂ)

/-- Translating a measurable source backwards introduces the normalized real Gaussian tilt. -/
theorem integral_real_shift (F : ℂ → ℂ) (hF : Measurable F) (a : ℝ) :
    (∫ w, F w ∂gaussC) = (Real.exp (-(a ^ 2)) : ℂ) *
      ∫ w, F (w - (a : ℂ)) * (Real.exp (2 * a * w.re) : ℂ) ∂gaussC := by
  rw [integral_real_tilt (fun w ↦ F (w - (a : ℂ))) (by fun_prop)]
  simp only [add_sub_cancel_right, ← mul_assoc, ← Complex.ofReal_mul,
    ← Real.exp_add, neg_add_cancel, Real.exp_zero, Complex.ofReal_one, one_mul]

/-- The same real translation in complex-exponential notation, ready for analytic kernels. -/
theorem integral_real_shift_cexp (F : ℂ → ℂ) (hF : Measurable F) (a : ℝ) :
    (∫ w, F w ∂gaussC) = Complex.exp (-((a : ℂ) ^ 2)) *
      ∫ w, F (w - (a : ℂ)) * Complex.exp (2 * (a : ℂ) * (w.re : ℂ)) ∂gaussC := by
  simpa only [← Complex.ofReal_pow, ← Complex.ofReal_neg, ← Complex.ofReal_mul,
    ← Complex.ofReal_ofNat, ← Complex.ofReal_exp] using integral_real_shift F hF a

/-- The forward real translation, with its Gaussian weight inside the integral. -/
theorem integral_real_add_weight (F : ℂ → ℂ) (hF : Measurable F) (a : ℝ) :
    (∫ w, F w ∂gaussC) = ∫ w, F (w + (a : ℂ)) *
      Complex.exp (-((a : ℂ) ^ 2) - 2 * (a : ℂ) * (w.re : ℂ)) ∂gaussC := by
  rw [integral_real_shift_cexp F hF (-a), ← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with w
  simp only [Complex.ofReal_neg, sub_neg_eq_add, neg_sq, mul_neg, neg_mul]
  rw [mul_left_comm, ← Complex.exp_add]
  congr 2

/-- Real Gaussian translation preserves integrability after inserting its density weight. -/
theorem integrable_real_shift (F : ℂ → ℂ) (hF : Measurable F) (a : ℝ)
    (hFi : Integrable F gaussC) :
    Integrable (fun w ↦ F (w - (a : ℂ)) * (Real.exp (2 * a * w.re) : ℂ)) gaussC := by
  have hpos : 0 < (∫ w, ‖F w‖ ∂gaussC) + 1 := by
    have hn : 0 ≤ ∫ w, ‖F w‖ ∂gaussC := integral_nonneg fun w ↦ norm_nonneg (F w)
    linarith
  have hmajorant : Integrable (fun w ↦
      ((‖F (w - (a : ℂ))‖ + 1 : ℝ) : ℂ) * (Real.exp (2 * a * w.re) : ℂ)) gaussC := by
    apply Integrable.of_integral_ne_zero
    rw [integral_real_tilt (fun w ↦ ((‖F (w - (a : ℂ))‖ + 1 : ℝ) : ℂ)) (by fun_prop)]
    simp only [add_sub_cancel_right]
    rw [integral_complex_ofReal,
      integral_add hFi.norm (integrable_const (1 : ℝ))]
    simp only [integral_const, probReal_univ, smul_eq_mul, one_mul]
    exact mul_ne_zero (Complex.ofReal_ne_zero.mpr (Real.exp_ne_zero _))
      (Complex.ofReal_ne_zero.mpr hpos.ne')
  refine hmajorant.norm.mono' (by fun_prop) (Filter.Eventually.of_forall fun w ↦ ?_)
  simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (Real.exp_pos _), abs_of_nonneg (by positivity : 0 ≤ ‖F (w - (a : ℂ))‖ + 1)]
  exact mul_le_mul_of_nonneg_right (by linarith) (Real.exp_pos _).le

end

end Grothe.UpperQuad.GaussianShift
