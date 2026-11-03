import Grothe.UpperChaos.ActualSelectedBandTails
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-!
# Finite actual matrix actions outside the original input rectangle

Agent-ID: codex-2ca4. Complete WIP proof bodies; compilation is pending.

The squared coefficient norm of an explicitly finite matrix action is bounded
by its entry energy times the squared input coefficient norm. For each of the
fourteen actual finite comparison bands, the entry energy is bounded by the
four exact sourceNormValue/cutoffWeight terms already proved for its original
gate quartet. Output indices and excluded input indices are explicitly filtered.

This is a finite coefficient-space statement. `ActualTaylorMultiplierOperator`
identifies the infinite Gaussian L2 multiplier, and
`ActualInfiniteRectangleOperator` passes these bounds to its coefficient
expansion. Numerical evaluation of the source-norm bounds remains open.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.ActualFiniteRectangleOperator

open ActualTaylorFiniteCoefficients ActualMatrixCutoffTail
open ActualMatrixRectangleTail ActualSelectedBandTails ActualSourceNormEvaluation

noncomputable section

/-- Finite complex Cauchy--Schwarz, with no assumption on either coefficient family. -/
theorem norm_sum_mul_sq_le {ι : Type*} (s : Finset ι) (a x : ι → ℂ) :
    ‖∑ n ∈ s, a n * x n‖ ^ 2 ≤
      (∑ n ∈ s, ‖a n‖ ^ 2) * (∑ n ∈ s, ‖x n‖ ^ 2) := by
  have hnorm : ‖∑ n ∈ s, a n * x n‖ ≤ ∑ n ∈ s, ‖a n‖ * ‖x n‖ := by
    simpa only [norm_mul] using norm_sum_le s (fun n => a n * x n)
  calc
    _ ≤ (∑ n ∈ s, ‖a n‖ * ‖x n‖) ^ 2 :=
      pow_le_pow_left₀ (norm_nonneg _) hnorm 2
    _ ≤ _ := Finset.sum_mul_sq_le_sq_mul_sq s (fun n => ‖a n‖) (fun n => ‖x n‖)

/-- The finite matrix action obeys the usual entry-energy bound. -/
theorem finite_matrix_action_sq_le {ι κ : Type*}
    (outputs : Finset ι) (inputs : Finset κ) (a : ι → κ → ℂ) (x : κ → ℂ) :
    (∑ m ∈ outputs, ‖∑ n ∈ inputs, a m n * x n‖ ^ 2) ≤
      (∑ m ∈ outputs, ∑ n ∈ inputs, ‖a m n‖ ^ 2) *
        (∑ n ∈ inputs, ‖x n‖ ^ 2) := by
  calc
    _ ≤ ∑ m ∈ outputs,
        (∑ n ∈ inputs, ‖a m n‖ ^ 2) * (∑ n ∈ inputs, ‖x n‖ ^ 2) :=
      Finset.sum_le_sum fun m _ => norm_sum_mul_sq_le inputs (a m) x
    _ = _ := (Finset.sum_mul outputs (fun m => ∑ n ∈ inputs, ‖a m n‖ ^ 2)
      (∑ n ∈ inputs, ‖x n‖ ^ 2)).symm

/-- Literal finite action of the actual normalized Hermite matrix. -/
def matrixAction (power : ℕ) (inputs : Finset Idx2) (x : Idx2 → ℂ) (m : Idx2) : ℂ :=
  ∑ n ∈ inputs, matrixEntry power m n * x n

/-- A finite block with the actual selected-band and rectangle restrictions has
the existing quartet bound, without a further coverage or gate-validity premise. -/
theorem finite_selectedBand_entryEnergy_le (b : Fin 14)
    (outputs inputs : Finset Idx2)
    (hout : ∀ m ∈ outputs, m ∈ bandModes (comparisonBand (selectedBand b)))
    (hin : ∀ n ∈ inputs, ¬ inputRectangle n) :
    (∑ m ∈ outputs, ∑ n ∈ inputs,
      ‖matrixEntry (pw (selectedBand b)).val m n‖ ^ 2) ≤
      ∑ i : Fin 4,
        (sourceNormValue (selectedGate b i)).re / cutoffWeight (selectedGate b i) := by
  classical
  calc
    _ = ∑ mn ∈ outputs ×ˢ inputs, bandRectangleExcludedEnergyTerm
        (pw (selectedBand b)).val (comparisonBand (selectedBand b)) mn := by
      rw [Finset.sum_product]
      apply Finset.sum_congr rfl
      intro m hm
      apply Finset.sum_congr rfl
      intro n hn
      simp only [bandRectangleExcludedEnergyTerm,
        ite_eq_left (And.intro (hout m hm) (hin n hn))]
    _ ≤ _ := finite_bandRectangleExcludedEnergy_le (selectedQuartet b)
      (comparisonBand (selectedBand b)) (selectedBand_hi_ne_zero b) le_rfl
      (outputs ×ˢ inputs)

