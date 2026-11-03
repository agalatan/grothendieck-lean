import Grothe.UpperChaos.Q0SourceExceptionProfile
import Grothe.UpperChaos.Q0SourceExceptionMassClosure
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exceptional saved-row error with the original discrete Gaussian weights.

The actual finite Gaussian vector estimate is integrated over the same source
addresses and selected-root weights as the existing source-error assembly.
There is one Gaussian density factor. Exact panel normalization supplies the
mass bound; continuous interval width is not substituted for the discrete sum.
The full-source conclusions keep the regular evaluator's error explicit.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionalWeightedError

open Q0GaussOrdinalEquiv Q0GaussProductionMass F0ConditionalNode
open ConditionalNodeIndices Q0SourceExceptionGeometry Q0SourceExceptionPayload
open Q0SourceExceptionMass Q0SourceExceptionError
open Q0ConditionalRetainedError Q0ConditionalSourceError Q0ConditionalRegularError
open Q0ConditionalSourceAssembly

/-- Restrict the actual whole-vector estimate to any selected finite subset.
Zero completion applies only to the saved row, not to the true coefficients. -/
theorem source_error_sq_le (a : Address) (ha : exceptionalPanel a.1.val)
    (S : Finset (ℕ × ℕ)) (hS : S ⊆ modes) :
    (∑ p ∈ S, ‖coefficient (sourceNode a) p - sourceCenter a ha p‖ ^ 2) ≤
      (3 / 10 ^ 15 : ℝ) ^ 2 := by
  calc
    _ ≤ ∑ p ∈ modes,
        ‖coefficient (sourceNode a) p - sourceCenter a ha p‖ ^ 2 := by
      apply Finset.sum_le_sum_of_subset_of_nonneg hS
      intro p _ _
      exact sq_nonneg _
    _ ≤ (3 / 10 ^ 15 : ℝ) ^ 2 :=
      (Q0SourceExceptionProfile.source_actual_error_sq_lt a ha).le

