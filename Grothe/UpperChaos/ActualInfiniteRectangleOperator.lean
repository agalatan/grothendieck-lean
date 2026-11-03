import Grothe.UpperChaos.ActualTaylorMultiplierOperator
import Mathlib.Topology.Algebra.InfiniteSum.Real

/-!
# Actual rectangle-tail multiplication on all physical L² inputs

Agent-ID: codex-2ca4. Complete WIP proof bodies; compilation is pending.

Finite input sums converge to the actual multiplier applied to the physical
rectangle-tail projection. Finite Bessel bounds control those inputs uniformly;
passing to the limit and using output Parseval gives the selected-band operator
bound for arbitrary L² inputs. The right-hand side is the same quartet of
actual Gaussian source norms as in the finite matrix estimate. No numerical
source-norm enclosure, new tolerance, or assumed matrix identity enters.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped BigOperators InnerProductSpace

namespace Grothe.UpperChaos.ActualInfiniteRectangleOperator

open ActualTaylorMultiplierOperator ActualFiniteRectangleOperator
open ActualSelectedBandTails ActualSourceNormEvaluation ActualMatrixCutoffTail

noncomputable section

/-- The unchanged sum of four actual source-norm bounds for a selected band. -/
def sourceBound (b : Fin 14) : ℝ :=
  ∑ i : Fin 4,
    (sourceNormValue (selectedGate b i)).re / cutoffWeight (selectedGate b i)

theorem sourceBound_nonneg (b : Fin 14) : 0 ≤ sourceBound b := by
  apply Finset.sum_nonneg
  intro i hi
  exact div_nonneg (sourceNormValue_re_nonneg _ (selectedGate_checked b i))
    (cutoffWeight_pos _ (selectedGate_checked b i)).le

/-- Infinite physical inputs satisfy the finite-output selected-band estimate.
The convergence used here is that of the actual continuous multiplier. -/
theorem finite_output_multiplier_sq_le (hφ : PhiBound) (b : Fin 14)
    (outputs : Finset Idx2) (f : Lp ℂ 2 mu2) :
    (∑ m ∈ selectedBandOutputs b outputs,
      ‖⟪hvec2 m, multiplier hφ (pw (selectedBand b)).val (rectangleTail f)⟫_ℂ‖ ^ 2)
      ≤ sourceBound b * ‖f‖ ^ 2 := by
  classical
  have hlim : Filter.Tendsto (fun inputs : Finset Idx2 =>
      ∑ m ∈ selectedBandOutputs b outputs,
        ‖matrixAction (pw (selectedBand b)).val (rectangleComplementInputs inputs)
          (fun n => ⟪hvec2 n, f⟫_ℂ) m‖ ^ 2) Filter.atTop
      (nhds (∑ m ∈ selectedBandOutputs b outputs,
        ‖⟪hvec2 m, multiplier hφ (pw (selectedBand b)).val (rectangleTail f)⟫_ℂ‖ ^ 2)) := by
    apply tendsto_finsetSum
    intro m hm
    exact (tendsto_rectangle_matrixAction hφ (pw (selectedBand b)).val m f).norm.pow 2
  apply le_of_tendsto hlim
  apply Filter.Eventually.of_forall
  intro inputs
  have hfinite := filtered_selectedBand_action_sq_le b outputs inputs
    (fun n => ⟪hvec2 n, f⟫_ℂ)
  have hinput : (∑ n ∈ rectangleComplementInputs inputs, ‖⟪hvec2 n, f⟫_ℂ‖ ^ 2)
      ≤ ‖f‖ ^ 2 :=
    orthonormal_hvec2.sum_inner_products_le f
  exact hfinite.trans (mul_le_mul_of_nonneg_left hinput (sourceBound_nonneg b))

/-- The physical rectangle-tail multiplier bound on the complete selected band,
for every L² input. This supplies the infinite-dimensional operator conclusion
from the finite Gaussian matrix estimates without assuming its coefficients. -/
theorem selectedBand_multiplier_sq_le (hφ : PhiBound) (b : Fin 14)
    (f : Lp ℂ 2 mu2) :
    ‖bandProj (comparisonBand (selectedBand b))
      (multiplier hφ (pw (selectedBand b)).val (rectangleTail f))‖ ^ 2
      ≤ sourceBound b * ‖f‖ ^ 2 := by
  classical
  let F := multiplier hφ (pw (selectedBand b)).val (rectangleTail f)
  let G := bandProj (comparisonBand (selectedBand b)) F
  have hfinite (outputs : Finset Idx2) :
      (∑ m ∈ outputs, ‖⟪hvec2 m, G⟫_ℂ‖ ^ 2) ≤ sourceBound b * ‖f‖ ^ 2 := by
    have h := finite_output_multiplier_sq_le hφ b outputs f
    simpa only [G, bandProj, inner_projOn, selectedBandOutputs,
      Finset.sum_filter, apply_ite, norm_zero, zero_pow (by decide : (2 : ℕ) ≠ 0), F]
      using h
  have hsum : (∑' m, ‖⟪hvec2 m, G⟫_ℂ‖ ^ 2) ≤ sourceBound b * ‖f‖ ^ 2 :=
    Real.tsum_le_of_sum_le (fun m => sq_nonneg _) hfinite
  rw [(hasSum_energy2 G).tsum_eq] at hsum
  exact hsum

end
end Grothe.UpperChaos.ActualInfiniteRectangleOperator
