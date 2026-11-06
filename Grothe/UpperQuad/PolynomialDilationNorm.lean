import Grothe.UpperQuad.GaussianGrowth
import Grothe.UpperQuad.PolynomialHermiteNorm
import Grothe.UpperQuad.PolynomialRescale

/-!
# Gaussian norm bounds for polynomial dilation

Integrating the finite Hermite Mehler estimate gives a bound for the Gaussian norm of
`P(√L z, √L conjugate z)`. The parameter `τ` remains explicit, so each finite degree can
choose its own rate below the integrability threshold `(2L - 1)τ < 1`.

Agent-ID: codex-1a87. Refs #339, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialDilationNorm

open MeasureTheory Complex MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open PolynomialHermite PolynomialRescale FinitePolynomialMehler
open scoped ComplexConjugate

noncomputable section

/-- Simultaneous dilation of the two formal polynomial variables by `√L`. -/
def dilate (L : ℝ) (P : CPoly) : CPoly := rescale (Real.sqrt L)⁻¹ P

lemma ev_dilate (L : ℝ) (P : CPoly) (z : ℂ) :
    ev z (dilate L P) = ev ((Real.sqrt L : ℂ) * z) P := by
  simp only [dilate, ev_rescale, Complex.ofReal_inv, inv_inv]

lemma ev_dilate_eq_eval (L : ℝ) (P : CPoly) (z : ℂ) :
    ev z (dilate L P) =
      eval ![(Real.sqrt L : ℂ) * z, (Real.sqrt L : ℂ) * conj z] P := by
  rw [ev_dilate]
  simp only [ev, zv, map_mul, Complex.conj_ofReal]

/-- On a dilated real Gaussian plane, the Mehler exponent is radial. -/
lemma mehlerExp_dilate_re {L τ : ℝ} (hL : 0 ≤ L) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1)
    (z : ℂ) :
    (Mehler.mehlerExp τ ((Real.sqrt L : ℂ) * z)
      ((Real.sqrt L : ℂ) * conj z)).re =
        (2 * L * τ / (1 + τ)) * normSq z := by
  have hz : (z.re : ℂ) + I * (z.im : ℂ) = z := by
    apply Complex.ext <;> simp
  have hzc : (z.re : ℂ) - I * (z.im : ℂ) = conj z := by
    apply Complex.ext <;> simp
  simpa [hz, hzc, Complex.normSq_apply, pow_two] using
    mehlerExp_scaled_pair_re τ hτ0 hτ1 L hL (z.re : ℂ) (z.im : ℂ)

lemma dilation_rate_lt_one {L τ : ℝ} (hτ0 : 0 < τ)
    (hrate : (2 * L - 1) * τ < 1) : 2 * L * τ / (1 + τ) < 1 := by
  have hplus : 0 < 1 + τ := by positivity
  apply (div_lt_iff₀ hplus).2
  nlinarith

/-- Cancellation of the radial Gaussian integral with the Mehler prefactor. -/
lemma dilation_prefactor {L τ : ℝ} (hτ0 : 0 < τ) :
    (1 - τ ^ 2)⁻¹ * (1 - 2 * L * τ / (1 + τ))⁻¹ =
      ((1 - τ) * (1 - (2 * L - 1) * τ))⁻¹ := by
  have hplus : 1 + τ ≠ 0 := by positivity
  have hfactor : (1 - τ ^ 2) * (1 - 2 * L * τ / (1 + τ)) =
      (1 - τ) * (1 - (2 * L - 1) * τ) := by
    field_simp
    ring
  rw [← mul_inv, hfactor]

