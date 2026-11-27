import Grothe.UpperSix.Haagerup.GammaDagger
import Grothe.UpperSix.Result
import Grothe.UpperSelector.Bound

/-! # The upper bound for the complex Grothendieck constant

The seven-channel transfer gives a factor of `10^27 / 711968565817136711740669035` for each finite
complex matrix. The rounded bound is `1.404556392`. The six original channels use their
certified heads and Hardy tails. The seventh uses a Gaussian angular selector and a signed
linear preprocessor. Its complete Wiener approximation is proved in `UpperSelector/PhysicalColumn.lean`.
-/

set_option warningAsError true

namespace Grothe.UpperSeven

/-- Admissibility at the exact seven-channel transfer endpoint, for every finite complex matrix. -/
theorem bound : Statement.IsBound ((10 : ℝ) ^ 27 / 711968565817136711740669035) :=
  Haagerup.AngularSelector.isBound

/-- The seven-channel bound rounded upward to nine decimal places. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ 1404556392 / 1000000000 := by
  have h : Statement.complexGrothendieckConstant ≤ (10 : ℝ) ^ 27 / 711968565817136711740669035 :=
    csInf_le Haagerup.Statement.bounds_bddBelow bound
  exact h.trans (by norm_num)

/-- The seven-channel bound also implies the strict comparison with Haagerup's proposed value. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger := by
  refine constant_le.trans_lt ?_
  rw [lt_div_iff₀ Haagerup.gammaDagger_pos]
  calc (1404556392 / 1000000000 : ℝ) * Haagerup.Statement.gammaDagger
      < (1404556392 / 1000000000 : ℝ) * (711958683 / 1000000000) := by
        gcongr; exact Haagerup.gammaDagger_bounds.2
    _ < 1 := by norm_num

end Grothe.UpperSeven
