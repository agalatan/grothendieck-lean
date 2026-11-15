import Grothe.UpperChaos.AdaptiveRectangleEnclosure

/-!
# Finite-cell envelopes preserving nonnegativity

The first base-pair kernel is nonnegative. Integrating its envelope on a
finite retained cell preserves the lower endpoint zero, avoiding the doubled
width of a symmetric absolute-value enclosure. The companion uses the
existing absolute-value area bound.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.AdaptiveRectanglePartition.Rect

theorem integral_nonneg (r : Rect) (hr : r.Valid) (f : ℝ → ℝ → ℝ)
    (hf : ∀ p ∈ r.domain, 0 ≤ f p.1 p.2) : 0 ≤ r.integral f := by
  unfold integral
  apply intervalIntegral.integral_nonneg (Rat.cast_le.mpr hr.2)
  intro u hu
  apply intervalIntegral.integral_nonneg (Rat.cast_le.mpr hr.1)
  intro s hs
  exact hf (s, u) ⟨hs, hu⟩

/-- A nonnegative envelope retains its one-sided interval after integration. -/
theorem integral_nonneg_and_le_area_mul (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (M : ℚ)
    (hf : ∀ p ∈ r.domain, 0 ≤ f p.1 p.2 ∧ f p.1 p.2 ≤ (M : ℝ)) :
    0 ≤ r.integral f ∧ r.integral f ≤ (r.area * M : ℚ) := by
  have hn := r.integral_nonneg hr f (fun p hp => (hf p hp).1)
  have hb := r.abs_integral_le_area_mul hr f M (fun p hp => by
    simpa only [abs_of_nonneg (hf p hp).1] using (hf p hp).2)
  exact ⟨hn, by simpa only [abs_of_nonneg hn] using hb⟩

/-- Rational endpoint checks place the one-sided integral in a stored interval. -/
theorem integral_mem_of_nonneg_envelope (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (M : ℚ) (I : IntervalRat)
    (hf : ∀ p ∈ r.domain, 0 ≤ f p.1 p.2 ∧ f p.1 p.2 ≤ (M : ℝ))
    (hlo : I.lo ≤ 0) (hhi : r.area * M ≤ I.hi) :
    r.integral f ∈ I := by
  obtain ⟨hn, hb⟩ := r.integral_nonneg_and_le_area_mul hr f M hf
  rw [IntervalRat.mem_def]
  refine ⟨?_, hb.trans (Rat.cast_le.mpr hhi)⟩
  exact (show (I.lo : ℝ) ≤ 0 by exact_mod_cast hlo).trans hn

/-- Rational endpoint checks place a symmetric companion envelope in its stored interval. -/
theorem integral_mem_of_abs_envelope (r : Rect) (hr : r.Valid)
    (f : ℝ → ℝ → ℝ) (M : ℚ) (I : IntervalRat)
    (hf : ∀ p ∈ r.domain, |f p.1 p.2| ≤ (M : ℝ))
    (hlo : I.lo ≤ -(r.area * M)) (hhi : r.area * M ≤ I.hi) :
    r.integral f ∈ I := by
  have hb := abs_le.mp (r.abs_integral_le_area_mul hr f M hf)
  rw [IntervalRat.mem_def]
  refine ⟨?_, hb.2.trans (Rat.cast_le.mpr hhi)⟩
  have hl : (I.lo : ℝ) ≤ -((r.area * M : ℚ) : ℝ) := by
    simpa only [Rat.cast_neg] using (Rat.cast_le.mpr hlo :
      (I.lo : ℝ) ≤ ((-(r.area * M) : ℚ) : ℝ))
  exact hl.trans hb.1

end Grothe.UpperChaos.AdaptiveRectanglePartition.Rect
