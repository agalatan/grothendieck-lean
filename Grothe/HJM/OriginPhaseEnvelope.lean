import Grothe.HJM.OriginPolynomialEnvelope
import Grothe.HJM.OriginPhaseQuotient
import Grothe.HJM.OriginDenominator

/-!
# Polynomial envelopes for the actual rationalized phase quotients

Agent-ID: codex-aa04.

The polynomial envelope closes under the elementary real operations used by
the explicit phase derivatives. Uniform norm floors give bounded reciprocals.
For the phase quotient, its numerator divided differences are polynomials;
the denominator margins already proved for the actual HJM responses therefore
give actual global polynomial envelopes, including the endpoint.
-/

open scoped RealInnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

namespace PolynomialEnvelope

/-- The restriction of any complex polynomial to the real radial axis has a
finite global polynomial envelope. -/
theorem complex_polynomial (p : Polynomial ℂ) :
    PolynomialEnvelope (fun s : ℝ => p.eval (s : ℂ)) := by
  induction p using Polynomial.induction_on' with
  | monomial n a =>
    simpa only [Polynomial.eval_monomial] using (const a).mul (real_id.pow n)
  | add p q hp hq =>
    simpa only [Polynomial.eval_add] using hp.add hq

/-- Pointwise norm domination transfers an existing envelope. -/
theorem of_norm_le {F G : ℝ → ℂ} (hG : PolynomialEnvelope G)
    (hFG : ∀ s : ℝ, 0 ≤ s → ‖F s‖ ≤ ‖G s‖) : PolynomialEnvelope F := by
  rcases hG with ⟨C, hC, d, hG⟩
  exact ⟨C, hC, d, fun s hs => (hFG s hs).trans (hG s hs)⟩

/-- Casting a real norm to the complex scalars preserves its envelope. -/
theorem norm {F : ℝ → ℂ} (hF : PolynomialEnvelope F) :
    PolynomialEnvelope (fun s : ℝ => (‖F s‖ : ℂ)) := by
  rcases hF with ⟨C, hC, d, hF⟩
  refine ⟨C, hC, d, ?_⟩
  intro s hs
  simpa only [Complex.norm_real, norm_norm] using hF s hs

/-- The real inner products in the phase derivative formulas have polynomial
growth by Cauchy--Schwarz. -/
theorem real_inner {F G : ℝ → ℂ} (hF : PolynomialEnvelope F)
    (hG : PolynomialEnvelope G) :
    PolynomialEnvelope (fun s : ℝ => (⟪F s, G s⟫_ℝ : ℂ)) := by
  apply (hF.mul hG).of_norm_le
  intro s _hs
  rw [Complex.norm_real, Real.norm_eq_abs, norm_mul]
  exact abs_real_inner_le_norm (F s) (G s)

/-- A positive uniform norm floor supplies a constant envelope for the
reciprocal; no continuity or compactness argument is required. -/
theorem inv_of_norm_lower {F : ℝ → ℂ} {m : ℝ} (hm : 0 < m)
    (hF : ∀ s : ℝ, 0 ≤ s → m ≤ ‖F s‖) :
    PolynomialEnvelope (fun s : ℝ => (F s)⁻¹) := by
  refine ⟨m⁻¹, (inv_pos.mpr hm).le, 0, ?_⟩
  intro s hs
  simp only [norm_inv, pow_zero, mul_one]
  simpa only [one_div] using one_div_le_one_div_of_le hm (hF s hs)

/-- Dividing a polynomially bounded numerator by a uniformly nonvanishing
denominator preserves polynomial growth. -/
theorem div_of_norm_lower {F G : ℝ → ℂ} (hF : PolynomialEnvelope F) {m : ℝ}
    (hm : 0 < m) (hG : ∀ s : ℝ, 0 ≤ s → m ≤ ‖G s‖) :
    PolynomialEnvelope (fun s : ℝ => F s / G s) := by
  simpa only [div_eq_mul_inv] using hF.mul (inv_of_norm_lower hm hG)

