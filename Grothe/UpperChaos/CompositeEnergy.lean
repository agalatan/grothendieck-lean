import Grothe.UpperChaos.CompositeComparison
import Grothe.UpperChaos.ProductionRetainedEnergy
import Grothe.UpperChaos.ProductionF0Omission
import Grothe.UpperChaos.ProductionF0Reconstruction
import Grothe.Upper.GroupedBridge

/-! Propagate the actual F0 source approximation through the frozen correction,
production smoothing, selected energy table, and composite Taylor comparison.
All analytic/source/table premises remain explicit; no completed upper-bound
facade or replacement of the original contracts is introduced here.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset Grothe.Upper GrotheKernel

namespace Grothe.UpperChaos.CompositeComparison
noncomputable section

/-- A raw F0 certificate and the actual rational output's table fit imply the
new full selected-energy tolerance. The frozen correction is inserted once,
and the existing relative smoothing reserve is derived from the input norm. -/
theorem energy_close_of_raw_source (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ p ∈ headIdx 501, |energy response p - (energyTable p : ℝ)| ≤
      (CompositeComparisonData.energyErrorQ : ℝ) := by
  apply FixedChaosSmoothing.selected_energy_close_of_raw_error a0 hraw htable
    (Δ := (CompositeComparisonData.projectedCapQ : ℝ))
  · exact_mod_cast CompositeComparisonData.raw_to_projected_budget
  · exact_mod_cast CompositeComparisonData.projected_energy_budget

theorem weighted_comparison_of_raw_source (h : Inputs) (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p * |energy rounding p - energy response p| ≤
      (CompositeComparisonData.comparisonCapQ : ℝ) :=
  weighted_energy_comparison h (energy_close_of_raw_source a0 hraw htable)

/-- Replace the full raw-source input by an actual approximation on the
entire complement of the three supplied root gaps and s>100. Their continuous
union is charged once; quadrature-panel coverage is not inferred. -/
theorem raw_error_of_regular_source (gaps : Fin 3 → Set ℝ)
    (hg : ∀ j, MeasurableSet (gaps j))
    (h13 : ∀ j, gaps j ⊆ Set.Ici (13 : ℝ))
    (hwidth : volume (FixedChaosSmoothing.F0Omission.threeRootGaps gaps) ≤
      ENNReal.ofReal (8 / 10 ^ 16 : ℝ))
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hregular : ‖FixedChaosSmoothing.F0Omission.completeRegularHead hg -
      gradedHermite 251 a0‖ ≤ (CompositeComparisonData.regularRawCapQ : ℝ)) :
    ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ) := by
  have h := FixedChaosSmoothing.F0Omission.complete_head_approx_error_le
    hg h13 hwidth a0 hregular
  have he : (CompositeComparisonData.massNormQ : ℝ) +
      (CompositeComparisonData.regularRawCapQ : ℝ) =
        (CompositeComparisonData.rawCapQ : ℝ) := by
    rw [CompositeComparisonData.regularRawCapQ, Rat.cast_sub]
    ring
  exact h.trans_eq he

