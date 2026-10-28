import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Tactic

/-!
# Exact monomial integrals on the normalized square

These identities are independent of the source and polynomial representation.
They give the exact integral of each bivariate monomial on `[-1,1]²`.

Agent-ID: codex-8c4d
-/

open MeasureTheory intervalIntegral

namespace Grothe.UpperChaos.RectangleMonomialIntegral

theorem integral_pow_odd (n : ℕ) (hn : Odd n) :
    (∫ x in (-1 : ℝ)..1, x ^ n) = 0 := by
  rw [integral_pow]
  have hp : (-1 : ℝ) ^ (n + 1) = 1 := by
    rw [pow_succ, hn.neg_one_pow]
    norm_num
  rw [hp]
  simp

theorem integral_pow_even (n : ℕ) (hn : Even n) :
    (∫ x in (-1 : ℝ)..1, x ^ n) = 2 / ((n : ℝ) + 1) := by
  rw [integral_pow]
  have hp : (-1 : ℝ) ^ (n + 1) = -1 := by
    rw [pow_succ, hn.neg_one_pow]
    norm_num
  rw [hp]
  norm_num

/-- A monomial's square integral factors into its one-dimensional integrals. -/
theorem integral_monomial_factor (i j : ℕ) :
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, x ^ i * y ^ j) =
      (∫ x in (-1 : ℝ)..1, x ^ i) * (∫ y in (-1 : ℝ)..1, y ^ j) := by
  simp_rw [intervalIntegral.integral_const_mul]
  rw [intervalIntegral.integral_mul_const]

/-- If either exponent is odd, the exact iterated integral is zero. -/
theorem integral_monomial_odd (i j : ℕ) (h : Odd i ∨ Odd j) :
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, x ^ i * y ^ j) = 0 := by
  rw [integral_monomial_factor]
  rcases h with hi | hj
  · rw [integral_pow_odd i hi, zero_mul]
  · rw [integral_pow_odd j hj, mul_zero]

/-- If both exponents are even, the exact iterated integral is the product
of the two elementary power integrals. -/
theorem integral_monomial_even (i j : ℕ) (hi : Even i) (hj : Even j) :
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, x ^ i * y ^ j) =
      4 / (((i : ℝ) + 1) * ((j : ℝ) + 1)) := by
  rw [integral_monomial_factor, integral_pow_even i hi, integral_pow_even j hj]
  have hi0 : (i : ℝ) + 1 ≠ 0 := by positivity
  have hj0 : (j : ℝ) + 1 ≠ 0 := by positivity
  field_simp [hi0, hj0]
  norm_num

end Grothe.UpperChaos.RectangleMonomialIntegral
