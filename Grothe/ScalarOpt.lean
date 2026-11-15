import Grothe.Upper.Disk

/-!
# The scalar optimum as an attained one-sided response

Optimizing the left phases gives the sum of the norms of the row responses. The remaining
optimization is over a compact product of circles, so both the response formula and the original
scalar optimum are attained. These statements include matrices with an empty index set.

Agent-ID: codex-c8a4. Refs #377.
-/

namespace Grothe

open scoped ComplexConjugate
open Finset

noncomputable section

variable {m n : ℕ}

/-- Every one-sided phase response is bounded by the scalar optimum. -/
theorem sum_norm_row_le_scalarOpt (A : Fin m → Fin n → ℂ) {δ : Fin n → ℂ}
    (hδ : ∀ j, ‖δ j‖ = 1) :
    ∑ i, ‖∑ j, A i j * δ j‖ ≤ scalarOpt A := by
  rw [sum_norm_eq]
  convert le_scalarOpt A (fun i ↦ norm_phaseOf (∑ j, A i j * δ j)) hδ using 1
  congr 1
  refine sum_congr rfl fun i _ ↦ ?_
  rw [mul_sum]
  exact sum_congr rfl fun j _ ↦ by ring

/-- Bounding the scalar optimum is equivalent to bounding all one-sided phase responses. -/
theorem scalarOpt_le_iff (A : Fin m → Fin n → ℂ) (B : ℝ) :
    scalarOpt A ≤ B ↔ ∀ δ : Fin n → ℂ, (∀ j, ‖δ j‖ = 1) →
      ∑ i, ‖∑ j, A i j * δ j‖ ≤ B := by
  constructor
  · intro h δ hδ
    exact (sum_norm_row_le_scalarOpt A hδ).trans h
  · intro h
    apply csSup_le (scalarSet_nonempty A)
    rintro _ ⟨ε, δ, hε, hδ, rfl⟩
    calc
      ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ =
          ‖∑ i, conj (ε i) * ∑ j, A i j * δ j‖ := by
        congr 1
        refine sum_congr rfl fun i _ ↦ ?_
        rw [mul_sum]
        exact sum_congr rfl fun j _ ↦ by ring
      _ ≤ ∑ i, ‖∑ j, A i j * δ j‖ :=
        norm_sum_conj_mul_le _ _ _ fun i ↦ (hε i).le
      _ ≤ B := h δ hδ

/-- The scalar optimum is an attained maximum of the one-sided row response. -/
theorem exists_scalarOpt_eq_sum_norm (A : Fin m → Fin n → ℂ) :
    ∃ δ : Fin n → ℂ, (∀ j, ‖δ j‖ = 1) ∧
      scalarOpt A = ∑ i, ‖∑ j, A i j * δ j‖ := by
  let S : Set (Fin n → ℂ) := {δ | ∀ j, ‖δ j‖ = 1}
  have hS : IsCompact S := by
    convert isCompact_univ_pi (fun _ : Fin n ↦ isCompact_sphere (0 : ℂ) 1) using 1
    ext δ
    simp [S]
  have hne : S.Nonempty := ⟨fun _ ↦ 1, fun _ ↦ norm_one⟩
  have hc : Continuous (fun δ : Fin n → ℂ ↦ ∑ i, ‖∑ j, A i j * δ j‖) := by
    fun_prop
  obtain ⟨δ, hδ, hmax⟩ := hS.exists_isMaxOn hne hc.continuousOn
  refine ⟨δ, hδ, le_antisymm ?_ (sum_norm_row_le_scalarOpt A hδ)⟩
  exact (scalarOpt_le_iff A _).2 fun δ' hδ' ↦ hmax hδ'

/-- Unimodular families attain the scalar optimum. -/
theorem exists_scalarOpt (A : Fin m → Fin n → ℂ) :
    ∃ (ε : Fin m → ℂ) (δ : Fin n → ℂ),
      (∀ i, ‖ε i‖ = 1) ∧ (∀ j, ‖δ j‖ = 1) ∧
      scalarOpt A = ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ := by
  obtain ⟨δ, hδ, hA⟩ := exists_scalarOpt_eq_sum_norm A
  refine ⟨fun i ↦ phaseOf (∑ j, A i j * δ j), δ,
    fun i ↦ norm_phaseOf _, hδ, ?_⟩
  rw [hA, sum_norm_eq]
  congr 1
  refine sum_congr rfl fun i _ ↦ ?_
  rw [mul_sum]
  exact sum_congr rfl fun j _ ↦ by ring

/-- A matrix with no rows or no columns has scalar optimum zero. -/
theorem scalarOpt_eq_zero_of_empty (A : Fin m → Fin n → ℂ) (h : m = 0 ∨ n = 0) :
    scalarOpt A = 0 := by
  apply le_antisymm _ (scalarOpt_nonneg A)
  apply (scalarOpt_le_iff A 0).2
  intro δ _
  rcases h with rfl | rfl <;> simp

end

end Grothe
