import Grothe.UpperChaos.SmallProfileBandEnclosure
import Grothe.UpperChaos.ConcreteTaylorUpper

/-!
# Retained coefficient certificates for the fourteen captured bands

The actual degree bounds and stored center lengths fix the finite coefficient
domains. The original rational caps absorb the shared source reserve before
the energy is squared. Only the coefficient enclosures and their rational
energy checks remain to be supplied by the numerical certificates.

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos.ConcreteRetainedBands
open SmallProfileMesh
noncomputable section

def firstLevels (k : Fin 6) : ℕ := (firstCenterBandHi k + 1) / 2
def secondLevels (k : Fin 4) : ℕ := (secondCenterBandHi k + 1) / 2
def thirdLevels (k : Fin 4) : ℕ := (thirdCenterBandHi k + 1) / 2

theorem first_degree (k : Fin 6) (i : Idx2) (hi : i ∈ firstCenterBandModes k) :
    (bideg i).1 + (bideg i).2 < 2 * firstLevels k := by
  have h : ∀ k : Fin 6, firstCenterBandHi k < 2 * firstLevels k := by decide +kernel
  exact hi.2.trans_lt (h k)

theorem second_degree (k : Fin 4) (i : Idx2) (hi : i ∈ secondCenterBandModes k) :
    (bideg i).1 + (bideg i).2 < 2 * secondLevels k := by
  have h : ∀ k : Fin 4, secondCenterBandHi k < 2 * secondLevels k := by decide +kernel
  exact hi.2.trans_lt (h k)

theorem third_degree (k : Fin 4) (i : Idx2) (hi : i ∈ thirdCenterBandModes k) :
    (bideg i).1 + (bideg i).2 < 2 * thirdLevels k := by
  have h : ∀ k : Fin 4, thirdCenterBandHi k < 2 * thirdLevels k := by decide +kernel
  exact hi.2.trans_lt (h k)

/-- The common source reserve fits every original first-order cap. -/
theorem first_reserve : ∀ k : Fin 6, (5 / 10 ^ 15 : ℚ) ≤ firstCapturedErrorQ k := by
  decide +kernel

/-- The unscaled second-order caps retain their original values. -/
theorem second_reserve : ∀ k : Fin 4, (5 / 10 ^ 15 : ℚ) ≤ secondCapturedErrorQ k := by
  decide +kernel

/-- The unscaled third-order caps retain their original values. -/
theorem third_reserve : ∀ k : Fin 4, (5 / 10 ^ 15 : ℚ) ≤ thirdCapturedErrorQ k := by
  decide +kernel

/-- A complete coefficient certificate supplies one actual first-order band,
with its exact stored center and the minimal graded cutoff for that band. -/
theorem first_error (k : Fin 6) (center radius : GradedIdx (firstLevels k) → ℚ)
    (hcoeff : ∀ i : GradedIdx (firstLevels k), gradedIdx i ∈ firstCenterBandModes k →
      |(retainedReciprocalMeshValue i 1 cut 7 selected).re - (center i : ℝ)| ≤
        (radius i : ℝ))
    (henergy : bandEnclosureEnergyQ (firstCenterBandModes k) (firstLevels k) 91
      firstCenterCoeff center radius ≤ (firstCapturedErrorQ k - 5 / 10 ^ 15) ^ 2) :
    ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ) := by
  simpa only [firstTaylorL2, firstCenter] using
    norm_band_error_le_cap (firstCenterBandModes k) 1 (firstLevels k) 91
      firstCenterCoeff center radius (firstCapturedErrorQ k) (first_reserve k)
      (first_degree k) hcoeff henergy

/-- A complete coefficient certificate supplies one actual second-order band.
The comparison decomposition applies its factorial scaling afterward. -/
theorem second_error (k : Fin 4) (center radius : GradedIdx (secondLevels k) → ℚ)
    (hcoeff : ∀ i : GradedIdx (secondLevels k), gradedIdx i ∈ secondCenterBandModes k →
      |(retainedReciprocalMeshValue i 2 cut 7 selected).re - (center i : ℝ)| ≤
        (radius i : ℝ))
    (henergy : bandEnclosureEnergyQ (secondCenterBandModes k) (secondLevels k) 46
      secondCenterCoeff center radius ≤ (secondCapturedErrorQ k - 5 / 10 ^ 15) ^ 2) :
    ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ) := by
  simpa only [secondTaylorL2, secondCenter] using
    norm_band_error_le_cap (secondCenterBandModes k) 2 (secondLevels k) 46
      secondCenterCoeff center radius (secondCapturedErrorQ k) (second_reserve k)
      (second_degree k) hcoeff henergy

/-- A complete coefficient certificate supplies one actual third-order band.
The comparison decomposition applies its factorial scaling afterward. -/
theorem third_error (k : Fin 4) (center radius : GradedIdx (thirdLevels k) → ℚ)
    (hcoeff : ∀ i : GradedIdx (thirdLevels k), gradedIdx i ∈ thirdCenterBandModes k →
      |(retainedReciprocalMeshValue i 3 cut 7 selected).re - (center i : ℝ)| ≤
        (radius i : ℝ))
    (henergy : bandEnclosureEnergyQ (thirdCenterBandModes k) (thirdLevels k) 26
      thirdCenterCoeff center radius ≤ (thirdCapturedErrorQ k - 5 / 10 ^ 15) ^ 2) :
    ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ) := by
  simpa only [thirdTaylorL2, thirdCenter] using
    norm_band_error_le_cap (thirdCenterBandModes k) 3 (thirdLevels k) 26
      thirdCenterCoeff center radius (thirdCapturedErrorQ k) (third_reserve k)
      (third_degree k) hcoeff henergy

end
end Grothe.UpperChaos.ConcreteRetainedBands
