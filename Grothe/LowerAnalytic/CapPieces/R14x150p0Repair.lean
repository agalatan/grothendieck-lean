import Grothe.LowerAnalytic.CapPieceRepairDefs
import Grothe.LowerAnalytic.CapPieces.D14x150
import Grothe.LowerAnalytic.CapPieces.D14x150p0Repair

/-! The repaired centre piece at the original row-14 node-150 cap.
Agent-ID: codex-2ca4. The checker recomputes its Gaussian enclosure and exact PSD test. -/

namespace Grothe.LowerAnalytic

theorem pieceRepair_14x150p0_check :
    pieceRepairOK pieceNode_14x150 pieceRepair_14x150p0 0 0 = true := by native_decide

end Grothe.LowerAnalytic
