import Grothe.UpperChaos.QuadraticPolynomialMoments

/-!
# Rational execution of the finite correlated moment formula

Agent-ID: codex-2ca4. Complete WIP source, awaiting compilation.

This uses the same finite Wick sum, balance test and inverse-rate factors as
the analytic evaluator. Casting is proved directly from the definitions.
Convergence hypotheses belong to the integral theorem; no positivity is
needed for equality of the two total finite algebraic expressions.
-/

namespace Grothe.UpperChaos.RationalQuadraticMoments

def wickCoeff (A B : ℚ) (p q k : ℕ) : ℚ :=
  (p.choose k : ℚ) * (q.choose k : ℚ) *
    (-(B / A)) ^ ((p - k) + (q - k)) *
      (k.factorial : ℚ) / A ^ (k + 1)

def momentValue (A B C : ℚ) (p q r s : ℕ) : ℚ :=
  ∑ k ∈ Finset.range (min p q + 1), wickCoeff A B p q k *
    (if (p - k) + r = (q - k) + s then
      (((p - k) + r).factorial : ℚ) /
        ((A * C - B ^ 2) / A) ^ (((p - k) + r) + 1)
    else 0)

theorem cast_wickCoeff (A B : ℚ) (p q k : ℕ) :
    (wickCoeff A B p q k : ℂ) =
      QuadraticPolynomialMoments.wickCoeff (A : ℝ) (B : ℝ) p q k := by
  unfold wickCoeff QuadraticPolynomialMoments.wickCoeff
  push_cast

/-- Executable rational arithmetic equals the analytic finite evaluator,
including its unnormalized Gaussian mass. -/
theorem cast_momentValue (A B C : ℚ) (p q r s : ℕ) :
    (momentValue A B C p q r s : ℂ) =
      QuadraticPolynomialMoments.momentValue (A : ℝ) (B : ℝ) (C : ℝ) p q r s := by
  classical
  unfold momentValue QuadraticPolynomialMoments.momentValue
  rw [Rat.cast_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Rat.cast_mul, cast_wickCoeff]
  by_cases h : (p - k) + r = (q - k) + s
  · simp only [if_pos h]
    push_cast
  · simp only [if_neg h, Rat.cast_zero]

end Grothe.UpperChaos.RationalQuadraticMoments
