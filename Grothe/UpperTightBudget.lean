-- Grothe/UpperTightBudget.lean
import Grothe.Upper.ThreeBandBudget
import Grothe.UpperChaos.PhaseMomentData
import Grothe.UpperChaos.TaylorCenterBandData
import Grothe.UpperChaos.TaylorBandData
import Grothe.UpperQuad.PortFacts.Thresholds

/-!
# Quadrature and Taylor radii for the GT energy comparison

The three panel radii use the exact dyadic table excursions and the existing
quadrature reserve. The inner-product thresholds bound the three whole Taylor
sources. The quadratic comparison charge uses these sources and the rounding
error once each. `UpperTightSix` turns the port facts into the six estimates.

Agent-ID: codex-c8a4. Refs #389. Mixture integration by codex-a7c4.
-/

namespace Grothe.Upper

open Finset GrotheKernel Grothe.UpperChaos
open Grothe.UpperQuad.PortFacts

/-- Full unscaled quadrature radii, including the existing `10⁻¹⁵` tail/gap reserve. -/
def tightQuadRadiusQ : Fin 3 → ℚ
  | 0 => 9 / 10 ^ 15
  | 1 => 17 / 10 ^ 15
  | _ => 1132 / 10 ^ 15

/-- Covered-panel portions of the tight quadrature radii. -/
def tightPanelRadiusQ (g : Fin 3) : ℚ := tightQuadRadiusQ g - 1 / 10 ^ 15

/-- Exact square roots of the three certified squared table-excursion tolerances. -/
def tightLowReserveQ : Fin 3 → ℚ
  | 0 => 1 / 2 ^ 41
  | 1 => 1 / 2 ^ 42
  | _ => 1 / 2 ^ 45

/-- Unscaled low-band errors, combining quadrature and finite-table excursion. -/
def tightLowErrorQ (g : Fin 3) : ℚ := tightQuadRadiusQ g + tightLowReserveQ g

/-- Whole-source radii after division by the corresponding Taylor factorial. -/
def tightScaledRQ : Fin 3 → ℚ
  | 0 => 6338057765 / 10 ^ 15
  | 1 => 1086368451 / 10 ^ 15
  | _ => 334910976 / 10 ^ 15

/-- The four unsplit error radii: rounding followed by the three Taylor powers. -/
def tightGroupRadiusQ (g : Fin 4) : ℚ :=
  if g = 0 then comparisonGroupRadiusQ 0 else
  if g = 1 then tightScaledRQ 0 else
  if g = 2 then tightScaledRQ 1 else tightScaledRQ 2

/-- The seven linear-piece radii; the low bands are divided by their factorials once. -/
def tightThreeBandErrorQ (j : Fin 7) : ℚ :=
  if j = 0 then tightGroupRadiusQ 0 else
  if j = 1 then tightLowErrorQ 0 else
  if j = 2 then tightScaledRQ 0 else
  if j = 3 then tightLowErrorQ 1 / 2 else
  if j = 4 then tightScaledRQ 1 else
  if j = 5 then tightLowErrorQ 2 / 6 else tightScaledRQ 2

theorem tightQuadRadiusQ_pos (g : Fin 3) : 0 < tightQuadRadiusQ g := by
  have h : ∀ g : Fin 3, 0 < tightQuadRadiusQ g := by decide +kernel
  exact h g

theorem tightPanelRadiusQ_pos (g : Fin 3) : 0 < tightPanelRadiusQ g := by
  have h : ∀ g : Fin 3, 0 < tightPanelRadiusQ g := by decide +kernel
  exact h g

theorem tightLowErrorQ_pos (g : Fin 3) : 0 < tightLowErrorQ g := by
  have h : ∀ g : Fin 3, 0 < tightLowErrorQ g := by decide +kernel
  exact h g

