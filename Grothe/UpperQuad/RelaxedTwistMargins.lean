import Grothe.UpperQuad.PortFacts.Thresholds
import Grothe.UpperChaos.PhaseMomentData
import Grothe.UpperChaos.WholeCenterEnergies
import Grothe.UpperChaos.TaylorTailData
import Grothe.Upper.RelaxedThreeBandBudget

/-!
# Exact margins for the relaxed twisted-quadrature radii

The whole-source identities charge the full coefficient-vector radius multiplied by the
proved center-norm cap. The low-band inequalities reserve `10⁻¹²` for the finite-table
excursion. These closed rational checks use the current port-fact thresholds and the same
radius definitions as the strict `1.4046` endpoint.

Agent-ID: codex-2f3d. Refs #334, #332.
-/

namespace Grothe.UpperQuad.RelaxedTwist

open Grothe.UpperChaos Grothe.Upper Grothe.UpperChaos.WholeCenterEnergies
open Grothe.UpperQuad.PortFacts

set_option exponentiation.threshold 1100 in
/-- The first whole margin pays the center-norm charge at the full relaxed radius. -/
theorem first_whole_margin :
    (phaseMoment2Q + firstEnergyQ - comparisonGroupRadiusQ 1 ^ 2) / 2 +
      (161 / 100000) * relaxedQuadRadiusQ 0 ≤ (j1ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j1ThetaNum, phaseMoment2Q, firstEnergyQ, Fin.sum_univ_succ,
    firstCenterBandEnergyQ, firstCenterBandIntegerEnergy, comparisonGroupRadiusQ,
    relaxedQuadRadiusQ]

set_option exponentiation.threshold 1100 in
/-- The second whole margin includes its unscaled Taylor radius. -/
theorem second_whole_margin :
    (phaseMoment4Q + secondEnergyQ - (2 * comparisonGroupRadiusQ 2) ^ 2) / 2 +
      (3 / 125000) * relaxedQuadRadiusQ 1 ≤ (j2ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j2ThetaNum, phaseMoment4Q, secondEnergyQ, Fin.sum_univ_succ,
    secondCenterBandEnergyQ, secondCenterBandIntegerEnergy, comparisonGroupRadiusQ,
    relaxedQuadRadiusQ]

/-- The third whole margin includes its unscaled Taylor radius. -/
theorem third_whole_margin :
    (phaseMoment6Q + thirdEnergyQ - (6 * comparisonGroupRadiusQ 3) ^ 2) / 2 +
      (9 / 2500000) * relaxedQuadRadiusQ 2 ≤ (j3ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j3ThetaNum, phaseMoment6Q, thirdEnergyQ, thirdCenterEnergyQ,
    comparisonGroupRadiusQ, relaxedQuadRadiusQ]

set_option exponentiation.threshold 1100 in
/-- The first table excursion fits the low-band reserve. -/
theorem first_low_margin :
    (j1Eps : ℚ) / 2 ^ 1024 ≤ (relaxedLowErrorQ 0 - relaxedQuadRadiusQ 0) ^ 2 := by
  norm_num [j1Eps, relaxedLowErrorQ, relaxedQuadRadiusQ]

set_option exponentiation.threshold 1100 in
/-- The second table excursion fits the low-band reserve. -/
theorem second_low_margin :
    (j2Eps : ℚ) / 2 ^ 1024 ≤ (relaxedLowErrorQ 1 - relaxedQuadRadiusQ 1) ^ 2 := by
  norm_num [j2Eps, relaxedLowErrorQ, relaxedQuadRadiusQ]

set_option exponentiation.threshold 1100 in
/-- The third table excursion fits the low-band reserve. -/
theorem third_low_margin :
    (j3Eps : ℚ) / 2 ^ 1024 ≤ (relaxedLowErrorQ 2 - relaxedQuadRadiusQ 2) ^ 2 := by
  norm_num [j3Eps, relaxedLowErrorQ, relaxedQuadRadiusQ]

end Grothe.UpperQuad.RelaxedTwist
