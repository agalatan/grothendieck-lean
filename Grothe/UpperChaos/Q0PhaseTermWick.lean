import Grothe.UpperChaos.Q0PhaseMonomialExpansion
import Grothe.UpperChaos.Q0WickTermLinearity

/-!
# Exact Wick evaluation of one invariant phase term

This combines the generic binomial monomial expansion with additive Wick
evaluation. The source term, complex coordinate, Gaussian rate and shift are
arbitrary. No numerical table, positivity premise, compressed production
certificate or bound is asserted.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.Q0PhaseTermWick

open MvPolynomial
open Grothe.UpperChaos.Q0PhaseMonomialExpansion
open Grothe.UpperChaos.Q0WickTermLinearity
open Grothe.UpperChaos.Q0PhaseWickBridge

noncomputable section

/-- Exact Wick evaluation as an additive map, including coincident supports. -/
def wickEvalAddHom (β : ℝ) (μ : ℂ) : CPoly →+ ℂ where
  toFun := wickEval β μ
  map_zero' := by simp [wickEval]
  map_add' := wickEval_add β μ

/-- One literal invariant phase term evaluates to its exact binomial sum of
imaginary-square shifted moments. -/
theorem wickEval_single_phaseTerm (β : ℝ) (μ z : ℂ) (a b c : ℕ) (d : ℚ) :
    wickEval β μ (phaseInvariantSlice [((a, b, c), d)] z) =
      ∑ k ∈ Finset.range (c + 1),
        phaseMonomialCoeff a c k d z * imSqMoment β μ (b + k) (b + (c - k)) := by
  rw [phaseInvariantSlice_single_monomials]
  change wickEvalAddHom β μ _ = _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro k hk
  change wickEval β μ (monomial (exponentPair (b + k) (b + (c - k)))
    (phaseMonomialCoeff a c k d z)) = _
  rw [wickEval_monomial, exponentPair_zero, exponentPair_one]

end
end Grothe.UpperChaos.Q0PhaseTermWick
