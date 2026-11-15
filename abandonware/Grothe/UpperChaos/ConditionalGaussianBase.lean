import Grothe.UpperChaos.ConditionalGaussianPhase
import Grothe.UpperChaos.ShiftedMomentRecurrence

/-!
# The exact zeroth conditional Gaussian phase moment

The linear shifted moment cancels the apparent leading affine contribution.
The retained Gaussian mass is `1 / β`, and the resulting bracket is exactly
`α z / β²`.

Agent-ID: codex-37fb
-/

open MeasureTheory ProbabilityTheory Real Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The first holomorphic shifted moment retains the tilted mass. -/
theorem shiftedDampedMoment_one_zero (rate : ℝ) (μ : ℂ) :
    shiftedDampedMoment rate μ 1 0 = μ / (rate : ℂ) := by
  simp [shiftedDampedMoment]

/-- The first antiholomorphic shifted moment retains the same tilted mass. -/
theorem shiftedDampedMoment_zero_one (rate : ℝ) (μ : ℂ) :
    shiftedDampedMoment rate μ 0 1 = conj μ / (rate : ℂ) := by
  simp [shiftedDampedMoment]

/-- Centering preserves the affine cancellation rather than bounding its terms separately. -/
theorem shiftedDampedMoment_affine_base (α a t : ℝ) (z : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    z * shiftedDampedMoment β μ 0 0 +
      (a : ℂ) * shiftedDampedMoment β μ 1 0 = (α : ℂ) * z / (β : ℂ)^2 := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  change z * shiftedDampedMoment β μ 0 0 +
    (a : ℂ) * shiftedDampedMoment β μ 1 0 = (α : ℂ) * z / (β : ℂ)^2
  have h := shiftedDampedMoment_affine_step α a t z 0 0 hα ht
  dsimp only at h
  simp only [Nat.cast_zero, mul_zero, zero_div, zero_mul, add_zero,
    shiftedDampedMoment_zero_zero] at h
  rw [shiftedDampedMoment_zero_zero, h]
  dsimp only [β]
  simp only [div_eq_mul_inv, pow_two]
  ring

/-- Exact conditional expectation of the affine phase kernel, including its cancellation. -/
theorem integral_affine_phaseLaplace_base (α a t : ℝ) (z : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    (∫ w, phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
        (α : ℂ) * z / (β : ℂ)^2 := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  have h := integral_affine_phaseLaplace_monomial 0 0 α a t z hα ht
  change (∫ w, w ^ 0 * conj w ^ 0 * phaseLaplaceKernel (z + (a : ℂ) * w) t *
    (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
    ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
      (z * shiftedDampedMoment β μ 0 0 + (a : ℂ) * shiftedDampedMoment β μ 1 0) at h
  have hc := shiftedDampedMoment_affine_base α a t z hα ht
  change z * shiftedDampedMoment β μ 0 0 + (a : ℂ) * shiftedDampedMoment β μ 1 0 =
    (α : ℂ) * z / (β : ℂ)^2 at hc
  rw [hc] at h
  simpa only [pow_zero, one_mul, mul_div_assoc, mul_assoc] using h

/-- The exact scalar norm profile of the conditional phase expectation. -/
theorem norm_integral_affine_phaseLaplace_base (α a t : ℝ) (z : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    ‖∫ w, phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC‖ =
      t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) *
        α * ‖z‖ / β^2 := by
  dsimp only
  have hβ : 0 < α + a ^ 2 * t :=
    add_pos_of_pos_of_nonneg hα (mul_nonneg (sq_nonneg a) ht.le)
  have hs : 0 ≤ t ^ (-(1 / 2 : ℝ)) := Real.rpow_nonneg ht.le _
  have he : 0 < Real.exp (-(α * t * Complex.normSq z / (α + a ^ 2 * t))) := Real.exp_pos _
  rw [integral_affine_phaseLaplace_base α a t z hα ht]
  simp only [norm_div, norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg hs, abs_of_pos he, abs_of_pos hα, abs_of_pos hβ]

end
end Grothe.UpperChaos
