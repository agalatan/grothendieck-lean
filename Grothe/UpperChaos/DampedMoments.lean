import Grothe.UpperChaos.ComplexMoments

/-!
# Gaussian moments with radial exponential damping

Changing the Gaussian scale evaluates a mixed monomial times a radial exponential
exactly. The scale may be any positive real number; in particular, the result does
not require the exponential factor itself to be bounded.

Agent-ID: codex-2ca4
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The standard complex Gaussian density, with complex-valued test functions. -/
theorem integral_gaussC_eq_volume_complex (F : ℂ → ℂ) (hF : Measurable F) :
    ∫ z, F z ∂gaussC = ∫ z : ℂ, (π⁻¹ * exp (-Complex.normSq z)) • F z := by
  rw [gaussC_eq_map, integral_map measurable_F2.aemeasurable
    (hF.aestronglyMeasurable)]
  have hd : ∫ p, F (F2 p) ∂gauss2 =
      ∫ p : ℝ × ℝ, (gaussianPDFReal 0 1 p.1 * gaussianPDFReal 0 1 p.2) • F (F2 p) := by
    rw [gauss2, gaussianReal_of_var_ne_zero 0 one_ne_zero,
      MeasureTheory.prod_withDensity (measurable_gaussianPDF 0 1) (measurable_gaussianPDF 0 1),
      integral_withDensity_eq_integral_toReal_smul (by fun_prop)
        (Filter.Eventually.of_forall fun p =>
          ENNReal.mul_lt_top gaussianPDF_lt_top gaussianPDF_lt_top),
      ← Measure.volume_eq_prod]
    congr 1
    ext p
    rw [ENNReal.toReal_mul, toReal_gaussianPDF, toReal_gaussianPDF]
  rw [hd]
  have he : (∫ p : ℝ × ℝ,
      (gaussianPDFReal 0 1 p.1 * gaussianPDFReal 0 1 p.2) • F (F2 p)) =
      ∫ z : ℂ, (gaussianPDFReal 0 1 z.re * gaussianPDFReal 0 1 z.im) •
        F (F2 (z.re, z.im)) := by
    rw [← (Complex.volume_preserving_equiv_real_prod.symm).integral_comp
      Complex.measurableEquivRealProd.symm.measurableEmbedding]
    rfl
  rw [he]
  have hs : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have hscale := Measure.integral_comp_smul (μ := (volume : Measure ℂ))
    (fun z : ℂ => (gaussianPDFReal 0 1 z.re * gaussianPDFReal 0 1 z.im) •
      F (F2 (z.re, z.im))) √2
  rw [Complex.finrank_real_complex, hs] at hscale
  have hp : ∀ w : ℂ,
      (gaussianPDFReal 0 1 ((√2 : ℝ) • w).re *
        gaussianPDFReal 0 1 ((√2 : ℝ) • w).im) •
          F (F2 (((√2 : ℝ) • w).re, ((√2 : ℝ) • w).im)) =
      ((2 * π)⁻¹ * exp (-Complex.normSq w)) • F w := by
    intro w
    have ht : F2 (((√2 : ℝ) • w).re, ((√2 : ℝ) • w).im) = w := by
      have h2 : (√2 : ℝ) ≠ 0 := by positivity
      unfold F2
      apply Complex.ext <;>
        simp [Complex.div_re, Complex.div_im, Complex.normSq_ofReal] <;>
        field_simp <;> rw [hs] <;> ring
    rw [ht, Grothe.LowerAnalytic.gaussianPDFReal_mul]
    congr 3
    simp only [Complex.smul_re, Complex.smul_im, smul_eq_mul, Complex.normSq_apply]
    rw [mul_pow, mul_pow, hs]
    ring
  simp_rw [hp] at hscale
  have hnorm : (∫ z : ℂ, (π⁻¹ * exp (-Complex.normSq z)) • F z) =
      (2 : ℝ) • ∫ z : ℂ, ((2 * π)⁻¹ * exp (-Complex.normSq z)) • F z := by
    rw [← integral_smul]
    congr 1
    ext z
    rw [smul_smul]
    congr 1
    field_simp
  rw [hnorm, hscale, smul_smul]
  norm_num

