import Grothe.UpperChaos.Q0ConditionalRegularError
import Grothe.UpperChaos.Q0SourceExceptionError

/-! Assemble the finite selected coefficient error using the actual saved
exceptional payload and an explicitly bounded regular evaluator. The two
node families are disjoint, so their squared errors add. Floating-point
scaling, underflow, contraction, continuous omission, and infinite tails are
separate obligations. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalSourceAssembly

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.F0ConditionalNode
open Grothe.UpperChaos.ConditionalNodeIndices
open Grothe.UpperChaos.Q0ConditionalRetainedModes
open Grothe.UpperChaos.Q0ConditionalRetainedError
open Grothe.UpperChaos.Q0ConditionalSourceError
open Grothe.UpperChaos.Q0ConditionalRegularError
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0SourceExceptionPayload

noncomputable section

/-- On exceptional nodes use the actual recovered saved row. The supplied
regular center is never used on those nodes. -/
def joinedCenter (center : Address → (ℕ × ℕ) → ℂ)
    (a : Address) (p : ℕ × ℕ) : ℂ := by
  classical
  exact if ha : exceptionalPanel a.1.val then sourceCenter a ha p else center a p

theorem completed_exceptional (center : Address → (ℕ × ℕ) → ℂ)
    (a : Address) (ha : exceptionalPanel a.1.val)
    (p : ℕ × ℕ) (hp : p ∈ modes) :
    completedCenter (joinedCenter center) a p = sourceCenter a ha p := by
  classical
  by_cases hr : p ∈ retainedModes a
  · simp only [completedCenter, ite_eq_left hr, joinedCenter, dite_eq_left ha]
  · have hcut : ¬ p.1 + p.2 ≤ (Q0ConditionalMetadataAll.rowAt a).cutoff := by
      intro hc
      exact hr (Finset.mem_filter.mpr ⟨hp, hc⟩)
    have hb := storage_bounds hp
    have hc := sourceCenter_completion a ha p.1 p.2 hb.1 hb.2.1 hb.2.2.1 hb.2.2.2
    simpa only [completedCenter, ite_eq_right hr, Q0ExceptionSupport.completed, ite_eq_right hcut]
      using hc

theorem regular_error_eq (center : Address → (ℕ × ℕ) → ℂ) :
    retainedErrorSq regularModes (completedCenter (joinedCenter center)) =
      retainedErrorSq regularModes (completedCenter center) := by
  classical
  unfold retainedErrorSq
  apply Finset.sum_congr rfl
  intro a _
  by_cases ha : exceptionalPanel a.1.val
  · simp [regularModes, ha]
  · simp only [regularModes, ite_eq_right ha, completedCenter, joinedCenter, dite_eq_right ha]

theorem exceptional_error_eq (center : Address → (ℕ × ℕ) → ℂ) :
    retainedErrorSq exceptionModes (completedCenter (joinedCenter center)) =
      Q0SourceExceptionError.errorSq modes := by
  classical
  unfold retainedErrorSq Q0SourceExceptionError.errorSq
  apply Finset.sum_congr rfl
  intro a _
  by_cases ha : exceptionalPanel a.1.val
  · simp only [exceptionModes, ite_eq_left ha, dite_eq_left ha, nodeWeight]
    congr 1
    apply Finset.sum_congr rfl
    intro p hp
    rw [completed_exceptional center a ha p hp]
  · simp [exceptionModes, ha]

/-- An identity on all 31,877 selected modes at every original source
address. The exceptional true coefficients have not been discarded. -/
theorem all_error_sq_eq (center : Address → (ℕ × ℕ) → ℂ) :
    retainedErrorSq (fun _ => modes) (completedCenter (joinedCenter center)) =
      retainedErrorSq regularModes (completedCenter center) +
        Q0SourceExceptionError.errorSq modes := by
  rw [error_sq_split, regular_error_eq, exceptional_error_eq]

theorem actual_error_le_of_regular_error
    (center : Address → (ℕ × ℕ) → ℂ)
    (hregular : Real.sqrt (retainedErrorSq regularModes (completedCenter center)) ≤
      (1969 / 10^13 : ℝ))
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (253 / 10^12 : ℝ) := by
  have hr := (Real.sqrt_le_iff.mp hregular).2
  have he := Q0SourceExceptionError.error_sq_le modes
    (fun _ hp => storage_bounds hp) hpanel
  apply Real.sqrt_le_iff.mpr
  refine ⟨by norm_num, ?_⟩
  rw [all_error_sq_eq]
  calc
    _ ≤ (1969 / 10^13 : ℝ) ^ 2 + (1575 / 10^13 : ℝ) ^ 2 := add_le_add hr he
    _ ≤ (253 / 10^12 : ℝ) ^ 2 := by norm_num

/-- The regular evaluator's finite-mode enclosure and actual panel
normalization are the remaining inputs to this source-error assembly. -/
theorem actual_error_le
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ))
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (253 / 10^12 : ℝ) :=
  actual_error_le_of_regular_error center (actual_regular_error_uniform center hpoint) hpanel

/-- Preserve the consumer's existing 3.6e-10 source-error allowance. This
does not include floating-point scale/weight construction or contraction. -/
theorem actual_error_le_ledger
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ))
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (36 / 10^11 : ℝ) :=
  (actual_error_le center hpoint hpanel).trans (by norm_num)

end
end Grothe.UpperChaos.Q0ConditionalSourceAssembly

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalSourceAssembly.completed_exceptional,
      ``Grothe.UpperChaos.Q0ConditionalSourceAssembly.all_error_sq_eq,
      ``Grothe.UpperChaos.Q0ConditionalSourceAssembly.actual_error_le,
      ``Grothe.UpperChaos.Q0ConditionalSourceAssembly.actual_error_le_ledger] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
