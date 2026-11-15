-- Grothe/Research/RefinedCoverBoxes1.lean
import Grothe.Research.RefinedCoverParts

/-! Second sequential chunk of the refined finite cover. -/

open Grothe.Lower Grothe.Research.LowerRefinementData Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedBoxes1 :
    chunkOK (MixBox.ok rowData refinementBatches bound) refinedBoxList
      chunkSize chunkSize = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