/-- A coupled finite-vector error is paid once per physical source address.
The mass is the actual selected-root weight times the Gaussian density. -/
theorem error_sq_le_mass (S : Finset (ℕ × ℕ)) (hS : S ⊆ modes) :
    errorSq S ≤ (3 / 10 ^ 15 : ℝ) ^ 2 * exceptionMass := by
  classical
  rw [errorSq, exceptionMass_eq_source, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro a _
  by_cases ha : exceptionalPanel a.1.val
  · simp only [dite_eq_left ha, ite_eq_left ha]
    calc
      _ ≤ (sourceWeight a * Real.exp (-(sourceNode a))) *
          (3 / 10 ^ 15 : ℝ) ^ 2 :=
        mul_le_mul_of_nonneg_left (source_error_sq_le a ha S hS)
          (mul_nonneg (sourceWeight_pos a).le (Real.exp_pos _).le)
      _ = _ := mul_comm _ _
  · simp [ha]

/-- The concrete discrete exceptional mass is at most 2e-21, giving this
squared weighted error without a panel-normalization premise. -/
theorem error_sq_le (S : Finset (ℕ × ℕ)) (hS : S ⊆ modes) :
    errorSq S ≤ (2 / 10 ^ 25 : ℝ) ^ 2 := by
  have hm : exceptionMass ≤ (2 / 10 ^ 21 : ℝ) := by
    exact Q0SourceExceptionMassClosure.exceptional_mass_le.trans (by norm_num)
  calc
    _ ≤ (3 / 10 ^ 15 : ℝ) ^ 2 * exceptionMass := error_sq_le_mass S hS
    _ ≤ (3 / 10 ^ 15 : ℝ) ^ 2 * (2 / 10 ^ 21 : ℝ) :=
      mul_le_mul_of_nonneg_left hm (sq_nonneg _)
    _ ≤ (2 / 10 ^ 25 : ℝ) ^ 2 := by norm_num

/-- Weighted error radius for every subset of the selected modes. -/
theorem error_le (S : Finset (ℕ × ℕ)) (hS : S ⊆ modes) :
    Real.sqrt (errorSq S) ≤ (2 / 10 ^ 25 : ℝ) :=
  Real.sqrt_le_iff.mpr ⟨by norm_num, error_sq_le S hS⟩

/-- Keep the exact regular squared error and the actual exceptional mass.
The existing disjoint-family identity accounts for every original source node. -/
theorem actual_source_error_sq_le_mass
    (center : Address → (ℕ × ℕ) → ℂ) :
    retainedErrorSq (fun _ => modes) (completedCenter (joinedCenter center)) ≤
      retainedErrorSq regularModes (completedCenter center) +
        (3 / 10 ^ 15 : ℝ) ^ 2 * exceptionMass := by
  rw [all_error_sq_eq]
  exact add_le_add le_rfl (error_sq_le_mass modes (fun _ hp => hp))

/-- Orthogonal source-family assembly with an explicit regular squared budget.
No numerical regular evaluator enclosure is asserted here. -/
theorem actual_source_error_sq_le
    (center : Address → (ℕ × ℕ) → ℂ) (R : ℝ)
    (hregular : retainedErrorSq regularModes (completedCenter center) ≤ R ^ 2) :
    retainedErrorSq (fun _ => modes) (completedCenter (joinedCenter center)) ≤
      R ^ 2 + (2 / 10 ^ 25 : ℝ) ^ 2 := by
  rw [all_error_sq_eq]
  exact add_le_add hregular (error_sq_le modes (fun _ hp => hp))

/-- The stronger square-root form preserves the sum of the two squared budgets. -/
theorem actual_source_error_sqrt_le
    (center : Address → (ℕ × ℕ) → ℂ) (R : ℝ)
    (hregular : retainedErrorSq regularModes (completedCenter center) ≤ R ^ 2) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤
        Real.sqrt (R ^ 2 + (2 / 10 ^ 25 : ℝ) ^ 2) :=
  Real.sqrt_le_sqrt (actual_source_error_sq_le center R hregular)

/-- A regular error radius gives a full source radius, with the actual
exceptional contribution already discharged. -/
theorem actual_source_error_le_of_regular_error
    (center : Address → (ℕ × ℕ) → ℂ) (R : ℝ)
    (hregular : Real.sqrt (retainedErrorSq regularModes
      (completedCenter center)) ≤ R) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ R + 2 / 10 ^ 25 := by
  have hR : 0 ≤ R := (Real.sqrt_nonneg _).trans hregular
  have hr := (Real.sqrt_le_iff.mp hregular).2
  apply Real.sqrt_le_iff.mpr
  refine ⟨by positivity, ?_⟩
  calc
    _ ≤ R ^ 2 + (2 / 10 ^ 25 : ℝ) ^ 2 := actual_source_error_sq_le center R hr
    _ ≤ (R + 2 / 10 ^ 25) ^ 2 := by nlinarith

/-- Compatibility with the existing regular finite-mode evaluator interface.
Its actual per-entry premise remains explicit; all exceptional data and
physical-profile bounds are supplied by the closed saved-row proof. -/
theorem actual_source_error_uniform
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10 ^ 12 : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤
        (1969 / 10 ^ 13 : ℝ) + 2 / 10 ^ 25 :=
  actual_source_error_le_of_regular_error center (1969 / 10 ^ 13 : ℝ)
    (actual_regular_error_uniform center hpoint)

end Grothe.UpperChaos.Q0SourceExceptionalWeightedError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.source_error_sq_le,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.error_sq_le_mass,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.error_sq_le,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.error_le,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.actual_source_error_sq_le_mass,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.actual_source_error_sq_le,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.actual_source_error_sqrt_le,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.actual_source_error_le_of_regular_error,
      ``Grothe.UpperChaos.Q0SourceExceptionalWeightedError.actual_source_error_uniform] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
