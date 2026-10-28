import Mathlib.Tactic

/-!
Integer-scaled recurrence for the Legendre root certificates. This provides
exact arithmetic at a rational argument; root existence, uniqueness and
Gauss quadrature properties are separate obligations. Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0LegendreInteger

/-- Successive values of the standard Legendre recurrence at `x`. -/
noncomputable def realPair (x : ℝ) : ℕ → ℝ × ℝ
  | 0 => (1, x)
  | k + 1 =>
      let p := realPair x k
      (p.2, (((2 * k + 3 : ℕ) : ℝ) * x * p.2 - ((k + 1 : ℕ) : ℝ) * p.1) /
        ((k + 2 : ℕ) : ℝ))

/-- The recurrence scaled by `k! D^k`, with `x = X / D`. -/
def integerPair (X D : ℤ) : ℕ → ℤ × ℤ
  | 0 => (1, X)
  | k + 1 =>
      let p := integerPair X D k
      (p.2, ((2 * k + 3 : ℕ) : ℤ) * X * p.2 -
        (((k + 1 : ℕ) : ℤ) ^ 2) * D ^ 2 * p.1)

/-- Integer values evaluate the same recurrence at the exact rational input. -/
theorem integerPair_sound (X D : ℤ) (hD : D ≠ 0) (k : ℕ) :
    let x : ℝ := (X : ℝ) / (D : ℝ)
    ((integerPair X D k).1 : ℝ) = (k.factorial : ℝ) * (D : ℝ)^k * (realPair x k).1 ∧
    ((integerPair X D k).2 : ℝ) = ((k + 1).factorial : ℝ) * (D : ℝ)^(k + 1) * (realPair x k).2 := by
  have hDr : (D : ℝ) ≠ 0 := by exact_mod_cast hD
  induction k with
  | zero =>
      simp [integerPair, realPair, div_eq_mul_inv, hDr, mul_comm, mul_left_comm]
  | succ k ih =>
      dsimp only at ih ⊢
      simp only [integerPair, realPair, Int.cast_sub,
        Int.cast_mul, Int.cast_pow, Nat.cast_add,
        Nat.cast_mul, Nat.cast_ofNat] at *
      constructor
      · exact ih.2
      · rw [ih.1, ih.2]
        simp only [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one, pow_succ]
        have hk : ((k : ℝ) + 2) ≠ 0 := by positivity
        field_simp
        push_cast
        ring

end Grothe.UpperChaos.Q0LegendreInteger
