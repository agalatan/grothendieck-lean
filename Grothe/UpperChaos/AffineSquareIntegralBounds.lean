import Grothe.UpperChaos.RectangleListPolynomialIntegral
import Grothe.UpperChaos.RectangleIntegralBounds
import LeanCert.Core.IntervalRat.Basic
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Integral.Prod

/-!
# From a normalized-square model to an affine cell integral

The first argument of `f` is the outer integration variable and indexes the
outer rows of the rational coefficient list. The second is the inner variable.
The result is a rational interval around the exact polynomial integral; no
particular source function or numerical certificate is assumed.

Agent-ID: codex-8c4d
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.AffineSquareIntegralBounds

open Grothe.UpperChaos.RectangleListPolynomialIntegral
open Grothe.UpperChaos.RectangleIntegralBounds

/-- The oriented affine change of variables for an iterated rectangle
integral, with the first coordinate integrated on the outside. -/
theorem integral_affine_square (f : ℝ → ℝ → ℝ) (cx hx cy hy : ℚ) :
    (∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx),
      ∫ y in ((cy : ℝ) - hy)..((cy : ℝ) + hy), f x y) =
      (hx : ℝ) * (hy : ℝ) *
        ∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1,
          f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) := by
  let G : ℝ → ℝ := fun x =>
    ∫ y in ((cy : ℝ) - hy)..((cy : ℝ) + hy), f x y
  have houter : (hx : ℝ) *
      (∫ x in (-1 : ℝ)..1, G ((cx : ℝ) + (hx : ℝ) * x)) =
        ∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx), G x := by
    simpa only [smul_eq_mul, mul_neg, mul_one, sub_eq_add_neg] using
      (intervalIntegral.smul_integral_comp_add_mul (a := (-1 : ℝ)) (b := 1)
        G (hx : ℝ) (cx : ℝ))
  have hinner (x : ℝ) : (hy : ℝ) *
      (∫ y in (-1 : ℝ)..1,
        f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y)) =
        G ((cx : ℝ) + (hx : ℝ) * x) := by
    dsimp only [G]
    simpa only [smul_eq_mul, mul_neg, mul_one, sub_eq_add_neg] using
      (intervalIntegral.smul_integral_comp_add_mul (a := (-1 : ℝ)) (b := 1)
        (fun y => f ((cx : ℝ) + (hx : ℝ) * x) y) (hy : ℝ) (cy : ℝ))
  have hfun : (fun x : ℝ => G ((cx : ℝ) + (hx : ℝ) * x)) =
      fun x : ℝ => (hy : ℝ) * ∫ y in (-1 : ℝ)..1,
        f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) := by
    funext x
    exact (hinner x).symm
  change (∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx), G x) = _
  rw [← houter, hfun, intervalIntegral.integral_const_mul]
  ring

