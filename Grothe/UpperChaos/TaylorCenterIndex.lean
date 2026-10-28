import Grothe.UpperChaos.TaylorBandData
import Grothe.UpperChaos.GradedFlatIndex

/-! Third-center integer lookup at the shared exact graded index. These are
source definitions only; no decoding or energy check is asserted.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos

def thirdCenterAt (q c d : ℕ) : ℤ := thirdCenterInts[gradedFlatIndex q c d]?.getD 0

end Grothe.UpperChaos
