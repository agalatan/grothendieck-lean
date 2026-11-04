import Grothe.Upper.CompositeComparisonData
import Lean.Util.CollectAxioms

/-! Relax the selected energy-table tolerance while retaining all eighteen
original comparison bands and their Gaussian error radii. The added radius
belongs only to the weighted response mass in each band.
Agent-ID: codex-7c2e. -/

namespace Grothe.Upper.RelaxedComparisonData

open Finset

def radiusSlackQ : ℚ := 1 / 5000
def energyErrorQ : ℚ := CompositeComparisonData.energyErrorQ
def comparisonCapQ : ℚ := 9 / 10 ^ 7
def headResidualQ : ℚ := headCapQ + energyErrorQ + comparisonCapQ
def residualQ : ℚ := headResidualQ + CompositeComparisonData.rawTailQ
def upperQ : ℚ := 14045984 / 10 ^ 7

theorem radiusSlack_nonneg : 0 ≤ radiusSlackQ := by norm_num [radiusSlackQ]

/-- An energy discrepancy is absorbed by the square of a mass-radius increase;
it is never used as an L2 error allowance. -/
theorem energy_le_radiusSlack_sq : energyErrorQ ≤ radiusSlackQ ^ 2 := by
  norm_num [energyErrorQ, CompositeComparisonData.energyErrorQ, radiusSlackQ]

theorem original_energy_nonneg : 0 ≤ energyErrQ := by norm_num [energyErrQ]

/-- Gaussian error radii and the grouped quadratic cost are unchanged. Only
the response band-mass radii receive the displayed slack. -/
theorem comparison_budget :
    2 * (comparisonBands.map fun b => (b.norm + radiusSlackQ) * b.error).sum +
      (∑ g : Fin 4, comparisonGroupRadiusQ g) ^ 2 ≤ comparisonCapQ := by
  norm_num [comparisonBands, radiusSlackQ, comparisonGroupRadiusQ, comparisonCapQ,
    Fin.sum_univ_succ]

theorem residual_value : residualQ = 994901 / 10 ^ 12 := by
  norm_num [residualQ, headResidualQ, energyErrorQ, CompositeComparisonData.energyErrorQ,
    comparisonCapQ, headCapQ, CompositeComparisonData.rawTailQ]

theorem denominator_pos : 0 < slopeQ - residualQ := by
  rw [residual_value]
  norm_num [slopeQ]

/-- The tail tolerance remains a separate premise of the final analytic
transfer; this is only its exact scalar budget. -/
theorem transfer_value_lt :
    (1 / ((slopeQ - residualQ : ℚ) : ℝ)) < (upperQ : ℝ) := by
  rw [residual_value]
  norm_num [slopeQ, upperQ]

theorem upper_lt_decimal : (upperQ : ℝ) < 1.4046 := by norm_num [upperQ]

end Grothe.Upper.RelaxedComparisonData

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.Upper.RelaxedComparisonData.comparison_budget,
      ``Grothe.Upper.RelaxedComparisonData.residual_value,
      ``Grothe.Upper.RelaxedComparisonData.transfer_value_lt,
      ``Grothe.Upper.RelaxedComparisonData.upper_lt_decimal] do
    let dependencies ← Lean.collectAxioms target
    Lean.logInfo m!"Relaxed comparison scalar audit {target}: {dependencies}"
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected relaxed comparison scalar axioms: {unexpected}"
