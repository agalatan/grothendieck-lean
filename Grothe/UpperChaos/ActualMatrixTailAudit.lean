import Grothe.UpperChaos.ActualSelectedBandTails
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for actual finite-band rectangle tails

Agent-ID: codex-2ca4.

The actual gate weights, coordinate union, finite-band membership and all
fourteen selected production bands are guarded by the standard three axioms.
These complete WIP proof bodies await compilation; numerical source bounds,
operator-norm conversion and the final endpoint are separate obligations.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.ActualMatrixBandTail.bandExcludedEnergyTerm_le,
    ``Grothe.UpperChaos.ActualMatrixBandTail.bandExcludedEnergyTerm_nonneg,
    ``Grothe.UpperChaos.ActualMatrixBandTail.finite_bandExcludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixBandTail.outputDegree_eq_bideg,
    ``Grothe.UpperChaos.ActualMatrixBandTail.outputDegree_le_of_mem_bandModes,
    ``Grothe.UpperChaos.ActualMatrixBandTail.summable_bandExcludedEnergyTerm,
    ``Grothe.UpperChaos.ActualMatrixBandTail.tsum_bandExcludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.cutoffWeight_le_energyWeight,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.cutoffWeight_pos,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.energyWeight_eq_selected_coordinate,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.excludedEnergyTerm_nonneg,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.finite_excludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.summable_excludedEnergyTerm,
    ``Grothe.UpperChaos.ActualMatrixCutoffTail.tsum_excludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.bandRectangleExcludedEnergyTerm_le,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.bandRectangleExcludedEnergyTerm_nonneg,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.finite_bandRectangleExcludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.finite_rectangleExcludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.inputRectangle_iff,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.not_inputRectangle_iff,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.rectangleExcludedEnergyTerm_le_sum,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.rectangleExcludedEnergyTerm_nonneg,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.summable_bandRectangleExcludedEnergyTerm,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.summable_rectangleExcludedEnergyTerm,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.tsum_bandRectangleExcludedEnergy_le,
    ``Grothe.UpperChaos.ActualMatrixRectangleTail.tsum_rectangleExcludedEnergy_le,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedBand_coverage,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedBand_hi_ne_zero,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedBand_injective,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedBand_rectangleEnergy_le,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedGate_checked,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedGate_coordinate,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedGate_cutoff,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedGate_degree,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedGate_mem,
    ``Grothe.UpperChaos.ActualSelectedBandTails.selectedGate_power,
    ``Grothe.UpperChaos.ActualSelectedBandTails.summable_selectedBand_rectangleEnergy]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
