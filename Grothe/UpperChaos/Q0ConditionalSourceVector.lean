import Grothe.UpperChaos.Q0ConditionalLinearError
import Grothe.UpperChaos.Q0SourceExceptionMassClosure
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Whole-vector error budgets on the actual selected source nodes.
The near-zero model is used only on a caller-selected subset of regular nodes.
Other regular nodes retain their separate evaluator obligations. Every weight
is the existing physical source weight times the Gaussian density once.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalSourceVector

open Q0GaussOrdinalEquiv Q0GaussProductionMass F0ConditionalNode
open ConditionalNodeIndices Q0ConditionalRetainedError Q0ConditionalSourceError
open Q0ConditionalRegularError Q0ConditionalSourceAssembly
open Q0SourceExceptionGeometry ZeroProfilePhaseStability

noncomputable section

/-- Physical parameter enclosures and one coupled saved-model error bound.
The last field is a vector certificate, not a bound on each scalar entry. -/
structure LinearRowBounds (a : Address) (center : (ℕ × ℕ) → ℂ)
    (r ρ η ε : ℝ) : Prop where
  radius_nonneg : 0 ≤ ρ
  parameter_nonneg : 0 ≤ η
  saved_nonneg : 0 ≤ ε
  ratio_le : |signedProfileRatio (sourceNode a)| ≤ ρ
  parameter_le : |signedProfileRatio (sourceNode a) - r| ≤ η
  saved_sq_le : (∑ i ∈ modes, ‖linearCenter r i - center i‖ ^ 2) ≤ ε ^ 2

/-- Bessel pays the analytic remainder once for the whole selected vector.
The two-coordinate parameter error and saved-vector error are paid separately. -/
theorem linear_row_error_sq_le (a : Address) (center : (ℕ × ℕ) → ℂ)
    (r ρ η ε : ℝ) (h : LinearRowBounds a center r ρ η ε) :
    (∑ i ∈ modes, ‖coefficient (sourceNode a) i - center i‖ ^ 2) ≤
      (5 * ρ ^ 2 + η + ε) ^ 2 := by
  have hρ : signedProfileRatio (sourceNode a) ^ 2 ≤ ρ ^ 2 := by
    simpa only [sq_abs] using
      (sq_le_sq₀ (abs_nonneg _) h.radius_nonneg).2 h.ratio_le
  have hε := h.saved_nonneg
  have hη := h.parameter_nonneg
  have hrad : 5 * signedProfileRatio (sourceNode a) ^ 2 +
      |signedProfileRatio (sourceNode a) - r| + ε ≤ 5 * ρ ^ 2 + η + ε := by
    linarith [h.parameter_le]
  exact (Q0ConditionalLinearError.actual_saved_error_sq_le
    (sourceNode a) (sourceNode_pos a) r modes center ε hε h.saved_sq_le).trans
      ((sq_le_sq₀ (by positivity) (by positivity)).2 hrad)

/-- The regular source addresses, retaining the original complete address type. -/
def regularNodes : Finset Address := by
  classical
  exact Finset.univ.filter fun a => ¬ exceptionalPanel a.1.val

-- Prove the projection while the carrier, finset and predicate are symbolic.
-- Specializing this theorem does not search through the source enumeration.
private theorem filter_property {α : Type*} (s : Finset α)
    (P : α → Prop) [DecidablePred P] (a : α)
    (ha : a ∈ s.filter P) : P a :=
  ((Finset.mem_filter (s := s) (p := P) (a := a)).mp ha).2

/-- Membership in the filtered source family implies its defining predicate. -/
theorem regular_of_mem_regularNodes (a : Address)
    (ha : a ∈ regularNodes) : ¬ exceptionalPanel a.1.val := by
  classical
  exact filter_property (α := Address) (Finset.univ : Finset Address)
    (fun b : Address => ¬ exceptionalPanel b.1.val) a ha

