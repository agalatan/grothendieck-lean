import Grothe.UpperReplacement.CircleWide
import Lean.Elab.Tactic.Decide

/-! Closed facts for the wider first contour. Agent-ID: codex-a7c4. -/

namespace Grothe.UpperReplacement.WideFacts

open GrotheKernel CircleCheck CircleWide

set_option maxHeartbeats 0

theorem first_gt_region :
    regionOK (gtRData [993 / 1000, -7 / 1000] [0, -1]) (103301 / 100000) = true := by
  native_decide

theorem first_gt_circle :
    meanOK (gtRData [993 / 1000, -7 / 1000] [0, -1])
      (1033 / 1000) (9 / 20) (7 / 5) 24 (D / 8) = true := by
  native_decide

end Grothe.UpperReplacement.WideFacts
