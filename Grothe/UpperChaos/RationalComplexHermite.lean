import Grothe.UpperChaos.ComplexHermite
import Mathlib.Algebra.MvPolynomial.PDeriv

/-!
# Rational coefficients for complex Hermite polynomials

The rational recursion uses exactly the existing variable and creation-operator
conventions: variable 0 is `z` and variable 1 is `conj z`. This module only
establishes the coefficient-cast identity, not a phase-source or Wick formula.

Agent-ID: codex-8c4d
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalComplexHermite

noncomputable section

abbrev RatPoly := MvPolynomial (Fin 2) ℚ

/-- The existing first creation operator, over rational coefficients. -/
def ratA0 (f : RatPoly) : RatPoly := X 0 * f - pderiv 1 f

/-- The existing second creation operator, over rational coefficients. -/
def ratA1 (f : RatPoly) : RatPoly := X 1 * f - pderiv 0 f

/-- The complex Hermite recursion, constructed over the rationals. -/
def ratH (p q : ℕ) : RatPoly := ratA0^[p] (ratA1^[q] 1)

theorem ratH_succ_left (p q : ℕ) : ratH (p + 1) q = ratA0 (ratH p q) := by
  simp [ratH, Function.iterate_succ_apply']

theorem ratH_zero_succ (q : ℕ) : ratH 0 (q + 1) = ratA1 (ratH 0 q) := by
  simp [ratH, Function.iterate_succ_apply']

/-- Casting coefficients commutes with the first creation operator. -/
theorem map_ratA0 (f : RatPoly) :
    MvPolynomial.map (Rat.castHom ℂ) (ratA0 f) =
      A0 (MvPolynomial.map (Rat.castHom ℂ) f) := by
  simp [ratA0, A0, MvPolynomial.pderiv_map]

/-- Casting coefficients commutes with the second creation operator. -/
theorem map_ratA1 (f : RatPoly) :
    MvPolynomial.map (Rat.castHom ℂ) (ratA1 f) =
      A1 (MvPolynomial.map (Rat.castHom ℂ) f) := by
  simp [ratA1, A1, MvPolynomial.pderiv_map]

/-- The source complex Hermite polynomial is the coefficient cast of the
corresponding rational polynomial for every pair of natural indices. -/
theorem map_ratH (p q : ℕ) :
    MvPolynomial.map (Rat.castHom ℂ) (ratH p q) = H p q := by
  induction p with
  | zero =>
      induction q with
      | zero => simp [ratH, H]
      | succ q ih =>
          rw [ratH_zero_succ, H_zero_succ, map_ratA1, ih]
  | succ p ih =>
      rw [ratH_succ_left, H_succ_left, map_ratA0, ih]

end
end Grothe.UpperChaos.RationalComplexHermite
