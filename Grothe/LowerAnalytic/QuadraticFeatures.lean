import Grothe.LowerAnalytic.ResponseGram

/-!
# Quadratic feature closure

Multiplying a first-chaos probe by a centered neutral quadratic gives only
first and (2,1)-cubic probes. Its pairing with an arbitrary response is therefore
determined by those two projections. No unbounded multiplication operator on
all of L² is assumed. The exact Gaussian application is written in the manuscript.
-/

namespace Grothe.LowerAnalytic.QuadraticFeatures

open Finset

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def wick21 (z : ι → ℂ) (j l i : ι) : ℂ :=
  z j * z l * star (z i) - (if i = j then z l else 0) - (if i = l then z j else 0)

theorem quadratic_mul_linear (M : ι → ι → ℂ) (z : ι → ℂ) (l : ι) :
    ((∑ i, ∑ j, M i j * (star (z i) * z j)) - ∑ i, M i i) * z l =
      (∑ j, M l j * z j) + ∑ i, ∑ j, M i j * wick21 z j l i := by
  have ht : ∀ i j, M i j * wick21 z j l i =
      (M i j * (star (z i) * z j)) * z l -
        (if i = j then M i j * z l else 0) -
        (if i = l then M i j * z j else 0) := by
    intro i j
    unfold wick21
    split_ifs <;> ring
  simp_rw [ht, sum_sub_distrib]
  have hd : (∑ i, ∑ j, if i = j then M i j * z l else 0) = (∑ i, M i i) * z l := by
    simp [sum_mul]
  have hl : (∑ i, ∑ j, if i = l then M i j * z j else 0) = ∑ j, M l j * z j := by
    rw [sum_comm]
    simp
  rw [hd, hl]
  simp_rw [← sum_mul]
  ring

/-- A probe in the retained polynomial space cannot see the discarded response
grades. This is the coefficient-level closure used for unbounded quadratic
features, whose products with first-chaos probes remain in L². -/
theorem probe_projection_closure {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (V : Submodule ℂ H) [V.HasOrthogonalProjection]
    (probe f : H) (hp : probe ∈ V) :
    inner ℂ probe f = inner ℂ probe (V.starProjection f) := by
  have h := V.inner_starProjection_left_eq_right probe f
  simpa only [V.starProjection_eq_self_iff.mpr hp] using h

/-- The uniform fourth-order remainder budget after the exact quadratic moment
bounds. Applied to feature L² norms, it gives C(A,B) ≤ 48 (a²+b²)². -/
theorem quadratic_remainder_budget (a b : ℝ) :
    (183/4 : ℝ) * (a^4+b^4) + (45/2 : ℝ)*a^2*b^2 +
      (489/20 : ℝ)*(a^3*b+a*b^3) ≤ 48*(a^2+b^2)^2 := by
  nlinarith [sq_nonneg (138*a*b-(489/20 : ℝ)*(a^2+b^2)), sq_nonneg (a^2+b^2)]

/-- Including a constant feature still gives a uniform L8 remainder budget. -/
theorem affine_quadratic_remainder_budget (a b : ℝ) :
    (507/8 : ℝ) * (a^4+b^4) + 40*a^2*b^2 +
      (69/2 : ℝ)*(a^3*b+a*b^3) ≤ 67*(a^2+b^2)^2 := by
  nlinarith [sq_nonneg ((347/2 : ℝ)*a*b-(69/2 : ℝ)*(a^2+b^2)), sq_nonneg (a^2+b^2)]

end

end Grothe.LowerAnalytic.QuadraticFeatures
