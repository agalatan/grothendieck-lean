import Grothe.UpperChaos.BandProj

/-!
# Tail bounds from captured Hermite energy

For disjoint sets of Hermite modes, their projected energies sum to at most the
total energy. Lower bounds on an approximant's captured norms, together with
error caps on the same modes, therefore leave a certified upper bound for the
tail. The finite-family estimate retains each band's separate error cap before
summing captured energies. No coverage assumption is needed. If the approximant
vanishes in the tail, this also bounds the tail of the approximation error.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Projections onto disjoint Hermite mode sets annihilate one another. -/
theorem projOn_projOn_eq_zero_of_disjoint {A B : Set Idx2} (hAB : Disjoint A B)
    (f : Lp ℂ 2 mu2) : projOn B (projOn A f) = 0 := by
  classical
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_projOn, inner_zero_right]
  by_cases hiB : i ∈ B
  · have hiA : i ∉ A := fun hiA => Set.disjoint_left.mp hAB hiA hiB
    simp [hiB, hiA]
  · simp [hiB]

/-- Pythagoras for a set of Hermite modes and its orthogonal residual. -/
theorem norm_projOn_sq_add_norm_sub_projOn_sq (A : Set Idx2) (f : Lp ℂ 2 mu2) :
    ‖projOn A f‖ ^ 2 + ‖f - projOn A f‖ ^ 2 = ‖f‖ ^ 2 := by
  symm
  change ‖f‖ ^ 2 = ‖(modeSpace A).starProjection f‖ ^ 2 +
    ‖f - (modeSpace A).starProjection f‖ ^ 2
  simpa only [Submodule.starProjection_orthogonal_val] using
    Submodule.norm_sq_eq_add_norm_sq_starProjection f (modeSpace A)

/-- The energy captured in two disjoint mode sets is at most the total energy. -/
theorem norm_projOn_sq_add_le_of_disjoint {A B : Set Idx2} (hAB : Disjoint A B)
    (f : Lp ℂ 2 mu2) : ‖projOn A f‖ ^ 2 + ‖projOn B f‖ ^ 2 ≤ ‖f‖ ^ 2 := by
  have hproj : projOn B (f - projOn A f) = projOn B f := by
    rw [map_sub, projOn_projOn_eq_zero_of_disjoint hAB, sub_zero]
  have hn : ‖projOn B f‖ ≤ ‖f - projOn A f‖ := by
    rw [← hproj]
    exact (modeSpace B).norm_starProjection_apply_le _
  have hpyth := norm_projOn_sq_add_norm_sub_projOn_sq A f
  have hs := pow_le_pow_left₀ (norm_nonneg _) hn 2
  linarith

private lemma captured_norm_lower (A : Set Idx2) (f c : Lp ℂ 2 mu2) {lower error : ℝ}
    (hlower : lower ≤ ‖projOn A c‖) (herror : ‖projOn A (f - c)‖ ≤ error) :
    max 0 (lower - error) ≤ ‖projOn A f‖ := by
  have htri := norm_le_norm_add_norm_sub (projOn A f) (projOn A c)
  rw [← map_sub] at htri
  exact max_le (norm_nonneg _) (by linarith)

/-- Subtract the energy certified by a captured approximant norm and its error cap.
The `max` permits an uninformative captured lower bound without extra sign premises. -/
theorem norm_projOn_residual_sq_le_of_captured {A B : Set Idx2} (hAB : Disjoint A B)
    (f c : Lp ℂ 2 mu2) (hc : projOn B c = 0) {lower error : ℝ}
    (hlower : lower ≤ ‖projOn A c‖) (herror : ‖projOn A (f - c)‖ ≤ error) :
    ‖projOn B (f - c)‖ ^ 2 ≤ ‖f‖ ^ 2 - (max 0 (lower - error)) ^ 2 := by
  have hcaptured := captured_norm_lower A f c hlower herror
  have hcaptured_sq := pow_le_pow_left₀ (le_max_left 0 (lower - error)) hcaptured 2
  have henergy := norm_projOn_sq_add_le_of_disjoint hAB f
  rw [map_sub, hc, sub_zero]
  linarith

/-- A scalar energy budget turns the captured-energy estimate into a norm cap. -/
theorem norm_projOn_residual_le_of_captured {A B : Set Idx2} (hAB : Disjoint A B)
    (f c : Lp ℂ 2 mu2) (hc : projOn B c = 0) {lower error energy cap : ℝ}
    (hlower : lower ≤ ‖projOn A c‖) (herror : ‖projOn A (f - c)‖ ≤ error)
    (henergy : ‖f‖ ^ 2 ≤ energy)
    (hbudget : energy - (max 0 (lower - error)) ^ 2 ≤ cap ^ 2) (hcap : 0 ≤ cap) :
    ‖projOn B (f - c)‖ ≤ cap := by
  have hs := norm_projOn_residual_sq_le_of_captured hAB f c hc hlower herror
  nlinarith [norm_nonneg (projOn B (f - c))]

