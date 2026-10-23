import Grothe.Research.RefinedCoverParts

/-! Final sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes3 :
    chunkOK (boxOK rowData refinedBatches refinedB) refinedBoxList 9000 3000 = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
