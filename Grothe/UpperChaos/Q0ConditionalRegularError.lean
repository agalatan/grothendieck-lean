import Grothe.UpperChaos.Q0ConditionalSourceError
import Grothe.UpperChaos.Q0SourceExceptionGeometry

/-! The regular-node part of the revised source-error budget.
The retained evaluator and omitted true coefficients remain explicit inputs;
the exceptional-node contribution is not included in this estimate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalRegularError

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.F0ConditionalNode
open Grothe.UpperChaos.ConditionalNodeIndices
open Grothe.UpperChaos.Q0ConditionalRetainedModes
open Grothe.UpperChaos.Q0ConditionalRetainedError
open Grothe.UpperChaos.Q0ConditionalSourceError
open Grothe.UpperChaos.Q0SourceExceptionGeometry

noncomputable section

def regularModes (a : Address) : Finset (ℕ × ℕ) := by
  classical
  exact if exceptionalPanel a.1.val then ∅ else modes

def exceptionModes (a : Address) : Finset (ℕ × ℕ) := by
  classical
  exact if exceptionalPanel a.1.val then modes else ∅

theorem mem_regularModes (a : Address) (p : ℕ × ℕ) :
    p ∈ regularModes a ↔ ¬ exceptionalPanel a.1.val ∧ p ∈ modes := by
  classical
  by_cases h : exceptionalPanel a.1.val <;> simp [regularModes, h]

theorem regular_subset_modes (a : Address) : regularModes a ⊆ modes := by
  intro p hp
  exact ((mem_regularModes a p).mp hp).2

/-- Exact split of all actual selected coefficient errors into the two
disjoint source-node families, with the same physical Gaussian weights. -/
theorem error_sq_split (center : Address → (ℕ × ℕ) → ℂ) :
    retainedErrorSq (fun _ => modes) center =
      retainedErrorSq regularModes center + retainedErrorSq exceptionModes center := by
  classical
  unfold retainedErrorSq
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro a _
  by_cases h : exceptionalPanel a.1.val <;> simp [regularModes, exceptionModes, h]

/-- One uniform finite-mode enclosure for the actual source and its saved
zero-completed approximation. The source mass bound is supplied by
`retained_error_sqrt_le`, using the actual source mass below 107/100. -/
theorem actual_regular_error_uniform
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ)) :
    Real.sqrt (retainedErrorSq regularModes (completedCenter center)) ≤
      (1969 / 10^13 : ℝ) := by
  have hregular : ∀ a p, p ∈ regularModes a →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ) := by
    intro a p hp
    have hm := (mem_regularModes a p).mp hp
    exact hpoint a hm.1 p hm.2
  calc
    Real.sqrt (retainedErrorSq regularModes (completedCenter center)) ≤
        (179 * (1 / 10^12 : ℝ)) * (26 / 25) :=
      retained_error_sqrt_le regularModes (completedCenter center) (by positivity)
        regular_subset_modes hregular
    _ ≤ (1969 / 10^13 : ℝ) := by norm_num

/-- The same 10^-12 tolerance can be used on both retained and omitted
selected modes. The latter premise bounds the true coefficient against zero;
it does not assert that coefficient vanishes. Infinite tails are separate. -/
theorem actual_regular_error
    (center : Address → (ℕ × ℕ) → ℂ)
    (hretained : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ retainedModes a →
      ‖coefficient (sourceNode a) p - center a p‖ ≤ (1 / 10^12 : ℝ))
    (homitted : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ omittedModes a →
      ‖coefficient (sourceNode a) p‖ ≤ (1 / 10^12 : ℝ)) :
    Real.sqrt (retainedErrorSq regularModes (completedCenter center)) ≤
      (1969 / 10^13 : ℝ) := by
  classical
  apply actual_regular_error_uniform center
  intro a ha p hm
  by_cases hr : p ∈ retainedModes a
  · simpa [completedCenter, hr] using hretained a ha p hr
  · have ho : p ∈ omittedModes a := by
      have hu : p ∈ retainedModes a ∪ omittedModes a := by
        rw [retained_union_omitted]
        exact hm
      exact (Finset.mem_union.mp hu).resolve_left hr
    simpa [completedCenter, hr] using homitted a ha p ho

end
end Grothe.UpperChaos.Q0ConditionalRegularError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalRegularError.error_sq_split,
      ``Grothe.UpperChaos.Q0ConditionalRegularError.actual_regular_error_uniform,
      ``Grothe.UpperChaos.Q0ConditionalRegularError.actual_regular_error] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