/-- Bessel's inequality for a finite family of disjoint Hermite mode sets. -/
theorem sum_norm_projOn_sq_le_of_disjoint {ι : Type*} (s : Finset ι) (A : ι → Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (A i) (A j)) (f : Lp ℂ 2 mu2) :
    ∑ i ∈ s, ‖projOn (A i) f‖ ^ 2 ≤ ‖f‖ ^ 2 := by
  classical
  revert hdisj f
  induction s using Finset.induction_on with
  | empty =>
      intro _ f
      simpa only [Finset.sum_empty] using sq_nonneg ‖f‖
  | @insert i s hi ih =>
      intro hdisj f
      have hdisj' : ∀ j ∈ s, ∀ k ∈ s, j ≠ k → Disjoint (A j) (A k) :=
        fun j hj k hk hjk =>
          hdisj j (Finset.mem_insert_of_mem hj) k (Finset.mem_insert_of_mem hk) hjk
      have hrest := ih hdisj' (f - projOn (A i) f)
      have hproj (j : ι) (hj : j ∈ s) :
          projOn (A j) (f - projOn (A i) f) = projOn (A j) f := by
        have hij : i ≠ j := by
          rintro rfl
          exact hi hj
        rw [map_sub, projOn_projOn_eq_zero_of_disjoint
          (hdisj i (Finset.mem_insert_self _ _) j (Finset.mem_insert_of_mem hj) hij), sub_zero]
      have heq : (∑ j ∈ s, ‖projOn (A j) (f - projOn (A i) f)‖ ^ 2) =
          ∑ j ∈ s, ‖projOn (A j) f‖ ^ 2 := by
        apply Finset.sum_congr rfl
        intro j hj
        rw [hproj j hj]
      rw [heq] at hrest
      rw [Finset.sum_insert hi]
      have hpyth := norm_projOn_sq_add_norm_sub_projOn_sq (A i) f
      linarith

/-- A disjoint tail and a finite family of captured bands share the total energy budget. -/
theorem sum_norm_projOn_sq_add_le_of_disjoint {ι : Type*} (s : Finset ι)
    (A : ι → Set Idx2) (B : Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i ∈ s, Disjoint (A i) B) (f : Lp ℂ 2 mu2) :
    (∑ i ∈ s, ‖projOn (A i) f‖ ^ 2) + ‖projOn B f‖ ^ 2 ≤ ‖f‖ ^ 2 := by
  have hsum := sum_norm_projOn_sq_le_of_disjoint s A hdisj (f - projOn B f)
  have heq : (∑ i ∈ s, ‖projOn (A i) (f - projOn B f)‖ ^ 2) =
      ∑ i ∈ s, ‖projOn (A i) f‖ ^ 2 := by
    apply Finset.sum_congr rfl
    intro i hi
    rw [map_sub, projOn_projOn_eq_zero_of_disjoint (hB i hi).symm, sub_zero]
  rw [heq] at hsum
  have hpyth := norm_projOn_sq_add_norm_sub_projOn_sq B f
  linarith

/-- Subtract each band's certified captured energy separately before estimating the tail. -/
theorem norm_projOn_residual_sq_le_of_captured_family {ι : Type*} (s : Finset ι)
    (A : ι → Set Idx2) (B : Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i ∈ s, Disjoint (A i) B) (f c : Lp ℂ 2 mu2) (hc : projOn B c = 0)
    (lower error : ι → ℝ) (hlower : ∀ i ∈ s, lower i ≤ ‖projOn (A i) c‖)
    (herror : ∀ i ∈ s, ‖projOn (A i) (f - c)‖ ≤ error i) :
    ‖projOn B (f - c)‖ ^ 2 ≤
      ‖f‖ ^ 2 - ∑ i ∈ s, (max 0 (lower i - error i)) ^ 2 := by
  have hcaptured : (∑ i ∈ s, (max 0 (lower i - error i)) ^ 2) ≤
      ∑ i ∈ s, ‖projOn (A i) f‖ ^ 2 := by
    apply Finset.sum_le_sum
    intro i hi
    exact pow_le_pow_left₀ (le_max_left 0 (lower i - error i))
      (captured_norm_lower (A i) f c (hlower i hi) (herror i hi)) 2
  have henergy := sum_norm_projOn_sq_add_le_of_disjoint s A B hdisj hB f
  rw [map_sub, hc, sub_zero]
  linarith

/-- Per-band captured energies and a scalar total-energy budget imply a tail norm cap. -/
theorem norm_projOn_residual_le_of_captured_family {ι : Type*} (s : Finset ι)
    (A : ι → Set Idx2) (B : Set Idx2)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i ∈ s, Disjoint (A i) B) (f c : Lp ℂ 2 mu2) (hc : projOn B c = 0)
    (lower error : ι → ℝ) (hlower : ∀ i ∈ s, lower i ≤ ‖projOn (A i) c‖)
    (herror : ∀ i ∈ s, ‖projOn (A i) (f - c)‖ ≤ error i)
    {energy cap : ℝ} (henergy : ‖f‖ ^ 2 ≤ energy)
    (hbudget : energy - (∑ i ∈ s, (max 0 (lower i - error i)) ^ 2) ≤ cap ^ 2)
    (hcap : 0 ≤ cap) : ‖projOn B (f - c)‖ ≤ cap := by
  have hs := norm_projOn_residual_sq_le_of_captured_family s A B hdisj hB f c hc
    lower error hlower herror
  nlinarith [norm_nonneg (projOn B (f - c))]

end

end Grothe.UpperChaos
