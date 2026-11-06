import Grothe.UpperQuad.TwistMatrixBessel

/-!
# Production phase bounds for the finite twisted matrix columns

The literal complex multiplier agrees with the fixed-imaginary-coordinate phase continuation.
Its uniform auxiliary-variable bound combines with the Gaussian dilation estimate and Bessel's
inequality to control every finite matrix column.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorization

open MeasureTheory Complex MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open PolynomialHermite PolynomialDilationNorm
open scoped ComplexConjugate

noncomputable section

local notation "ε" => (Grothe.Upper.phaseEpsQ : ℝ)

private lemma ev_phaseSum_pair (r w : ℂ) :
    ev w (TwistFactorPolynomial.phaseSum r) =
      (phaseTerms.map fun t ↦ (t.2 : ℂ) * r ^ (2 * t.1.1) *
        ((w.re : ℂ) ^ 2 + (w.im : ℂ) ^ 2) ^ t.1.2.1 *
          (r * (w.re : ℂ)) ^ t.1.2.2).sum := by
  have hnorm : (normSq w : ℂ) = (w.re : ℂ) ^ 2 + (w.im : ℂ) ^ 2 := by
    rw [Complex.normSq_apply]
    push_cast
    ring
  have hreal : r / 2 * (w + conj w) = r * (w.re : ℂ) := by
    rw [Complex.add_conj]
    push_cast
    ring
  unfold TwistFactorPolynomial.phaseSum
  simp only [ev, map_list_sum, List.map_map, Function.comp_def]
  apply congrArg List.sum
  apply List.map_congr_left
  intro t _
  change ev w (TwistFactorPolynomial.phaseTerm r t) = _
  rw [TwistFactorPolynomial.ev_phaseTerm, Complex.mul_conj, hnorm, hreal]

private lemma ev_Q_pair (r w : ℂ) :
    ev w (TwistFactorPolynomial.Q r) =
      I * (w.im : ℂ) * r *
        (phaseTerms.map fun t ↦ (t.2 : ℂ) * r ^ (2 * t.1.1) *
          ((w.re : ℂ) ^ 2 + (w.im : ℂ) ^ 2) ^ t.1.2.1 *
            (r * (w.re : ℂ)) ^ t.1.2.2).sum := by
  rw [TwistFactorPolynomial.ev_Q, ev_phaseSum_pair]
  congr 1
  rw [Complex.sub_conj]
  push_cast
  ring

/-- The fixed-imaginary-coordinate phase is the literal complex radial source. -/
theorem I_mul_phaseComplex_eq (r w : ℂ) :
    I * PhasePolynomialComplex.phaseComplex w.im r (w.re : ℂ) =
      Complex.exp (-(ε : ℂ) * r ^ 2) * (Real.exp (-ε * normSq w) : ℂ) *
        ev w (TwistFactorPolynomial.Q r) := by
  have hgauss : (Real.exp (-ε * w.im ^ 2) : ℂ) *
      Complex.exp (-((ε : ℂ) * (r ^ 2 + (w.re : ℂ) ^ 2))) =
        Complex.exp (-(ε : ℂ) * r ^ 2) * (Real.exp (-ε * normSq w) : ℂ) := by
    rw [Complex.ofReal_exp, Complex.ofReal_exp, ← Complex.exp_add, ← Complex.exp_add]
    congr 1
    rw [Complex.normSq_apply]
    push_cast
    ring
  rw [PhasePolynomialComplex.phaseComplex,
    PhasePolynomialComplex.eval_phasePolynomial_pair, ev_Q_pair]
  linear_combination I * (w.im : ℂ) * r *
    (phaseTerms.map fun t ↦ (t.2 : ℂ) * r ^ (2 * t.1.1) *
      ((w.re : ℂ) ^ 2 + (w.im : ℂ) ^ 2) ^ t.1.2.1 *
        (r * (w.re : ℂ)) ^ t.1.2.2).sum * hgauss

