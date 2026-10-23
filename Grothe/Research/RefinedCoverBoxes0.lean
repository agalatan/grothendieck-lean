import Grothe.Research.RefinedCoverParts

/-! First sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes0 :
    chunkOK (boxOK rowData refinedBatches refinedB) refinedBoxList 0 3000 = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
