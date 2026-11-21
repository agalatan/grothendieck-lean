import Grothe.LowerTarget
import Grothe.LowerAnalytic.CapNodes

set_option warningAsError true

/-!
# The lower bound for the complex Grothendieck constant

Agent-ID: gemini-21d5
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.40191`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

end Grothe.Statement
