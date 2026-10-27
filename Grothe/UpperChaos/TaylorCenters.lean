import Grothe.UpperChaos.GradedHermiteLinear
import Grothe.UpperChaos.PackedDyadicChunks
import Grothe.UpperChaos.TaylorBandCheck
import Grothe.UpperChaos.TaylorFirstData
import Grothe.UpperChaos.TaylorSecondData
import Grothe.UpperChaos.TaylorFrozenData

/-! Complete finite Taylor centers at a common dyadic scale. Agent-ID: codex-2ca4. -/
open MeasureTheory
namespace Grothe.UpperChaos

/-- Flat row-major coordinate in the injective graded enumeration. -/
def gradedFlatIndex (q c d : ℕ) : ℕ := q * (q + 1) * (q + 2) / 3 + c * (q + 1) + d

def firstCenterInts : Array ℤ :=
  (PackedDyadic.parseChunks 206 firstCenterPackedChunks).getD #[]
def secondCenterInts : Array ℤ :=
  (PackedDyadic.parseChunks 206 secondCenterPackedChunks).getD #[]
def frozenCorrectionInts : Array ℤ :=
  (PackedDyadic.parseChunks 206 frozenCorrectionPackedChunks).getD #[]

def firstCenterAt (q c d : ℕ) : ℤ := firstCenterInts[gradedFlatIndex q c d]?.getD 0
def secondCenterAt (q c d : ℕ) : ℤ := secondCenterInts[gradedFlatIndex q c d]?.getD 0
def frozenCorrectionAt (q c d : ℕ) : ℤ := frozenCorrectionInts[gradedFlatIndex q c d]?.getD 0
def thirdCenterAt (q c d : ℕ) : ℤ := thirdCenterInts[gradedFlatIndex q c d]?.getD 0

def firstCenterCoeff (q c d : ℕ) : ℚ := (firstCenterAt q c d : ℚ) / (2 : ℚ)^206
def secondCenterCoeff (q c d : ℕ) : ℚ := (secondCenterAt q c d : ℚ) / (2 : ℚ)^206
def frozenCorrectionCoeff (q c d : ℕ) : ℚ := (frozenCorrectionAt q c d : ℚ) / (2 : ℚ)^206

noncomputable def firstCenter : Lp ℂ 2 mu2 := gradedHermite 91 firstCenterCoeff
noncomputable def secondCenter : Lp ℂ 2 mu2 := gradedHermite 46 secondCenterCoeff
noncomputable def frozenCorrection : Lp ℂ 2 mu2 := gradedHermite 91 frozenCorrectionCoeff

/-- Integer numerator at the single common denominator `6*2^206`. -/
def roundingScaledCoeff (q c d : ℕ) : ℤ :=
  6 * firstCenterAt q c d +
  3 * (if q < 46 then secondCenterAt q c d else 0) +
  (if q < 26 then thirdCenterAt q c d * (2 : ℤ)^101 else 0) -
  6 * frozenCorrectionAt q c d

def roundingCoeff (q c d : ℕ) : ℚ :=
  (roundingScaledCoeff q c d : ℚ) / (6 * (2 : ℚ)^206)

/-- The actual rounding source of the finite Taylor decomposition. -/
noncomputable def roundingDifference : Lp ℂ 2 mu2 :=
  firstCenter + ((1 / 2 : ℚ) : ℂ) • secondCenter +
    ((1 / 6 : ℚ) : ℂ) • thirdCenter - frozenCorrection

end Grothe.UpperChaos
