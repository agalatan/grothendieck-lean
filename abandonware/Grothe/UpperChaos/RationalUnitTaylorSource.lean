import Grothe.UpperChaos.RationalComplexHermite
import Grothe.UpperChaos.RationalPhaseImaginary
import Grothe.UpperChaos.GradedUnitBasis
import Mathlib.Algebra.MvPolynomial.Rename

/-!
# Rational four-variable source for a unit Hermite mode

The Hermite polynomials and the undamped phase source are built over `ℚ`.
The single real Hermite normalization factor remains outside the polynomial.
No Gaussian integration or numerical enclosure is asserted.

Agent-ID: codex-8c4d
-/

open Complex MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.RationalUnitTaylorSource

open Grothe.UpperChaos.RationalComplexHermite
open Grothe.UpperChaos.RationalPhaseInvariant
open Grothe.UpperChaos.RationalPhaseImaginary

noncomputable section

/-- The two Hermite variable pairs inside `(z, conj z, w, conj w)`. -/
def firstVariables : Fin 2 → Fin 4 := ![0, 1]
def secondVariables : Fin 2 → Fin 4 := ![2, 3]

def firstHermiteQ (p q : ℕ) : RatPoly4 :=
  MvPolynomial.rename firstVariables (ratH p q)

def secondHermiteQ (p q : ℕ) : RatPoly4 :=
  MvPolynomial.rename secondVariables (ratH p q)

/-- A renamed rational Hermite polynomial evaluates to the existing complex
Hermite polynomial whenever its two variables are assigned `(v, conj v)`. -/
theorem eval_rename_ratH (z w v : ℂ) (vars : Fin 2 → Fin 4) (p q : ℕ)
    (hvars : (![z, conj z, w, conj w] : Fin 4 → ℂ) ∘ vars = zv v) :
    evalQ z w (MvPolynomial.rename vars (ratH p q)) = ev v (H p q) := by
  unfold evalQ
  rw [MvPolynomial.eval₂Hom_rename, hvars]
  change MvPolynomial.eval₂ (Rat.castHom ℂ) (zv v) (ratH p q) = ev v (H p q)
  rw [MvPolynomial.eval₂_eq_eval_map, map_ratH]
  rfl

theorem eval_firstHermiteQ (z w : ℂ) (p q : ℕ) :
    evalQ z w (firstHermiteQ p q) = ev z (H p q) := by
  apply eval_rename_ratH z w z firstVariables p q
  funext i
  fin_cases i <;> simp [firstVariables, zv]

theorem eval_secondHermiteQ (z w : ℂ) (p q : ℕ) :
    evalQ z w (secondHermiteQ p q) = ev w (H p q) := by
  apply eval_rename_ratH z w w secondVariables p q
  funext i
  fin_cases i <;> simp [secondVariables, zv]

/-- The unnormalized rational polynomial in the unit mode's undamped source;
Hermite indices are swapped because the source conjugates the basis mode. -/
def unitSourceQ (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) : RatPoly4 :=
  firstHermiteQ (i.1.val - i.2.2.val) (i.1.val + 1 - i.2.1.val) *
    secondHermiteQ i.2.2.val i.2.1.val *
      (imaginaryFactorQ * phaseInvariantQ ts) ^ j

/-- The existing unit-mode conditional source slice is evaluation of the
rational polynomial times exactly one Hermite normalization factor. -/
theorem eval_unitSourceQ_eq_slice (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) (z w : ℂ) :
    (nrm2 (gradedIdx i) : ℂ) * evalQ z w (unitSourceQ ts i j) =
      ev w (taylorSourceSlice ts j N (gradedUnitCoeff i) z) := by
  rw [ev_taylorSourceSlice, gradedHermiteFn_unit]
  simp only [hfun2, H2, map_mul, Complex.conj_ofReal, conj_ev_H_swap]
  simp only [unitSourceQ, map_mul, map_pow, eval_firstHermiteQ, eval_secondHermiteQ,
    eval_imaginaryFactorQ, eval_phaseInvariantQ]
  simp only [gradedIdx, gradedMode]
  ring

end
end Grothe.UpperChaos.RationalUnitTaylorSource
