import Grothe.UpperChaos.IntervalIntegralBounds

/-!
# Integrating pointwise polynomial-remainder bounds on a rectangle

The comparison function `P` may be a rational polynomial after coercion to
the reals, but this lemma does not depend on a particular representation.
Its exact iterated integral is an explicit hypothesis, so the result introduces
no numerical oracle or certificate assumption.

Agent-ID: codex-8c4d
-/

open MeasureTheory Set

namespace Grothe.UpperChaos.RectangleIntegralBounds

open Grothe.UpperChaos.IntervalIntegralBounds

/-- A pointwise interval remainder integrates to the rectangle area times
that interval. Slices and outer integrals are required to be integrable. -/
theorem integral_bounds_of_remainder
    {a b c d L U pIntegral : ℝ} {f P : ℝ → ℝ → ℝ}
    (hab : a ≤ b) (hcd : c ≤ d)
    (hf : ∀ x ∈ Icc a b, IntervalIntegrable (f x) volume c d)
    (hP : ∀ x ∈ Icc a b, IntervalIntegrable (P x) volume c d)
    (hfOuter : IntervalIntegrable (fun x => ∫ y in c..d, f x y) volume a b)
    (hPOuter : IntervalIntegrable (fun x => ∫ y in c..d, P x y) volume a b)
    (hPIntegral : (∫ x in a..b, ∫ y in c..d, P x y) = pIntegral)
    (hL : ∀ x ∈ Icc a b, ∀ y ∈ Icc c d, P x y + L ≤ f x y)
    (hU : ∀ x ∈ Icc a b, ∀ y ∈ Icc c d, f x y ≤ P x y + U) :
    pIntegral + L * (b - a) * (d - c) ≤ (∫ x in a..b, ∫ y in c..d, f x y) ∧
      (∫ x in a..b, ∫ y in c..d, f x y) ≤ pIntegral + U * (b - a) * (d - c) := by
  have hslice (x : ℝ) (hx : x ∈ Icc a b) :
      L * (d - c) ≤ (∫ y in c..d, f x y) - (∫ y in c..d, P x y) ∧
        (∫ y in c..d, f x y) - (∫ y in c..d, P x y) ≤ U * (d - c) := by
    have h := integral_bounds_of_pointwise hcd ((hf x hx).sub (hP x hx))
      (fun y hy => by have := hL x hx y hy; linarith)
      (fun y hy => by have := hU x hx y hy; linarith)
    rw [intervalIntegral.integral_sub (hf x hx) (hP x hx)] at h
    exact h
  have h := integral_bounds_of_pointwise hab (hfOuter.sub hPOuter)
    (fun x hx => (hslice x hx).1) (fun x hx => (hslice x hx).2)
  rw [intervalIntegral.integral_sub hfOuter hPOuter, hPIntegral] at h
  constructor <;> nlinarith [h.1, h.2]

end Grothe.UpperChaos.RectangleIntegralBounds
