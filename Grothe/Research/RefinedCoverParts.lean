-- Grothe/Research/RefinedCoverParts.lean
import Grothe.Research.LowerRefinementCoverData
import Grothe.Lower.Cert.Parts

/-! The complete finite-mixture cover shared by its native check chunks. -/

open Grothe.Lower

namespace Grothe.Research.RefinedLowerCheck

/-- All 14,060 leaves, including the unchanged original boxes. -/
def refinedBoxList : List MixBox := LowerRefinementCoverData.boxes

end Grothe.Research.RefinedLowerCheck