/-- The actual finite matrix-action estimate on explicitly restricted index sets. -/
theorem finite_selectedBand_action_sq_le (b : Fin 14)
    (outputs inputs : Finset Idx2) (x : Idx2 → ℂ)
    (hout : ∀ m ∈ outputs, m ∈ bandModes (comparisonBand (selectedBand b)))
    (hin : ∀ n ∈ inputs, ¬ inputRectangle n) :
    (∑ m ∈ outputs, ‖matrixAction (pw (selectedBand b)).val inputs x m‖ ^ 2) ≤
      (∑ i : Fin 4,
        (sourceNormValue (selectedGate b i)).re / cutoffWeight (selectedGate b i)) *
          (∑ n ∈ inputs, ‖x n‖ ^ 2) := by
  have hx : 0 ≤ ∑ n ∈ inputs, ‖x n‖ ^ 2 :=
    Finset.sum_nonneg fun n _ => sq_nonneg _
  calc
    _ ≤ (∑ m ∈ outputs, ∑ n ∈ inputs,
        ‖matrixEntry (pw (selectedBand b)).val m n‖ ^ 2) *
          (∑ n ∈ inputs, ‖x n‖ ^ 2) := by
      simpa only [matrixAction] using
        finite_matrix_action_sq_le outputs inputs (matrixEntry (pw (selectedBand b)).val) x
    _ ≤ _ := mul_le_mul_of_nonneg_right
      (finite_selectedBand_entryEnergy_le b outputs inputs hout hin) hx

/-- Keep exactly the requested output indices belonging to the actual comparison band. -/
def selectedBandOutputs (b : Fin 14) (s : Finset Idx2) : Finset Idx2 := by
  classical
  exact s.filter (fun m => m ∈ bandModes (comparisonBand (selectedBand b)))

/-- Keep exactly the requested input indices outside (500, 500, 251, 250). -/
def rectangleComplementInputs (s : Finset Idx2) : Finset Idx2 := by
  classical
  exact s.filter (fun n => ¬ inputRectangle n)

@[simp] theorem mem_selectedBandOutputs (b : Fin 14) (s : Finset Idx2) (m : Idx2) :
    m ∈ selectedBandOutputs b s ↔
      m ∈ s ∧ m ∈ bandModes (comparisonBand (selectedBand b)) := by
  classical
  simp only [selectedBandOutputs, Finset.mem_filter]

@[simp] theorem mem_rectangleComplementInputs (s : Finset Idx2) (n : Idx2) :
    n ∈ rectangleComplementInputs s ↔ n ∈ s ∧ ¬ inputRectangle n := by
  classical
  simp only [rectangleComplementInputs, Finset.mem_filter]

/-- Every actual selected-band finite rectangle-tail action is bounded by its
four exact source norms times the squared norm of the filtered input coefficients.
All index restrictions are enforced by the displayed finite filters. -/
theorem filtered_selectedBand_action_sq_le (b : Fin 14)
    (outputs inputs : Finset Idx2) (x : Idx2 → ℂ) :
    (∑ m ∈ selectedBandOutputs b outputs,
      ‖matrixAction (pw (selectedBand b)).val (rectangleComplementInputs inputs) x m‖ ^ 2) ≤
      (∑ i : Fin 4,
        (sourceNormValue (selectedGate b i)).re / cutoffWeight (selectedGate b i)) *
          (∑ n ∈ rectangleComplementInputs inputs, ‖x n‖ ^ 2) := by
  exact finite_selectedBand_action_sq_le b
    (selectedBandOutputs b outputs) (rectangleComplementInputs inputs) x
    (fun m hm => ((mem_selectedBandOutputs b outputs m).1 hm).2)
    (fun n hn => ((mem_rectangleComplementInputs inputs n).1 hn).2)

end
end Grothe.UpperChaos.ActualFiniteRectangleOperator
