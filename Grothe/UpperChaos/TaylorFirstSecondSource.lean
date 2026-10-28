import Grothe.UpperChaos.GradedFlatIndex
import Grothe.UpperChaos.TaylorFirstIntegerData
import Grothe.UpperChaos.TaylorSecondIntegerData

/-! Exact first and second center integer sources and lookups. This module
states no energy bound. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos

def firstCenterInts : Array ℤ :=
  firstCenterIntegerValues.toArray
def secondCenterInts : Array ℤ :=
  secondCenterIntegerValues.toArray

def firstCenterAt (q c d : ℕ) : ℤ := firstCenterInts[gradedFlatIndex q c d]?.getD 0
def secondCenterAt (q c d : ℕ) : ℤ := secondCenterInts[gradedFlatIndex q c d]?.getD 0

end Grothe.UpperChaos
