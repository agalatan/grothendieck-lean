import Grothe.UpperQuad.GaussianGrowth
import Grothe.UpperQuad.FinitePolynomialMehler

/-!
# Cancellation of Gaussian damping against the finite Mehler exponent

Changing the Gaussian rate to `ε * (1 + τ) / τ` makes the real-coordinate part of the
Mehler exponent cancel the damping exactly. The remaining bound depends only on the
imaginary coordinates. These algebraic lemmas retain squared norms, avoiding fractional powers.

Agent-ID: codex-1a87. Refs #339, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianMehlerBound

open Complex FinitePolynomialMehler

noncomputable section

/-- The Gaussian rate that cancels the real-coordinate Mehler growth. -/
def gaussianRate (ε τ : ℝ) : ℝ := ε * (1 + τ) / τ

lemma gaussianRate_pos {ε τ : ℝ} (hε : 0 < ε) (hτ : 0 < τ) :
    0 < gaussianRate ε τ := by
  unfold gaussianRate
  positivity

lemma damping_ratio {ε τ : ℝ} (hε : 0 < ε) (hτ : 0 < τ) :
    ε / gaussianRate ε τ = τ / (1 + τ) := by
  have hsum : 1 + τ ≠ 0 := by positivity
  unfold gaussianRate
  field_simp

lemma damping_ratio_lt_half {ε τ : ℝ} (hε : 0 < ε) (hτ0 : 0 < τ)
    (hτ1 : τ < 1) : 2 * (ε / gaussianRate ε τ) < 1 := by
  rw [damping_ratio hε hτ0]
  have hsum : 0 < 1 + τ := by positivity
  rw [← mul_div_assoc, div_lt_iff₀ hsum]
  linarith

/-- The Gaussian norm factor and the Mehler prefactor combine to `(1 - τ)⁻²`. -/
lemma gaussian_mehler_prefactor {ε τ : ℝ} (hε : 0 < ε) (hτ0 : 0 < τ)
    (hτ1 : τ < 1) :
    (1 - 2 * (ε / gaussianRate ε τ))⁻¹ * (1 - τ ^ 2)⁻¹ = ((1 - τ) ^ 2)⁻¹ := by
  rw [damping_ratio hε hτ0]
  have hsum : 1 + τ ≠ 0 := by positivity
  have hdiff : 1 - τ ≠ 0 := by linarith
  rw [show 1 - 2 * (τ / (1 + τ)) = (1 - τ) / (1 + τ) by field_simp; ring]
  rw [show 1 - τ ^ 2 = (1 - τ) * (1 + τ) by ring]
  field_simp [hdiff, hsum]

/-- Cancellation leaves only imaginary-coordinate growth, with its explicit coefficient. -/
lemma gaussian_mehler_exponent {ε τ : ℝ} (hε : 0 < ε) (hτ0 : 0 < τ)
    (hτ1 : τ < 1) (r x : ℂ) :
    (Mehler.mehlerExp τ
      ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r + I * x))
      ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r - I * x))).re +
      2 * (-((ε : ℂ) * (r ^ 2 + x ^ 2))).re =
        4 * ε / (1 - τ) * (r.im ^ 2 + x.im ^ 2) := by
  rw [mehlerExp_scaled_pair_re τ hτ0.le hτ1 _ (gaussianRate_pos hε hτ0).le]
  have hsum : 1 + τ ≠ 0 := by positivity
  have hdiff : 1 - τ ≠ 0 := by linarith
  simp only [Complex.neg_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
    zero_mul, sub_zero, Complex.add_re, pow_two]
  unfold gaussianRate
  field_simp
  ring

/-- Turn a finite Mehler estimate with the Gaussian norm factor into a damped growth bound. -/
theorem norm_damped_sq_le_of_mehler {ε τ : ℝ} (hε : 0 < ε) (hτ0 : 0 < τ)
    (hτ1 : τ < 1) (N : ℕ) (r x v : ℂ)
    (hbound : ‖v‖ ^ 2 ≤ (1 - 2 * (ε / gaussianRate ε τ))⁻¹ *
      ((τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp τ
        ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r + I * x))
        ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r - I * x))).re))) :
    ‖v * Complex.exp (-((ε : ℂ) * (r ^ 2 + x ^ 2)))‖ ^ 2 ≤
      (τ ^ N)⁻¹ * ((1 - τ) ^ 2)⁻¹ *
        Real.exp (4 * ε / (1 - τ) * (r.im ^ 2 + x.im ^ 2)) := by
  rw [norm_mul, mul_pow, Complex.norm_exp]
  have hexp : (Real.exp (-((ε : ℂ) * (r ^ 2 + x ^ 2))).re) ^ 2 =
      Real.exp (2 * (-((ε : ℂ) * (r ^ 2 + x ^ 2))).re) := by
    rw [sq, ← Real.exp_add]
    congr 1
    ring
  rw [hexp]
  refine (mul_le_mul_of_nonneg_right hbound (Real.exp_pos _).le).trans_eq ?_
  rw [show (1 - 2 * (ε / gaussianRate ε τ))⁻¹ *
      ((τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp τ
        ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r + I * x))
        ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r - I * x))).re)) *
      Real.exp (2 * (-((ε : ℂ) * (r ^ 2 + x ^ 2))).re) =
      (τ ^ N)⁻¹ * ((1 - 2 * (ε / gaussianRate ε τ))⁻¹ * (1 - τ ^ 2)⁻¹) *
      (Real.exp (Mehler.mehlerExp τ
        ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r + I * x))
        ((Real.sqrt (gaussianRate ε τ) : ℂ) * (r - I * x))).re *
      Real.exp (2 * (-((ε : ℂ) * (r ^ 2 + x ^ 2))).re)) by ring]
  rw [gaussian_mehler_prefactor hε hτ0 hτ1, ← Real.exp_add,
    gaussian_mehler_exponent hε hτ0 hτ1]

end

end Grothe.UpperQuad.GaussianMehlerBound
