import Grothe.UpperChaos.HermiteTranslationAlgebra

/-!
# Polynomial identities for the Gaussian shift

A shift of the real coordinate translates both formal variables together. Conjugating the
first slot of the Hermite inner product therefore conjugates the displacement as well.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open Complex MvPolynomial Grothe.UpperChaos Grothe.UpperChaos.HermiteTranslation
open scoped ComplexConjugate

noncomputable section

/-- Formal real-coordinate translation evaluates with the same shift in both coordinates. -/
theorem ev_simultaneousShift (w δ : ℂ) (P : CPoly) :
    ev w (simultaneousShift δ P) = eval ![w + δ, conj w + δ] P := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [simultaneousShift, ev]
  | add P Q hP hQ => simpa only [map_add, ev] using congrArg₂ (· + ·) hP hQ
  | mul_X P i hP =>
    rw [map_mul, simultaneousShift_X]
    simp only [ev, map_mul, map_add, eval_C, eval_X] at hP ⊢
    rw [hP]
    congr 1
    fin_cases i <;> simp [zv]

/-- Conjugation of formal evaluation conjugates the common displacement. -/
theorem conjP_simultaneousShift (δ : ℂ) (P : CPoly) :
    conjP (simultaneousShift δ P) = simultaneousShift (conj δ) (conjP P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [conjP_C]
  | add P Q hP hQ => simp only [map_add, hP, hQ]
  | mul_X P i hP =>
    simp only [map_mul, simultaneousShift_X, map_add, conjP_X, conjP_C, hP]

/-- The conjugated translated mode is the shifted conjugate polynomial. -/
theorem conj_ev_simultaneousShift (w δ : ℂ) (P : CPoly) :
    conj (ev w (simultaneousShift δ P)) =
      eval ![w + conj δ, conj w + conj δ] (conjP P) := by
  rw [← ev_conjP, conjP_simultaneousShift, ev_simultaneousShift]

/-- For an imaginary displacement, both conjugated formal coordinates move by `-I*b`. -/
theorem conj_ev_imaginaryShift (w : ℂ) (b : ℝ) (P : CPoly) :
    conj (ev w (simultaneousShift (I * (b : ℂ)) P)) =
      eval ![(w.re : ℂ) - I * (b : ℂ) + I * (w.im : ℂ),
        (w.re : ℂ) - I * (b : ℂ) - I * (w.im : ℂ)] (conjP P) := by
  rw [conj_ev_simultaneousShift]
  apply congrArg (fun v : Fin 2 → ℂ ↦ eval v (conjP P))
  funext i
  fin_cases i <;>
    apply Complex.ext <;>
    simp [Complex.mul_re, Complex.mul_im] <;>
    ring

end

end Grothe.UpperQuad.GaussianShift

/-- info: 'Grothe.UpperQuad.GaussianShift.conj_ev_imaginaryShift' depends on axioms:
[propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperQuad.GaussianShift.conj_ev_imaginaryShift
