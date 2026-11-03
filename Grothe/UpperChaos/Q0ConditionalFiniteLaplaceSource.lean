import Grothe.UpperChaos.Q0ConditionalSoftening
import Grothe.UpperChaos.Q0ConditionalSourceVector
import Grothe.UpperChaos.Q0SourceExceptionalWeightedError
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Actual source-node errors from finite auxiliary-integral certificates.

Every coefficient below belongs to the same fixed-node base F0 response.
Softening and the infinite auxiliary tail are discharged uniformly at the
original source nodes. The finite-integral comparison with saved centers
remains explicit and is weighted using the original discrete Gaussian mass.
This does not identify the full phiT/P3 response or the production table.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource

open Q0GaussOrdinalEquiv Q0GaussProductionMass F0ConditionalNode
open ConditionalNodeIndices Q0ConditionalRetainedError Q0ConditionalSourceError
open Q0ConditionalRegularError Q0ConditionalSourceAssembly
open Q0ConditionalSourceVector Q0SourceExceptionGeometry Q0ConditionalFiniteLaplace

noncomputable section

/-- The finite auxiliary-integral coefficients at the original source node. -/
def finiteCoefficient (a : Address) (i : ℕ × ℕ) : ℂ :=
  finiteLaplaceCoefficient (sourceNode a) finiteLaplaceEta finiteLaplaceCutoff
    finiteLaplaceCutoff_nonneg i

/-- One coupled actual-to-finite error at every original source node. -/
theorem actual_finite_error_sq_le (a : Address) (S : Finset (ℕ × ℕ)) :
    (∑ i ∈ S, ‖coefficient (sourceNode a) i - finiteCoefficient a i‖ ^ 2) ≤
      (5 / 10 ^ 15 : ℝ) ^ 2 :=
  Q0ConditionalSoftening.coefficient_finiteLaplace_error_sq_le_fixed
    (sourceNode a) (sourceNode_pos a).le S

/-- The actual response-to-saved error needs only the finite-integral comparison.
The saved approximation must cover all selected modes, including its zeros. -/
theorem actual_saved_error_sq_le (a : Address) (S : Finset (ℕ × ℕ))
    (center : ℕ × ℕ → ℂ) (ε : ℝ) (hε : 0 ≤ ε)
    (hcenter : (∑ i ∈ S, ‖finiteCoefficient a i - center i‖ ^ 2) ≤ ε ^ 2) :
    (∑ i ∈ S, ‖coefficient (sourceNode a) i - center i‖ ^ 2) ≤
      ((5 / 10 ^ 15 : ℝ) + ε) ^ 2 :=
  Q0ConditionalSoftening.actual_saved_error_sq_le_fixed
    (sourceNode a) (sourceNode_pos a).le S center ε hε hcenter

/-- Row-dependent finite-integral errors with the original physical weights.
The regular and exceptional source address families remain disjoint. -/
def regularBudget (ε : Address → ℝ) : ℝ :=
  ∑ a ∈ regularNodes, nodeWeight a * ((5 / 10 ^ 15 : ℝ) + ε a) ^ 2

/-- A common coupled row tolerance is charged only against the actual source
mass. In particular, it does not acquire a selected-mode count factor. -/
theorem regular_budget_const_le (ε : ℝ) :
    regularBudget (fun _ => ε) ≤ (107 / 100 : ℝ) * ((5 / 10 ^ 15 : ℝ) + ε) ^ 2 := by
  classical
  unfold regularBudget
  calc
    _ ≤ ∑ a : Address, nodeWeight a * ((5 / 10 ^ 15 : ℝ) + ε) ^ 2 := by
      apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
      intro a _ _
      exact mul_nonneg (nodeWeight_nonneg a) (sq_nonneg _)
    _ = sourceMass * ((5 / 10 ^ 15 : ℝ) + ε) ^ 2 := by
      rw [sourceMass, Finset.sum_mul]
    _ ≤ _ := mul_le_mul_of_nonneg_right sourceMass_lt.le (sq_nonneg _)

