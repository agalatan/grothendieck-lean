-- Grothe/Research/RefinedCoverPartition.lean
import Grothe.Research.RefinedCoverParts

/-! The refined boxes cover the full original parameter domain. -/

open Grothe.Lower Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedPartition :
    treeCoverOK (treeOf cuts) (0, 9 / 10, 0, ρ, 0, xMax)
      (refinedBoxList.map MixBox.dom) = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
