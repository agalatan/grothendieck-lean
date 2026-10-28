import Grothe.UpperChaos.TaylorCenters
import Grothe.UpperChaos.TaylorFirstSecondBandDefs
import Grothe.UpperChaos.TaylorCenterBandData
import Grothe.UpperChaos.GradedHermiteIntegerEnergy

/-!
# The second center's four exact captured-band norms

Agent-ID: codex-37fb. Coefficients are those of `secondCenter`
from the rounding source, without a second stored source array. Gaussian
approximation errors are separate obligations.
-/
open MeasureTheory
namespace Grothe.UpperChaos
set_option maxRecDepth 4096

/-- Exact integer sums over the same coordinates used by `secondCenterCoeff`. -/
theorem secondCenter_band_energy_check : ∀ k : Fin 4,
    PackedDyadic.gradedIntegerSum 46
      (fun q c d => if gradedMode q c d ∈ secondCenterBandModes k then
        secondCenterAt q c d ^ 2 else 0) = secondCenterBandIntegerEnergy k := by
  native_decide

/-- The integer targets are exactly the actual projected Hermite energies. -/
theorem norm_secondCenterBand_sq (k : Fin 4) :
    ‖projOn (secondCenterBandModes k) secondCenter‖ ^ 2 = (secondCenterBandEnergyQ k : ℝ) := by
  have h := norm_projOn_gradedHermite_integer_sq_cast (secondCenterBandModes k) 46 206 secondCenterAt
  change ‖projOn (secondCenterBandModes k) secondCenter‖ ^ 2 =
    (((PackedDyadic.gradedIntegerSum 46
      (fun q c d => if gradedMode q c d ∈ secondCenterBandModes k then
        secondCenterAt q c d ^ 2 else 0) : ℚ) / (2 : ℚ)^412 : ℚ) : ℝ) at h
  rw [secondCenter_band_energy_check k] at h
  exact h

/-- Certified captured norm lower bounds, each rounded downward at `10^-30`. -/
theorem secondCenterBand_norm_lower (k : Fin 4) :
    (secondCenterBandLowerQ k : ℝ) ≤ ‖projOn (secondCenterBandModes k) secondCenter‖ := by
  have hq : ∀ j : Fin 4, secondCenterBandLowerQ j ^ 2 ≤ secondCenterBandEnergyQ j := by
    decide +kernel
  have hr : (secondCenterBandLowerQ k : ℝ) ^ 2 ≤ (secondCenterBandEnergyQ k : ℝ) := by
    exact_mod_cast hq k
  have hn : ∀ j : Fin 4, 0 ≤ secondCenterBandLowerQ j := by decide +kernel
  have hnonneg : (0 : ℝ) ≤ secondCenterBandLowerQ k := by exact_mod_cast hn k
  nlinarith [norm_secondCenterBand_sq k, norm_nonneg (projOn (secondCenterBandModes k) secondCenter)]

/-- Matching upper enclosures of the four finite band norms. -/
theorem secondCenterBand_norm_upper (k : Fin 4) :
    ‖projOn (secondCenterBandModes k) secondCenter‖ ≤ (secondCenterBandUpperQ k : ℝ) := by
  have hq : ∀ j : Fin 4, secondCenterBandEnergyQ j ≤ secondCenterBandUpperQ j ^ 2 := by
    decide +kernel
  have hr : (secondCenterBandEnergyQ k : ℝ) ≤ (secondCenterBandUpperQ k : ℝ) ^ 2 := by
    exact_mod_cast hq k
  have hn : ∀ j : Fin 4, 0 ≤ secondCenterBandUpperQ j := by decide +kernel
  have hnonneg : (0 : ℝ) ≤ secondCenterBandUpperQ k := by exact_mod_cast hn k
  nlinarith [norm_secondCenterBand_sq k, norm_nonneg (projOn (secondCenterBandModes k) secondCenter)]

/-- The second center has no coefficient of a charge other than one. -/
theorem secondCenter_charge (i : Idx2)
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) : inner ℂ (hvec2 i) secondCenter = 0 :=
  inner_gradedHermite_eq_zero_of_charge 46 secondCenterCoeff i hi

/-- The second center vanishes identically on the degree tail above 91. -/
theorem secondCenter_tail_zero :
    projOn {i : Idx2 | 91 < (bideg i).1 + (bideg i).2} secondCenter = 0 := by
  apply projOn_gradedHermite_eq_zero_of_total_degree _ 46 secondCenterCoeff
  intro i hi
  exact hi

end Grothe.UpperChaos
