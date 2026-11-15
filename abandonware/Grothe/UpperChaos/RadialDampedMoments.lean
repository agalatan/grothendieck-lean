import Grothe.LowerAnalytic.CapPolar
import Mathlib.MeasureTheory.Integral.Gamma

/-!
# Real radial powers under a positive Gaussian tilt

The radial exponent may be negative, provided it is greater than `-2`.
This includes the locally integrable singular majorants needed when an
auxiliary Laplace-tail estimate is integrated across the radial origin.

Agent-ID: codex-2ca4
-/

open MeasureTheory Real Grothe.LowerAnalytic

namespace Grothe.UpperChaos

noncomputable section

/-- Exact real radial moment, including locally integrable negative exponents. -/
theorem integral_norm_rpow_damped (q : ℝ) {rate : ℝ}
    (hq : -2 < q) (hrate : 0 < rate) :
    (∫ z : ℂ, ‖z‖ ^ q * exp (-(rate - 1) * Complex.normSq z) ∂gaussC) =
      rate ^ (-(q + 2) / 2) * Gamma ((q + 2) / 2) := by
  rw [integral_gaussC_eq_volume _ (by fun_prop)]
  have he (z : ℂ) : exp (-Complex.normSq z) *
      exp (-(rate - 1) * Complex.normSq z) = exp (-rate * Complex.normSq z) := by
    rw [← exp_add]
    congr 1
    ring
  have hp : (fun z : ℂ => (π⁻¹ * exp (-Complex.normSq z)) *
      (‖z‖ ^ q * exp (-(rate - 1) * Complex.normSq z))) =
        fun z : ℂ => π⁻¹ * (‖z‖ ^ q * exp (-rate * ‖z‖ ^ 2)) := by
    funext z
    calc
      _ = π⁻¹ * (‖z‖ ^ q * (exp (-Complex.normSq z) *
          exp (-(rate - 1) * Complex.normSq z))) := by ring
      _ = _ := by rw [he, Complex.normSq_eq_norm_sq]
  rw [hp, integral_const_mul]
  have hg := Complex.integral_rpow_mul_exp_neg_mul_rpow
    (p := (2 : ℝ)) (q := q) (by norm_num) hq hrate
  simp only [Real.rpow_two] at hg
  rw [hg]
  field_simp [Real.pi_ne_zero]

/-- The same radial powers are integrable at every positive Gaussian rate. -/
theorem integrable_norm_rpow_damped (q : ℝ) {rate : ℝ}
    (hq : -2 < q) (hrate : 0 < rate) :
    Integrable (fun z : ℂ => ‖z‖ ^ q * exp (-(rate - 1) * Complex.normSq z)) gaussC := by
  apply Integrable.of_integral_ne_zero
  rw [integral_norm_rpow_damped q hq hrate]
  exact (mul_pos (Real.rpow_pos_of_pos hrate _)
    (Gamma_pos_of_pos (by linarith))).ne'

end
end Grothe.UpperChaos
