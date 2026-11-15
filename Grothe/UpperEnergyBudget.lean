-- Grothe/UpperEnergyBudget.lean
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Tactic.NormNum

/-!
# Quantitative accuracy of the production energy table

The existing twelve block checks each allow `5 * 10^64` units at scale `2^256`.
Keeping that exact allowance, and tightening only the intermediate radii, gives
an energy error of `8296 / 10^15`. A weighted square inequality avoids the
factor two in combining quadrature and interval-width errors. No numerical
acceptance fact is changed.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.UpperQuad.EnergyBudget

/-- Weight of the analytic quadrature error in the squared-norm split. -/
def quadWeightQ : ℚ := 1 + 1 / 10 ^ 10

/-- Weight of the much smaller interval-width error in the squared-norm split. -/
def intervalWeightQ : ℚ := 1 + 10 ^ 10

/-- Raw coefficient radius, after the quadrature and interval-width errors. -/
def rawQ : ℚ := 15500000001 / 10 ^ 22

/-- Radius after the certified production smoothing error. -/
def smoothQ : ℚ := 155400800011 / 10 ^ 23

/-- Selected energy error, with the exact existing block allowance. -/
def errorQ : ℚ := 8296 / 10 ^ 15

theorem rawQ_nonneg : 0 ≤ rawQ := by norm_num [rawQ]

theorem width_budget :
    quadWeightQ * (155 / 10 ^ 14 : ℚ) ^ 2 +
      intervalWeightQ * (12 * 2 ^ 100 / 2 ^ 256 : ℚ) ≤ rawQ ^ 2 := by
  norm_num [quadWeightQ, intervalWeightQ, rawQ]

theorem smoothing_budget :
    rawQ + (4 / 10 ^ 15 : ℚ) * (501 / 500 + rawQ) ≤ smoothQ := by
  norm_num [rawQ, smoothQ]

theorem energy_budget :
    (2 * (501 / 500 : ℚ) + 3 * smoothQ) * smoothQ +
      (12 * (5 * 10 ^ 64) / 2 ^ 256 : ℚ) ≤ errorQ := by
  norm_num [smoothQ, errorQ]

end Grothe.UpperQuad.EnergyBudget
