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

/-- A two-variable monomial in ordinary `C`, `X` notation. -/
theorem monomial_exponentPair (p q : ℕ) (v : ℂ) :
    monomial (exponentPair p q) v = C v * X 0 ^ p * X 1 ^ q := by
  rw [monomial_fin_two, exponentPair_zero, exponentPair_one]

/-- Exact complex coefficient of one binomial term of the invariant slice. -/
def phaseMonomialCoeff (a c k : ℕ) (d : ℚ) (z : ℂ) : ℂ :=
  (d : ℂ) * (Complex.normSq z : ℂ) ^ a * (1 / 2 : ℂ) ^ c *
    (c.choose k : ℂ) * conj z ^ k * z ^ (c - k)

/-- A single actual-format invariant term expands into `c+1` monomials.
The exponents are exactly `(b+k, b+c−k)`, before combining collisions
between different source terms. -/
theorem phaseInvariantSlice_single_monomials (a b c : ℕ) (d : ℚ) (z : ℂ) :
    phaseInvariantSlice [((a, b, c), d)] z =
      ∑ k ∈ Finset.range (c + 1),
        monomial (exponentPair (b + k) (b + (c - k)))
          (phaseMonomialCoeff a c k d z) := by
  classical
  simp only [phaseInvariantSlice, List.map_cons, List.map_nil, List.sum_cons,
    List.sum_nil, add_zero]
  simp only [phaseNormSlice, phaseRealSlice, mul_pow, add_pow, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [monomial_exponentPair]
  simp only [phaseMonomialCoeff, map_mul, map_pow, map_natCast]
  rw [pow_add, pow_add]
  ring

end
end Grothe.UpperChaos.Q0PhaseMonomialExpansion
