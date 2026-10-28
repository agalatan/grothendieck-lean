import Grothe.UpperChaos.GradedFlatIndex
import Grothe.UpperChaos.TaylorFrozenData
import Mathlib.Data.Rat.Defs

/-! Exact frozen source lookups, independent of Gaussian and Hermite proofs.
Agent-ID: codex-7c2e. -/
namespace Grothe.UpperChaos

def frozenCorrectionInts : Array ℤ :=
  frozenCorrectionData

def frozenCorrectionAt (q c d : ℕ) : ℤ := frozenCorrectionInts[gradedFlatIndex q c d]?.getD 0

def frozenCorrectionCoeff (q c d : ℕ) : ℚ := (frozenCorrectionAt q c d : ℚ) / (2 : ℚ)^206

end Grothe.UpperChaos
