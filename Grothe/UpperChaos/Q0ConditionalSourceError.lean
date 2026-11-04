import Grothe.UpperChaos.Q0ConditionalRetainedError
import Grothe.UpperChaos.Q0ConditionalRetainedModes
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Consume the evaluator's pointwise estimates on the exact source-node
retained and omitted mode sets. The pointwise estimates remain to be proved.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalSourceError

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.F0ConditionalNode
open Grothe.UpperChaos.Q0ConditionalRetainedError
open Grothe.UpperChaos.Q0ConditionalRetainedModes
open Grothe.UpperChaos.ConditionalNodeIndices

noncomputable section

/-- The stored approximation uses zero for omitted entries, while the true
Gaussian coefficients in those positions remain present in the error. -/
def completedCenter (center : Address → (ℕ × ℕ) → ℂ)
    (a : Address) (i : ℕ × ℕ) : ℂ :=
  if i ∈ retainedModes a then center a i else 0

/-- The retained-table error at the original source cutoff, aggregated over
all selected modes and source addresses with the physical radial weight. -/
theorem actual_retained_error
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a i, i ∈ retainedModes a →
      ‖coefficient (sourceNode a) i - center a i‖ ≤ (2 / 10^16 : ℝ)) :
    Real.sqrt (retainedErrorSq retainedModes center) ≤
      (179 * (2 / 10^16 : ℝ)) * (26 / 25) :=
  retained_error_sqrt_le_original retainedModes center retained_subset_modes hpoint

/-- The actual omitted modes contribute an independently bounded weighted
error; omitted stored entries are not treated as exact Gaussian zeros. -/
theorem actual_omitted_error
    (hpoint : ∀ a i, i ∈ omittedModes a →
      ‖coefficient (sourceNode a) i‖ ≤ (1 / 10^30 : ℝ)) :
    Real.sqrt (retainedErrorSq omittedModes (fun _ _ => 0)) ≤
      (179 * (1 / 10^30 : ℝ)) * (26 / 25) := by
  apply retained_error_sqrt_le omittedModes (fun _ _ => 0) (by positivity)
    omitted_subset_modes
  intro a i hi
  simpa only [sub_zero] using hpoint a i hi

/-- A single weighted error bound for the full selected mode set, including
both stored centers and omitted entries. The omitted coefficients are bounded,
not asserted to vanish. -/
theorem actual_completed_error
    (center : Address → (ℕ × ℕ) → ℂ)
    (hretained : ∀ a i, i ∈ retainedModes a →
      ‖coefficient (sourceNode a) i - center a i‖ ≤ (2 / 10^16 : ℝ))
    (homitted : ∀ a i, i ∈ omittedModes a →
      ‖coefficient (sourceNode a) i‖ ≤ (1 / 10^30 : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes) (completedCenter center)) ≤
      (179 * (2 / 10^16 : ℝ)) * (26 / 25) := by
  apply retained_error_sqrt_le_original (fun _ => modes) (completedCenter center)
    (fun _ => Finset.Subset.rfl)
  intro a i hi
  by_cases hr : i ∈ retainedModes a
  · simpa [completedCenter, hr] using hretained a i hr
  · have ho : i ∈ omittedModes a := by
      have hc : ¬ i.1 + i.2 ≤ (Q0ConditionalMetadataAll.rowAt a).cutoff := by
        intro hc
        apply hr
        exact Finset.mem_filter.mpr ⟨hi, hc⟩
      exact Finset.mem_filter.mpr ⟨hi, hc⟩
    have hsmall : (1 / 10^30 : ℝ) ≤ 2 / 10^16 := by norm_num
    have h := (homitted a i ho).trans hsmall
    simpa [completedCenter, hr] using h

end
end Grothe.UpperChaos.Q0ConditionalSourceError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalSourceError.actual_retained_error,
      ``Grothe.UpperChaos.Q0ConditionalSourceError.actual_omitted_error,
      ``Grothe.UpperChaos.Q0ConditionalSourceError.actual_completed_error] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Conditional source error audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
