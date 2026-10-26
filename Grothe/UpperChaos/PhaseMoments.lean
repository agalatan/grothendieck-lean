import Grothe.UpperChaos.ComplexMoments
import Grothe.LowerAnalytic.CapPolar

/-!
# Radial Gaussian moments for phase coefficients

The odd radial moments of the standard complex Gaussian are the half-integer
Gamma values appearing in the Hermite coefficients of `z / ‖z‖`.
-/

open MeasureTheory Real Set Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- Radial integration for the standard complex Gaussian. -/
lemma integral_gaussC_radial (f : ℝ → ℝ) (hf : Measurable f) :
    ∫ z, f ‖z‖ ∂gaussC = 2 * ∫ r in Ioi (0 : ℝ), r * exp (-r ^ 2) * f r := by
  rw [integral_gaussC_polar (fun z => f ‖z‖) (hf.comp measurable_norm)]
  have hp : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 * (π⁻¹ * exp (-p.1 ^ 2)) * f ‖Complex.polarCoord.symm p‖
        = (π⁻¹ * (p.1 * exp (-p.1 ^ 2) * f p.1)) * (1 : ℝ) := by
    intro p hp
    rw [norm_polarCoord_symm_of_mem hp]
    ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hp,
    setIntegral_target_mul (fun r => π⁻¹ * (r * exp (-r ^ 2) * f r)) (fun _ => 1),
    integral_const_mul]
  have hangle : ∫ _θ in Ioo (-π) π, (1 : ℝ) = 2 * π := by
    simp only [integral_const, smul_eq_mul, mul_one, Measure.real,
      Measure.restrict_apply_univ, Real.volume_Ioo]
    rw [ENNReal.toReal_ofReal (by linarith [pi_pos])]
    ring
  rw [hangle]
  field_simp

/-- Odd norm powers are integrable under the standard complex Gaussian. -/
lemma integrable_norm_odd_pow (n : ℕ) :
    Integrable (fun z : ℂ => ‖z‖ ^ (2 * n + 1)) gaussC :=
  integrable_norm_pow _

/-- The odd radial moments are half-integer Gamma values. -/
theorem integral_norm_odd_pow (n : ℕ) :
    ∫ z : ℂ, ‖z‖ ^ (2 * n + 1) ∂gaussC = Gamma ((n : ℝ) + 3 / 2) := by
  rw [integral_gaussC_radial (fun r => r ^ (2 * n + 1)) (by fun_prop),
    Gamma_eq_integral (by positivity)]
  conv_rhs => rw [← integral_comp_rpow_Ioi_of_pos (show (0 : ℝ) < 2 by norm_num)]
  rw [← integral_const_mul]
  refine setIntegral_congr_fun measurableSet_Ioi fun r hr => ?_
  have hp : (r ^ (2 : ℝ)) ^ ((n : ℝ) + 3 / 2 - 1)
      = r ^ (2 * n + 1) := by
    rw [← rpow_mul hr.le]
    rw [show (2 : ℝ) * ((n : ℝ) + 3 / 2 - 1) = ((2 * n + 1 : ℕ) : ℝ) by push_cast; ring]
    exact rpow_natCast _ _
  rw [hp]
  norm_num [smul_eq_mul]
  ring

/-- The charge-one monomial paired with phase is an odd radial power. -/
lemma conj_monomial_mul_div_norm (n : ℕ) (z : ℂ) :
    conj (z ^ (n + 1) * conj z ^ n) * (z / (‖z‖ : ℂ))
      = ((‖z‖ ^ (2 * n + 1) : ℝ) : ℂ) := by
  by_cases hz : z = 0
  · subst z
    simp
  have hn : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast (norm_ne_zero_iff.mpr hz)
  have hs : (‖z‖ : ℂ) ^ 2 = conj z * z := by
    rw [← Complex.ofReal_pow, ← Complex.normSq_eq_norm_sq, Complex.normSq_eq_conj_mul_self]
  calc
    conj (z ^ (n + 1) * conj z ^ n) * (z / (‖z‖ : ℂ))
        = (conj z * z) ^ (n + 1) / (‖z‖ : ℂ) := by
          simp only [map_mul, map_pow, Complex.conj_conj]
          ring
    _ = (‖z‖ : ℂ) ^ (2 * n + 1 + 1) / (‖z‖ : ℂ) := by
      rw [← hs, ← pow_mul]
      congr 2
    _ = ((‖z‖ ^ (2 * n + 1) : ℝ) : ℂ) := by
      rw [pow_succ, mul_div_cancel_right₀ _ hn, Complex.ofReal_pow]

lemma integrable_conj_monomial_mul_div_norm (n : ℕ) :
    Integrable (fun z : ℂ => conj (z ^ (n + 1) * conj z ^ n) *
      (z / (‖z‖ : ℂ))) gaussC := by
  simp_rw [conj_monomial_mul_div_norm]
  exact (integrable_norm_odd_pow n).ofReal

/-- The mixed monomial-phase integral needed for Hermite phase coefficients. -/
theorem integral_conj_monomial_mul_div_norm (n : ℕ) :
    ∫ z : ℂ, conj (z ^ (n + 1) * conj z ^ n) * (z / (‖z‖ : ℂ)) ∂gaussC
      = (Gamma ((n : ℝ) + 3 / 2) : ℂ) := by
  simp_rw [conj_monomial_mul_div_norm]
  rw [integral_complex_ofReal, integral_norm_odd_pow]

end

end Grothe.UpperChaos
