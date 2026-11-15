-- Grothe/Research/RefinedCoverBoxes2.lean
import Grothe.Research.RefinedCoverParts

/-! Third sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.LowerRefinementData Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes2 :
    chunkOK (MixBox.ok rowData refinementBatches bound) refinedBoxList
      (2 * chunkSize) chunkSize = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
