import Grothe.UpperChaos.LocalAffineSquareIntegralBounds

/-!
# Exact midpoint refinement of retained rectangles

A binary split tree determines every child endpoint by rational midpoint.
Its ordered leaves integrate to the original rectangle, with the auxiliary
coordinate outside and the radial coordinate inside. Continuity is required
only on the closed root rectangle; no area-only coverage claim is used.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set

namespace Grothe.UpperChaos.AdaptiveRectanglePartition

structure Rect where
  sLo : ℚ
  sHi : ℚ
  auxLo : ℚ
  auxHi : ℚ
  deriving DecidableEq

namespace Rect

def Valid (r : Rect) : Prop := r.sLo ≤ r.sHi ∧ r.auxLo ≤ r.auxHi

instance (r : Rect) : Decidable r.Valid :=
  inferInstanceAs (Decidable (r.sLo ≤ r.sHi ∧ r.auxLo ≤ r.auxHi))

def domain (r : Rect) : Set (ℝ × ℝ) :=
  Icc (r.sLo : ℝ) r.sHi ×ˢ Icc (r.auxLo : ℝ) r.auxHi

def sMid (r : Rect) : ℚ := (r.sLo + r.sHi) / 2
def auxMid (r : Rect) : ℚ := (r.auxLo + r.auxHi) / 2

def leftS (r : Rect) : Rect := { r with sHi := r.sMid }
def rightS (r : Rect) : Rect := { r with sLo := r.sMid }
def leftAux (r : Rect) : Rect := { r with auxHi := r.auxMid }
def rightAux (r : Rect) : Rect := { r with auxLo := r.auxMid }

theorem sMid_bounds (r : Rect) (hr : r.Valid) :
    r.sLo ≤ r.sMid ∧ r.sMid ≤ r.sHi := by
  dsimp [sMid]
  constructor <;> linarith [hr.1]

theorem auxMid_bounds (r : Rect) (hr : r.Valid) :
    r.auxLo ≤ r.auxMid ∧ r.auxMid ≤ r.auxHi := by
  dsimp [auxMid]
  constructor <;> linarith [hr.2]

theorem leftS_valid (r : Rect) (hr : r.Valid) : r.leftS.Valid :=
  ⟨(sMid_bounds r hr).1, hr.2⟩

theorem rightS_valid (r : Rect) (hr : r.Valid) : r.rightS.Valid :=
  ⟨(sMid_bounds r hr).2, hr.2⟩

theorem leftAux_valid (r : Rect) (hr : r.Valid) : r.leftAux.Valid :=
  ⟨hr.1, (auxMid_bounds r hr).1⟩

theorem rightAux_valid (r : Rect) (hr : r.Valid) : r.rightAux.Valid :=
  ⟨hr.1, (auxMid_bounds r hr).2⟩

theorem leftS_domain_subset (r : Rect) (hr : r.Valid) :
    r.leftS.domain ⊆ r.domain :=
  Set.prod_mono (Icc_subset_Icc le_rfl (Rat.cast_le.mpr (sMid_bounds r hr).2))
    Subset.rfl

theorem rightS_domain_subset (r : Rect) (hr : r.Valid) :
    r.rightS.domain ⊆ r.domain :=
  Set.prod_mono (Icc_subset_Icc (Rat.cast_le.mpr (sMid_bounds r hr).1) le_rfl)
    Subset.rfl

theorem leftAux_domain_subset (r : Rect) (hr : r.Valid) :
    r.leftAux.domain ⊆ r.domain :=
  Set.prod_mono Subset.rfl
    (Icc_subset_Icc le_rfl (Rat.cast_le.mpr (auxMid_bounds r hr).2))

theorem rightAux_domain_subset (r : Rect) (hr : r.Valid) :
    r.rightAux.domain ⊆ r.domain :=
  Set.prod_mono Subset.rfl
    (Icc_subset_Icc (Rat.cast_le.mpr (auxMid_bounds r hr).1) le_rfl)

noncomputable def integral (r : Rect) (f : ℝ → ℝ → ℝ) : ℝ :=
  ∫ u in (r.auxLo : ℝ)..r.auxHi, ∫ s in (r.sLo : ℝ)..r.sHi, f s u

theorem integral_congr (r : Rect) (hr : r.Valid) (f g : ℝ → ℝ → ℝ)
    (hfg : ∀ p ∈ r.domain, f p.1 p.2 = g p.1 p.2) :
    r.integral f = r.integral g := by
  apply intervalIntegral.integral_congr_Ioo_of_le (Rat.cast_le.mpr hr.2)
  intro u hu
  apply intervalIntegral.integral_congr_Ioo_of_le (Rat.cast_le.mpr hr.1)
  intro s hs
  exact hfg (s, u) ⟨⟨hs.1.le, hs.2.le⟩, ⟨hu.1.le, hu.2.le⟩⟩

private theorem continuous_swap (f : ℝ → ℝ → ℝ) (hf : Continuous f.uncurry) :
    Continuous (fun p : ℝ × ℝ => f p.2 p.1) :=
  hf.comp (continuous_snd.prodMk continuous_fst)

