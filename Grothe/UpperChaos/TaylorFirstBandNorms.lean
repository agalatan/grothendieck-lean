import Grothe.UpperChaos.TaylorCenters
import Grothe.UpperChaos.TaylorCenterBandData
import Grothe.UpperChaos.GradedHermiteIntegerEnergy

/-!
# The first center's six exact captured-band norms

Agent-ID: codex-37fb. Coefficients are those of `firstCenter`
from the rounding source, without a second stored source array. Gaussian
approximation errors are separate obligations.
-/
open MeasureTheory
namespace Grothe.UpperChaos
set_option maxRecDepth 4096

/-- The first center's six finite bands in the actual tensor Hermite degree. -/
def firstCenterBandModes (k : Fin 6) : Set Idx2 :=
  {i | firstCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ firstCenterBandHi k}

instance (k : Fin 6) : DecidablePred (· ∈ firstCenterBandModes k) := fun i =>
  inferInstanceAs (Decidable (firstCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ firstCenterBandHi k))

/-- Exact integer sums over the same coordinates used by `firstCenterCoeff`. -/
theorem firstCenter_band_energy_check : ∀ k : Fin 6,
    PackedDyadic.gradedIntegerSum 91
      (fun q c d => if gradedMode q c d ∈ firstCenterBandModes k then
        firstCenterAt q c d ^ 2 else 0) = firstCenterBandIntegerEnergy k := by
  native_decide

/-- The integer targets are exactly the actual projected Hermite energies. -/
theorem norm_firstCenterBand_sq (k : Fin 6) :
    ‖projOn (firstCenterBandModes k) firstCenter‖ ^ 2 = (firstCenterBandEnergyQ k : ℝ) := by
  have h := norm_projOn_gradedHermite_integer_sq_cast (firstCenterBandModes k) 91 206 firstCenterAt
  change ‖projOn (firstCenterBandModes k) firstCenter‖ ^ 2 =
    (((PackedDyadic.gradedIntegerSum 91
      (fun q c d => if gradedMode q c d ∈ firstCenterBandModes k then
        firstCenterAt q c d ^ 2 else 0) : ℚ) / (2 : ℚ)^412 : ℚ) : ℝ) at h
  rw [firstCenter_band_energy_check k] at h
  exact h

/-- Certified captured norm lower bounds, each rounded downward at `10^-30`. -/
theorem firstCenterBand_norm_lower (k : Fin 6) :
    (firstCenterBandLowerQ k : ℝ) ≤ ‖projOn (firstCenterBandModes k) firstCenter‖ := by
  have hq : ∀ j : Fin 6, firstCenterBandLowerQ j ^ 2 ≤ firstCenterBandEnergyQ j := by
    decide +kernel
  have hr : (firstCenterBandLowerQ k : ℝ) ^ 2 ≤ (firstCenterBandEnergyQ k : ℝ) := by
    exact_mod_cast hq k
  have hn : ∀ j : Fin 6, 0 ≤ firstCenterBandLowerQ j := by decide +kernel
  have hnonneg : (0 : ℝ) ≤ firstCenterBandLowerQ k := by exact_mod_cast hn k
  nlinarith [norm_firstCenterBand_sq k, norm_nonneg (projOn (firstCenterBandModes k) firstCenter)]

/-- Matching upper enclosures of the six finite band norms. -/
theorem firstCenterBand_norm_upper (k : Fin 6) :
    ‖projOn (firstCenterBandModes k) firstCenter‖ ≤ (firstCenterBandUpperQ k : ℝ) := by
  have hq : ∀ j : Fin 6, firstCenterBandEnergyQ j ≤ firstCenterBandUpperQ j ^ 2 := by
    decide +kernel
  have hr : (firstCenterBandEnergyQ k : ℝ) ≤ (firstCenterBandUpperQ k : ℝ) ^ 2 := by
    exact_mod_cast hq k
  have hn : ∀ j : Fin 6, 0 ≤ firstCenterBandUpperQ j := by decide +kernel
  have hnonneg : (0 : ℝ) ≤ firstCenterBandUpperQ k := by exact_mod_cast hn k
  nlinarith [norm_firstCenterBand_sq k, norm_nonneg (projOn (firstCenterBandModes k) firstCenter)]

/-- The first center has no coefficient of a charge other than one. -/
theorem firstCenter_charge (i : Idx2)
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) : inner ℂ (hvec2 i) firstCenter = 0 :=
  inner_gradedHermite_eq_zero_of_charge 91 firstCenterCoeff i hi

/-- The first center vanishes identically on the degree tail above 181. -/
theorem firstCenter_tail_zero :
    projOn {i : Idx2 | 181 < (bideg i).1 + (bideg i).2} firstCenter = 0 := by
  apply projOn_gradedHermite_eq_zero_of_total_degree _ 91 firstCenterCoeff
  intro i hi
  exact hi

end Grothe.UpperChaos
