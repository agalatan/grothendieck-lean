import Grothe.UpperChaos.Q0SourceExceptionPayload
import Grothe.UpperChaos.Q0SourceExceptionMass
import Grothe.UpperChaos.F0ConditionalNode
import Grothe.UpperChaos.Q0FiniteVectorError

/-! Error of the actual Gaussian coefficient vector against the recovered
exceptional source rows. Bessel bounds the true vector, including all selected
modes absent from the stored approximation. The same-selected-root physical
panel normalization remains explicit. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionError

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0SourceExceptionPayload
open Grothe.UpperChaos.Q0SourceExceptionMass
open Grothe.UpperChaos.F0ConditionalNode

/-- No coefficient-count factor: the true finite vector has norm at most
one, and the actual sparse stored vector has norm at most five halves. -/
theorem source_error_sq_le (a : Address) (ha : exceptionalPanel a.1.val)
    (S : Finset (ℕ × ℕ))
    (hdom : ∀ p ∈ S, p.1 ≤ 266 ∧ p.2 ≤ 265 ∧
      p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ 531) :
    (∑ p ∈ S, ‖coefficient (sourceNode a) p - sourceCenter a ha p‖ ^ 2) ≤
      (7 / 2 : ℝ) ^ 2 := by
  have hf : (∑ p ∈ S, ‖coefficient (sourceNode a) p‖ ^ 2) ≤ (1 : ℝ) ^ 2 := by
    simpa only [one_pow] using sum_sq_coefficient_le_one (sourceNode a) S
  have hc : (∑ p ∈ S, ‖sourceCenter a ha p‖ ^ 2) ≤ (5 / 2 : ℝ) ^ 2 :=
    (Real.sqrt_le_iff.mp (sourceCenter_norm a ha S hdom)).2
  have h := Q0FiniteVectorError.sum_norm_sub_sq_le S
    (fun p => coefficient (sourceNode a) p) (sourceCenter a ha)
    (1 : ℝ) (5 / 2 : ℝ) (by norm_num) (by norm_num) hf hc
  simpa only [show (1 : ℝ) + 5 / 2 = 7 / 2 by norm_num] using h

/-- Original source addresses, original physical weights, and one Gaussian
density factor. The saved vector is zero-completed; the true one is not. -/
noncomputable def errorSq (S : Finset (ℕ × ℕ)) : ℝ := by
  classical
  exact ∑ a : Address, if ha : exceptionalPanel a.1.val then
    (sourceWeight a * Real.exp (-(sourceNode a))) *
      (∑ p ∈ S, ‖coefficient (sourceNode a) p - sourceCenter a ha p‖ ^ 2)
    else 0

theorem error_sq_le_mass (S : Finset (ℕ × ℕ))
    (hdom : ∀ p ∈ S, p.1 ≤ 266 ∧ p.2 ≤ 265 ∧
      p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ 531) :
    errorSq S ≤ (7 / 2 : ℝ) ^ 2 * exceptionMass := by
  classical
  rw [errorSq, exceptionMass_eq_source, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro a _
  by_cases ha : exceptionalPanel a.1.val
  · simp only [dite_eq_left ha, ite_eq_left ha]
    calc
      _ ≤ (sourceWeight a * Real.exp (-(sourceNode a))) * (7 / 2 : ℝ) ^ 2 :=
        mul_le_mul_of_nonneg_left (source_error_sq_le a ha S hdom)
          (mul_nonneg (sourceWeight_pos a).le (Real.exp_pos _).le)
      _ = _ := mul_comm _ _
  · simp [ha]

/-- The exact selected-root normalization is an explicit input until the
four small-order rules and the production binding have passed Lean checking. -/
theorem error_sq_le (S : Finset (ℕ × ℕ))
    (hdom : ∀ p ∈ S, p.1 ≤ 266 ∧ p.2 ≤ 265 ∧
      p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ 531)
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    errorSq S ≤ (1575 / 10^13 : ℝ) ^ 2 := by
  calc
    _ ≤ (7 / 2 : ℝ) ^ 2 * exceptionMass := error_sq_le_mass S hdom
    _ ≤ (7 / 2 : ℝ) ^ 2 * (45 / 10^12 : ℝ) ^ 2 :=
      mul_le_mul_of_nonneg_left (exceptionMass_le_norm_sq hpanel) (sq_nonneg _)
    _ = (1575 / 10^13 : ℝ) ^ 2 := by norm_num

theorem error_le (S : Finset (ℕ × ℕ))
    (hdom : ∀ p ∈ S, p.1 ≤ 266 ∧ p.2 ≤ 265 ∧
      p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ 531)
    (hpanel : ∀ p : Fin sourcePanels.length, exceptionalPanel p.val →
      (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
        ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ)) :
    Real.sqrt (errorSq S) ≤ (1575 / 10^13 : ℝ) :=
  Real.sqrt_le_iff.mpr ⟨by norm_num, error_sq_le S hdom hpanel⟩

end Grothe.UpperChaos.Q0SourceExceptionError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionError.source_error_sq_le,
      ``Grothe.UpperChaos.Q0SourceExceptionError.error_sq_le_mass,
      ``Grothe.UpperChaos.Q0SourceExceptionError.error_le] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
