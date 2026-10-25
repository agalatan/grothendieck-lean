import Grothe.Research.LawNodeData

/-! Additional law nodes, checked against the existing original-row source caps. -/

open Grothe.Lower Grothe.Research.LawNodeData

namespace Grothe.Research.LawNodeCheck

set_option maxRecDepth 0
set_option maxHeartbeats 0

/-- Every additional batch passes the existing whole-half-line law checker. -/
theorem certLawNodes : extraBatches.all (checkBatch rowData) = true := by
  native_decide

end Grothe.Research.LawNodeCheck
