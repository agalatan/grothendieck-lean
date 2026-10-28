import Grothe.UpperChaos.TaylorBandData

/-! Shared exact graded index and third-center integer lookup. These are
source definitions only; no decoding or energy check is asserted.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos

/-- Flat row-major coordinate in the injective graded enumeration. -/
def gradedFlatIndex (q c d : ℕ) : ℕ := q * (q + 1) * (q + 2) / 3 + c * (q + 1) + d

def thirdCenterAt (q c d : ℕ) : ℤ := thirdCenterInts[gradedFlatIndex q c d]?.getD 0

end Grothe.UpperChaos
