import Mathlib.Basic.Real.Basic

/-! # Signed fifth row prices

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.SignedRowTransfer

/-- The proved lower price of the signed fifth energy on each amplitude interval. -/
noncomputable def fifthFloor (t : ℝ) : ℝ :=
  if 886176/1000000 ≤ t then 17/500 else if 885868/1000000 ≤ t then 13/500 else -1

/-- The signed physical upper price in the normalized units of the original sparse rows. -/
noncomputable def profileValue (w d V t : ℝ) : ℝ :=
  (1-w)*(1-47/2000)*V+w*t^2+(1-w)*(47/2000)-d*fifthFloor t

end Grothe.LowerAnalytic.SignedRowTransfer
