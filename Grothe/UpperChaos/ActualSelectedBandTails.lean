import Grothe.UpperChaos.ActualMatrixRectangleTail
import Grothe.UpperChaos.ComparisonPieces

/-!
# The fourteen actual finite comparison bands and their original gate quartets

Agent-ID: codex-2ca4.

The selected bands are exactly indices 1--6, 8--11 and 13--16 of the actual
comparison table. Their gates are consecutive quartets in the existing pinned
56-gate table. All metadata proofs use kernel reduction; covariance validity is
reused from `parameters_checked`. No numerical integral estimate is assumed.
-/

namespace Grothe.UpperChaos.ActualSelectedBandTails

open OriginalHSParameterGates ActualMatrixCutoffTail
open ActualMatrixRectangleTail ActualSourceNormEvaluation

noncomputable section

/-- Skip the correction band and the three unbounded Taylor tails. -/
def selectedBand (b : Fin 14) : ComparisonIndex :=
  ⟨if b.val < 6 then b.val + 1 else if b.val < 10 then b.val + 2 else b.val + 3, by
    change (if b.val < 6 then b.val + 1 else if b.val < 10 then b.val + 2
      else b.val + 3) < 18
    have hb := b.isLt
    split_ifs <;> omega⟩

theorem selectedBand_injective : Function.Injective selectedBand := by decide +kernel

/-- This selection is complete for the actual finite, nonzero-power bands. -/
theorem selectedBand_coverage : ∀ k : ComparisonIndex,
    ((pw k).val ≠ 0 ∧ (comparisonBand k).hi ≠ 0) ↔
      ∃ b : Fin 14, selectedBand b = k := by decide +kernel

private theorem gate_index_lt (b : Fin 14) (i : Fin 4) :
    4 * b.val + i.val < gates.length := by
  change 4 * b.val + i.val < 56
  have hb := b.isLt
  have hi := i.isLt
  omega

/-- Read the original pinned gate, without reconstructing its rational parameters. -/
def selectedGate (b : Fin 14) (i : Fin 4) : Gate :=
  gates[4 * b.val + i.val]'(gate_index_lt b i)

theorem selectedGate_mem (b : Fin 14) (i : Fin 4) : selectedGate b i ∈ gates :=
  List.getElem_mem (gate_index_lt b i)

theorem selectedGate_checked (b : Fin 14) (i : Fin 4) :
    gateOK (selectedGate b i) = true :=
  gate_checked_of_mem _ (selectedGate_mem b i)

theorem selectedGate_power : ∀ b : Fin 14, ∀ i : Fin 4,
    (selectedGate b i).power = (pw (selectedBand b)).val := by decide +kernel

theorem selectedGate_degree : ∀ b : Fin 14, ∀ i : Fin 4,
    (selectedGate b i).degree = (comparisonBand (selectedBand b)).hi := by decide +kernel

theorem selectedGate_coordinate : ∀ b : Fin 14, ∀ i : Fin 4,
    (selectedGate b i).coordinate = i.val := by decide +kernel

theorem selectedGate_cutoff : ∀ b : Fin 14, ∀ i : Fin 4,
    (selectedGate b i).cutoff = rectangleCutoff i := by decide +kernel

theorem selectedBand_hi_ne_zero : ∀ b : Fin 14,
    (comparisonBand (selectedBand b)).hi ≠ 0 := by decide +kernel

/-- The quartet hypotheses are discharged for every selected production band. -/
def selectedQuartet (b : Fin 14) :
    GateQuartet (pw (selectedBand b)).val (comparisonBand (selectedBand b)).hi where
  gate := selectedGate b
  checked := selectedGate_checked b
  power_eq := selectedGate_power b
  degree_eq := selectedGate_degree b
  coordinate_eq := selectedGate_coordinate b
  cutoff_eq := selectedGate_cutoff b

/-- Every actual finite Taylor band has a summable rectangle-complement energy. -/
theorem summable_selectedBand_rectangleEnergy (b : Fin 14) :
    Summable (bandRectangleExcludedEnergyTerm
      (pw (selectedBand b)).val (comparisonBand (selectedBand b))) := by
  exact summable_bandRectangleExcludedEnergyTerm (selectedQuartet b)
    (comparisonBand (selectedBand b)) (selectedBand_hi_ne_zero b) le_rfl

/-- All fourteen actual rectangle tails reduce to four finite source-norm values each. -/
theorem selectedBand_rectangleEnergy_le (b : Fin 14) :
    (∑' mn : Idx2 × Idx2, bandRectangleExcludedEnergyTerm
      (pw (selectedBand b)).val (comparisonBand (selectedBand b)) mn) ≤
      ∑ i : Fin 4, (sourceNormValue (selectedGate b i)).re / cutoffWeight (selectedGate b i) := by
  exact tsum_bandRectangleExcludedEnergy_le (selectedQuartet b)
    (comparisonBand (selectedBand b)) (selectedBand_hi_ne_zero b) le_rfl

end
end Grothe.UpperChaos.ActualSelectedBandTails
