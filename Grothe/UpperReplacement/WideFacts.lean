import Grothe.UpperReplacement.CircleWide
import Lean.Elab.Tactic.Decide

set_option warningAsError true

/-! Closed facts for the wider first contour. Agent-ID: codex-a7c4, gemini-1aa9. -/

namespace Grothe.UpperReplacement.WideFacts

open GrotheKernel CircleCheck CircleWide

set_option maxHeartbeats 0

theorem first_gt_region :
    tubeQuarterOK gtSmoothingM [993 / 1000, -7 / 1000] [0, -1] (103301 / 100000) 18 = true := by
  native_decide

theorem first_gt_circle :
    quarterMeanOK gtSmoothingM [993 / 1000, -7 / 1000] [0, -1]
      (1033 / 1000) (9 / 20) (7 / 5) 20 (D * D / 30000) = true := by
  native_decide

end Grothe.UpperReplacement.WideFacts
