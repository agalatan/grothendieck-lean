import Grothe.UpperChaos.Q0GaussConditionalEnergy
import Grothe.UpperChaos.ConditionalNodeIndices
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Aggregating actual retained-node enclosure errors

The pointwise enclosure is an explicit input to these intermediate estimates.
The evaluator, saved-byte binding, omitted entries, primary matrix contraction,
and smoothing-vector estimate are separate obligations. Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0ConditionalRetainedError

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.F0ConditionalNode
open Grothe.UpperChaos.ConditionalNodeIndices

noncomputable section

/-- The positive physical-node weight, including the radial density. -/
def nodeWeight (a : Address) : ℝ :=
  sourceWeight a * Real.exp (-(sourceNode a))

/-- The exact mass of the complete source-address family. -/
def sourceMass : ℝ := ∑ a : Address, nodeWeight a

/-- Squared error of approximate conditional coefficients on the actually
retained finite modes at each original source node. -/
def retainedErrorSq (retained : Address → Finset (ℕ × ℕ))
    (center : Address → (ℕ × ℕ) → ℂ) : ℝ :=
  ∑ a : Address, nodeWeight a *
    (∑ i ∈ retained a, ‖coefficient (sourceNode a) i - center a i‖ ^ 2)

theorem nodeWeight_nonneg (a : Address) : 0 ≤ nodeWeight a := by
  exact mul_nonneg (sourceWeight_pos a).le (Real.exp_pos _).le

theorem sourceMass_nonneg : 0 ≤ sourceMass := by
  apply Finset.sum_nonneg
  intro a _
  exact nodeWeight_nonneg a

theorem sourceMass_lt : sourceMass < 107 / 100 := by
  simpa only [sourceMass, nodeWeight, Fintype.sum_sigma] using source_mass_lt

/-- A pointwise enclosure of the actual selected coefficients gives one
coupled weighted error bound. There are fewer than 179² selected modes;
no assumption about disjoint production grades is needed. -/
theorem retained_error_sq_le
    (retained : Address → Finset (ℕ × ℕ))
    (center : Address → (ℕ × ℕ) → ℂ) {δ : ℝ} (hδ : 0 ≤ δ)
    (hsubset : ∀ a, retained a ⊆ modes)
    (hpoint : ∀ a i, i ∈ retained a →
      ‖coefficient (sourceNode a) i - center a i‖ ≤ δ) :
    retainedErrorSq retained center ≤ (179 * δ) ^ 2 * sourceMass := by
  have hlocal (a : Address) :
      (∑ i ∈ retained a, ‖coefficient (sourceNode a) i - center a i‖ ^ 2) ≤
        (179 * δ) ^ 2 := by
    have hcardNat : (retained a).card ≤ 31877 := by
      calc
        _ ≤ modes.card := Finset.card_le_card (hsubset a)
        _ = 31877 := card_modes
    have hcard : ((retained a).card : ℝ) ≤ 31877 := by exact_mod_cast hcardNat
    calc
      _ ≤ ∑ _i ∈ retained a, δ ^ 2 := by
        apply Finset.sum_le_sum
        intro i hi
        exact (sq_le_sq₀ (norm_nonneg _) hδ).2 (hpoint a i hi)
      _ = ((retained a).card : ℝ) * δ ^ 2 := by simp
      _ ≤ (31877 : ℝ) * δ ^ 2 :=
        mul_le_mul_of_nonneg_right hcard (sq_nonneg δ)
      _ ≤ (179 * δ) ^ 2 := by nlinarith [sq_nonneg δ]
  unfold retainedErrorSq sourceMass
  calc
    _ ≤ ∑ a : Address, nodeWeight a * (179 * δ) ^ 2 := by
      apply Finset.sum_le_sum
      intro a _
      exact mul_le_mul_of_nonneg_left (hlocal a) (nodeWeight_nonneg a)
    _ = (179 * δ) ^ 2 * ∑ a : Address, nodeWeight a := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro a _
      ring

/-- Square-root form for the retained-node input-error ledger. The bound is
on node-weighted coefficient errors, not on the separate smoothing vector. -/
theorem retained_error_sqrt_le
    (retained : Address → Finset (ℕ × ℕ))
    (center : Address → (ℕ × ℕ) → ℂ) {δ : ℝ} (hδ : 0 ≤ δ)
    (hsubset : ∀ a, retained a ⊆ modes)
    (hpoint : ∀ a i, i ∈ retained a →
      ‖coefficient (sourceNode a) i - center a i‖ ≤ δ) :
    Real.sqrt (retainedErrorSq retained center) ≤ (179 * δ) * (26 / 25) := by
  have hcap : sourceMass ≤ (26 / 25 : ℝ) ^ 2 := by
    have hnumeric : (107 / 100 : ℝ) ≤ (26 / 25 : ℝ) ^ 2 := by norm_num
    exact (le_of_lt sourceMass_lt).trans hnumeric
  have hbound : retainedErrorSq retained center ≤ ((179 * δ) * (26 / 25)) ^ 2 := by
    calc
      _ ≤ (179 * δ) ^ 2 * sourceMass := retained_error_sq_le retained center hδ hsubset hpoint
      _ ≤ (179 * δ) ^ 2 * (26 / 25 : ℝ) ^ 2 :=
        mul_le_mul_of_nonneg_left hcap (sq_nonneg _)
      _ = ((179 * δ) * (26 / 25)) ^ 2 := by ring
  apply Real.sqrt_le_iff.mpr
  exact ⟨by positivity, hbound⟩

/-- The numerical enclosure required by the historical retained table gives
its corresponding coupled weighted error bound. -/
theorem retained_error_sqrt_le_original
    (retained : Address → Finset (ℕ × ℕ))
    (center : Address → (ℕ × ℕ) → ℂ)
    (hsubset : ∀ a, retained a ⊆ modes)
    (hpoint : ∀ a i, i ∈ retained a →
      ‖coefficient (sourceNode a) i - center a i‖ ≤ (2 / 10^16 : ℝ)) :
    Real.sqrt (retainedErrorSq retained center) ≤
      (179 * (2 / 10^16 : ℝ)) * (26 / 25) :=
  retained_error_sqrt_le retained center (by positivity) hsubset hpoint

end
end Grothe.UpperChaos.Q0ConditionalRetainedError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalRetainedError.retained_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalRetainedError.retained_error_sqrt_le,
      ``Grothe.UpperChaos.Q0ConditionalRetainedError.retained_error_sqrt_le_original] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Retained source error audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