/-- Exponential tilting of the complex Gaussian is a change of radial scale. -/
theorem integral_gaussC_tilt (F : ℂ → ℂ) (hF : Measurable F)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z, exp (-(rate - 1) * Complex.normSq z) • F z ∂gaussC) =
      rate⁻¹ • ∫ z, F ((√rate)⁻¹ • z) ∂gaussC := by
  rw [integral_gaussC_eq_volume_complex _ (by fun_prop),
    integral_gaussC_eq_volume_complex _ (by fun_prop)]
  have hs : (√rate) ^ 2 = rate := Real.sq_sqrt hrate.le
  have hn : √rate ≠ 0 := (Real.sqrt_pos.2 hrate).ne'
  have ht : ∀ z : ℂ, Complex.normSq ((√rate) • z) = rate * Complex.normSq z := by
    intro z
    simp only [Complex.normSq_eq_norm_sq, norm_smul, Real.norm_eq_abs,
      abs_of_nonneg (Real.sqrt_nonneg rate), mul_pow, hs]
  have hscale := Measure.integral_comp_smul (μ := (volume : Measure ℂ))
    (fun z : ℂ => (π⁻¹ * exp (-Complex.normSq z)) • F ((√rate)⁻¹ • z)) √rate
  rw [Complex.finrank_real_complex, hs, abs_of_pos (inv_pos.2 hrate)] at hscale
  rw [← hscale]
  congr 1
  ext z
  simp only [ht, smul_smul, inv_mul_cancel₀ hn, one_smul]
  congr 1
  rw [mul_assoc, ← exp_add]
  congr 2
  ring

