import Grothe.UpperQuad.PhasePolynomialComplex
import Grothe.UpperChaos.Charge

/-!
# Parity of the complex phase and formal Hermite factors

Simultaneously reversing the radial coordinate and both auxiliary coordinates preserves the
production phase. Reversing both formal Hermite arguments gives the sign of its total degree.
These identities supply the parity factors needed for descent of the twisted radial integrand
through the square map. They use the source formula and polynomial rotation, without a phase
bound or a numerical certificate.

Agent-ID: codex-1a87. Refs #339, #345, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PhasePolynomialParity

open Complex MvPolynomial Grothe.UpperChaos
open PhasePolynomialComplex FinitePolynomialMehler
open scoped ComplexConjugate

noncomputable section

/-- Reversing all three coordinates preserves the actual complex phase. -/
theorem phaseComplex_neg_all (y : ℝ) (r x : ℂ) :
    phaseComplex (-y) (-r) (-x) = phaseComplex y r x := by
  have hpow (n : ℕ) : (-r) ^ (2 * n) = r ^ (2 * n) := by
    simp only [pow_mul, neg_sq]
  simp only [phaseComplex, eval_phasePolynomial_pair, neg_sq, Complex.ofReal_neg, hpow,
    neg_mul_neg]
  ring

private lemma eval_rotP_neg (P : CPoly) (z₁ z₂ : ℂ) :
    eval ![z₁, z₂] (rotP (-1) P) = eval ![-z₁, -z₂] P := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [rotP]
  | add P Q hP hQ => simp only [map_add, hP, hQ]
  | mul_X P i hP =>
    simp only [map_mul, hP]
    congr 1
    fin_cases i <;> simp [rotP]

/-- The existing Hermite rotation identity holds for independent complex arguments. -/
theorem Hf_neg_neg (p q : ℕ) (z₁ z₂ : ℂ) :
    Mehler.Hf p q (-z₁) (-z₂) =
      (-1 : ℂ) ^ (p + q) * Mehler.Hf p q z₁ z₂ := by
  rw [← PolynomialHermite.eval_H, ← eval_rotP_neg,
    rotP_H (c := (-1 : ℂ)) (by norm_num)]
  simp only [map_mul, eval_C, map_neg, map_one, ← pow_add, PolynomialHermite.eval_H]

/-- Hermite normalization leaves the total-degree parity unchanged. -/
theorem normalizedHf_neg_neg (p q : ℕ) (z₁ z₂ : ℂ) :
    normalizedHf p q (-z₁) (-z₂) =
      (-1 : ℂ) ^ (p + q) * normalizedHf p q z₁ z₂ := by
  simp only [normalizedHf, Hf_neg_neg]
  ring

end

end Grothe.UpperQuad.PhasePolynomialParity
