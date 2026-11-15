import Mathlib

/-!
# Algebra for the sharp quadratic phase remainder

The phase remainder reduces to a polynomial inequality in a nonnegative radius `s` and an
angular defect `u ∈ [0, 2]`. Its squared norm is bounded by four times the squared perturbation
energy. This elementary estimate supplies the coefficient `2` in the phase Taylor bound.

Agent-ID: codex-c8a4. Refs #369.
-/

namespace Grothe.Haag

/-- Polynomial estimate for the squared phase Taylor remainder, in radius and angular defect
coordinates. -/
theorem phase_taylor_polynomial_le (s u : ℝ) (hs : 0 ≤ s) (hu0 : 0 ≤ u) (hu2 : u ≤ 2) :
    u ^ 2 + (s - 1) ^ 2 * (2 * u - u ^ 2) ≤ 4 * ((s - 1) ^ 2 + 2 * s * u) ^ 2 := by
  by_cases hs8 : (1 : ℝ) / 8 ≤ s
  · have h8 : 0 ≤ 8 * s - 1 := by linarith
    have h17 : 0 ≤ 17 * s - 2 := by linarith
    have hfirst : 0 ≤ 2 * u * (s - 1) ^ 2 * (8 * s - 1) := by positivity
    have hsecond : 0 ≤ u ^ 2 * s * (17 * s - 2) := by positivity
    nlinarith [sq_nonneg ((s - 1) ^ 2)]
  · have hs8' : s ≤ (1 : ℝ) / 8 := (lt_of_not_ge hs8).le
    have ha : (s - 1) ^ 2 ≤ 1 := by nlinarith
    have hb : 0 ≤ 2 * u - u ^ 2 := by nlinarith
    have herror : u ^ 2 + (s - 1) ^ 2 * (2 * u - u ^ 2) ≤ 2 * u := by
      nlinarith [mul_nonneg (sub_nonneg.mpr ha) hb]
    by_cases hu1 : 1 ≤ u
    · have henergy : 1 ≤ (s - 1) ^ 2 + 2 * s * u := by
        nlinarith [mul_nonneg hs (sub_nonneg.mpr hu1)]
      nlinarith [sq_nonneg ((s - 1) ^ 2 + 2 * s * u - 1)]
    · have hu1' : u ≤ 1 := (lt_of_not_ge hu1).le
      have henergy : (49 : ℝ) / 64 ≤ (s - 1) ^ 2 + 2 * s * u := by
        nlinarith [sq_nonneg (s - (1 : ℝ) / 8), mul_nonneg hs hu0]
      nlinarith [sq_nonneg ((s - 1) ^ 2 + 2 * s * u - (49 : ℝ) / 64)]

end Grothe.Haag
