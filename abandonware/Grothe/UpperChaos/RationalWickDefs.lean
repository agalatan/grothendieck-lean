import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Basic.Real.Basic
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Fin.VecNotation

/-!
# Rational Wick compiler definitions

The target variables are `(r, b, v, κ)`. These definitions have no dependency
on Gaussian integration or shifted-moment correctness proofs.

Agent-ID: codex-8c4d
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalWickMonomial

noncomputable section

abbrev WickPoly := MvPolynomial (Fin 4) ℚ

/-- Rational Wick moment polynomial in `(r, b, v, κ)`. -/
def wickMomentQ (p q : ℕ) : WickPoly :=
  ∑ j ∈ Finset.range (min p q + 1),
    C ((p.choose j : ℚ) * (q.choose j : ℚ) * (j.factorial : ℚ)) *
      (-(X 2 * X 0)) ^ (p + q - 2 * j) * X 1 ^ (j + 1)

/-- Wick contribution of a source monomial `z^A * conj(z)^B * w^p * conj(w)^q`
after multiplying by the affine kernel's `z + κw` factor. -/
def wickAffineMonomialQ (A B p q : ℕ) : WickPoly :=
  X 0 ^ (A + B) * (X 0 * wickMomentQ p q + X 3 * wickMomentQ (p + 1) q)

/-- Rational polynomial evaluation at the four real compiler variables. -/
def evalWickQ (r b v κ : ℝ) : WickPoly →+* ℝ :=
  MvPolynomial.eval₂Hom (Rat.castHom ℝ) ![r, b, v, κ]

end
end Grothe.UpperChaos.RationalWickMonomial

namespace Grothe.UpperChaos.RationalWickCompiler

open Grothe.UpperChaos.RationalWickMonomial

noncomputable section

/-- Compile each of the rational source polynomial's actual monomials, keeping
its coefficient and the four exponents in source-variable order. -/
def wickCompileQ (P : MvPolynomial (Fin 4) ℚ) : WickPoly :=
  ∑ d ∈ P.support,
    C (P.coeff d) * wickAffineMonomialQ (d 0) (d 1) (d 2) (d 3)

end
end Grothe.UpperChaos.RationalWickCompiler