/-- A continuous cell integrand with a pointwise ragged-polynomial model on
the normalized square has the stated exact rational interval enclosure. The
first coordinate, represented by the outer list index, is integrated first
in the outer integral; the second coordinate is integrated in the inner one. -/
theorem integral_mem_affine_square_model
    (f : ℝ → ℝ → ℝ) (cx hx cy hy : ℚ) (p : List (List ℚ)) (R : IntervalRat)
    (hhx : 0 < hx) (hhy : 0 < hy)
    (hf : Continuous (Function.uncurry f))
    (hmodel : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) -
        squareListEval p x y ∈ R) :
    (∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx),
      ∫ y in ((cy : ℝ) - hy)..((cy : ℝ) + hy), f x y) ∈
      IntervalRat.add (IntervalRat.singleton (hx * hy * squareListIntegralQ p))
        (IntervalRat.scale (4 * hx * hy) R) := by
  let F : ℝ → ℝ → ℝ := fun x y =>
    f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y)
  have hmap : Continuous (fun v : ℝ × ℝ =>
      ((cx : ℝ) + (hx : ℝ) * v.1, (cy : ℝ) + (hy : ℝ) * v.2)) := by
    fun_prop
  have hF : Continuous (Function.uncurry F) := by
    exact hf.comp hmap
  have hP : Continuous (Function.uncurry (squareListEval p)) := by
    change Continuous (fun v : ℝ × ℝ => ∑ i ∈ Finset.range p.length,
      ∑ j ∈ Finset.range (p.getD i []).length,
        (((p.getD i []).getD j 0 : ℚ) : ℝ) * v.1 ^ i * v.2 ^ j)
    apply continuous_finsetSum _
    intro i hi
    apply continuous_finsetSum _
    intro j hj
    fun_prop
  have hFOuter : IntervalIntegrable (fun x : ℝ => ∫ y in (-1 : ℝ)..1, F x y)
      volume (-1) 1 :=
    (intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
      (μ := volume) hF (-1) 1).intervalIntegrable _ _
  have hPOuter : IntervalIntegrable (fun x : ℝ =>
      ∫ y in (-1 : ℝ)..1, squareListEval p x y) volume (-1) 1 :=
    (intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
      (μ := volume) hP (-1) 1).intervalIntegrable _ _
  have hb := integral_bounds_of_remainder
    (a := (-1 : ℝ)) (b := 1) (c := (-1 : ℝ)) (d := 1)
    (L := (R.lo : ℝ)) (U := (R.hi : ℝ))
    (pIntegral := (squareListIntegralQ p : ℝ)) (f := F) (P := squareListEval p)
    (by norm_num) (by norm_num)
    (fun x _ => (hF.uncurry_left x).intervalIntegrable _ _)
    (fun x _ => (hP.uncurry_left x).intervalIntegrable _ _)
    hFOuter hPOuter (integral_squareListEval p)
    (fun x hx' y hy' => by
      have h := ((IntervalRat.mem_def _ _).mp (hmodel x hx' y hy')).1
      change (R.lo : ℝ) ≤ F x y - squareListEval p x y at h
      linarith)
    (fun x hx' y hy' => by
      have h := ((IntervalRat.mem_def _ _).mp (hmodel x hx' y hy')).2
      change F x y - squareListEval p x y ≤ (R.hi : ℝ) at h
      linarith)
  have harea : (0 : ℝ) < (hx : ℝ) * (hy : ℝ) := by
    exact_mod_cast mul_pos hhx hhy
  have hrem : ((∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, F x y) -
      (squareListIntegralQ p : ℝ)) / 4 ∈ R := by
    rw [IntervalRat.mem_def]
    constructor <;> nlinarith [hb.1, hb.2, harea]
  have hmem := IntervalRat.mem_add
    (IntervalRat.mem_singleton (hx * hy * squareListIntegralQ p))
    (IntervalRat.mem_scale (4 * hx * hy) hrem)
  rw [integral_affine_square]
  change (hx : ℝ) * (hy : ℝ) *
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, F x y) ∈ _
  convert hmem using 1
  push_cast
  ring

/-- A continuous function has equal iterated interval integrals in either
order on a rectangle. Compactness supplies the Fubini integrability premise. -/
theorem interval_integral_swap_of_continuous (f : ℝ → ℝ → ℝ)
    (a b c d : ℝ) (hf : Continuous (Function.uncurry f)) :
    (∫ x in a..b, ∫ y in c..d, f x y) =
      ∫ y in c..d, ∫ x in a..b, f x y := by
  apply MeasureTheory.intervalIntegral_intervalIntegral_swap
  have hcompact : IsCompact (uIcc a b ×ˢ uIcc c d) :=
    isCompact_uIcc.prod isCompact_uIcc
  have hint : IntegrableOn (Function.uncurry f) (uIcc a b ×ˢ uIcc c d) :=
    hf.continuousOn.integrableOn_compact hcompact
  exact hint.mono_set (Set.prod_mono uIoc_subset_uIcc uIoc_subset_uIcc)

/-- The same certificate, with the second coordinate integrated on the
outside. For the generator's `x = s, y = u` convention this is the production
order: outer `u`, inner `s`; the coefficient list itself is not transposed. -/
theorem integral_mem_affine_square_model_swapped
    (f : ℝ → ℝ → ℝ) (cx hx cy hy : ℚ) (p : List (List ℚ)) (R : IntervalRat)
    (hhx : 0 < hx) (hhy : 0 < hy)
    (hf : Continuous (Function.uncurry f))
    (hmodel : ∀ x ∈ Icc (-1 : ℝ) 1, ∀ y ∈ Icc (-1 : ℝ) 1,
      f ((cx : ℝ) + (hx : ℝ) * x) ((cy : ℝ) + (hy : ℝ) * y) -
        squareListEval p x y ∈ R) :
    (∫ y in ((cy : ℝ) - hy)..((cy : ℝ) + hy),
      ∫ x in ((cx : ℝ) - hx)..((cx : ℝ) + hx), f x y) ∈
      IntervalRat.add (IntervalRat.singleton (hx * hy * squareListIntegralQ p))
        (IntervalRat.scale (4 * hx * hy) R) := by
  rw [← interval_integral_swap_of_continuous f ((cx : ℝ) - hx) ((cx : ℝ) + hx)
    ((cy : ℝ) - hy) ((cy : ℝ) + hy) hf]
  exact integral_mem_affine_square_model f cx hx cy hy p R hhx hhy hf hmodel

end Grothe.UpperChaos.AffineSquareIntegralBounds
