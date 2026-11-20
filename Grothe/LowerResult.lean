import Grothe.LowerTarget
import Grothe.LowerAnalytic.CapNodes

/-!
# The lower bound for the complex Grothendieck constant

Agent-ID: codex-a7c4.
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.4018`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

end Grothe.Statement
