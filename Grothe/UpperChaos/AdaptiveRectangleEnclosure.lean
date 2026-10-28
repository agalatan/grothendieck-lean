import Grothe.UpperChaos.AdaptiveRectanglePartition

/-!
# Certified interval sums on adaptive retained rectangles

Leaf intervals are added in the exact ordered partition, then converted to
a rational center and radius. Pointwise analytic envelopes also yield cell
integral bounds by multiplying by the exact rational area. These estimates
do not add the separate source-omission reserve.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.AdaptiveRectanglePartition

/-- Exact rational addition of an ordered list of interval enclosures. -/
def enclosureSum : List IntervalRat → IntervalRat
  | [] => IntervalRat.singleton 0
  | I :: rest => IntervalRat.add I (enclosureSum rest)

theorem sum_mem_enclosureSum {α : Type*} (items : List α)
    (value : α → ℝ) (bound : α → IntervalRat)
    (h : ∀ x ∈ items, value x ∈ bound x) :
    (items.map value).sum ∈ enclosureSum (items.map bound) := by
  revert h
  induction items with
  | nil =>
      intro _
      simpa only [List.map_nil, List.sum_nil, enclosureSum, Rat.cast_zero] using
        IntervalRat.mem_singleton (0 : ℚ)
  | cons x xs ih =>
      intro h
      have hx := h x (by simp)
      have hxs := ih (fun y hy => h y (by simp [hy]))
      simpa only [List.map_cons, List.sum_cons, enclosureSum] using
        IntervalRat.mem_add hx hxs

namespace Rect

def area (r : Rect) : ℚ := (r.sHi - r.sLo) * (r.auxHi - r.auxLo)

theorem area_nonneg (r : Rect) (hr : r.Valid) : 0 ≤ r.area :=
  mul_nonneg (sub_nonneg.mpr hr.1) (sub_nonneg.mpr hr.2)

/-- A pointwise bound on a finite rectangle gives its exact area-weighted
integral bound. No continuity or measurability premise is needed for this
norm inequality with the totalized Bochner integral. -/
theorem abs_integral_le_area_mul (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (M : ℚ)
    (hbound : ∀ p ∈ r.domain, |f p.1 p.2| ≤ (M : ℝ)) :
    |r.integral f| ≤ (r.area * M : ℚ) := by
  have hsle : (r.sLo : ℝ) ≤ r.sHi := Rat.cast_le.mpr hr.1
  have hule : (r.auxLo : ℝ) ≤ r.auxHi := Rat.cast_le.mpr hr.2
  have hinner (u : ℝ) (hu : u ∈ Icc (r.auxLo : ℝ) r.auxHi) :
      ‖∫ s in (r.sLo : ℝ)..r.sHi, f s u‖ ≤
        (M : ℝ) * ((r.sHi : ℝ) - r.sLo) := by
    have hi := intervalIntegral.norm_integral_le_of_norm_le_const
      (a := (r.sLo : ℝ)) (b := (r.sHi : ℝ)) (C := (M : ℝ))
      (f := fun s => f s u) (fun s hs => by
        rw [uIoc_of_le hsle] at hs
        simpa only [Real.norm_eq_abs] using hbound (s, u) ⟨⟨hs.1.le, hs.2⟩, hu⟩)
    simpa only [abs_of_nonneg (sub_nonneg.mpr hsle)] using hi
  have hout := intervalIntegral.norm_integral_le_of_norm_le_const
    (a := (r.auxLo : ℝ)) (b := (r.auxHi : ℝ))
    (C := (M : ℝ) * ((r.sHi : ℝ) - r.sLo))
    (f := fun u => ∫ s in (r.sLo : ℝ)..r.sHi, f s u) (fun u hu => by
      rw [uIoc_of_le hule] at hu
      exact hinner u ⟨hu.1.le, hu.2⟩)
  simp only [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hule)] at hout
  calc
    |r.integral f| ≤ (M : ℝ) * ((r.sHi : ℝ) - r.sLo) *
        ((r.auxHi : ℝ) - r.auxLo) := hout
    _ = (r.area * M : ℚ) := by
      simp only [area, Rat.cast_mul, Rat.cast_sub]
      ring

end Rect

namespace SplitTree

/-- A complete family of certified leaf intervals encloses the actual root
integral. Every leaf appears exactly as often as in the midpoint tree. -/
theorem integral_mem_enclosureSum (t : SplitTree) (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain)
    (bound : Rect → IntervalRat)
    (hcell : ∀ q ∈ t.leaves r, q.integral f ∈ bound q) :
    r.integral f ∈ enclosureSum ((t.leaves r).map bound) := by
  rw [integral_eq_sum t r hr f hf]
  exact sum_mem_enclosureSum (t.leaves r) (fun q => q.integral f) bound hcell

/-- Rational endpoint checks convert the complete leaf enclosure into a
center/radius bound without any additional analytic error allowance. -/
theorem abs_integral_sub_center_le (t : SplitTree) (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (hf : ContinuousOn f.uncurry r.domain)
    (bound : Rect → IntervalRat)
    (hcell : ∀ q ∈ t.leaves r, q.integral f ∈ bound q)
    (center radius : ℚ)
    (hlo : center - radius ≤ (enclosureSum ((t.leaves r).map bound)).lo)
    (hhi : (enclosureSum ((t.leaves r).map bound)).hi ≤ center + radius) :
    |r.integral f - (center : ℝ)| ≤ (radius : ℝ) := by
  have hm := integral_mem_enclosureSum t r hr f hf bound hcell
  rw [IntervalRat.mem_def] at hm
  have hloR : (center : ℝ) - radius ≤
      ((enclosureSum ((t.leaves r).map bound)).lo : ℝ) := by
    simpa only [Rat.cast_sub] using (Rat.cast_le.mpr hlo :
      ((center - radius : ℚ) : ℝ) ≤ (enclosureSum ((t.leaves r).map bound)).lo)
  have hhiR : ((enclosureSum ((t.leaves r).map bound)).hi : ℝ) ≤
      (center : ℝ) + radius := by
    simpa only [Rat.cast_add] using (Rat.cast_le.mpr hhi :
      ((enclosureSum ((t.leaves r).map bound)).hi : ℝ) ≤ ((center + radius : ℚ) : ℝ))
  exact abs_le.mpr ⟨by linarith [hm.1], by linarith [hm.2]⟩

end SplitTree
end Grothe.UpperChaos.AdaptiveRectanglePartition
