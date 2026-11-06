import Grothe.Upper.ThreeBandBudget

/-!
# Three-band error allowances for the strict target `K < 1.4046`

The original whole-source radii, mass caps, energy-table tolerance and Hardy tail stay fixed.
Only the three low-band allowances increase. The resulting rational endpoint remains strictly
below `1.4046`. These arithmetic checks do not assert the Gaussian error bounds themselves.

The full quadrature targets include the tail and root gaps. Subtracting their `10⁻¹⁵` reserve
gives the covered-panel targets; `10⁻¹²` is reserved for the certified low-band table excursions.

Agent-ID: codex-1a87. Refs #332, #334, #335.
-/

set_option warningAsError true

namespace Grothe.Upper

open Finset GrotheKernel

/-- Full unscaled coefficient-vector error targets for the three Taylor powers. -/
def relaxedQuadRadiusQ : Fin 3 → ℚ
  | 0 => 4 / 10 ^ 9
  | 1 => 14 / 10 ^ 9
  | _ => 7 / 10 ^ 8

/-- The covered-panel portion of each quadrature target. -/
def relaxedPanelRadiusQ (g : Fin 3) : ℚ := relaxedQuadRadiusQ g - 1 / 10 ^ 15

/-- Unscaled low-band error targets, including the finite-table excursion allowance. -/
def relaxedLowErrorQ (g : Fin 3) : ℚ := relaxedQuadRadiusQ g + 1 / 10 ^ 12

/-- The seven linear-piece errors; Taylor factorials enter here exactly once. -/
def relaxedThreeBandErrorQ (j : Fin 7) : ℚ :=
  if j = 1 then relaxedLowErrorQ 0 else
  if j = 3 then relaxedLowErrorQ 1 / 2 else
  if j = 5 then relaxedLowErrorQ 2 / 6 else (threeBandBands j).error

theorem relaxedPanelRadiusQ_pos (g : Fin 3) : 0 < relaxedPanelRadiusQ g := by
  have h : ∀ g : Fin 3, 0 < relaxedPanelRadiusQ g := by decide +kernel
  exact h g

theorem relaxedLowErrorQ_literals :
    relaxedLowErrorQ 0 = 4001 / 10 ^ 12 ∧
    relaxedLowErrorQ 1 = 14001 / 10 ^ 12 ∧
    relaxedLowErrorQ 2 = 70001 / 10 ^ 12 := by
  decide +kernel

theorem relaxedThreeBandErrorQ_nonneg (j : Fin 7) : 0 ≤ relaxedThreeBandErrorQ j := by
  have h : ∀ j : Fin 7, 0 ≤ relaxedThreeBandErrorQ j := by decide +kernel
  exact h j

/-- Only the linear low-band charge changes; the unsplit whole-error charge is unchanged. -/
def relaxedThreeBandCompareQ : ℚ :=
  2 * ∑ j : Fin 7, (threeBandBands j).norm * relaxedThreeBandErrorQ j + threeBandQuadraticQ

def relaxedThreeBandResidualQ : ℚ :=
  headCapQ + energyErrQ + relaxedThreeBandCompareQ + threeBandRawTailQ

def relaxedThreeBandValueQ : ℚ := 1 / (slopeQ - relaxedThreeBandResidualQ)

theorem relaxedThreeBandResidualQ_lt_slopeQ : relaxedThreeBandResidualQ < slopeQ := by
  decide +kernel

/-- The relaxed endpoint still lies below the user's strict target. -/
theorem relaxedThreeBandValueQ_lt : relaxedThreeBandValueQ < (14046 : ℚ) / 10000 := by
  decide +kernel

theorem relaxedThreeBand_real_reciprocal :
    1 / ((slopeQ : ℝ) - (relaxedThreeBandResidualQ : ℝ)) = (relaxedThreeBandValueQ : ℝ) := by
  norm_num only [relaxedThreeBandValueQ, Rat.cast_div, Rat.cast_one, Rat.cast_sub]

theorem relaxedThreeBand_real_value_lt : (relaxedThreeBandValueQ : ℝ) < 14046 / 10000 := by
  calc
    (relaxedThreeBandValueQ : ℝ) < (((14046 : ℚ) / 10000 : ℚ) : ℝ) := by
      exact_mod_cast relaxedThreeBandValueQ_lt
    _ = (14046 / 10000 : ℝ) := by norm_num

end Grothe.Upper
