import Grothe.Lower.Basic

/-!
Exact assembly for the rank-one semiconvex interpolation argument.

The Gaussian shifted-potential convexity and response extraction are paper
inputs. These lemmas check the quadratic correction, finite expectation
assembly, and explicit mesh allowance. No numerical endpoint is asserted.
-/

namespace Grothe.Reassessment.SemiconvexChord

open Finset

/-- A convex chord for `F + A r²` yields a quadratic chord for `F`. -/
theorem chord_of_lifted (F : ℝ → ℝ → ℝ) (A r₀ r₁ f₀ f₁ θ : ℝ)
    (hchord :
      F (θ * r₀ + (1 - θ) * r₁) (θ * f₀ + (1 - θ) * f₁) +
          A * (θ * r₀ + (1 - θ) * r₁) ^ 2 ≤
        θ * (F r₀ f₀ + A * r₀ ^ 2) + (1 - θ) * (F r₁ f₁ + A * r₁ ^ 2)) :
    F (θ * r₀ + (1 - θ) * r₁) (θ * f₀ + (1 - θ) * f₁) ≤
      θ * F r₀ f₀ + (1 - θ) * F r₁ f₁ +
        A * θ * (1 - θ) * (r₁ - r₀) ^ 2 := by
  nlinarith only [hchord]

/-- The scalar square that makes the rank-one profile jointly convex. -/
theorem profile_square (d c r f : ℝ) (hd : d ≠ 0) :
    d * f ^ 2 + 2 * c * r * f + (c ^ 2 / d) * r ^ 2 =
      d * (f + c / d * r) ^ 2 := by
  field_simp [hd]
  ring

/-- Finite expectation assembly uses the same second moment, once. -/
theorem finite_expectation_chord {ι : Type*} [Fintype ι]
    (w z Fa Fb Ft : ι → ℝ) (Wa Wb θ err : ℝ)
    (hw : ∀ i, 0 ≤ w i) (hθ₀ : 0 ≤ θ) (hθ₁ : θ ≤ 1)
    (hpoint : ∀ i, Ft i ≤ θ * Fa i + (1 - θ) * Fb i + err * z i ^ 2)
    (hsecond : ∑ i, w i * z i ^ 2 = 1)
    (hFa : ∑ i, w i * Fa i ≤ Wa) (hFb : ∑ i, w i * Fb i ≤ Wb) :
    ∑ i, w i * Ft i ≤ θ * Wa + (1 - θ) * Wb + err := by
  calc
    ∑ i, w i * Ft i ≤ ∑ i, w i *
        (θ * Fa i + (1 - θ) * Fb i + err * z i ^ 2) :=
      sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hpoint i) (hw i)
    _ = θ * (∑ i, w i * Fa i) + (1 - θ) * (∑ i, w i * Fb i) +
        err * (∑ i, w i * z i ^ 2) := by
      simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
      apply sum_congr rfl
      intro i _
      ring
    _ ≤ θ * Wa + (1 - θ) * Wb + err := by
      rw [hsecond, mul_one]
      have hθc : 0 ≤ 1 - θ := sub_nonneg.mpr hθ₁
      have ha := mul_le_mul_of_nonneg_left hFa hθ₀
      have hb := mul_le_mul_of_nonneg_left hFb hθc
      linarith only [ha, hb]

/-- The correction preserves exact quadratic box maximization. -/
theorem gate_reassembly (A D a b t chord : ℝ) :
    chord - D * t ^ 2 + A * (t - a) * (b - t) =
      chord - (D + A) * t ^ 2 + A * (a + b) * t - A * a * b := by
  ring

/-- A bounded semiconvex coefficient has a uniform rational mesh cost. -/
theorem chord_allowance (A a b t : ℝ) (hA : 0 ≤ A) :
    A * (t - a) * (b - t) ≤ A * (b - a) ^ 2 / 4 := by
  nlinarith only [mul_nonneg hA (sq_nonneg (2 * t - a - b))]

theorem checked_mesh_allowance :
    (207 / 1000 : ℝ) * (1 / 500 : ℝ) ^ 2 / 4 = 207 / 1000000000 := by
  norm_num

end Grothe.Reassessment.SemiconvexChord

#print axioms Grothe.Reassessment.SemiconvexChord.chord_of_lifted
#print axioms Grothe.Reassessment.SemiconvexChord.profile_square
#print axioms Grothe.Reassessment.SemiconvexChord.finite_expectation_chord
#print axioms Grothe.Reassessment.SemiconvexChord.gate_reassembly
#print axioms Grothe.Reassessment.SemiconvexChord.chord_allowance
#print axioms Grothe.Reassessment.SemiconvexChord.checked_mesh_allowance
