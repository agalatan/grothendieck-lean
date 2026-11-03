import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Exact algebra behind the recovered weighted Gaussian multiplier calculation.
These scalar identities give the determinant and covariance numerators and
remove square roots from squared transformed polynomial entries. They assert
no Bargmann integral identity, operator estimate, or captured-band bound.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.OriginalHSCovariance

/-- Common determinant of the two two-by-two blocks of `I - M*M`. -/
def delta (a n R P Q : ℝ) : ℝ :=
  1 - a ^ 2 * (R ^ 2 + P * Q) - n ^ 2 * R * (P + Q) +
    (a ^ 2 - n ^ 2) ^ 2 * R ^ 2 * P * Q

theorem first_block_det (a n R P Q : ℝ) :
    (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P) *
        (1 - n ^ 2 * R * Q - a ^ 2 * P * Q) -
      (a * n) ^ 2 * R * Q * (R + P) ^ 2 = delta a n R P Q := by
  unfold delta
  ring

theorem second_block_det (a n R P Q : ℝ) :
    (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * Q) *
        (1 - n ^ 2 * R * P - a ^ 2 * P * Q) -
      (a * n) ^ 2 * R * P * (R + Q) ^ 2 = delta a n R P Q := by
  unfold delta
  ring

/-- Clearing the common determinant removes the apparent radicals from chi-plus. -/
theorem plus_numerator (a n R P Q : ℝ) (h : a + n = 1) :
    R * (1 - n ^ 2 * R * Q - a ^ 2 * P * Q) +
        Q * (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P) -
        2 * a * n * R * Q * (R + P) = R + Q - R * Q * (R + P) := by
  have ha : a = 1 - n := by linarith
  rw [ha]
  ring

theorem minus_numerator (a n R P Q : ℝ) (h : a + n = 1) :
    R * (1 - n ^ 2 * R * P - a ^ 2 * P * Q) +
        P * (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * Q) -
        2 * a * n * R * P * (R + Q) = R + P - R * P * (R + Q) := by
  have ha : a = 1 - n := by linarith
  rw [ha]
  ring

/-- The crossed covariance's numerator, including its own-copy contraction n. -/
theorem lambda_numerator (a n R P Q : ℝ) (h : a + n = 1) :
    delta a n R P Q + n *
      (R * (-a * R + n * Q) * (1 - n * R * P - a * P * Q) +
        P * (n * R - a * Q) * (1 - a * R ^ 2 - n * R * Q)) =
      1 - a * (R ^ 2 + P * Q) + (a - n) * R ^ 2 * P * Q := by
  have ha : a = 1 - n := by linarith
  rw [ha]
  unfold delta
  ring

theorem sqrt_two_block_determinant (d : ℝ) (hd : 0 ≤ d) :
    Real.sqrt (d * d) = d := by
  simpa only [pow_two] using Real.sqrt_sq hd

/-- Squaring each transformed Laguerre entry removes both radial square roots. -/
theorem transformed_entry_sq (c x y u : ℝ) (i j : ℕ)
    (hx : 0 ≤ x) (hy : 0 ≤ y) :
    ((c * Real.sqrt x) ^ i * (c * Real.sqrt y) ^ j * u) ^ 2 =
      (c ^ 2 * x) ^ i * (c ^ 2 * y) ^ j * u ^ 2 := by
  have hp (v : ℝ) (k : ℕ) : (v ^ k) ^ 2 = (v ^ 2) ^ k := by
    rw [← pow_mul, Nat.mul_comm k 2, pow_mul]
  have hcx : (c * Real.sqrt x) ^ 2 = c ^ 2 * x := by
    rw [mul_pow, Real.sq_sqrt hx]
  have hcy : (c * Real.sqrt y) ^ 2 = c ^ 2 * y := by
    rw [mul_pow, Real.sq_sqrt hy]
  rw [mul_pow, mul_pow, hp, hp, hcx, hcy]

end Grothe.UpperChaos.OriginalHSCovariance
