import Grothe.UpperChaos.GroupedRounder

/-! # Captured-energy control of a disjoint source projection

Shared source estimate used by the sharp-target Gaussian work. The theorem
is retained verbatim from the archived second-band elimination module.

Agent-ID: codex-aa04
-/

open MeasureTheory Finset
namespace Grothe.UpperChaos
noncomputable section

/-- Variant of captured-energy subtraction that bounds the source itself on B;
there is no false assumption that the approximant vanishes on B. -/
theorem norm_projOn_source_le_of_captured_family {ι : Type*} (s : Finset ι)
    (A : ι → Set Idx2) (B : Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i ∈ s, Disjoint (A i) B) (f c : Lp ℂ 2 mu2)
    (lower error : ι → ℝ) (hlower : ∀ i ∈ s, lower i ≤ ‖projOn (A i) c‖)
    (herror : ∀ i ∈ s, ‖projOn (A i) (f - c)‖ ≤ error i)
    {energy cap : ℝ} (henergy : ‖f‖ ^ 2 ≤ energy)
    (hbudget : energy - (∑ i ∈ s, (max 0 (lower i - error i)) ^ 2) ≤ cap ^ 2)
    (hcap : 0 ≤ cap) : ‖projOn B f‖ ≤ cap := by
  have hc : (∑ i ∈ s, (max 0 (lower i - error i)) ^ 2) ≤
      ∑ i ∈ s, ‖projOn (A i) f‖ ^ 2 := by
    apply sum_le_sum
    intro i hi
    have htri := norm_le_norm_add_norm_sub (projOn (A i) f) (projOn (A i) c)
    rw [← map_sub] at htri
    have hlow : max 0 (lower i - error i) ≤ ‖projOn (A i) f‖ :=
      max_le (norm_nonneg _) (by have := hlower i hi; have := herror i hi; linarith)
    exact pow_le_pow_left₀ (le_max_left 0 (lower i - error i)) hlow 2
  have hs := sum_norm_projOn_sq_add_le_of_disjoint s A B hdisj hB f
  nlinarith [norm_nonneg (projOn B f)]

end
end Grothe.UpperChaos
