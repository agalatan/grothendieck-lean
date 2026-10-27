import Grothe.UpperChaos.CapturedTail
import Grothe.Upper.WeightedUnion

/-! # A shared source budget on disjoint Hermite bands

A family of disjoint sub-bands of one mode set shares that set's projection
energy. This is intended for weighted comparison across several omitted bands.

Agent-ID: codex-239c -/

open MeasureTheory Finset
namespace Grothe.UpperChaos

noncomputable section

theorem projOn_projOn_of_subset {B U : Set Idx2} (hBU : B ⊆ U)
    (f : Lp ℂ 2 mu2) : projOn B (projOn U f) = projOn B f := by
  classical
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_projOn]
  by_cases hi : i ∈ B
  · simp [hi, hBU hi]
  · simp [hi]

/-- A single norm cap for a union bounds the sum of squared projected norms.
No coverage assumption is needed. -/
theorem sum_norm_projOn_sq_le_of_subsets {ι : Type*} (s : Finset ι)
    (B : ι → Set Idx2) (U : Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (B i) (B j))
    (hsub : ∀ i ∈ s, B i ⊆ U) (f : Lp ℂ 2 mu2) {R : ℝ}
    (hR : ‖projOn U f‖ ≤ R) :
    ∑ i ∈ s, ‖projOn (B i) f‖ ^ 2 ≤ R ^ 2 := by
  have h := sum_norm_projOn_sq_le_of_disjoint s B hdisj (projOn U f)
  have heq : (∑ i ∈ s, ‖projOn (B i) (projOn U f)‖ ^ 2) =
      ∑ i ∈ s, ‖projOn (B i) f‖ ^ 2 := by
    apply sum_congr rfl
    intro i hi
    rw [projOn_projOn_of_subset (hsub i hi)]
  rw [heq] at h
  exact h.trans (pow_le_pow_left₀ (norm_nonneg _) hR 2)

/-- Weighted residuals on disjoint sub-bands share the source norm cap on the
union. Center bounds remain separately visible in the conclusion. -/
theorem weighted_projOn_sub_of_union {ι : Type*} (s : Finset ι)
    (B : ι → Set Idx2) (U : Set Idx2) (a t : ι → ℝ)
    (f c : Lp ℂ 2 mu2) (A R : ℝ)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (B i) (B j))
    (hsub : ∀ i ∈ s, B i ⊆ U)
    (ha : ∀ i ∈ s, 0 ≤ a i) (hA : 0 ≤ A) (hR : 0 ≤ R)
    (ha_sq : ∑ i ∈ s, a i ^ 2 ≤ A ^ 2)
    (hf : ‖projOn U f‖ ≤ R) (hc : ∀ i ∈ s, ‖projOn (B i) c‖ ≤ t i) :
    ∑ i ∈ s, a i * ‖projOn (B i) (f - c)‖ ≤
      A * R + ∑ i ∈ s, a i * t i := by
  have h := Grothe.Upper.BandComparison.weighted_union_sub s a t
    (fun i => projOn (B i) f) (fun i => projOn (B i) c) A R ha hA hR ha_sq
    (sum_norm_projOn_sq_le_of_subsets s B U hdisj hsub f hf) hc
  simpa only [map_sub] using h

end
end Grothe.UpperChaos
