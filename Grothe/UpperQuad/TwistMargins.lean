import Grothe.UpperQuad.PortFacts.Thresholds
import Grothe.UpperChaos.PhaseMomentData
import Grothe.UpperChaos.WholeCenterEnergies
import Grothe.UpperChaos.TaylorTailData
import Grothe.Upper.ComparisonGroups

/-!
# The arithmetic margins of the twisted bridge

The exact rational inequalities between the thresholds of the final facts (`θ_j`, `eps_j`,
`PortFacts/Thresholds.lean`) and master's constants: the whole errors need
`(E φ^{2j} + ‖c_j‖² − (j! R_j)²)/2 + ρ_I ≤ θ_j`, the low bands `eps_j / 2^{1024} ≤ (cap_j − ρ_low)²`,
with `ρ_I = 10⁻¹², 5·10⁻¹⁴, 3·10⁻¹⁴` and `ρ_low = 10⁻¹¹, 10⁻¹⁰, 10⁻¹¹`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open Grothe.UpperChaos Grothe.Upper Grothe.UpperChaos.WholeCenterEnergies Grothe.UpperQuad.PortFacts

set_option exponentiation.threshold 1100 in
theorem twist_j1_whole_margin :
    (phaseMoment2Q + firstEnergyQ - comparisonGroupRadiusQ 1 ^ 2) / 2 + 1 / 10 ^ 12 ≤
      (j1ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j1ThetaNum, phaseMoment2Q, firstEnergyQ, Fin.sum_univ_succ, firstCenterBandEnergyQ,
    firstCenterBandIntegerEnergy, comparisonGroupRadiusQ]

set_option exponentiation.threshold 1100 in
theorem twist_j2_whole_margin :
    (phaseMoment4Q + secondEnergyQ - (2 * comparisonGroupRadiusQ 2) ^ 2) / 2 + 5 / 10 ^ 14 ≤
      (j2ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j2ThetaNum, phaseMoment4Q, secondEnergyQ, Fin.sum_univ_succ, secondCenterBandEnergyQ,
    secondCenterBandIntegerEnergy, comparisonGroupRadiusQ]

theorem twist_j3_whole_margin :
    (phaseMoment6Q + thirdEnergyQ - (6 * comparisonGroupRadiusQ 3) ^ 2) / 2 + 3 / 10 ^ 14 ≤
      (j3ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j3ThetaNum, phaseMoment6Q, thirdEnergyQ, thirdCenterEnergyQ, comparisonGroupRadiusQ]

theorem twist_j1_low_margin :
    (j1Eps : ℚ) / 2 ^ 1024 ≤ (firstCapturedErrorQ 0 - 1 / 10 ^ 11) ^ 2 := by
  have h : (j1Eps : ℚ) / 2 ^ 1024 = 1 / 2 ^ 82 := by
    rw [j1Eps, div_eq_div_iff (by positivity) (by positivity), one_mul]; push_cast; rw [← pow_add]
  rw [h]
  norm_num [firstCapturedErrorQ]

theorem twist_j2_low_margin :
    (j2Eps : ℚ) / 2 ^ 1024 ≤ (secondCapturedErrorQ 0 - 1 / 10 ^ 10) ^ 2 := by
  have h : (j2Eps : ℚ) / 2 ^ 1024 = 1 / 2 ^ 84 := by
    rw [j2Eps, div_eq_div_iff (by positivity) (by positivity), one_mul]; push_cast; rw [← pow_add]
  rw [h]
  norm_num [secondCapturedErrorQ]

theorem twist_j3_low_margin :
    (j3Eps : ℚ) / 2 ^ 1024 ≤ (thirdCapturedErrorQ 0 - 1 / 10 ^ 11) ^ 2 := by
  have h : (j3Eps : ℚ) / 2 ^ 1024 = 1 / 2 ^ 89 := by
    rw [j3Eps, div_eq_div_iff (by positivity) (by positivity), one_mul]; push_cast; rw [← pow_add]
  rw [h]
  norm_num [thirdCapturedErrorQ]

end Grothe.UpperQuad
