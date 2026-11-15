-- Grothe/Research/RefinedCoverCheck.lean
import Grothe.Research.RefinedCoverBoxes0
import Grothe.Research.RefinedCoverBoxes1
import Grothe.Research.RefinedCoverBoxes2
import Grothe.Research.RefinedCoverBoxes3
import Grothe.Research.RefinedCoverPartition

/-! Assemble the complete finite-mixture cover independently of the Gaussian reduction. -/

open Grothe.Lower Grothe.Research.LowerRefinementData
  Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

set_option maxRecDepth 0
set_option maxHeartbeats 0

/-- All refined boxes pass, and their partition covers the whole original domain. -/
theorem refined_cover_checked :
    checkMixCover rowData refinementBatches bound cuts boxes = true := by
  have hx : refinedBoxList.all (MixBox.ok rowData refinementBatches bound) = true :=
    all_of_chunk _ _ 0 chunkSize certRefinedBoxes0 <|
      all_of_chunk _ _ chunkSize chunkSize certRefinedBoxes1 <|
      all_of_chunk _ _ (2 * chunkSize) chunkSize certRefinedBoxes2 <|
      all_of_chunk _ _ (3 * chunkSize) chunkSize certRefinedBoxes3 <|
      all_drop_of_le _ _ (4 * chunkSize) (by decide +kernel)
  have hp := certRefinedPartition
  simp only [refinedBoxList] at hx hp
  simp only [checkMixCover, allPar_eq, hx, hp, Bool.and_self]

end Grothe.Research.RefinedLowerCheck
