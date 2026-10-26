import Grothe.Research.RefinedCoverParts

/-! Third sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes2 :
    chunkOK (boxOK rowData refinedBatches refinedB) refinedBoxList
      (2 * refinedChunkSize) refinedChunkSize = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
