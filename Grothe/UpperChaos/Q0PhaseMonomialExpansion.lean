import Grothe.UpperChaos.GradedHermitePhaseSlice
import Mathlib.Algebra.MvPolynomial.Coeff

/-!
# One invariant phase term as two-variable monomials

This is generic algebra for one rational invariant phase term. It keeps the
first coordinate complex and introduces no coefficient-table or numerical
hypothesis. The expansion is intended for the exact Wick evaluator's linearity
bridge; it does not assert any compressed production table or bound.

Agent-ID: codex-8c4d
-/

open Complex MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0PhaseMonomialExpansion

noncomputable section

/-- Exponent pair `(p,q)` in the two complex Hermite variables. -/
def exponentPair (p q : ℕ) : Fin 2 →₀ ℕ :=
  Finsupp.single 0 p + Finsupp.single 1 q

@[simp] theorem exponentPair_zero (p q : ℕ) : exponentPair p q 0 = p := by
  simp [exponentPair]

@[simp] theorem exponentPair_one (p q : ℕ) : exponentPair p q 1 = q := by
  simp [exponentPair]

end
end Grothe.UpperChaos.Q0PhaseMonomialExpansion
