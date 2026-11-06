import Grothe.UpperQuad.GaussianShiftAnalytic
import Grothe.UpperQuad.PhasePolynomialParity
import Grothe.UpperChaos.HermiteConjugation

/-!
# Simultaneous parity of the shifted Gaussian coefficient

Negating the radial coordinate, the complex shift, and the Gaussian integration variable
preserves the production phase. The conjugated Hermite mode contributes its degree sign,
and the fixed unit phase contributes one further minus sign. Multiplication by the primary
Hermite factor cancels this sign on the full graded rectangle.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open Complex MeasureTheory MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.UpperChaos.HermiteTranslation PhasePolynomialParity FinitePolynomialMehler
open scoped ComplexConjugate

private theorem eval_conj_normalizedPolynomial (i : ℕ × ℕ) (z₁ z₂ : ℂ) :
    eval ![z₁, z₂] (conjP (normalizedPolynomial i)) =
      (nrm i.1 i.2 : ℂ) * Mehler.Hf i.2 i.1 z₁ z₂ := by
  simp only [normalizedPolynomial, ← C_mul', map_mul, conjP_C, conjP_H_swap,
    Complex.conj_ofReal, eval_C, PolynomialHermite.eval_H]

/-- Negating both formal arguments gives the total-degree sign of the conjugated mode. -/
theorem eval_conj_normalizedPolynomial_neg (i : ℕ × ℕ) (z₁ z₂ : ℂ) :
    eval ![-z₁, -z₂] (conjP (normalizedPolynomial i)) =
      (-1 : ℂ) ^ (i.1 + i.2) * eval ![z₁, z₂] (conjP (normalizedPolynomial i)) := by
  simp only [eval_conj_normalizedPolynomial, Hf_neg_neg, Nat.add_comm i.2 i.1]
  ring

/-- Simultaneous reversal contributes the Hermite-degree sign and one phase sign,
independently of the phase power. -/
theorem fixedPhaseIntegrand_neg_all (j : ℕ) (r A : ℂ) (i : ℕ × ℕ) (w : ℂ) :
    fixedPhaseIntegrand j (-r) (-A) i (-w) =
      (-1 : ℂ) ^ (i.1 + i.2 + 1) * fixedPhaseIntegrand j r A i w := by
  have hph : Haag.ph (-w) = -Haag.ph w := by
    unfold Haag.ph
    rw [norm_neg, neg_div]
  have hx : (((-w).re : ℝ) : ℂ) - (-A) = -((w.re : ℂ) - A) := by
    simp only [Complex.neg_re, Complex.ofReal_neg]
    ring
  have hvars :
      ![((-w).re : ℂ) - (-A) + I * ((-w).im : ℂ),
        ((-w).re : ℂ) - (-A) - I * ((-w).im : ℂ)] =
      ![-((w.re : ℂ) - A + I * (w.im : ℂ)),
        -((w.re : ℂ) - A - I * (w.im : ℂ))] := by
    ext k
    fin_cases k
    · change ((-w).re : ℂ) - (-A) + I * ((-w).im : ℂ) =
        -((w.re : ℂ) - A + I * (w.im : ℂ))
      simp only [Complex.neg_re, Complex.neg_im, Complex.ofReal_neg]
      ring
    · change ((-w).re : ℂ) - (-A) - I * ((-w).im : ℂ) =
        -((w.re : ℂ) - A - I * (w.im : ℂ))
      simp only [Complex.neg_re, Complex.neg_im, Complex.ofReal_neg]
      ring
  have hexp : -(-A) ^ 2 + 2 * (-A) * ((-w).re : ℂ) =
      -A ^ 2 + 2 * A * (w.re : ℂ) := by
    simp only [neg_sq, Complex.neg_re, Complex.ofReal_neg]
    ring
  unfold fixedPhaseIntegrand
  rw [hph, hvars, hx, Complex.neg_im, phaseComplex_neg_all, hexp,
    eval_conj_normalizedPolynomial_neg, pow_succ]
  ring

/-- Simultaneous radial and shift reversal has parity `c+d+1`, for every natural phase power. -/
theorem coefficient_neg_neg (j : ℕ) (r A : ℂ) (i : ℕ × ℕ) :
    coefficient j (-r) (-A).re (-A).im i =
      (-1 : ℂ) ^ (i.1 + i.2 + 1) * coefficient j r A.re A.im i := by
  rw [coefficient_eq_fixedPhaseIntegral_complex, coefficient_eq_fixedPhaseIntegral_complex]
  calc
    _ = ∫ w, fixedPhaseIntegrand j (-r) (-A) i (-w) ∂gaussC := by
      simpa only [neg_one_mul] using
        (integral_rot_gaussC (-1 : ℂ) (by simp)
          (fixedPhaseIntegrand j (-r) (-A) i)).symm
    _ = _ := by
      simp_rw [fixedPhaseIntegrand_neg_all]
      rw [integral_const_mul]

/-- The primary Hermite parity cancels the conditional parity on the graded rectangle. -/
theorem primary_product_neg_neg (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q)
    (r A : ℂ) :
    Complex.exp (-((-r) ^ 2)) * normalizedHf (q - d) (q + 1 - c) (-r) (-r) *
        coefficient j (-r) (-A).re (-A).im (c, d) =
      Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r *
        coefficient j r A.re A.im (c, d) := by
  have hdegree : (q - d + (q + 1 - c)) + (c + d + 1) = 2 * (q + 1) := by omega
  have hsign : (-1 : ℂ) ^ (q - d + (q + 1 - c)) * (-1 : ℂ) ^ (c + d + 1) = 1 := by
    rw [← pow_add, hdegree, pow_mul]
    norm_num
  rw [neg_sq, normalizedHf_neg_neg, coefficient_neg_neg]
  change _ * ((-1 : ℂ) ^ (q - d + (q + 1 - c)) * _) *
    ((-1 : ℂ) ^ (c + d + 1) * _) = _
  calc
    _ = ((-1 : ℂ) ^ (q - d + (q + 1 - c)) * (-1 : ℂ) ^ (c + d + 1)) *
        (Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r *
          coefficient j r A.re A.im (c, d)) := by ring
    _ = _ := by rw [hsign, one_mul]

end Grothe.UpperQuad.GaussianShift

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms
    ``Grothe.UpperQuad.GaussianShift.coefficient_eq_fixedPhaseIntegral_complex
  for target in #[``Grothe.UpperQuad.GaussianShift.fixedPhaseIntegrand_neg_all,
      ``Grothe.UpperQuad.GaussianShift.coefficient_neg_neg,
      ``Grothe.UpperQuad.GaussianShift.primary_product_neg_neg] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
