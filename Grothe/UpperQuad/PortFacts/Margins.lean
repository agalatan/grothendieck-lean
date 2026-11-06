import Grothe.UpperQuad.PortFacts.Thresholds
import Grothe.UpperChaos.PhaseMomentData
import Grothe.UpperChaos.WholeCenterEnergies
import Grothe.UpperChaos.TaylorTailData
import Grothe.Upper.ComparisonGroups

/-!
# The arithmetic margins of the final facts

The final facts give, per power `j`, a lower bound `θ_j` on the kernel's enclosure of the
Gauss–Legendre `I_j`-sum and an upper bound `eps_j / 2^1024` on the squared low-band excursions
of the Gauss sums from the center (`j<j>Final`, with the constants of `Thresholds.lean`).  The
consumers of the soundness layer need (`docs/UPPER_CLOSURE.md` §2, §8.4):

* the whole errors: `‖hpow j − c_j‖² = E φ^{2j} − 2 I_j + ‖c_j‖² ≤ (j! R_j)²`, i.e.
  `I_j ≥ I_j^min = (E φ^{2j} + ‖c_j‖² − (j! R_j)²)/2`, from `I_j ≥ θ_j − ρ_I`;
* the low bands: `‖P_band (hpow j − c_j)‖ ≤ √(eps_j)/2^512 + ρ_low ≤ cap_j`.

With the remainder budgets of §8.4 (`ρ_I = 10⁻¹², 5·10⁻¹⁴, 3·10⁻¹⁴`, `ρ_low = 10⁻¹¹, 10⁻¹⁰, 10⁻¹¹`)
both hold; these are the exact rational inequalities, with master's constants.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad.PortFacts

open Grothe.UpperChaos Grothe.Upper

theorem j1_whole_margin :
    (phaseMoment2Q + firstEnergyQ - comparisonGroupRadiusQ 1 ^ 2) / 2 + 1 / 10 ^ 12 ≤
      (j1ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j1ThetaNum, phaseMoment2Q, firstEnergyQ, Fin.sum_univ_succ, firstCenterBandEnergyQ,
    comparisonGroupRadiusQ]

theorem j2_whole_margin :
    (phaseMoment4Q + secondEnergyQ - (2 * comparisonGroupRadiusQ 2) ^ 2) / 2 + 5 / 10 ^ 14 ≤
      (j2ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j2ThetaNum, phaseMoment4Q, secondEnergyQ, Fin.sum_univ_succ, secondCenterBandEnergyQ,
    comparisonGroupRadiusQ]

theorem j3_whole_margin :
    (phaseMoment6Q + thirdEnergyQ - (6 * comparisonGroupRadiusQ 3) ^ 2) / 2 + 3 / 10 ^ 14 ≤
      (j3ThetaNum : ℚ) / 10 ^ 20 := by
  norm_num [j3ThetaNum, phaseMoment6Q, thirdEnergyQ, thirdCenterEnergyQ, comparisonGroupRadiusQ]

theorem j1_low_margin : (j1Eps : ℚ) / 2 ^ 1024 ≤ (firstCapturedErrorQ 0 - 1 / 10 ^ 11) ^ 2 := by
  norm_num [j1Eps, firstCapturedErrorQ]

theorem j2_low_margin : (j2Eps : ℚ) / 2 ^ 1024 ≤ (secondCapturedErrorQ 0 - 1 / 10 ^ 10) ^ 2 := by
  norm_num [j2Eps, secondCapturedErrorQ]

theorem j3_low_margin : (j3Eps : ℚ) / 2 ^ 1024 ≤ (thirdCapturedErrorQ 0 - 1 / 10 ^ 11) ^ 2 := by
  norm_num [j3Eps, thirdCapturedErrorQ]

end Grothe.UpperQuad.PortFacts
