import Grothe.UpperChaos.ActualFiniteRectangleOperator

/-!
# Physical coefficients of finite Hermite rectangle-tail inputs

Agent-ID: codex-2ca4. Complete WIP proof bodies; compilation is pending.

The input is the literal finite linear combination of production normalized
Hermite functions. Integrating its actual Taylor multiplier against an output
Hermite function gives exactly the finite matrix action. Thus the previously
derived selected-band action bound applies to physical Gaussian coefficients,
without an assumed operator-entry identity. Infinite expansions and numerical
enclosures of the four source norms remain separate obligations.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped BigOperators ComplexConjugate

namespace Grothe.UpperChaos.ActualRectangleCoefficientAction

open ActualTaylorCoherent ActualTaylorFiniteCoefficients
open ActualFiniteRectangleOperator ActualSelectedBandTails
open ActualMatrixCutoffTail ActualSourceNormEvaluation

noncomputable section

/-- A finite input in the production normalized Hermite basis. -/
def finiteHermiteInput (inputs : Finset Idx2) (x : Idx2 → ℂ) (zw : ℂ × ℂ) : ℂ :=
  ∑ n ∈ inputs, x n * hfun2 n zw

/-- The actual Gaussian coefficient after multiplication by `(i * phi)^power`.
The base response F0 is not part of this multiplier. -/
def outputCoefficient (power : ℕ) (inputs : Finset Idx2) (x : Idx2 → ℂ)
    (m : Idx2) : ℂ :=
  ∫ zw, conj (hfun2 m zw) * taylorPhasePower power zw *
    finiteHermiteInput inputs x zw ∂mu2

private theorem outputIntegrand_eq_sum (power : ℕ) (inputs : Finset Idx2)
    (x : Idx2 → ℂ) (m : Idx2) (zw : ℂ × ℂ) :
    conj (hfun2 m zw) * taylorPhasePower power zw * finiteHermiteInput inputs x zw =
      ∑ n ∈ inputs,
        (conj (hfun2 m zw) * taylorPhasePower power zw * hfun2 n zw) * x n := by
  classical
  simp only [finiteHermiteInput, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro n hn
  ring

/-- Every displayed physical coefficient is an absolutely integrable Gaussian
integral, using the genuine integrability of each actual matrix entry. -/
theorem integrable_outputCoefficient (power : ℕ) (inputs : Finset Idx2)
    (x : Idx2 → ℂ) (m : Idx2) :
    Integrable (fun zw => conj (hfun2 m zw) * taylorPhasePower power zw *
      finiteHermiteInput inputs x zw) mu2 := by
  classical
  simp_rw [outputIntegrand_eq_sum]
  exact integrable_finsetSum inputs fun n _ =>
    (integrable_matrixEntry power m n).mul_const (x n)

/-- Integration of the finite physical input is precisely the actual matrix
action; both Hermite normalization factors and the Gaussian measure are retained. -/
theorem outputCoefficient_eq_matrixAction (power : ℕ) (inputs : Finset Idx2)
    (x : Idx2 → ℂ) (m : Idx2) :
    outputCoefficient power inputs x m = matrixAction power inputs x m := by
  classical
  unfold outputCoefficient
  simp_rw [outputIntegrand_eq_sum]
  rw [integral_finsetSum inputs fun n _ =>
    (integrable_matrixEntry power m n).mul_const (x n)]
  simp only [integral_mul_const, matrixEntry, matrixAction]

/-- The selected-band Gaussian output coefficients of a finite input outside
the original rectangle satisfy the four actual source-norm bounds. The index
filters enforce all input and output restrictions in the statement itself. -/
theorem filtered_selectedBand_outputCoefficient_sq_le (b : Fin 14)
    (outputs inputs : Finset Idx2) (x : Idx2 → ℂ) :
    (∑ m ∈ selectedBandOutputs b outputs,
      ‖outputCoefficient (pw (selectedBand b)).val
        (rectangleComplementInputs inputs) x m‖ ^ 2) ≤
      (∑ i : Fin 4,
        (sourceNormValue (selectedGate b i)).re / cutoffWeight (selectedGate b i)) *
          (∑ n ∈ rectangleComplementInputs inputs, ‖x n‖ ^ 2) := by
  simp_rw [outputCoefficient_eq_matrixAction]
  exact filtered_selectedBand_action_sq_le b outputs inputs x

end
end Grothe.UpperChaos.ActualRectangleCoefficientAction
