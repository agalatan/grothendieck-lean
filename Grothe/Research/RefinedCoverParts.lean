import Grothe.Research.RefinedCoverData
import Grothe.Lower.Cert.Parts

/-! Shared parsed boxes for the refined cover's sequential native checks. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

namespace Grothe.Research.RefinedLowerCheck

/-- The refined finite cover, parsed with the existing certificate parser. -/
def refinedBoxList : List Box := refinedBoxes.map parseBox

end Grothe.Research.RefinedLowerCheck