/-- The Taylor power includes its one factor of `I` before taking the power. -/
theorem multiplier_eq_phaseComplex_pow (j : ℕ) (r w : ℂ) :
    multiplier j r w = (I * PhasePolynomialComplex.phaseComplex w.im r (w.re : ℂ)) ^ j := by
  have hr : Complex.exp (-(ε : ℂ) * r ^ 2) ^ j =
      Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) := by
    rw [← Complex.exp_nat_mul]
    congr 1
    push_cast
    ring
  have hw : (Real.exp (-ε * normSq w) : ℂ) ^ j =
      (Real.exp (-(j : ℝ) * ε * normSq w) : ℂ) := by
    rw [← Complex.ofReal_pow, ← Real.exp_nat_mul]
    congr 2
    ring
  simp only [I_mul_phaseComplex_eq, mul_pow, hr, hw, multiplier]

/-- On the real radial slice, the multiplier is exactly the actual Taylor phase power. -/
theorem multiplier_real (j : ℕ) (r : ℝ) (w : ℂ) :
    multiplier j (r : ℂ) w = (I * (phiT ((r : ℂ), w) : ℂ)) ^ j := by
  have hw : (w.re : ℂ) + I * (w.im : ℂ) = w := by
    apply Complex.ext <;> simp
  rw [multiplier_eq_phaseComplex_pow, PhasePolynomialComplex.phaseComplex_real, hw]

/-- At real radial parameters, the matrix is the literal damped Hermite coefficient integral. -/
theorem matrixCoefficient_real_eq_integral (j : ℕ) (r : ℝ) (c d g h : ℕ) :
    matrixCoefficient j (r : ℂ) c d g h =
      ∫ w, conj (hfun (c, d) w) * (I * (phiT ((r : ℂ), w) : ℂ)) ^ j *
        hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w) ∂gaussC := by
  rw [matrixCoefficient_eq_integral]
  apply integral_congr_ae
  filter_upwards with w
  simp only [columnSource, multiplier_real, mul_assoc]

/-- The production phase envelope is uniform over the auxiliary Gaussian variable. -/
theorem norm_multiplier_sq_le (j : ℕ) (hj : 0 < j) {τ : ℝ}
    (hτ0 : 0 < τ) (hτ1 : τ < 1) (r w : ℂ) :
    ‖multiplier j r w‖ ^ 2 ≤ (τ ^ (35 * j))⁻¹ * ((1 - τ) ^ 2)⁻¹ *
      Real.exp (4 * ((j : ℝ) * ε) / (1 - τ) * r.im ^ 2) := by
  rw [multiplier_eq_phaseComplex_pow, mul_pow, norm_mul, norm_pow, Complex.norm_I,
    one_pow, one_mul]
  simpa only [Complex.ofReal_im, zero_pow (by decide : 2 ≠ 0), add_zero] using
    PhasePolynomialComplex.norm_phaseComplex_pow_sq_le j hj w.im hτ0 hτ1 r (w.re : ℂ)

private lemma ev_dilate_normalized_H (L : ℝ) (g h : ℕ) (w : ℂ) :
    ev w (dilate L ((nrm g h : ℂ) • H g h)) =
      hfun (g, h) ((Real.sqrt L : ℂ) * w) := by
  rw [ev_dilate]
  exact smul_eval _ _ _

/-- The Gaussian dilation bound in the integral form used by the matrix columns. -/
theorem integral_norm_dilate_hfun_sq_le (j g h : ℕ) {σ : ℝ}
    (hσ0 : 0 < σ) (hσ1 : σ < 1) (hσrate : (2 * rate j - 1) * σ < 1) :
    (∫ w, ‖hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)‖ ^ 2 ∂gaussC) ≤
      (σ ^ (g + h))⁻¹ * ((1 - σ) * (1 - (2 * rate j - 1) * σ))⁻¹ := by
  have hbound := norm_dilate_normalized_H_sq_le g h (one_le_rate j) hσ0 hσ1 hσrate
  change ‖(memLp_ev (dilate (rate j) ((nrm g h : ℂ) • H g h))).toLp
    (fun w ↦ ev w (dilate (rate j) ((nrm g h : ℂ) • H g h)))‖ ^ 2 ≤ _ at hbound
  rw [GaussianGrowth.norm_toLp_sq] at hbound
  simpa only [ev_dilate_normalized_H] using hbound

