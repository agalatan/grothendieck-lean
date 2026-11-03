import Lean.Util.CollectAxioms
import Grothe.UpperChaos.ProductionF0RationalCompletion
import Grothe.UpperChaos.ProductionRetainedEnergy

/-! The source-to-selected-energy part of the common tolerance ledger.
All allowances below are totals. The table certificate must concern the same
exact dyadic reference after the frozen correction and rational smoothing.
Continuous omissions, quadrature/evaluator error and contraction error must
already be included in the actual canonical tensor certificate; no numerical
certificate or final endpoint is assumed here. Agent-ID: codex-7c2e. -/

namespace Grothe.UpperChaos.CommonSourceTolerance

open MeasureTheory Finset Grothe.Upper FixedChaosSmoothing
noncomputable section

def canonicalCapQ : ℚ := 97 / 10 ^ 9
def rawCapQ : ℚ := 7 / 50000000
def projectedCapQ : ℚ := 29 / 200000000
def tableCapQ : ℚ := 1 / 10000000
def selectedEnergyCapQ : ℚ := 1 / 2500000

/-- Reflection is charged once, after the coupled canonical tensor error.
The exact rational completion contributes its own square-root-floor defect. -/
theorem canonical_completion_budget :
    (10 / 7 : ℝ) * (canonicalCapQ : ℝ) +
      (1 / (2 : ℝ) ^ 54) * (1 + (canonicalCapQ : ℝ)) ≤ (rawCapQ : ℝ) := by
  norm_num [canonicalCapQ, rawCapQ]

/-- The existing relative smoothing reserve is charged once to the full
finite input vector, whose norm follows from the actual source error. -/
theorem smoothing_budget :
    (rawCapQ : ℝ) + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + (rawCapQ : ℝ)) ≤
      (projectedCapQ : ℝ) := by
  norm_num [rawCapQ, projectedCapQ]

/-- The same-output table discrepancy is inside the selected energy budget. -/
theorem selected_energy_budget :
    (2 * (501 / 500 : ℝ) + 3 * (projectedCapQ : ℝ)) * (projectedCapQ : ℝ) +
      (tableCapQ : ℝ) ≤ (selectedEnergyCapQ : ℝ) := by
  norm_num [projectedCapQ, tableCapQ, selectedEnergyCapQ]

/-- A canonical tensor certificate gives an actual complete degree-501 F0
head approximation, with the rational completion defect paid separately. -/
theorem raw_error_of_canonical_reference (g : ℕ → ℕ → ℕ → ℚ)
    (hcanonical : canonicalTensorErrorNorm g ≤ (canonicalCapQ : ℝ)) :
    ‖productionF0Head - gradedHermite 251 (dyadicTensorReference g)‖ ≤
      (rawCapQ : ℝ) := by
  have h := norm_productionF0Head_sub_le_canonical (dyadicTensorReference g)
  have hd := rationalTensorCompletion_defect_le (2 ^ 54) (by positivity) g
  rw [dyadicTensorReference, canonical_error_rationalTensorCompletion] at h
  norm_num only [Nat.cast_pow, Nat.cast_ofNat] at hd
  have hb := canonical_completion_budget
  linarith

/-- Propagate actual raw F0 error and same-output table error to all selected
energies; the frozen correction enters once through retainedSmoothed. -/
theorem selected_energy_of_raw_source (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖productionF0Head - gradedHermite 251 a0‖ ≤ (rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed a0) p - (energyTable p : ℝ)| ≤ (tableCapQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤
      (selectedEnergyCapQ : ℝ) :=
  selected_energy_close_of_raw_error a0 hraw htable smoothing_budget selected_energy_budget

/-- The numerical source and table premises share the exact same rational
coefficient family. An archived floating output certificate cannot replace it. -/
theorem selected_energy_of_canonical_reference (g : ℕ → ℕ → ℕ → ℚ)
    (hcanonical : canonicalTensorErrorNorm g ≤ (canonicalCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed (dyadicTensorReference g)) p - (energyTable p : ℝ)| ≤
        (tableCapQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤
      (selectedEnergyCapQ : ℝ) :=
  selected_energy_of_raw_source (dyadicTensorReference g)
    (raw_error_of_canonical_reference g hcanonical) htable

end
end Grothe.UpperChaos.CommonSourceTolerance

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.CommonSourceTolerance.canonical_completion_budget,
      ``Grothe.UpperChaos.CommonSourceTolerance.smoothing_budget,
      ``Grothe.UpperChaos.CommonSourceTolerance.selected_energy_budget,
      ``Grothe.UpperChaos.CommonSourceTolerance.raw_error_of_canonical_reference] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected common-tolerance axioms: {unexpected}"
