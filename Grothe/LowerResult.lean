import Grothe.LowerTarget
import Grothe.LowerAnalytic.CapNodes

set_option warningAsError true

/-!
# The lower bound for the complex Grothendieck constant

Every admissible Grothendieck bound exceeds `1.40191`, from the identity-tail witness
`(191/250, 47/2000)` (`lowerTarget_of_tailNodeCaps`) and its certified node caps
(`tailNodeCaps_cert`).

Agent-ID: gemini-1aa9
-/

namespace Grothe.Statement

open Grothe.LowerAnalytic

/-- **The lower bound**: every Grothendieck bound is above `1.40191`. -/
theorem lower_target : LowerTarget :=
  lowerTarget_of_tailNodeCaps tailNodeCaps_cert

end Grothe.Statement
