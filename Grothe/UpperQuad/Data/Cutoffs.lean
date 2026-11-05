import Grothe.UpperQuad.Data.Cutoffs0
import Grothe.UpperQuad.Data.Cutoffs1
import Grothe.UpperQuad.Data.Cutoffs2
import Grothe.UpperQuad.Data.Cutoffs3
import Grothe.UpperQuad.Data.Cutoffs4
import Grothe.UpperQuad.Data.Cutoffs5
import Grothe.UpperQuad.Data.Cutoffs6
import Grothe.UpperQuad.Data.Cutoffs7

/-!
# The conditional cutoffs of the committed partition (assembly of the generated blocks)

`cutoffs.getD i 532` is the cutoff of the node of ordinal `i < 21577` (`data/quad-checker/cutoffs.txt`).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.PartitionData

/-- The 21,577 cutoffs in node order. -/
def cutoffs : Array Nat := cutoffBlock0 ++ cutoffBlock1 ++ cutoffBlock2 ++ cutoffBlock3 ++ cutoffBlock4 ++ cutoffBlock5 ++ cutoffBlock6 ++ cutoffBlock7

end Grothe.UpperQuad.PartitionData
