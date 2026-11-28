import Grothe.Statement
import Grothe.Upper.Selector.Bound

/-! # The upper bound for the complex Grothendieck constant

A mixture of Gaussian rounding channels gives the transfer factor `10^27 / 711968565817136711740669035` for every
finite complex matrix; rounded upward, `K_G^ℂ ≤ 1.404556392`. The cell and phase channels
(`Grothe/Upper/Certificate/`) use their certified heads and Hardy tails; the angular selector
(`Grothe/Upper/Selector/`) adds a Gaussian angular selector with a signed linear preprocessor, whose complete
Wiener approximation is proved in `Grothe/Upper/Selector/PhysicalColumn.lean`.
-/

set_option warningAsError true

namespace Grothe.Upper

/-- Admissibility at the exact transfer endpoint of the mixture, for every finite complex matrix. -/
theorem bound : Statement.IsBound ((10 : ℝ) ^ 27 / 711968565817136711740669035) :=
  Grothe.Upper.Selector.isBound

/-- The upper bound rounded upward to nine decimal places. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ 1404556392 / 1000000000 := by
  have h : Statement.complexGrothendieckConstant ≤ (10 : ℝ) ^ 27 / 711968565817136711740669035 :=
    csInf_le Grothe.Upper.Optima.bounds_bddBelow bound
  exact h.trans (by norm_num)

end Grothe.Upper
