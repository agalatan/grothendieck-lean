import Mathlib.Tactic
import Lean.Util.CollectAxioms

/-! Small canonical support for the exceptional saved conditional rows.
Zero completion below is the stored approximation, not the true response.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ExceptionSupport

def lowModes : Finset (ℕ × ℕ) := {(0, 0), (0, 1), (1, 0), (0, 2), (1, 1)}

theorem mem_lowModes (c d : ℕ) :
    (c, d) ∈ lowModes ↔ c ≤ d + 1 ∧ c + d ≤ 2 := by
  simp only [lowModes, Finset.mem_insert, Finset.mem_singleton, Prod.mk.injEq]
  omega

theorem lowModes_card : lowModes.card = 5 := by decide +kernel

def retained (S : Finset (ℕ × ℕ)) (cutoff : ℕ) : Finset (ℕ × ℕ) :=
  S.filter fun p => p.1 + p.2 ≤ cutoff

theorem retained_card_le_five (S : Finset (ℕ × ℕ)) (cutoff : ℕ)
    (hcut : cutoff ≤ 2) (hcanonical : ∀ p ∈ S, p.1 ≤ p.2 + 1) :
    (retained S cutoff).card ≤ 5 := by
  calc
    (retained S cutoff).card ≤ lowModes.card := by
      apply Finset.card_le_card
      intro p hp
      have hs := Finset.mem_filter.mp hp
      exact (mem_lowModes p.1 p.2).mpr ⟨hcanonical p hs.1, hs.2.trans hcut⟩
    _ = 5 := lowModes_card

/-- Stored approximation, with zero placeholders outside its saved cutoff. -/
def completed (cutoff : ℕ) (center : ℕ × ℕ → ℂ) (p : ℕ × ℕ) : ℂ :=
  if p.1 + p.2 ≤ cutoff then center p else 0

theorem completed_sum (S : Finset (ℕ × ℕ)) (cutoff : ℕ)
    (center : ℕ × ℕ → ℂ) :
    (∑ p ∈ S, ‖completed cutoff center p‖ ^ 2) =
      ∑ p ∈ retained S cutoff, ‖center p‖ ^ 2 := by
  rw [retained, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro p _
  by_cases hp : p.1 + p.2 ≤ cutoff <;> simp [completed, hp]

/-- A scalar 11/10 bound is enough because at most five saved modes survive. -/
theorem completed_normSq_le (S : Finset (ℕ × ℕ)) (cutoff : ℕ)
    (center : ℕ × ℕ → ℂ) (hcut : cutoff ≤ 2)
    (hcanonical : ∀ p ∈ S, p.1 ≤ p.2 + 1)
    (hcenter : ∀ p ∈ retained S cutoff, ‖center p‖ ≤ (11 / 10 : ℝ)) :
    (∑ p ∈ S, ‖completed cutoff center p‖ ^ 2) ≤ (121 / 20 : ℝ) := by
  rw [completed_sum]
  have hcard : ((retained S cutoff).card : ℝ) ≤ 5 := by
    exact_mod_cast retained_card_le_five S cutoff hcut hcanonical
  calc
    (∑ p ∈ retained S cutoff, ‖center p‖ ^ 2) ≤
        ∑ _p ∈ retained S cutoff, (11 / 10 : ℝ) ^ 2 := by
      apply Finset.sum_le_sum
      intro p hp
      exact (sq_le_sq₀ (norm_nonneg _) (by norm_num)).mpr (hcenter p hp)
    _ = ((retained S cutoff).card : ℝ) * (11 / 10 : ℝ) ^ 2 := by simp
    _ ≤ (121 / 20 : ℝ) := by nlinarith

theorem completed_norm_le (S : Finset (ℕ × ℕ)) (cutoff : ℕ)
    (center : ℕ × ℕ → ℂ) (hcut : cutoff ≤ 2)
    (hcanonical : ∀ p ∈ S, p.1 ≤ p.2 + 1)
    (hcenter : ∀ p ∈ retained S cutoff, ‖center p‖ ≤ (11 / 10 : ℝ)) :
    Real.sqrt (∑ p ∈ S, ‖completed cutoff center p‖ ^ 2) ≤ (5 / 2 : ℝ) := by
  apply Real.sqrt_le_iff.mpr
  refine ⟨by norm_num, ?_⟩
  have h := completed_normSq_le S cutoff center hcut hcanonical hcenter
  nlinarith

end Grothe.UpperChaos.Q0ExceptionSupport

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ExceptionSupport.retained_card_le_five,
      ``Grothe.UpperChaos.Q0ExceptionSupport.completed_normSq_le,
      ``Grothe.UpperChaos.Q0ExceptionSupport.completed_norm_le] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
