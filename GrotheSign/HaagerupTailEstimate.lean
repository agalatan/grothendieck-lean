import Mathlib.Tactic

/-!
# The rational tail comparison in the Haagerup starting-case argument

The ratio `67/96 = 1.206/1.728` makes the final exponential comparison a rational inequality.
The conservative threshold `0.08344 = 0.56 * (1 - 0.851)` is usable once the corresponding
analytic lower and upper estimates have been certified. This module proves only the rational
comparison at every index at least nine; it supplies no analytic contour estimate.

Agent-ID: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

private theorem haagerup_tail_ratio_succ_lt (k : ℕ) (hk : 1 ≤ k) :
    4 * (2 * ((k + 1 : ℕ) : ℚ) + 1) * (67 / 96 : ℚ) ^ (2 * (k + 1) + 1) <
      4 * (2 * (k : ℚ) + 1) * (67 / 96 : ℚ) ^ (2 * k + 1) := by
  have hk' : (1 : ℚ) ≤ k := by exact_mod_cast hk
  have hlin : (2 * (k : ℚ) + 3) * (67 / 96 : ℚ) ^ 2 < 2 * (k : ℚ) + 1 := by
    norm_num
    linarith
  have hp : 0 < (67 / 96 : ℚ) ^ (2 * k + 1) := by positivity
  rw [show 2 * (k + 1) + 1 = (2 * k + 1) + 2 by omega, pow_add]
  calc
    _ = 4 * (((2 * (k : ℚ) + 3) * (67 / 96 : ℚ) ^ 2) *
        (67 / 96 : ℚ) ^ (2 * k + 1)) := by push_cast; ring
    _ < 4 * ((2 * (k : ℚ) + 1) * (67 / 96 : ℚ) ^ (2 * k + 1)) :=
      mul_lt_mul_of_pos_left (mul_lt_mul_of_pos_right hlin hp) (by norm_num)
    _ = _ := by ring

/-- The exact rational comparison needed after the first eight coefficients have been checked. -/
theorem haagerup_tail_ratio_lt (k : ℕ) (hk : 9 ≤ k) :
    4 * (2 * (k : ℚ) + 1) * (67 / 96 : ℚ) ^ (2 * k + 1) < 1043 / 12500 := by
  induction k, hk using Nat.le_induction with
  | base => norm_num
  | succ k hk ih => exact (haagerup_tail_ratio_succ_lt k (by omega)).trans ih

/-- The same exact comparison over the reals, with no transcendental estimates involved. -/
theorem haagerup_tail_ratio_lt_real (k : ℕ) (hk : 9 ≤ k) :
    4 * (2 * (k : ℝ) + 1) * (67 / 96 : ℝ) ^ (2 * k + 1) < 1043 / 12500 := by
  have h : ((4 * (2 * (k : ℚ) + 1) * (67 / 96 : ℚ) ^ (2 * k + 1) : ℚ) : ℝ) <
      ((1043 / 12500 : ℚ) : ℝ) := Rat.cast_lt.mpr (haagerup_tail_ratio_lt k hk)
  push_cast at h
  exact h

end GrotheSign