theorem energy_close_of_regular_source (gaps : Fin 3 → Set ℝ)
    (hg : ∀ j, MeasurableSet (gaps j))
    (h13 : ∀ j, gaps j ⊆ Set.Ici (13 : ℝ))
    (hwidth : volume (FixedChaosSmoothing.F0Omission.threeRootGaps gaps) ≤
      ENNReal.ofReal (8 / 10 ^ 16 : ℝ))
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hregular : ‖FixedChaosSmoothing.F0Omission.completeRegularHead hg -
      gradedHermite 251 a0‖ ≤ (CompositeComparisonData.regularRawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ p ∈ headIdx 501, |energy response p - (energyTable p : ℝ)| ≤
      (CompositeComparisonData.energyErrorQ : ℝ) :=
  energy_close_of_raw_source a0
    (raw_error_of_regular_source gaps hg h13 hwidth a0 hregular) htable

/-- The actual stored head and actual Gaussian rounding are joined without
assuming the old, tighter comparison hypothesis from `DirectHyps`. -/
theorem head_residual_of_raw_source (h : Inputs) (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff (energy rounding) j -
      if j = 0 then (slopeQ : ℝ) else 0| ≤ (CompositeComparisonData.headResidualQ : ℝ) := by
  have hpG : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → energy rounding p = 0 :=
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc => GT_rot2 hc u)
  have hpX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → energy response p = 0 :=
    energy_eq_zero_of_even (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
      (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
  have hclose := energy_close_of_raw_source a0 hraw htable
  have hX : ∑ j ∈ range 251,
      |kernelCoeff (energy response) j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) + (CompositeComparisonData.energyErrorQ : ℝ) := by
    have h1 := Upper.head_residual_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly
      auxPoly_coeff_zero (energy response) (fun p => (energyTable p : ℝ)) hpX
      (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
    have h2 : ∑ j ∈ range 251,
        |∑ p ∈ headIdx 501, (energyTable p : ℝ) * (termOf primaryPoly auxPoly p).coeff j -
          if j = 0 then (slopeQ : ℝ) else 0| ≤ headCapQ :=
      head_le_of_check Grothe.head_check
    unfold kernelCoeff
    linarith
  have hc := weighted_energy_comparison h hclose
  have hloc := Upper.head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
    (energy rounding) (energy response) hpG (N := 501) (K := 251) (by norm_num)
    (slopeQ : ℝ) comparisonWeight (fun p _ => comparisonWeight_sound p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, energy response p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff (energy response) j -
        if j = 0 then (slopeQ : ℝ) else 0| := by
    apply sum_congr rfl
    intro j hj
    rw [show kernelCoeff (energy response) j = ∑ p ∈ headIdx 501,
      energy response p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly auxPoly_coeff_zero (energy response) hpX
        (by have := mem_range.mp hj; omega)]
  rw [heq] at hloc
  have hb := hloc.trans (add_le_add hX hc)
  calc
    _ ≤ (headCapQ : ℝ) + (CompositeComparisonData.energyErrorQ : ℝ) +
        (CompositeComparisonData.comparisonCapQ : ℝ) := hb
    _ = (CompositeComparisonData.headResidualQ : ℝ) := by
      simp only [CompositeComparisonData.headResidualQ, Rat.cast_add]
      ring

/-- The actual regular-source certificate feeds the same selected head,
with all six Gaussian premises and the exact output-table fit still explicit. -/
theorem head_residual_of_regular_source (h : Inputs) (gaps : Fin 3 → Set ℝ)
    (hg : ∀ j, MeasurableSet (gaps j))
    (h13 : ∀ j, gaps j ⊆ Set.Ici (13 : ℝ))
    (hwidth : volume (FixedChaosSmoothing.F0Omission.threeRootGaps gaps) ≤
      ENNReal.ofReal (8 / 10 ^ 16 : ℝ))
    (a0 : ℕ → ℕ → ℕ → ℚ)
    (hregular : ‖FixedChaosSmoothing.F0Omission.completeRegularHead hg -
      gradedHermite 251 a0‖ ≤ (CompositeComparisonData.regularRawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff (energy rounding) j -
      if j = 0 then (slopeQ : ℝ) else 0| ≤ (CompositeComparisonData.headResidualQ : ℝ) :=
  head_residual_of_raw_source h a0
    (raw_error_of_regular_source gaps hg h13 hwidth a0 hregular) htable

/-- Actual canonical tensor errors and the separately certified completion
of the same rational output suffice for the full raw F0 input. -/
theorem raw_error_of_canonical_tensor (a0 : ℕ → ℕ → ℕ → ℚ)
    (hbudget : (10 / 7 : ℝ) * FixedChaosSmoothing.canonicalTensorErrorNorm a0 +
      FixedChaosSmoothing.tensorCompletionDefectNorm a0 ≤
        (CompositeComparisonData.rawCapQ : ℝ)) :
    ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ) :=
  (FixedChaosSmoothing.norm_productionF0Head_sub_le_canonical a0).trans hbudget

theorem energy_close_of_canonical_tensor (a0 : ℕ → ℕ → ℕ → ℚ)
    (hbudget : (10 / 7 : ℝ) * FixedChaosSmoothing.canonicalTensorErrorNorm a0 +
      FixedChaosSmoothing.tensorCompletionDefectNorm a0 ≤
        (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ p ∈ headIdx 501, |energy response p - (energyTable p : ℝ)| ≤
      (CompositeComparisonData.energyErrorQ : ℝ) :=
  energy_close_of_raw_source a0 (raw_error_of_canonical_tensor a0 hbudget) htable

/-- The same actual tensor certificates reach the selected kernel head;
Gaussian comparison and output-table agreement remain explicit. -/
theorem head_residual_of_canonical_tensor (h : Inputs) (a0 : ℕ → ℕ → ℕ → ℚ)
    (hbudget : (10 / 7 : ℝ) * FixedChaosSmoothing.canonicalTensorErrorNorm a0 +
      FixedChaosSmoothing.tensorCompletionDefectNorm a0 ≤
        (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff (energy rounding) j -
      if j = 0 then (slopeQ : ℝ) else 0| ≤ (CompositeComparisonData.headResidualQ : ℝ) :=
  head_residual_of_raw_source h a0 (raw_error_of_canonical_tensor a0 hbudget) htable

end
end Grothe.UpperChaos.CompositeComparison
