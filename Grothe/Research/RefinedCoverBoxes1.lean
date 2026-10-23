import Grothe.Research.RefinedCoverParts

/-! Second sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes1 :
    chunkOK (boxOK rowData refinedBatches refinedB) refinedBoxList
      refinedChunkSize refinedChunkSize = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