/-- No mode-count factor: each row consumes one coupled vector certificate. -/
theorem regular_error_sq_le
    (center : Address → (ℕ × ℕ) → ℂ) (ε : Address → ℝ)
    (hε : ∀ a, ¬ exceptionalPanel a.1.val → 0 ≤ ε a)
    (hcenter : ∀ a, ¬ exceptionalPanel a.1.val →
      (∑ i ∈ modes,
        ‖finiteCoefficient a i - completedCenter center a i‖ ^ 2) ≤ ε a ^ 2) :
    retainedErrorSq regularModes (completedCenter center) ≤ regularBudget ε := by
  classical
  rw [Q0ConditionalSourceVector.regular_error_eq_sum]
  unfold regularBudget
  apply Finset.sum_le_sum
  intro a ha
  have hr : ¬ exceptionalPanel a.1.val := by
    simpa only [regularNodes, Finset.mem_filter, Finset.mem_univ, true_and] using ha
  exact mul_le_mul_of_nonneg_left
    (actual_saved_error_sq_le a modes (completedCenter center a) (ε a)
      (hε a hr) (hcenter a hr)) (nodeWeight_nonneg a)

/-- The exceptional contribution is already discharged; the regular numerical
certificate and its weighted budget remain explicit, with no new ledger value. -/
theorem source_error_sq_le
    (center : Address → (ℕ × ℕ) → ℂ) (ε : Address → ℝ) (R : ℝ)
    (hε : ∀ a, ¬ exceptionalPanel a.1.val → 0 ≤ ε a)
    (hcenter : ∀ a, ¬ exceptionalPanel a.1.val →
      (∑ i ∈ modes,
        ‖finiteCoefficient a i - completedCenter center a i‖ ^ 2) ≤ ε a ^ 2)
    (hbudget : regularBudget ε ≤ R ^ 2) :
    retainedErrorSq (fun _ => modes) (completedCenter (joinedCenter center)) ≤
      R ^ 2 + (2 / 10 ^ 25 : ℝ) ^ 2 :=
  Q0SourceExceptionalWeightedError.actual_source_error_sq_le center R
    ((regular_error_sq_le center ε hε hcenter).trans hbudget)

/-- Square-root form for the actual source-vector consumer. The independent
continuous quadrature, contraction, full-response and table obligations remain. -/
theorem source_error_le
    (center : Address → (ℕ × ℕ) → ℂ) (ε : Address → ℝ) (R : ℝ)
    (hε : ∀ a, ¬ exceptionalPanel a.1.val → 0 ≤ ε a)
    (hcenter : ∀ a, ¬ exceptionalPanel a.1.val →
      (∑ i ∈ modes,
        ‖finiteCoefficient a i - completedCenter center a i‖ ^ 2) ≤ ε a ^ 2)
    (hbudget : regularBudget ε ≤ R ^ 2) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤
        Real.sqrt (R ^ 2 + (2 / 10 ^ 25 : ℝ) ^ 2) :=
  Real.sqrt_le_sqrt (source_error_sq_le center ε R hε hcenter hbudget)


/-- A concrete sufficient coupled certificate for every regular source row.
The numerical finite-integral estimates remain inputs; their tolerance is a
whole-vector radius over all selected modes, including completed zero entries. -/
theorem source_error_le_of_uniform_finite_error
    (center : Address → (ℕ × ℕ) → ℂ)
    (hcenter : ∀ a, ¬ exceptionalPanel a.1.val →
      (∑ i ∈ modes,
        ‖finiteCoefficient a i - completedCenter center a i‖ ^ 2) ≤
          (19 / 10 ^ 11 : ℝ) ^ 2) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (253 / 10 ^ 12 : ℝ) := by
  have hbudget : regularBudget (fun _ => (19 / 10 ^ 11 : ℝ)) ≤
      (1969 / 10 ^ 13 : ℝ) ^ 2 :=
    (regular_budget_const_le (19 / 10 ^ 11)).trans (by norm_num)
  have h := source_error_le center (fun _ => (19 / 10 ^ 11 : ℝ))
    (1969 / 10 ^ 13) (fun _ _ => by norm_num) hcenter hbudget
  exact h.trans (Real.sqrt_le_iff.mpr ⟨by norm_num, by norm_num⟩)

end
end Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.actual_finite_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.actual_saved_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.regular_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.source_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.source_error_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.regular_budget_const_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource.source_error_le_of_uniform_finite_error] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
