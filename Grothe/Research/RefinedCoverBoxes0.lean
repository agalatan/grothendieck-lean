-- Grothe/Research/RefinedCoverBoxes0.lean
import Grothe.Research.RefinedCoverParts

/-! First sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.LowerRefinementData Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes0 :
    chunkOK (MixBox.ok rowData refinementBatches bound) refinedBoxList 0 chunkSize = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
