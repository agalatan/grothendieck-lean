import Grothe.Research.RefinedCoverParts

/-! The refined boxes cover the full original parameter domain. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

theorem certRefinedPartition :
    treeCoverOK (treeOf refinedCuts) (0, 9 / 10, 0, ρ, 0, xMax)
      (refinedBoxList.map Box.dom) = true := by
  native_decide

end Grothe.Research.RefinedLowerCheck
