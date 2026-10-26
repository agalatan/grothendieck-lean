import Grothe.Research.RefinedCoverBoxes0
import Grothe.Research.RefinedCoverBoxes1
import Grothe.Research.RefinedCoverBoxes2
import Grothe.Research.RefinedCoverBoxes3
import Grothe.Research.RefinedCoverPartition
import Grothe.Research.RefinedLower
import Grothe.Research.LawNodeCheck

/-!
# A strict lower improvement with the same Gaussian node-cap assumption

The four sequential native checks and the separate partition check certify the entire
refined finite cover. Additional original-source law nodes pass the existing batch checker.
The existing rows, mixed-node certificates, witness and `NodeCaps` are unchanged.
-/

open Grothe.Lower Grothe.LowerAnalytic Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

set_option maxRecDepth 0
set_option maxHeartbeats 0

/-- All refined boxes pass, and their partition covers the whole original domain. -/
theorem refined_cover_checked :
    checkCover rowData refinedBatches refinedB refinedCuts refinedBoxes = true := by
  have hx : refinedBoxList.all (boxOK rowData refinedBatches refinedB) = true :=
    all_of_chunk _ _ 0 refinedChunkSize certRefinedBoxes0 <|
      all_of_chunk _ _ refinedChunkSize refinedChunkSize certRefinedBoxes1 <|
      all_of_chunk _ _ (2 * refinedChunkSize) refinedChunkSize certRefinedBoxes2 <|
      all_of_chunk _ _ (3 * refinedChunkSize) refinedChunkSize certRefinedBoxes3 <|
      all_drop_of_le _ _ (4 * refinedChunkSize) (by decide +kernel)
  have hp := certRefinedPartition
  simp only [refinedBoxList] at hx hp
  simp only [checkCover, allPar_eq, hx, hp, Bool.and_self]

/-- The reciprocal cap is a Grothendieck lower bound under the original `NodeCaps`. -/
theorem refined_reciprocal_lower_bound (hcaps : NodeCaps) {K : ℝ}
    (hK : IsGrothendieckBound K) : 1 / (refinedB : ℝ) ≤ K :=
  LawNodeLower.lower_bound_of_law_nodes LawNodeData.extraBatches refinedB refinedCuts refinedBoxes
    LawNodeCheck.certLawNodes refined_cover_checked hcaps hK

/-- Exact rational comparison; no native check is added for the endpoint decimal. -/
theorem refined_endpoint_lt_reciprocal : (refinedL : ℝ) < 1 / (refinedB : ℝ) := by
  norm_num [refinedL, refinedB]

/-- The improved strict endpoint, with the existing Gaussian source hypotheses unchanged. -/
theorem lower_bound_of_refined_cover_data (hcaps : NodeCaps) {K : ℝ}
    (hK : IsGrothendieckBound K) : (refinedL : ℝ) < K :=
  refined_endpoint_lt_reciprocal.trans_le (refined_reciprocal_lower_bound hcaps hK)

#print axioms refined_cover_checked
#print axioms refined_reciprocal_lower_bound
#print axioms refined_endpoint_lt_reciprocal
#print axioms lower_bound_of_refined_cover_data

end Grothe.Research.RefinedLowerCheck
