import Grothe.Upper.ThreeBandBudget
import Grothe.UpperChaos.PhaseMomentData
import Grothe.UpperChaos.TaylorCenterBandData
import Grothe.UpperChaos.TaylorBandData
import Grothe.UpperQuad.PortFacts.Thresholds

/-!
# Tight arithmetic budgets for the existing upper certificate

The production panel certificates have much smaller total caps than their original allowances.
These radii retain the existing tail and root-gap reserve, use the exact dyadic table excursions,
and recompute whole-source error radii from the already certified inner-product thresholds.
The comparison then deducts the forced linear energy from the sharp Hardy budget.

This module proves only exact arithmetic. The panel acceptance facts and their analytic
interpretation are supplied separately; no new finite numerical assumption is introduced here.

Agent-ID: codex-c8a4. Refs #389.
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

/-- Tight square-root ceilings for the grouped reference masses, using the existing caps. -/
def tightThreeBandMassQ (j : Fin 7) : ℚ :=
  if j = 2 then 91516952888826 / 10 ^ 15 else
  if j = 4 then 91516952739994 / 10 ^ 15 else
  if j = 6 then 198924380740356 / 10 ^ 15 else (threeBandBands j).norm

theorem tightThreeBandMassQ_nonneg (j : Fin 7) : 0 ≤ tightThreeBandMassQ j := by
  have h : ∀ j : Fin 7, 0 ≤ tightThreeBandMassQ j := by decide +kernel
  exact h j

/-- Regroup the already certified eighteen mass squares without coarse decimal rounding. -/
theorem tightThreeBand_mass_caps (j : Fin 7) :
    (∑ k : Fin 18, if threeBandOldGroup k = j then comparisonBands[k].norm ^ 2 else 0) ≤
      tightThreeBandMassQ j ^ 2 := by
  have h : ∀ j : Fin 7,
      (∑ k : Fin 18, if threeBandOldGroup k = j then comparisonBands[k].norm ^ 2 else 0) ≤
        tightThreeBandMassQ j ^ 2 := by decide +kernel
  exact h j

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

/-- Tight error radii and regrouped reference masses from the existing certificates. -/
def tightThreeBandCompareQ : ℚ :=
  2 * ∑ j : Fin 7, tightThreeBandMassQ j * tightThreeBandErrorQ j +
    tightThreeBandQuadraticQ

/-- The finite head residual, including the existing table tolerance. -/
def tightHeadResidualQ : ℚ := headCapQ + energyErrQ + tightThreeBandCompareQ

/-- The linear coefficient forced by the finite head residual. -/
def tightLinearLowerQ : ℚ := slopeQ - tightHeadResidualQ

/-- The sharp Hardy budget after deducting linear energy and shifting the radial index. -/
def tightShiftedBudgetQ : ℚ :=
  (1737972 / 1000000 - tightLinearLowerQ ^ 2 * (4149 / 4000) ^ 2) / (4149 / 4000) ^ 4

/-- The tail cap beyond degree `501`, using the deducted Hardy budget. -/
def tightTailQ : ℚ := 303362611 / 10 ^ 16

def tightResidualQ : ℚ := tightHeadResidualQ + tightTailQ

def tightValueQ : ℚ := 1 / (slopeQ - tightResidualQ)

theorem tightHeadResidualQ_exact :
    tightHeadResidualQ =
      24910136796371013041787179493800509 / 16384000000000000000000000000000000000000 := by
  decide +kernel

theorem tightLinearLowerQ_pos : 0 < tightLinearLowerQ := by decide +kernel

theorem tightShiftedBudgetQ_nonneg : 0 ≤ tightShiftedBudgetQ := by decide +kernel

theorem tightTailQ_nonneg : 0 ≤ tightTailQ := by decide +kernel

theorem tightResidualQ_lt_slopeQ : tightResidualQ < slopeQ := by decide +kernel

/-- The exact new reciprocal lies strictly below this twelve-decimal threshold. -/
theorem tightValueQ_lt : tightValueQ < 1404599412097 / 10 ^ 12 := by decide +kernel

theorem tight_real_reciprocal :
    1 / ((slopeQ : ℝ) - (tightResidualQ : ℝ)) = (tightValueQ : ℝ) := by
  norm_num only [tightValueQ, Rat.cast_div, Rat.cast_one, Rat.cast_sub]

theorem tight_real_value_lt : (tightValueQ : ℝ) < (1.404599412097 : ℝ) := by
  calc
    (tightValueQ : ℝ) < (((1404599412097 : ℚ) / 10 ^ 12 : ℚ) : ℝ) := by
      exact_mod_cast tightValueQ_lt
    _ = (1.404599412097 : ℝ) := by norm_num

/-- Kernel-checked integer arithmetic gives the tail comparison after the radial-index shift. -/
theorem tight_hardy_numeric :
    (tightShiftedBudgetQ : ℝ) * (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 250 + 1)) ≤
      (tightTailQ : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
  have hN :
      (5122344528823656479503303427411872446249193426871408702127005549160122066029320159190719 *
        4000 ^ 1002 : ℕ) ≤
      622670654888495904523111826975998607360000000000000000000000000000000000 *
        4149 ^ 1002 := by decide +kernel
  have hR :
      (5122344528823656479503303427411872446249193426871408702127005549160122066029320159190719 *
        4000 ^ 1002 : ℝ) ≤
      622670654888495904523111826975998607360000000000000000000000000000000000 *
        4149 ^ 1002 := by exact_mod_cast hN
  have ha : (0 : ℝ) ≤ 4000 ^ 1002 := by positivity
  have hb : (0 : ℝ) < 4149 ^ 1002 := by positivity
  rw [show 2 * (2 * 250 + 1) = 1002 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 1002 = a at hR ha ⊢
  generalize (4149 : ℝ) ^ 1002 = b at hR hb ⊢
  norm_num [tightShiftedBudgetQ, tightLinearLowerQ, tightHeadResidualQ_exact, slopeQ, tightTailQ]
  rw [← mul_div_assoc, div_le_iff₀ hb]
  linarith

end Grothe.Upper
