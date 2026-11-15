-- Grothe/Research/RefinedCoverBoxes3.lean
import Grothe.Research.RefinedCoverParts

/-! Final sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.LowerRefinementData Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes3 :
    chunkOK (MixBox.ok rowData refinementBatches bound) refinedBoxList
      (3 * chunkSize) chunkSize = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
