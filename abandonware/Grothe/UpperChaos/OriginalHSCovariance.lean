import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.Ring

/-! Determinant algebra for the defined Gaussian coupling matrix.
The polynomial below is the determinant used by the positive quadratic form
and its Gaussian mass calculation. No identification with the historical
operator `HS_{j,I}`, polynomial insertion, or numerical tail estimate is asserted.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.OriginalHSCovariance

/-- Determinant polynomial for the defined two-by-two Gaussian form. -/
def delta (a n R P Q : ℝ) : ℝ :=
  1 - a ^ 2 * (R ^ 2 + P * Q) - n ^ 2 * R * (P + Q) +
    (a ^ 2 - n ^ 2) ^ 2 * R ^ 2 * P * Q

theorem first_block_det (a n R P Q : ℝ) :
    (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P) *
        (1 - n ^ 2 * R * Q - a ^ 2 * P * Q) -
      (a * n) ^ 2 * R * Q * (R + P) ^ 2 = delta a n R P Q := by
  unfold delta
  ring

end Grothe.UpperChaos.OriginalHSCovariance