/-- Phase growth and Hermite dilation control the norm of the actual column source. -/
theorem integral_norm_columnSource_sq_le (j : ℕ) (hj : 0 < j) (r : ℂ) (g h : ℕ)
    {τ σ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1) (hσ0 : 0 < σ) (hσ1 : σ < 1)
    (hσrate : (2 * rate j - 1) * σ < 1) :
    (∫ w, ‖columnSource j r g h w‖ ^ 2 ∂gaussC) ≤
      ((τ ^ (35 * j))⁻¹ * ((1 - τ) ^ 2)⁻¹ *
        Real.exp (4 * ((j : ℝ) * ε) / (1 - τ) * r.im ^ 2)) *
      ((σ ^ (g + h))⁻¹ * ((1 - σ) * (1 - (2 * rate j - 1) * σ))⁻¹) := by
  let E : ℝ := (τ ^ (35 * j))⁻¹ * ((1 - τ) ^ 2)⁻¹ *
    Real.exp (4 * ((j : ℝ) * ε) / (1 - τ) * r.im ^ 2)
  have hE : 0 ≤ E := by dsimp [E]; positivity
  have hH : Integrable
      (fun w ↦ ‖hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)‖ ^ 2) gaussC := by
    have hP := memLp_ev (dilate (rate j) ((nrm g h : ℂ) • H g h))
    simpa only [ev_dilate_normalized_H] using
      (memLp_two_iff_integrable_sq_norm hP.aestronglyMeasurable).mp hP
  calc
    (∫ w, ‖columnSource j r g h w‖ ^ 2 ∂gaussC) ≤
        ∫ w, E * ‖hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)‖ ^ 2 ∂gaussC := by
      apply integral_mono
        ((memLp_two_iff_integrable_sq_norm
          (memLp_columnSource j r g h).aestronglyMeasurable).mp
            (memLp_columnSource j r g h)) (hH.const_mul E)
      intro w
      change ‖multiplier j r w * hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)‖ ^ 2 ≤
        E * ‖hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)‖ ^ 2
      rw [norm_mul, mul_pow]
      exact mul_le_mul_of_nonneg_right (norm_multiplier_sq_le j hj hτ0 hτ1 r w)
        (sq_nonneg _)
    _ = E * ∫ w, ‖hfun (g, h) ((Real.sqrt (rate j) : ℂ) * w)‖ ^ 2 ∂gaussC :=
      integral_const_mul _ _
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (integral_norm_dilate_hfun_sq_le j g h hσ0 hσ1 hσrate) hE

/-- Every finite production matrix column satisfies the phase-times-dilation bound. -/
theorem sum_norm_matrixCoefficient_sq_le_production (S : Finset (ℕ × ℕ))
    (j : ℕ) (hj : 0 < j) (r : ℂ) (g h : ℕ) {τ σ : ℝ}
    (hτ0 : 0 < τ) (hτ1 : τ < 1) (hσ0 : 0 < σ) (hσ1 : σ < 1)
    (hσrate : (2 * rate j - 1) * σ < 1) :
    ∑ cd ∈ S, ‖matrixCoefficient j r cd.1 cd.2 g h‖ ^ 2 ≤
      ((τ ^ (35 * j))⁻¹ * ((1 - τ) ^ 2)⁻¹ *
        Real.exp (4 * ((j : ℝ) * ε) / (1 - τ) * r.im ^ 2)) *
      ((σ ^ (g + h))⁻¹ * ((1 - σ) * (1 - (2 * rate j - 1) * σ))⁻¹) :=
  (sum_norm_matrixCoefficient_sq_le S j r g h).trans
    (integral_norm_columnSource_sq_le j hj r g h hτ0 hτ1 hσ0 hσ1 hσrate)

end

end Grothe.UpperQuad.TwistFactorization
