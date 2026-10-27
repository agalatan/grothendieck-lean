import Grothe.UpperChaos.TaylorCenters
import Grothe.UpperChaos.TaylorRoundingData

/-! The exact finite Taylor rounding norm. Agent-ID: codex-2ca4. -/
open MeasureTheory
namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- The integer numerator is exactly the rational linear combination of the four centers. -/
theorem roundingCoeff_eq (q c d : ℕ) :
    roundingCoeff q c d = firstCenterCoeff q c d +
      (1 / 2 : ℚ) * (if q < 46 then secondCenterCoeff q c d else 0) +
      (1 / 6 : ℚ) * (if q < 26 then thirdCenterCoeff q c d else 0) -
      frozenCorrectionCoeff q c d := by
  change ((6 * firstCenterAt q c d +
    3 * (if q < 46 then secondCenterAt q c d else 0) +
    (if q < 26 then thirdCenterAt q c d * (2 : ℤ)^101 else 0) -
    6 * frozenCorrectionAt q c d : ℤ) : ℚ) / (6 * (2 : ℚ)^206) =
      (firstCenterAt q c d : ℚ) / (2 : ℚ)^206 +
      (1 / 2 : ℚ) * (if q < 46 then (secondCenterAt q c d : ℚ) / (2 : ℚ)^206 else 0) +
      (1 / 6 : ℚ) * (if q < 26 then (thirdCenterAt q c d : ℚ) / (2 : ℚ)^105 else 0) -
      (frozenCorrectionAt q c d : ℚ) / (2 : ℚ)^206
  split_ifs <;> push_cast <;> norm_num <;> ring

/-- The common-support coefficient vector equals the actual rounding source. -/
theorem roundingDifference_eq : roundingDifference = gradedHermite 91 roundingCoeff := by
  have heq : roundingCoeff = fun q c d => firstCenterCoeff q c d +
      (1 / 2 : ℚ) * (if q < 46 then secondCenterCoeff q c d else 0) +
      (1 / 6 : ℚ) * (if q < 26 then thirdCenterCoeff q c d else 0) -
      frozenCorrectionCoeff q c d := by
    funext q c d
    exact roundingCoeff_eq q c d
  rw [heq, gradedHermite_sub, gradedHermite_add, gradedHermite_add,
    gradedHermite_rat_mul, gradedHermite_rat_mul,
    ← gradedHermite_extend 46 91 (by decide) secondCenterCoeff,
    ← gradedHermite_extend 26 91 (by decide) thirdCenterCoeff]
  rfl

/-- The integer arithmetic leaf recomputes the actual finite rounding coefficient energy. -/
theorem rounding_energy_check :
    PackedDyadic.gradedIntegerSum 91 (fun q c d => roundingScaledCoeff q c d ^ 2) =
      roundingIntegerEnergy := by
  native_decide

/-- All three new sources parse successfully at the complete retained sizes. -/
theorem taylor_centers_decode_check :
    (PackedDyadic.parseChunks 206 firstCenterPackedChunks = some firstCenterInts ∧
      firstCenterInts.size = 259532) ∧
    (PackedDyadic.parseChunks 206 secondCenterPackedChunks = some secondCenterInts ∧
      secondCenterInts.size = 34592) ∧
    (PackedDyadic.parseChunks 206 frozenCorrectionPackedChunks = some frozenCorrectionInts ∧
      frozenCorrectionInts.size = 259532) := by
  native_decide

/-- The integer fold gives the exact squared norm of the actual rounding source. -/
theorem norm_roundingDifference_sq : ‖roundingDifference‖ ^ 2 =
    (((roundingIntegerEnergy : ℚ) / (6 * (2 : ℚ)^206)^2 : ℚ) : ℝ) := by
  rw [roundingDifference_eq, norm_gradedHermite_sq_cast]
  apply congrArg (fun r : ℚ => (r : ℝ))
  simp_rw [roundingCoeff, div_pow]
  simp only [div_eq_mul_inv, ← Finset.sum_mul, ← Int.cast_pow, ← Int.cast_sum]
  rw [← PackedDyadic.gradedIntegerSum_eq, rounding_energy_check]

/-- The required `10^-18` rounding cap follows from the exact integer certificate. -/
theorem norm_roundingDifference_le : ‖roundingDifference‖ ≤ (1 / 1000000000000000000 : ℝ) := by
  have hq : (roundingIntegerEnergy : ℚ) / (6 * (2 : ℚ)^206)^2 ≤
      (1 / 1000000000000000000 : ℚ)^2 := by
    decide +kernel
  have hr : (((roundingIntegerEnergy : ℚ) / (6 * (2 : ℚ)^206)^2 : ℚ) : ℝ) ≤
      (1 / 1000000000000000000 : ℝ)^2 := by
    exact_mod_cast hq
  nlinarith [norm_roundingDifference_sq, norm_nonneg roundingDifference]

end Grothe.UpperChaos
