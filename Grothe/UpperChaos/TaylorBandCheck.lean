import Grothe.UpperChaos.GradedHermite
import Grothe.UpperChaos.TaylorBandData

/-!
# Exact band norms of the third Taylor approximant

The concrete center uses all 6552 preserved dyadic coefficients through degree
51. Direct graded lookup avoids searching or deduplicating a coefficient list.
Orthonormality identifies the finite arithmetic checks with genuine projected
Hermite norms. Gaussian approximation errors remain separate hypotheses.

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- The complete, unscaled, third Taylor approximant. -/
noncomputable def thirdCenter : Lp ℂ 2 mu2 := gradedHermite 26 thirdCenterCoeff

/-- The four finite comparison bands, expressed by total degree. -/
def thirdCenterBandModes (k : Fin 4) : Set Idx2 :=
  {i | thirdCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ thirdCenterBandHi k}

instance (k : Fin 4) : DecidablePred (· ∈ thirdCenterBandModes k) := fun i =>
  inferInstanceAs (Decidable (thirdCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ thirdCenterBandHi k))

/-- Every packed record decodes, and the complete coefficient array has the expected size. -/
theorem thirdCenter_decode_check :
    PackedDyadic.parse thirdCenterExponent thirdCenterPacked = some thirdCenterInts ∧
      thirdCenterInts.size = 6552 := by
  native_decide

/-- Exact total energy and all four projected energies, from the actual graded coefficients. -/
theorem thirdCenter_energy_check :
    (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), thirdCenterCoeff q c d ^ 2) = thirdCenterEnergyQ ∧
    ∀ k : Fin 4,
      (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        if gradedMode q c d ∈ thirdCenterBandModes k then thirdCenterCoeff q c d ^ 2 else 0) =
          thirdCenterBandEnergyQ k := by
  native_decide

/-- The total coefficient energy is the actual squared Hermite norm. -/
theorem norm_thirdCenter_sq : ‖thirdCenter‖ ^ 2 = (thirdCenterEnergyQ : ℝ) := by
  rw [thirdCenter, norm_gradedHermite_sq_cast, thirdCenter_energy_check.1]

/-- Each finite coefficient target is the actual projected Hermite energy. -/
theorem norm_thirdCenterBand_sq (k : Fin 4) :
    ‖projOn (thirdCenterBandModes k) thirdCenter‖ ^ 2 = (thirdCenterBandEnergyQ k : ℝ) := by
  rw [thirdCenter, norm_projOn_gradedHermite_sq_cast, thirdCenter_energy_check.2 k]

/-- Lower enclosures preserve captured energy for the tail estimate. -/
theorem thirdCenterBand_norm_lower (k : Fin 4) :
    (thirdCenterBandLowerQ k : ℝ) ≤ ‖projOn (thirdCenterBandModes k) thirdCenter‖ := by
  have hq : ∀ j : Fin 4, thirdCenterBandLowerQ j ^ 2 ≤ thirdCenterBandEnergyQ j := by
    decide +kernel
  have hr : (thirdCenterBandLowerQ k : ℝ) ^ 2 ≤ (thirdCenterBandEnergyQ k : ℝ) := by
    exact_mod_cast hq k
  have hn : ∀ j : Fin 4, 0 ≤ thirdCenterBandLowerQ j := by decide +kernel
  have hnonneg : (0 : ℝ) ≤ thirdCenterBandLowerQ k := by exact_mod_cast hn k
  nlinarith [norm_thirdCenterBand_sq k, norm_nonneg (projOn (thirdCenterBandModes k) thirdCenter)]

/-- Matching upper enclosures of the four finite band norms. -/
theorem thirdCenterBand_norm_upper (k : Fin 4) :
    ‖projOn (thirdCenterBandModes k) thirdCenter‖ ≤ (thirdCenterBandUpperQ k : ℝ) := by
  have hq : ∀ j : Fin 4, thirdCenterBandEnergyQ j ≤ thirdCenterBandUpperQ j ^ 2 := by
    decide +kernel
  have hr : (thirdCenterBandEnergyQ k : ℝ) ≤ (thirdCenterBandUpperQ k : ℝ) ^ 2 := by
    exact_mod_cast hq k
  have hn : ∀ j : Fin 4, 0 ≤ thirdCenterBandUpperQ j := by decide +kernel
  have hnonneg : (0 : ℝ) ≤ thirdCenterBandUpperQ k := by exact_mod_cast hn k
  nlinarith [norm_thirdCenterBand_sq k, norm_nonneg (projOn (thirdCenterBandModes k) thirdCenter)]

/-- The center has no Hermite coefficient of a charge other than one. -/
theorem thirdCenter_charge (i : Idx2)
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) :
    inner ℂ (hvec2 i) thirdCenter = 0 :=
  inner_gradedHermite_eq_zero_of_charge 26 thirdCenterCoeff i hi

/-- The exact finite center vanishes on the omitted degree tail. -/
theorem thirdCenter_tail_zero :
    projOn {i : Idx2 | 51 < (bideg i).1 + (bideg i).2} thirdCenter = 0 := by
  apply projOn_gradedHermite_eq_zero_of_total_degree _ 26 thirdCenterCoeff
  intro i hi
  exact hi

end Grothe.UpperChaos
