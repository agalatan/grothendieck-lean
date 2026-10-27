import Grothe.Haagerup.PhaseLaplace

/-!
# Centering the affine damped Gaussian square

Pure algebra following the denominator-free completion of squares. No measure,
translation, or integration premise is needed.

Agent-ID: codex-44c5
-/

namespace Grothe.UpperChaos

/-- Translation by the conditional Gaussian mean separates the radial square. -/
theorem affine_gaussian_shift_complete_square (α a t : ℝ) (z v : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    α * Complex.normSq (v + μ) + t * Complex.normSq (z + (a : ℂ) * (v + μ)) =
      β * Complex.normSq v + α * t * Complex.normSq z / β := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  change α * Complex.normSq (v + μ) + t * Complex.normSq (z + (a : ℂ) * (v + μ)) =
    β * Complex.normSq v + α * t * Complex.normSq z / β
  have hβpos : 0 < β :=
    add_pos_of_pos_of_nonneg hα (mul_nonneg (sq_nonneg a) ht.le)
  have hβ : β ≠ 0 := hβpos.ne'
  have hβC : (β : ℂ) ≠ 0 := by exact_mod_cast hβ
  have hlinear : (β : ℂ) * (v + μ) + ((a * t : ℝ) : ℂ) * z = (β : ℂ) * v := by
    dsimp only [μ]
    push_cast
    field_simp [hβC]
    ring
  have hs := Grothe.Haag.affine_phase_complete_square α a t z (v + μ)
  simp only [← Complex.normSq_eq_norm_sq] at hs
  change β * (α * Complex.normSq (v + μ) +
      t * Complex.normSq (z + (a : ℂ) * (v + μ))) =
    Complex.normSq ((β : ℂ) * (v + μ) + ((a * t : ℝ) : ℂ) * z) +
      α * t * Complex.normSq z at hs
  rw [hlinear, Complex.normSq_mul, Complex.normSq_ofReal] at hs
  apply mul_left_cancel₀ hβ
  calc
    β * (α * Complex.normSq (v + μ) +
        t * Complex.normSq (z + (a : ℂ) * (v + μ))) =
      β * β * Complex.normSq v + α * t * Complex.normSq z := hs
    _ = β * (β * Complex.normSq v + α * t * Complex.normSq z / β) := by
      field_simp [hβ]

/-- The centered exponential splits into the conditional radial density and a `z` factor. -/
theorem affine_gaussian_shift_exp_factor (α a t : ℝ) (z v : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    Real.exp (-α * Complex.normSq (v + μ) -
      t * Complex.normSq (z + (a : ℂ) * (v + μ))) =
        Real.exp (-(α * t * Complex.normSq z / β)) *
          Real.exp (-β * Complex.normSq v) := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  change Real.exp (-α * Complex.normSq (v + μ) -
      t * Complex.normSq (z + (a : ℂ) * (v + μ))) =
    Real.exp (-(α * t * Complex.normSq z / β)) * Real.exp (-β * Complex.normSq v)
  have hs := affine_gaussian_shift_complete_square α a t z v hα ht
  change α * Complex.normSq (v + μ) + t * Complex.normSq (z + (a : ℂ) * (v + μ)) =
    β * Complex.normSq v + α * t * Complex.normSq z / β at hs
  have hexponent : -α * Complex.normSq (v + μ) -
      t * Complex.normSq (z + (a : ℂ) * (v + μ)) =
    -(α * t * Complex.normSq z / β) + -(β * Complex.normSq v) := by
    calc
      _ = -(α * Complex.normSq (v + μ) +
          t * Complex.normSq (z + (a : ℂ) * (v + μ))) := by ring
      _ = -(β * Complex.normSq v + α * t * Complex.normSq z / β) := by rw [hs]
      _ = _ := by ring
  rw [hexponent, Real.exp_add]
  simp only [neg_mul]

end Grothe.UpperChaos
