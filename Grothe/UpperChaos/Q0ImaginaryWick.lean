import Grothe.UpperChaos.ShiftedDampedMoments

/-!
# Imaginary-square insertions in shifted Gaussian Wick moments

The pointwise complex identity and its integral form apply to arbitrary
holomorphic and antiholomorphic exponents and arbitrary complex shifts. They
retain the unnormalized tilted Gaussian mass. Identification with the full q0
phase polynomial and its compressed coefficients remains separate.
Agent-ID: codex-8c4d.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The square of the imaginary part as a polynomial in `z` and its conjugate. -/
theorem ofReal_im_sq_eq_wick_polynomial (z : ℂ) :
    ((z.im ^ 2 : ℝ) : ℂ) = (2 * z * conj z - z ^ 2 - (conj z) ^ 2) / 4 := by
  apply Complex.ext <;>
    simp [pow_two, Complex.mul_re, Complex.mul_im] <;> ring

/-- An imaginary-square insertion into any shifted monomial is exactly three
ordinary shifted damped moments. -/
theorem integral_shifted_im_sq_monomial_damped (p q : ℕ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z : ℂ, (((z + μ).im ^ 2 : ℝ) : ℂ) * (z + μ) ^ p * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      (2 * shiftedDampedMoment rate μ (p + 1) (q + 1) -
        shiftedDampedMoment rate μ (p + 2) q -
        shiftedDampedMoment rate μ p (q + 2)) / 4 := by
  let f₁ : ℂ → ℂ := fun z => (z + μ) ^ (p + 1) * conj (z + μ) ^ (q + 1) *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  let f₂ : ℂ → ℂ := fun z => (z + μ) ^ (p + 2) * conj (z + μ) ^ q *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  let f₃ : ℂ → ℂ := fun z => (z + μ) ^ p * conj (z + μ) ^ (q + 2) *
    (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)
  have hf₁ : Integrable f₁ gaussC := integrable_shifted_monomial_damped (p + 1) (q + 1) μ hrate
  have hf₂ : Integrable f₂ gaussC := integrable_shifted_monomial_damped (p + 2) q μ hrate
  have hf₃ : Integrable f₃ gaussC := integrable_shifted_monomial_damped p (q + 2) μ hrate
  have heq : (fun z : ℂ => (((z + μ).im ^ 2 : ℝ) : ℂ) * (z + μ) ^ p *
      conj (z + μ) ^ q * (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ)) =
      fun z => (2 * f₁ z - f₂ z - f₃ z) / 4 := by
    funext z
    rw [ofReal_im_sq_eq_wick_polynomial]
    dsimp [f₁, f₂, f₃]
    simp only [pow_add, pow_one, pow_two]
    ring
  have houter : (∫ z : ℂ, 2 * f₁ z - f₂ z - f₃ z ∂gaussC) =
      (∫ z : ℂ, 2 * f₁ z - f₂ z ∂gaussC) - ∫ z : ℂ, f₃ z ∂gaussC := by
    simpa only [Pi.sub_apply] using integral_sub ((hf₁.const_mul 2).sub hf₂) hf₃
  have hinner : (∫ z : ℂ, 2 * f₁ z - f₂ z ∂gaussC) =
      (∫ z : ℂ, 2 * f₁ z ∂gaussC) - ∫ z : ℂ, f₂ z ∂gaussC := by
    exact integral_sub (hf₁.const_mul 2) hf₂
  rw [heq, integral_div, houter, hinner, integral_const_mul]
  change (2 * (∫ z, (z + μ) ^ (p + 1) * conj (z + μ) ^ (q + 1) *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) -
      (∫ z, (z + μ) ^ (p + 2) * conj (z + μ) ^ q *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) -
      (∫ z, (z + μ) ^ p * conj (z + μ) ^ (q + 2) *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC)) / 4 = _
  rw [integral_shifted_moment_damped (p + 1) (q + 1) μ hrate,
    integral_shifted_moment_damped (p + 2) q μ hrate,
    integral_shifted_moment_damped p (q + 2) μ hrate]

end
end Grothe.UpperChaos
