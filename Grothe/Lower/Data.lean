import Grothe.Lower.SourceData
import Grothe.Lower.AveragedData1
import Grothe.Lower.AveragedData2
import Grothe.Lower.JoinData
import Grothe.Lower.RowData

/-!
# The certificate context

All profiles in dependency order (sources, averaged profiles, joins) with the dense node tables.
-/

namespace Grothe.Lower

/-- The certificate context. -/
def ctx : Ctx :=
  ⟨sourceProfiles ++ averagedProfiles1 ++ averagedProfiles2 ++ joinProfiles, denseNodes⟩

end Grothe.Lower