theorem integral_splitS (r : Rect) (f : ℝ → ℝ → ℝ)
    (hf : Continuous f.uncurry) :
    r.integral f = r.leftS.integral f + r.rightS.integral f := by
  have hslice (u : ℝ) : Continuous (fun s => f s u) :=
    hf.comp (continuous_id.prodMk continuous_const)
  have hs (u : ℝ) : (∫ s in (r.sLo : ℝ)..r.sHi, f s u) =
      (∫ s in (r.sLo : ℝ)..r.sMid, f s u) +
        ∫ s in (r.sMid : ℝ)..r.sHi, f s u :=
    (intervalIntegral.integral_add_adjacent_intervals
      ((hslice u).intervalIntegrable _ _) ((hslice u).intervalIntegrable _ _)).symm
  have hl : Continuous (fun u => ∫ s in (r.sLo : ℝ)..r.sMid, f s u) :=
    intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
      (continuous_swap f hf) _ _
  have hh : Continuous (fun u => ∫ s in (r.sMid : ℝ)..r.sHi, f s u) :=
    intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
      (continuous_swap f hf) _ _
  dsimp only [integral, leftS, rightS]
  simp_rw [hs]
  exact intervalIntegral.integral_add (hl.intervalIntegrable _ _) (hh.intervalIntegrable _ _)

theorem integral_splitAux (r : Rect) (f : ℝ → ℝ → ℝ)
    (hf : Continuous f.uncurry) :
    r.integral f = r.leftAux.integral f + r.rightAux.integral f := by
  have hi : Continuous (fun u => ∫ s in (r.sLo : ℝ)..r.sHi, f s u) :=
    intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
      (continuous_swap f hf) _ _
  exact (intervalIntegral.integral_add_adjacent_intervals
    (hi.intervalIntegrable (r.auxLo : ℝ) r.auxMid)
    (hi.intervalIntegrable (r.auxMid : ℝ) r.auxHi)).symm

end Rect

inductive SplitTree where
  | leaf
  | splitS (left right : SplitTree)
  | splitAux (left right : SplitTree)
  deriving DecidableEq

namespace SplitTree

/-- Leaves retain their left-to-right path order, including multiplicities. -/
def leaves : SplitTree → Rect → List Rect
  | .leaf, r => [r]
  | .splitS l h, r => l.leaves r.leftS ++ h.leaves r.rightS
  | .splitAux l h, r => l.leaves r.leftAux ++ h.leaves r.rightAux

theorem leaf_valid_and_subset (t : SplitTree) (r : Rect) (hr : r.Valid)
    (q : Rect) (hq : q ∈ t.leaves r) : q.Valid ∧ q.domain ⊆ r.domain := by
  induction t generalizing r with
  | leaf =>
      have heq : q = r := by simpa only [leaves, List.mem_singleton] using hq
      subst q
      exact ⟨hr, Subset.rfl⟩
  | splitS l h ihl ihh =>
      rcases List.mem_append.mp hq with hq | hq
      · obtain ⟨hv, hs⟩ := ihl r.leftS (r.leftS_valid hr) hq
        exact ⟨hv, hs.trans (r.leftS_domain_subset hr)⟩
      · obtain ⟨hv, hs⟩ := ihh r.rightS (r.rightS_valid hr) hq
        exact ⟨hv, hs.trans (r.rightS_domain_subset hr)⟩
  | splitAux l h ihl ihh =>
      rcases List.mem_append.mp hq with hq | hq
      · obtain ⟨hv, hs⟩ := ihl r.leftAux (r.leftAux_valid hr) hq
        exact ⟨hv, hs.trans (r.leftAux_domain_subset hr)⟩
      · obtain ⟨hv, hs⟩ := ihh r.rightAux (r.rightAux_valid hr) hq
        exact ⟨hv, hs.trans (r.rightAux_domain_subset hr)⟩

theorem integral_eq_sum_of_continuous (t : SplitTree) (r : Rect)
    (f : ℝ → ℝ → ℝ) (hf : Continuous f.uncurry) :
    r.integral f = ((t.leaves r).map (fun q => q.integral f)).sum := by
  induction t generalizing r with
  | leaf => simp [leaves]
  | splitS l h ihl ihh =>
      rw [Rect.integral_splitS r f hf, ihl r.leftS, ihh r.rightS]
      simp only [leaves, List.map_append, List.sum_append]
  | splitAux l h ihl ihh =>
      rw [Rect.integral_splitAux r f hf, ihl r.leftAux, ihh r.rightAux]
      simp only [leaves, List.map_append, List.sum_append]

/-- Exact integral assembly for any finite midpoint tree, requiring continuity
only on the closed root. This applies independently to all retained roots. -/
theorem integral_eq_sum (t : SplitTree) (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain) :
    r.integral f = ((t.leaves r).map (fun q => q.integral f)).sum := by
  obtain ⟨g, hg, heq⟩ := AffineSquareIntegralBounds.exists_continuous_rectangle_extension
    f (r.sLo : ℝ) r.sHi r.auxLo r.auxHi
    (Rat.cast_le.mpr hr.1) (Rat.cast_le.mpr hr.2) hf
  have hgf : ∀ p ∈ r.domain, g p.1 p.2 = f p.1 p.2 :=
    fun p hp => heq p.1 hp.1 p.2 hp.2
  rw [← r.integral_congr hr g f hgf, integral_eq_sum_of_continuous t r g hg]
  congr 1
  apply List.map_congr_left
  intro q hq
  obtain ⟨hv, hs⟩ := leaf_valid_and_subset t r hr q hq
  exact q.integral_congr hv g f (fun p hp => hgf p (hs hp))

end SplitTree
end Grothe.UpperChaos.AdaptiveRectanglePartition