theorem tightScaledRQ_pos (g : Fin 3) : 0 < tightScaledRQ g := by
  have h : ∀ g : Fin 3, 0 < tightScaledRQ g := by decide +kernel
  exact h g

theorem tightGroupRadiusQ_nonneg (g : Fin 4) : 0 ≤ tightGroupRadiusQ g := by
  have h : ∀ g : Fin 4, 0 ≤ tightGroupRadiusQ g := by decide +kernel
  exact h g

theorem tightThreeBandErrorQ_nonneg (j : Fin 7) : 0 ≤ tightThreeBandErrorQ j := by
  have h : ∀ j : Fin 7, 0 ≤ tightThreeBandErrorQ j := by decide +kernel
  exact h j

set_option exponentiation.threshold 1100 in
/-- The first whole-source radius uses the existing moment budget, center energy and threshold. -/
theorem tight_first_whole_margin :
    (phaseMoment2Q + (∑ k : Fin 6, firstCenterBandEnergyQ k) - tightScaledRQ 0 ^ 2) / 2 +
      (161 / 100000) * tightQuadRadiusQ 0 ≤ (j1ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j1ThetaNum, phaseMoment2Q, Fin.sum_univ_succ,
    firstCenterBandEnergyQ, firstCenterBandIntegerEnergy, tightScaledRQ, tightQuadRadiusQ]

set_option exponentiation.threshold 1100 in
/-- The second whole-source radius retains its raw Taylor factor `2`. -/
theorem tight_second_whole_margin :
    (phaseMoment4Q + (∑ k : Fin 4, secondCenterBandEnergyQ k) - (2 * tightScaledRQ 1) ^ 2) / 2 +
      (3 / 125000) * tightQuadRadiusQ 1 ≤ (j2ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j2ThetaNum, phaseMoment4Q, Fin.sum_univ_succ,
    secondCenterBandEnergyQ, secondCenterBandIntegerEnergy, tightScaledRQ, tightQuadRadiusQ]

/-- The third whole-source radius retains its raw Taylor factor `6`. -/
theorem tight_third_whole_margin :
    (phaseMoment6Q + thirdCenterEnergyQ - (6 * tightScaledRQ 2) ^ 2) / 2 +
      (9 / 2500000) * tightQuadRadiusQ 2 ≤ (j3ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j3ThetaNum, phaseMoment6Q, thirdCenterEnergyQ,
    tightScaledRQ, tightQuadRadiusQ]

set_option exponentiation.threshold 1100 in
/-- The first dyadic reserve exactly covers its certified squared excursion. -/
theorem tight_first_low_margin :
    (j1Eps : ℚ) / 2 ^ 1024 ≤ (tightLowErrorQ 0 - tightQuadRadiusQ 0) ^ 2 := by
  norm_num [j1Eps, tightLowErrorQ, tightQuadRadiusQ, tightLowReserveQ]

set_option exponentiation.threshold 1100 in
/-- The second dyadic reserve exactly covers its certified squared excursion. -/
theorem tight_second_low_margin :
    (j2Eps : ℚ) / 2 ^ 1024 ≤ (tightLowErrorQ 1 - tightQuadRadiusQ 1) ^ 2 := by
  norm_num [j2Eps, tightLowErrorQ, tightQuadRadiusQ, tightLowReserveQ]

set_option exponentiation.threshold 1100 in
/-- The third dyadic reserve exactly covers its certified squared excursion. -/
theorem tight_third_low_margin :
    (j3Eps : ℚ) / 2 ^ 1024 ≤ (tightLowErrorQ 2 - tightQuadRadiusQ 2) ^ 2 := by
  norm_num [j3Eps, tightLowErrorQ, tightQuadRadiusQ, tightLowReserveQ]

/-- The quadratic error charge retains the four unsplit sources. -/
def tightThreeBandQuadraticQ : ℚ := (∑ g : Fin 4, tightGroupRadiusQ g) ^ 2

end Grothe.Upper