/-- The exact mixed monomial moment after any positive Gaussian tilt. -/
theorem integral_moment_damped (a b : ℕ) {rate : ℝ} (hrate : 0 < rate) :
    (∫ z, z ^ a * conj z ^ b * (exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      if a = b then (a.factorial : ℂ) / (rate : ℂ) ^ (a + 1) else 0 := by
  have ht := integral_gaussC_tilt (fun z => z ^ a * conj z ^ b) (by fun_prop) hrate
  have hp : ∀ z : ℂ, ((√rate)⁻¹ • z) ^ a * conj ((√rate)⁻¹ • z) ^ b =
      ((√rate)⁻¹ ^ (a + b)) • (z ^ a * conj z ^ b) := by
    intro z
    simp only [Complex.real_smul, mul_pow, map_mul, Complex.conj_ofReal, pow_add]
    push_cast
    ring
  simp_rw [hp] at ht
  rw [integral_smul, smul_smul, integral_moment] at ht
  have he : (∫ z, z ^ a * conj z ^ b *
      (exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      ∫ z, exp (-(rate - 1) * Complex.normSq z) • (z ^ a * conj z ^ b) ∂gaussC := by
    congr 1
    ext z
    simp only [Complex.real_smul]
    ring
  rw [he, ht]
  split_ifs with hab
  · subst b
    have hs : (√rate) ^ 2 = rate := Real.sq_sqrt hrate.le
    have hp : rate⁻¹ * (√rate)⁻¹ ^ (a + a) = (rate ^ (a + 1))⁻¹ := by
      rw [← two_mul a, pow_mul, inv_pow, hs, pow_succ]
      field_simp [hrate.ne']
    rw [hp, Complex.real_smul, Complex.ofReal_inv, Complex.ofReal_pow]
    ring
  · simp

/-- Radial polynomial moments remain integrable at every positive Gaussian scale. -/
theorem integrable_normSq_pow_damped (n : ℕ) {rate : ℝ} (hrate : 0 < rate) :
    Integrable (fun z : ℂ => Complex.normSq z ^ n *
      exp (-(rate - 1) * Complex.normSq z)) gaussC := by
  have hi : Integrable (fun z : ℂ => z ^ n * conj z ^ n *
      (exp (-(rate - 1) * Complex.normSq z) : ℂ)) gaussC := by
    by_contra hi
    have h := integral_moment_damped n n hrate
    rw [integral_undef hi, ite_eq_left rfl] at h
    have hn : (n.factorial : ℂ) ≠ 0 := by exact_mod_cast n.factorial_ne_zero
    have hrateC : (rate : ℂ) ≠ 0 := by exact_mod_cast hrate.ne'
    exact (div_ne_zero hn (pow_ne_zero _ hrateC)) h.symm
  have hp : ∀ z : ℂ, z ^ n * conj z ^ n *
      (exp (-(rate - 1) * Complex.normSq z) : ℂ) =
      ((Complex.normSq z ^ n * exp (-(rate - 1) * Complex.normSq z) : ℝ) : ℂ) := by
    intro z
    rw [← mul_pow, Complex.mul_conj]
    push_cast
    rfl
  simpa only [hp, RCLike.ofReal_re] using hi.re

/-- Every mixed monomial is integrable after a positive Gaussian tilt. -/
theorem integrable_monomial_damped (a b : ℕ) {rate : ℝ} (hrate : 0 < rate) :
    Integrable (fun z : ℂ => z ^ a * conj z ^ b *
      (exp (-(rate - 1) * Complex.normSq z) : ℂ)) gaussC := by
  refine ((integrable_normSq_pow_damped 0 hrate).add
    (integrable_normSq_pow_damped (a + b) hrate)).mono' (by fun_prop)
      (Filter.Eventually.of_forall fun z => ?_)
  simp only [Pi.add_apply, pow_zero, one_mul, norm_mul, norm_pow, Complex.norm_conj,
    Complex.norm_real, Real.norm_eq_abs, abs_of_pos (exp_pos _),
    ← pow_add, Complex.normSq_eq_norm_sq, ← pow_mul]
  have hp : ‖z‖ ^ (a + b) ≤ 1 + ‖z‖ ^ (2 * (a + b)) := by
    rcases le_total ‖z‖ 1 with hz | hz
    · have h : ‖z‖ ^ (a + b) ≤ 1 := pow_le_one₀ (norm_nonneg z) hz
      have hn : 0 ≤ ‖z‖ ^ (2 * (a + b)) := by positivity
      linarith
    · have h := pow_le_pow_right₀ hz (show a + b ≤ 2 * (a + b) by omega)
      linarith
  simpa only [add_mul, one_mul] using mul_le_mul_of_nonneg_right hp (le_of_lt
    (exp_pos (-(rate - 1) * ‖z‖ ^ 2)))

private lemma monomial_damped_prod_factor (a b c d : ℕ) (rate rate' : ℝ) (z : ℂ × ℂ) :
    z.1 ^ a * conj z.1 ^ b * z.2 ^ c * conj z.2 ^ d *
      (exp (-(rate - 1) * Complex.normSq z.1 -
        (rate' - 1) * Complex.normSq z.2) : ℂ) =
    (z.1 ^ a * conj z.1 ^ b * (exp (-(rate - 1) * Complex.normSq z.1) : ℂ)) *
      (z.2 ^ c * conj z.2 ^ d * (exp (-(rate' - 1) * Complex.normSq z.2) : ℂ)) := by
  rw [sub_eq_add_neg, ← neg_mul, exp_add]
  push_cast
  ring

/-- Products of damped mixed monomials are integrable in independent coordinates. -/
theorem integrable_monomial_damped_prod (a b c d : ℕ) {rate rate' : ℝ}
    (hrate : 0 < rate) (hrate' : 0 < rate') :
    Integrable (fun z : ℂ × ℂ => z.1 ^ a * conj z.1 ^ b * z.2 ^ c * conj z.2 ^ d *
      (exp (-(rate - 1) * Complex.normSq z.1 -
        (rate' - 1) * Complex.normSq z.2) : ℂ)) (gaussC.prod gaussC) := by
  simp_rw [monomial_damped_prod_factor]
  exact (integrable_monomial_damped a b hrate).mul_prod
    (integrable_monomial_damped c d hrate')

/-- Independent complex Gaussian coordinates have product damped moments. -/
theorem integral_moment_damped_prod (a b c d : ℕ) {rate rate' : ℝ}
    (hrate : 0 < rate) (hrate' : 0 < rate') :
    (∫ z : ℂ × ℂ, z.1 ^ a * conj z.1 ^ b * z.2 ^ c * conj z.2 ^ d *
      (exp (-(rate - 1) * Complex.normSq z.1 -
        (rate' - 1) * Complex.normSq z.2) : ℂ) ∂gaussC.prod gaussC) =
      (if a = b then (a.factorial : ℂ) / (rate : ℂ) ^ (a + 1) else 0) *
        (if c = d then (c.factorial : ℂ) / (rate' : ℂ) ^ (c + 1) else 0) := by
  simp_rw [monomial_damped_prod_factor]
  rw [integral_prod_mul
    (fun z : ℂ => z ^ a * conj z ^ b * (exp (-(rate - 1) * Complex.normSq z) : ℂ))
    (fun z : ℂ => z ^ c * conj z ^ d * (exp (-(rate' - 1) * Complex.normSq z) : ℂ)),
    integral_moment_damped a b hrate, integral_moment_damped c d hrate']

end

end Grothe.UpperChaos
