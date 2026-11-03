import Grothe.UpperChaos.GradedFlatIndex
import Grothe.UpperChaos.PackedDyadicChunks
import Grothe.UpperChaos.TaylorFirstData
import Grothe.UpperChaos.TaylorSecondData

/-! The original packed first and second center sources, preserved verbatim.
Auxiliary literal witnesses and source-equality obligations live separately.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos

def firstCenterInts : Array ℤ :=
  (PackedDyadic.parseChunks 206 firstCenterPackedChunks).getD #[]
def secondCenterInts : Array ℤ :=
  (PackedDyadic.parseChunks 206 secondCenterPackedChunks).getD #[]

def firstCenterAt (q c d : ℕ) : ℤ := firstCenterInts[gradedFlatIndex q c d]?.getD 0
def secondCenterAt (q c d : ℕ) : ℤ := secondCenterInts[gradedFlatIndex q c d]?.getD 0

end Grothe.UpperChaos
