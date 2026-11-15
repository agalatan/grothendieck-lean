import Grothe.StatementBridges

/-!
# From a Grothendieck bound to the upper statement

`upperBelow_of_bound`: a Grothendieck bound below `c` proves `UpperBelow c` (`Grothe/Statement.lean`). The upper
bound `upper_below_tight` (`Grothe/UpperTightFinal.lean`) uses it. What `UpperBelow c` says about the constant
(`K_G^ℂ < c`) is `constant_lt_of_upperBelow` in `Grothe/StatementBridges.lean`.
-/

namespace Grothe.Statement

/-- A Grothendieck bound below `c` proves `UpperBelow c`. -/
theorem upperBelow_of_bound {K c : ℝ} (h : Grothe.IsGrothendieckBound K) (hK : K < c) :
    UpperBelow c :=
  ⟨K, isBound_iff.mpr h, hK⟩

end Grothe.Statement
