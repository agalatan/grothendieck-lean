import Grothe.UpperReplacement.TailInputs
import Lean.Elab.Tactic.Decide

/-! Exact squared tail inequalities and their weighted sum. Agent-ID: codex-a7c4. -/

namespace Grothe.UpperReplacement.TailFacts

set_option maxHeartbeats 0 in
theorem numerics : TailInputs.numericalChecks = true := by
  decide +kernel

end Grothe.UpperReplacement.TailFacts
