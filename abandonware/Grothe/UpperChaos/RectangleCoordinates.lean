import Grothe.UpperChaos.RectangleModelCheck

/-! Rounded affine coordinates for arbitrary physical rectangles. The exact
rational center and half-width are kept in the semantic conclusion, even when
the model uses rounded dyadic coefficients. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.RectangleCoordinates

open RectangleCoefficientArithmetic RectangleModelCheck

def checkX (center halfwidth : ℚ) (out : Model) : Bool :=
  intervalSubset (polynomialRange (sub2 [[center], [halfwidth]] out.coefficients))
    out.remainder

def checkY (center halfwidth : ℚ) (out : Model) : Bool :=
  intervalSubset (polynomialRange (sub2 [[center, halfwidth]] out.coefficients))
    out.remainder

theorem x_sound (center halfwidth : ℚ) (out : Model)
    (hc : checkX center halfwidth out = true)
    {x y : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    Contains out x y ((center : ℝ) + (halfwidth : ℝ) * x) := by
  have h := mem_of_intervalSubset hc
    (eval2_mem_polynomialRange (sub2 [[center], [halfwidth]] out.coefficients) hx hy)
  rw [eval2_sub] at h
  have he : eval2 [[center], [halfwidth]] x y =
      (center : ℝ) + (halfwidth : ℝ) * x := by
    simp [eval2, eval1, mul_comm]
  rwa [he] at h

theorem y_sound (center halfwidth : ℚ) (out : Model)
    (hc : checkY center halfwidth out = true)
    {x y : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    Contains out x y ((center : ℝ) + (halfwidth : ℝ) * y) := by
  have h := mem_of_intervalSubset hc
    (eval2_mem_polynomialRange (sub2 [[center, halfwidth]] out.coefficients) hx hy)
  rw [eval2_sub] at h
  have he : eval2 [[center, halfwidth]] x y =
      (center : ℝ) + (halfwidth : ℝ) * y := by
    simp [eval2, eval1, mul_comm]
  rwa [he] at h

end Grothe.UpperChaos.RectangleCoordinates
