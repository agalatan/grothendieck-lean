import Grothe.UpperChaos.AffineSquareIntegralBounds

/-!
# Affine cell enclosures with local continuity

Reciprocal Gaussian kernels need be continuous only on the closed positive
cell being integrated. Clamping both coordinates extends such a kernel to a
globally continuous function without changing any cell value or integral.
The existing affine-square enclosure then applies with the same remainder.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.AffineSquareIntegralBounds
open Grothe.UpperChaos.RectangleListPolynomialIntegral

/-- Continuity on a closed rectangle suffices for a continuous extension
which agrees with the original function at every point of that rectangle. -/
theorem exists_continuous_rectangle_extension (f : ℝ → ℝ → ℝ)
    (a b c d : ℝ) (hab : a ≤ b) (hcd : c ≤ d)
    (hf : ContinuousOn (Function.uncurry f) (Icc a b ×ˢ Icc c d)) :
    ∃ g : ℝ → ℝ → ℝ, Continuous (Function.uncurry g) ∧
      ∀ x ∈ Icc a b, ∀ y ∈ Icc c d, g x y = f x y := by
  let g : ℝ → ℝ → ℝ := fun x y => f (max a (min b x)) (max c (min d y))
  refine ⟨g, ?_, ?_⟩
  · have hm : Continuous (fun p : ℝ × ℝ =>
        (max a (min b p.1), max c (min d p.2))) := by fun_prop
    exact hf.comp_continuous hm (fun p =>
      ⟨⟨le_max_left _ _, max_le hab (min_le_left _ _)⟩,
        ⟨le_max_left _ _, max_le hcd (min_le_left _ _)⟩⟩)
  · intro x hx y hy
    simp only [g, min_eq_right hx.2, max_eq_right hx.1,
      min_eq_right hy.2, max_eq_right hy.1]

private theorem affine_mem_cell (c h x : ℝ) (hh : 0 ≤ h) (hx : x ∈ Icc (-1 : ℝ) 1) :
    c + h * x ∈ Icc (c - h) (c + h) := by
  have hlo := mul_le_mul_of_nonneg_left hx.1 hh
  have hhi := mul_le_mul_of_nonneg_left hx.2 hh
  constructor <;> linarith

private theorem iterated_integral_congr_rectangle (f g : ℝ → ℝ → ℝ)
    (a b c d : ℝ) (hab : a ≤ b) (hcd : c ≤ d)
    (hfg : ∀ x ∈ Icc a b, ∀ y ∈ Icc c d, f x y = g x y) :
    (∫ x in a..b, ∫ y in c..d, f x y) =
      ∫ x in a..b, ∫ y in c..d, g x y := by
  apply intervalIntegral.integral_congr_Ioo_of_le hab
  intro x hx
  apply intervalIntegral.integral_congr_Ioo_of_le hcd
  intro y hy
  exact hfg x ⟨hx.1.le, hx.2.le⟩ y ⟨hy.1.le, hy.2.le⟩

/-- The affine-square certificate requires continuity only on its actual cell. -/
theorem integral_mem_affine_square_model_of_continuousOn
    (f : ℝ → ℝ → ℝ) (cx hx cy hy : ℚ) (p : List (List ℚ)) (R : IntervalRat)
    (hhx : 0 < hx) (hhy : 0 < hy)
    (hf : ContinuousOn (Function.uncurry f)
      (Icc ((cx : ℝ) - hx) ((cx : ℝ) + hx) ×ˢ
        Icc ((cy : ℝ) - hy) ((cy : ℝ) + hy)))
    (hmodel : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) -
        squareListEval p x y ∈ R) :
    (∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx),
      ∫ y in ((cy : ℝ) - hy)..((cy : ℝ) + hy), f x y) ∈
      IntervalRat.add (IntervalRat.singleton (hx * hy * squareListIntegralQ p))
        (IntervalRat.scale (4 * hx * hy) R) := by
  have hxR : (0 : ℝ) < (hx : ℝ) := by exact_mod_cast hhx
  have hyR : (0 : ℝ) < (hy : ℝ) := by exact_mod_cast hhy
  have hxab : (cx : ℝ) - hx ≤ (cx : ℝ) + hx := by linarith
  have hyab : (cy : ℝ) - hy ≤ (cy : ℝ) + hy := by linarith
  obtain ⟨g, hg, heq⟩ := exists_continuous_rectangle_extension f
    ((cx : ℝ) - hx) ((cx : ℝ) + hx) ((cy : ℝ) - hy) ((cy : ℝ) + hy)
    hxab hyab hf
  have hm : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      g ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) -
        squareListEval p x y ∈ R := by
    intro x hxi y hyi
    rw [heq _ (affine_mem_cell _ _ _ hxR.le hxi) _
      (affine_mem_cell _ _ _ hyR.le hyi)]
    exact hmodel x hxi y hyi
  have hint := iterated_integral_congr_rectangle g f
    ((cx : ℝ) - hx) ((cx : ℝ) + hx) ((cy : ℝ) - hy) ((cy : ℝ) + hy)
    hxab hyab heq
  rw [← hint]
  exact integral_mem_affine_square_model g cx hx cy hy p R hhx hhy hg hm

/-- Local cell continuity also suffices for the production integration order:
the second coordinate is outside, and the polynomial is not transposed. -/
theorem integral_mem_affine_square_model_swapped_of_continuousOn
    (f : ℝ → ℝ → ℝ) (cx hx cy hy : ℚ) (p : List (List ℚ)) (R : IntervalRat)
    (hhx : 0 < hx) (hhy : 0 < hy)
    (hf : ContinuousOn (Function.uncurry f)
      (Icc ((cx : ℝ) - hx) ((cx : ℝ) + hx) ×ˢ
        Icc ((cy : ℝ) - hy) ((cy : ℝ) + hy)))
    (hmodel : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) -
        squareListEval p x y ∈ R) :
    (∫ y in ((cy : ℝ) - hy)..((cy : ℝ) + hy),
      ∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx), f x y) ∈
      IntervalRat.add (IntervalRat.singleton (hx * hy * squareListIntegralQ p))
        (IntervalRat.scale (4 * hx * hy) R) := by
  have hxR : (0 : ℝ) < (hx : ℝ) := by exact_mod_cast hhx
  have hyR : (0 : ℝ) < (hy : ℝ) := by exact_mod_cast hhy
  have hxab : (cx : ℝ) - hx ≤ (cx : ℝ) + hx := by linarith
  have hyab : (cy : ℝ) - hy ≤ (cy : ℝ) + hy := by linarith
  obtain ⟨g, hg, heq⟩ := exists_continuous_rectangle_extension f
    ((cx : ℝ) - hx) ((cx : ℝ) + hx) ((cy : ℝ) - hy) ((cy : ℝ) + hy)
    hxab hyab hf
  have hm : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      g ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) -
        squareListEval p x y ∈ R := by
    intro x hxi y hyi
    rw [heq _ (affine_mem_cell _ _ _ hxR.le hxi) _
      (affine_mem_cell _ _ _ hyR.le hyi)]
    exact hmodel x hxi y hyi
  have hint := iterated_integral_congr_rectangle (fun y x => g x y) (fun y x => f x y)
    ((cy : ℝ) - hy) ((cy : ℝ) + hy) ((cx : ℝ) - hx) ((cx : ℝ) + hx)
    hyab hxab (fun y hy' x hx' => heq x hx' y hy')
  rw [← hint]
  exact integral_mem_affine_square_model_swapped g cx hx cy hy p R hhx hhy hg hm

end Grothe.UpperChaos.AffineSquareIntegralBounds