/-- Integrating finite Mehler controls the Gaussian norm of a dilated polynomial. -/
theorem norm_dilate_sq_le (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N)
    {L τ : ℝ} (hL : 1 ≤ L) (hτ0 : 0 < τ) (hτ1 : τ < 1)
    (hrate : (2 * L - 1) * τ < 1) :
    ‖polynomialLp (dilate L P)‖ ^ 2 ≤ ‖polynomialLp P‖ ^ 2 *
      ((τ ^ N)⁻¹ * ((1 - τ) * (1 - (2 * L - 1) * τ))⁻¹) := by
  have hc := dilation_rate_lt_one hτ0 hrate
  have hpoint (z : ℂ) : ‖ev z (dilate L P)‖ ^ 2 ≤
      ‖polynomialLp P‖ ^ 2 * ((τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ *
        Real.exp ((2 * L * τ / (1 + τ)) * normSq z))) := by
    rw [ev_dilate_eq_eval]
    have h := norm_eval_sq_le P hP τ hτ0 hτ1
      ((Real.sqrt L : ℂ) * z) ((Real.sqrt L : ℂ) * conj z)
    rwa [mehlerExp_dilate_re (by linarith) hτ0.le hτ1] at h
  change ‖(memLp_ev (dilate L P)).toLp (fun z ↦ ev z (dilate L P))‖ ^ 2 ≤ _
  rw [GaussianGrowth.norm_toLp_sq]
  calc
    (∫ z, ‖ev z (dilate L P)‖ ^ 2 ∂gaussC) ≤
        ∫ z, ‖polynomialLp P‖ ^ 2 * ((τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ *
          Real.exp ((2 * L * τ / (1 + τ)) * normSq z))) ∂gaussC := by
      apply integral_mono
        ((memLp_two_iff_integrable_sq_norm (memLp_ev (dilate L P)).aestronglyMeasurable).mp
          (memLp_ev (dilate L P)))
        ((((GaussianGrowth.integrable_exp_normSq _ hc).const_mul _).const_mul _).const_mul _)
      exact hpoint
    _ = _ := by
      rw [integral_const_mul, integral_const_mul, integral_const_mul,
        GaussianGrowth.integral_exp_normSq _ hc, dilation_prefactor hτ0]

/-- The formal complex Hermite polynomial has total degree at most the sum of its indices. -/
lemma totalDegree_H_le (p q : ℕ) : (H p q).totalDegree ≤ p + q := by
  rw [HermiteFallingFactorial.H_eq_fallingFactorial]
  apply totalDegree_finsetSum_le
  intro k _
  calc
    (C ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)) *
        X (0 : Fin 2) ^ (p - k) * X (1 : Fin 2) ^ (q - k)).totalDegree ≤
        (C ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)) *
          X (0 : Fin 2) ^ (p - k)).totalDegree + (X (1 : Fin 2) ^ (q - k) : CPoly).totalDegree :=
      totalDegree_mul _ _
    _ ≤ (0 + (p - k)) + (q - k) := by
      apply Nat.add_le_add
      · simpa only [totalDegree_C, totalDegree_X_pow] using
          (totalDegree_mul
            (C ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)))
            (X (0 : Fin 2) ^ (p - k) : CPoly))
      · simp
    _ ≤ p + q := by omega

/-- The same dilation estimate for a normalized Hermite column. -/
theorem norm_dilate_normalized_H_sq_le (p q : ℕ) {L τ : ℝ} (hL : 1 ≤ L)
    (hτ0 : 0 < τ) (hτ1 : τ < 1) (hrate : (2 * L - 1) * τ < 1) :
    ‖polynomialLp (dilate L ((nrm p q : ℂ) • H p q))‖ ^ 2 ≤
      (τ ^ (p + q))⁻¹ * ((1 - τ) * (1 - (2 * L - 1) * τ))⁻¹ := by
  have hdeg : ((nrm p q : ℂ) • H p q).totalDegree ≤ p + q :=
    (totalDegree_smul_le _ _).trans (totalDegree_H_le p q)
  have h := norm_dilate_sq_le _ hdeg hL hτ0 hτ1 hrate
  rw [polynomialLp_normalized_H (p, q), orthonormal_hvec.norm_eq_one, one_pow, one_mul] at h
  exact h

end

end Grothe.UpperQuad.PolynomialDilationNorm
