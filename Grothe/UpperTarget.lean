import Grothe.StatementBridges

/-!
# From a Grothendieck bound to the upper statement

`upperBelow_of_bound` turns an admissible bound below `c` into `UpperBelow c`.
`Grothe.UpperResult` applies it to the mixture. `constant_lt_of_upperBelow`
in `Grothe.StatementBridges` gives the strict inequality for the infimum.
-/

namespace Grothe.Statement

/-- A Grothendieck bound below `c` proves `UpperBelow c`. -/
theorem upperBelow_of_bound {K c : ℝ} (h : Grothe.IsGrothendieckBound K) (hK : K < c) :
    UpperBelow c :=
  ⟨K, isBound_iff.mpr h, hK⟩

end Grothe.Statement
