import Grothe.UpperChaos.Energy2
import Grothe.UpperChaos.Kernel2
import Grothe.Upper.ComparisonData

/-!
# Projections onto sets of Hermite modes

For a set `B` of indices, `projOn B` is the orthogonal projection of `L²(mu2)` onto the closed span of the Hermite
vectors `hvec2 i`, `i ∈ B`. Its Hermite coefficients are those of `f` on `B` and `0` off `B`
(`inner_projOn`). Hence its energies vanish at every bidegree outside `B` (`energy_projOn_eq_zero`), and
projections onto a family of sets that covers the support of `f` exactly once sum to `f` (`sum_projOn`).
For a comparison band `b`, `bandProj b` projects onto the total degrees `b.lo < n + m ≤ b.hi`.
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The closed span of the Hermite vectors indexed by `B`. -/
def modeSpace (B : Set Idx2) : Submodule ℂ (Lp ℂ 2 mu2) :=
  (Submodule.span ℂ (hvec2 '' B)).topologicalClosure

instance (B : Set Idx2) : CompleteSpace (modeSpace B) :=
  (Submodule.isClosed_topologicalClosure _).completeSpace_coe

/-- **The projection onto the Hermite modes in `B`.** -/
def projOn (B : Set Idx2) : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 := (modeSpace B).starProjection

lemma hvec2_mem_modeSpace {B : Set Idx2} {i : Idx2} (hi : i ∈ B) : hvec2 i ∈ modeSpace B :=
  Submodule.le_topologicalClosure _ (Submodule.subset_span ⟨i, hi, rfl⟩)

lemma hvec2_mem_orth {B : Set Idx2} {i : Idx2} (hi : i ∉ B) : hvec2 i ∈ (modeSpace B)ᗮ := by
  rw [modeSpace, Submodule.orthogonal_closure]
  rw [Submodule.mem_orthogonal]
  intro u hu
  refine Submodule.span_induction ?_ (by simp) (fun x y _ _ hx hy => by rw [inner_add_left, hx, hy, add_zero])
    (fun a x _ hx => by rw [inner_smul_left, hx, mul_zero]) hu
  rintro _ ⟨j, hj, rfl⟩
  rw [inner_hvec2]
  simp only [ite_eq_right_iff]
  rintro rfl; exact absurd hj hi

/-- **The coefficients of the projection.** -/
theorem inner_projOn (B : Set Idx2) [DecidablePred (· ∈ B)] (i : Idx2) (f : Lp ℂ 2 mu2) :
    ⟪hvec2 i, projOn B f⟫_ℂ = if i ∈ B then ⟪hvec2 i, f⟫_ℂ else 0 := by
  have hP : projOn B f ∈ modeSpace B := (modeSpace B).starProjection_apply_mem f
  have hR : f - projOn B f ∈ (modeSpace B)ᗮ := (modeSpace B).sub_starProjection_mem_orthogonal f
  split_ifs with hi
  · have h0 := Submodule.inner_right_of_mem_orthogonal (hvec2_mem_modeSpace hi) hR
    rw [inner_sub_right, sub_eq_zero] at h0
    exact h0.symm
  · exact Submodule.inner_left_of_mem_orthogonal hP (hvec2_mem_orth hi)

/-- Two vectors with the same Hermite coefficients are equal. -/
lemma eq_of_inner_hvec2 {f g : Lp ℂ 2 mu2} (h : ∀ i, ⟪hvec2 i, f⟫_ℂ = ⟪hvec2 i, g⟫_ℂ) : f = g := by
  rw [← sub_eq_zero]
  have hmem : f - g ∈ (Submodule.span ℂ (Set.range hvec2))ᗮ := by
    rw [Submodule.mem_orthogonal]
    intro u hu
    refine Submodule.span_induction ?_ (by simp) (fun x y _ _ hx hy => by rw [inner_add_left, hx, hy, add_zero])
      (fun a x _ hx => by rw [inner_smul_left, hx, mul_zero]) hu
    rintro _ ⟨i, rfl⟩
    rw [inner_sub_right, h i, sub_self]
  rw [span_hvec2_perp] at hmem
  exact hmem

/-- **Energies of a projection vanish off its modes.** -/
theorem energy_projOn_eq_zero (B : Set Idx2) [DecidablePred (· ∈ B)] (f : Lp ℂ 2 mu2) {nm : ℕ × ℕ}
    (h : ∀ i, bideg i = nm → i ∉ B) : energy (projOn B f) nm = 0 := by
  rw [energy]
  refine (tsum_congr fun i => ?_).trans tsum_zero
  simp [inner_projOn, h i.1 i.2]

/-- **Projections onto sets covering each mode of `f` once sum to `f`.** -/
theorem sum_projOn {ι : Type*} (s : Finset ι) (B : ι → Set Idx2) [∀ k, DecidablePred (· ∈ B k)]
    (f : Lp ℂ 2 mu2)
    (hcov : ∀ i, ⟪hvec2 i, f⟫_ℂ ≠ 0 → ∃! k, k ∈ s ∧ i ∈ B k)
    (hdisj : ∀ i, ∀ k ∈ s, ∀ l ∈ s, i ∈ B k → i ∈ B l → k = l) :
    ∑ k ∈ s, projOn (B k) f = f := by
  classical
  refine eq_of_inner_hvec2 fun i => ?_
  rw [inner_sum]
  simp only [inner_projOn]
  by_cases hf : ⟪hvec2 i, f⟫_ℂ = 0
  · simp [hf]
  · obtain ⟨k, ⟨hks, hik⟩, -⟩ := hcov i hf
    rw [Finset.sum_eq_single_of_mem k hks]
    · simp [hik]
    · intro l hl hlk
      have : i ∉ B l := fun hil => hlk (hdisj i l hl k hks hil hik)
      simp [this]

/-- The modes of total degree in the comparison band `b`. -/
def bandModes (b : GrotheKernel.ComparisonBand) : Set Idx2 :=
  {i | b.contains (bideg i).1 (bideg i).2 = true}

instance (b : GrotheKernel.ComparisonBand) : DecidablePred (· ∈ bandModes b) := fun i => by
  unfold bandModes; infer_instance

/-- **The projection onto a comparison band.** -/
def bandProj (b : GrotheKernel.ComparisonBand) : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 := projOn (bandModes b)

/-- **Band projections are supported in their band** (the `support` field of `ComparisonInputs`). -/
theorem energy_bandProj_eq_zero (b : GrotheKernel.ComparisonBand) (f : Lp ℂ 2 mu2) (p : ℕ × ℕ)
    (hp : b.contains p.1 p.2 = false) : energy (bandProj b f) p = 0 :=
  energy_projOn_eq_zero _ f fun i hi hmem => by
    simp only [bandModes, Set.mem_ofPred_eq, hi] at hmem
    rw [hp] at hmem
    exact Bool.false_ne_true hmem

end

end Grothe.UpperChaos