/-- A rowwise budget: only selected regular rows use the linear model.
All remaining regular rows are charged to their own squared-error budgets. -/
def hybridBudget (modelNodes : Finset Address) (ρ η ε otherSq : Address → ℝ) : ℝ := by
  classical
  exact ∑ a ∈ regularNodes, nodeWeight a *
    (if a ∈ modelNodes then (5 * ρ a ^ 2 + η a + ε a) ^ 2 else otherSq a)

theorem regular_error_eq_sum (center : Address → (ℕ × ℕ) → ℂ) :
    retainedErrorSq regularModes center =
      ∑ a ∈ regularNodes, nodeWeight a *
        (∑ i ∈ modes, ‖coefficient (sourceNode a) i - center a i‖ ^ 2) := by
  classical
  simp only [retainedErrorSq, regularNodes, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro a _
  by_cases ha : exceptionalPanel a.1.val <;> simp [regularModes, ha]

/-- Preserve row-dependent budgets and physical Gaussian weights. No worst-row
replacement, extra Gaussian factor, or coefficient-count multiplier is used. -/
theorem regular_error_sq_le (modelNodes : Finset Address)
    (center : Address → (ℕ × ℕ) → ℂ) (r ρ η ε otherSq : Address → ℝ)
    (hmodel : ∀ a, ¬ exceptionalPanel a.1.val → a ∈ modelNodes →
      LinearRowBounds a (completedCenter center a) (r a) (ρ a) (η a) (ε a))
    (hother : ∀ a, ¬ exceptionalPanel a.1.val → a ∉ modelNodes →
      (∑ i ∈ modes,
        ‖coefficient (sourceNode a) i - completedCenter center a i‖ ^ 2) ≤ otherSq a) :
    retainedErrorSq regularModes (completedCenter center) ≤
      hybridBudget modelNodes ρ η ε otherSq := by
  classical
  rw [regular_error_eq_sum]
  unfold hybridBudget
  apply Finset.sum_le_sum
  intro a ha
  have hregular : ¬ exceptionalPanel a.1.val := regular_of_mem_regularNodes a ha
  apply mul_le_mul_of_nonneg_left _ (nodeWeight_nonneg a)
  by_cases hm : a ∈ modelNodes
  · rw [ite_eq_left hm]
    exact linear_row_error_sq_le a (completedCenter center a)
      (r a) (ρ a) (η a) (ε a) (hmodel a hregular hm)
  · rw [ite_eq_right hm]
    exact hother a hregular hm

/-- Consume a certified hybrid regular budget in the actual source assembly.
Exceptional nodes still use the saved exceptional rows, and the selected-root
panel normalization is supplied by the concrete small-order proof. -/
theorem source_error_le (modelNodes : Finset Address)
    (center : Address → (ℕ × ℕ) → ℂ) (r ρ η ε otherSq : Address → ℝ)
    (hmodel : ∀ a, ¬ exceptionalPanel a.1.val → a ∈ modelNodes →
      LinearRowBounds a (completedCenter center a) (r a) (ρ a) (η a) (ε a))
    (hother : ∀ a, ¬ exceptionalPanel a.1.val → a ∉ modelNodes →
      (∑ i ∈ modes,
        ‖coefficient (sourceNode a) i - completedCenter center a i‖ ^ 2) ≤ otherSq a)
    (hbudget : hybridBudget modelNodes ρ η ε otherSq ≤ (1969 / 10^13 : ℝ) ^ 2) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (253 / 10^12 : ℝ) := by
  apply actual_error_le_of_regular_error center
  · exact Real.sqrt_le_iff.mpr ⟨by norm_num,
      (regular_error_sq_le modelNodes center r ρ η ε otherSq hmodel hother).trans hbudget⟩
  · exact Q0SourceExceptionMassClosure.exceptional_panel_normalization

end
end Grothe.UpperChaos.Q0ConditionalSourceVector

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.Q0ConditionalSourceVector.linear_row_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalSourceVector.regular_of_mem_regularNodes,
      ``Grothe.UpperChaos.Q0ConditionalSourceVector.regular_error_eq_sum,
      ``Grothe.UpperChaos.Q0ConditionalSourceVector.regular_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalSourceVector.source_error_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