end PolynomialEnvelope

/-- A norm floor for the underlying polynomial controls the rationalized
quotient globally. Its denominator has three nonnegative real factors,
each at least `m`, so the coarse lower bound `m³` suffices. -/
theorem phaseQuotient_polynomialEnvelope (p : Polynomial ℂ) {m : ℝ} (hm : 0 < m)
    (hp : ∀ s : ℝ, 0 ≤ s → m ≤ ‖p.eval (s : ℂ)‖) :
    PolynomialEnvelope (phaseQuotient p) := by
  have hp0 : m ≤ ‖p.eval 0‖ := by
    simpa only [Complex.ofReal_zero] using hp 0 le_rfl
  have hn : ∀ s : ℝ, 0 ≤ s → m ≤ ‖(‖p.eval (s : ℂ)‖ : ℂ)‖ := by
    intro s hs
    simpa only [Complex.norm_real, norm_norm] using hp s hs
  have hden : ∀ s : ℝ, 0 ≤ s → m ^ 3 ≤
      ‖(‖p.eval (s : ℂ)‖ : ℂ) * (‖p.eval 0‖ : ℂ) *
        ((‖p.eval (s : ℂ)‖ : ℂ) + (‖p.eval 0‖ : ℂ))‖ := by
    intro s hs
    have he : (‖p.eval (s : ℂ)‖ : ℂ) * (‖p.eval 0‖ : ℂ) *
        ((‖p.eval (s : ℂ)‖ : ℂ) + (‖p.eval 0‖ : ℂ)) =
        ((‖p.eval (s : ℂ)‖ * ‖p.eval 0‖ *
          (‖p.eval (s : ℂ)‖ + ‖p.eval 0‖) : ℝ) : ℂ) := by
      simp only [Complex.ofReal_mul, Complex.ofReal_add]
    rw [he, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (by positivity)]
    calc
      m ^ 3 = (m * m) * m := by ring
      _ ≤ (‖p.eval (s : ℂ)‖ * ‖p.eval 0‖) *
          (‖p.eval (s : ℂ)‖ + ‖p.eval 0‖) :=
        mul_le_mul
          (mul_le_mul (hp s hs) hp0 hm.le (norm_nonneg _))
          ((hp s hs).trans (le_add_of_nonneg_right (norm_nonneg _)))
          hm.le (mul_nonneg (norm_nonneg _) (norm_nonneg _))
  have hfirst := (PolynomialEnvelope.complex_polynomial p.divX).div_of_norm_lower hm hn
  have hsecond := ((PolynomialEnvelope.const (p.eval 0)).mul
      (PolynomialEnvelope.complex_polynomial (normSqPolynomial p).divX)).div_of_norm_lower
        (pow_pos hm 3) hden
  exact hfirst.sub hsecond

/-- The actual left quotient satisfies the envelope with no additional
analytic hypothesis: the exact denominator margin is already proved. -/
theorem fPhaseQuotient_polynomialEnvelope : PolynomialEnvelope fPhaseQuotient := by
  apply phaseQuotient_polynomialEnvelope leftNumeratorPolynomial
    (m := (1 : ℝ) / 250) (by norm_num)
  intro s hs
  rw [eval_leftNumeratorPolynomial]
  exact (norm_leftNumerator_lower s hs).le

/-- The same actual closure for the asymmetric right quotient. -/
theorem gPhaseQuotient_polynomialEnvelope : PolynomialEnvelope gPhaseQuotient := by
  apply phaseQuotient_polynomialEnvelope rightNumeratorPolynomial
    (m := (1 : ℝ) / 250) (by norm_num)
  intro s hs
  rw [eval_rightNumeratorPolynomial]
  exact (norm_rightNumerator_lower s hs).le

end

end Grothe.HJM.Origin
