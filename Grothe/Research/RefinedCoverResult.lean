-- Grothe/Research/RefinedCoverResult.lean
import Grothe.Research.RefinedCoverCheck
import Grothe.Research.LawNodeLower
import Grothe.Research.LawNodeCheck
import Grothe.Research.LowerRefinementCheck

/-!
# A strict lower improvement with the same Gaussian node-cap assumption

The four sequential native checks and the separate partition check certify the entire
refined finite cover. Additional original-source law nodes pass the existing batch checker.
The existing rows, mixed-node certificates, witness and `NodeCaps` are unchanged.
-/

open Grothe.Lower Grothe.LowerAnalytic Grothe.Research.LowerRefinementData
  Grothe.Research.LowerRefinementCoverData

namespace Grothe.Research.RefinedLowerCheck

set_option maxRecDepth 0
set_option maxHeartbeats 0

/-- The reciprocal cap is a Grothendieck lower bound under the original `NodeCaps`. -/
theorem refined_reciprocal_lower_bound (hcaps : NodeCaps) {K : ℝ}
    (hK : IsGrothendieckBound K) : 1 / (bound : ℝ) ≤ K := by
  have hextra : (LawNodeData.extraBatches ++ refinementExtraBatches).all
      (checkBatch rowData) = true := by
    simp only [List.all_append, LawNodeCheck.certLawNodes,
      LowerRefinementCheck.certRefinementBatches, Bool.and_self]
  exact LawNodeLower.lower_bound_of_law_nodes
    (LawNodeData.extraBatches ++ refinementExtraBatches) bound cuts boxes hextra
    (by simpa only [refinementBatches, List.append_assoc] using refined_cover_checked) hcaps hK

/-- Exact rational comparison; no native check is added for the endpoint decimal. -/
theorem refinement_endpoint_lt_reciprocal : (endpoint : ℝ) < 1 / (bound : ℝ) := by
  norm_num [endpoint, bound]

/-- The current endpoint follows from the complete checked cover. -/
theorem lower_bound_of_completed_refinement (hcaps : NodeCaps) {K : ℝ}
    (hK : IsGrothendieckBound K) : (endpoint : ℝ) < K :=
  refinement_endpoint_lt_reciprocal.trans_le (refined_reciprocal_lower_bound hcaps hK)

/-- Compatibility comparison for the cached node-cap assembly. -/
theorem refined_endpoint_lt_reciprocal :
    (RefinedCoverData.refinedL : ℝ) < 1 / (bound : ℝ) := by
  norm_num [RefinedCoverData.refinedL, bound]

/-- Compatibility conclusion for `CapNodes.lean`, derived from the current stronger
cover. Keeping this interface preserves the heavy computation cache. -/
theorem lower_bound_of_refined_cover_data (hcaps : NodeCaps) {K : ℝ}
    (hK : IsGrothendieckBound K) : (RefinedCoverData.refinedL : ℝ) < K :=
  refined_endpoint_lt_reciprocal.trans_le (refined_reciprocal_lower_bound hcaps hK)

end Grothe.Research.RefinedLowerCheck
