import Mathlib.Analysis.SpecialFunctions.Exp

/-! Damping error after reciprocal-coordinate Jacobian cancellation.
The error is uniform down to zero; no expansion of the inverse coordinate is
needed. Numerical certificates must still bound the remaining multiplier.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.ReciprocalDamping

theorem exp_loss (t : ℝ) (ht : 0 ≤ t) :
    0 ≤ 1 - Real.exp (-t) ∧ 1 - Real.exp (-t) ≤ t := by
  have he : Real.exp (-t) ≤ 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_le_exp.mpr (neg_nonpos.mpr ht)
  constructor
  · exact sub_nonneg.mpr he
  · linarith [Real.add_one_le_exp (-t)]

/-- The inverse-coordinate damping has a uniform absolute loss after its
Jacobian-cancelled factor `x²` is included. -/
theorem scaled_loss (η x : ℝ) :
    0 ≤ x^2 * (1 - Real.exp (-(η^2 / x^2))) ∧
      x^2 * (1 - Real.exp (-(η^2 / x^2))) ≤ η^2 := by
  by_cases hx : x = 0
  · simp [hx, sq_nonneg]
  have hx2 : 0 < x^2 := sq_pos_of_ne_zero hx
  have h := exp_loss (η^2 / x^2) (div_nonneg (sq_nonneg η) hx2.le)
  refine ⟨mul_nonneg hx2.le h.1, ?_⟩
  calc
    _ ≤ x^2 * (η^2 / x^2) := mul_le_mul_of_nonneg_left h.2 hx2.le
    _ = η^2 := by field_simp

/-- A nonnegative remaining kernel factor can be enclosed separately. -/
theorem weighted_error (η x A : ℝ) (hA : 0 ≤ A) :
    |x^2 * Real.exp (-(η^2 / x^2)) * A - x^2 * A| ≤ η^2 * A := by
  have h := scaled_loss η x
  have hid : x^2 * Real.exp (-(η^2 / x^2)) * A - x^2 * A =
      -(x^2 * (1 - Real.exp (-(η^2 / x^2)))) * A := by ring
  rw [hid, abs_mul, abs_neg, abs_of_nonneg h.1, abs_of_nonneg hA]
  exact mul_le_mul_of_nonneg_right h.2 hA

/-- Direct-coordinate damping is also controlled without a separate scalar
exponential certificate when a bound on `u²` is available. -/
theorem direct_weighted_error (η u A : ℝ) (hA : 0 ≤ A) :
    |Real.exp (-(η^2 * u^2)) * A - A| ≤ η^2 * u^2 * A := by
  have h := exp_loss (η^2 * u^2) (mul_nonneg (sq_nonneg η) (sq_nonneg u))
  have hid : Real.exp (-(η^2 * u^2)) * A - A =
      -(1 - Real.exp (-(η^2 * u^2))) * A := by ring
  rw [hid, abs_mul, abs_neg, abs_of_nonneg h.1, abs_of_nonneg hA]
  exact mul_le_mul_of_nonneg_right h.2 hA

/-- A coarse bound is sufficient here: damping errors have a factor `η²`.
This avoids computing a separate exponential enclosure for their reserve. -/
theorem sq_mul_exp_neg_le_two (t : ℝ) (ht : 0 ≤ t) :
    t^2 * Real.exp (-t) ≤ 2 := by
  rw [Real.exp_neg, ← div_eq_mul_inv, div_le_iff₀ (Real.exp_pos t)]
  nlinarith [Real.quadratic_le_exp_of_nonneg ht]

/-- The residual Gaussian factor controls the apparent inverse-square
singularity uniformly in the positive denominator. -/
theorem gaussian_inverse_sq_le (s D : ℝ) (hs : 0 < s) (hD : 0 ≤ D) :
    Real.exp (-s - s / D) / D^2 ≤ 2 / s^2 := by
  by_cases hzero : D = 0
  · simp only [hzero, zero_pow (by decide : 2 ≠ 0), div_zero]
    positivity
  have hexp : Real.exp (-s) ≤ 1 := by
    simpa using Real.exp_le_exp.mpr (neg_nonpos.mpr hs.le)
  have hfactor : Real.exp (-s - s / D) =
      Real.exp (-s) * Real.exp (-(s / D)) := by
    rw [sub_eq_add_neg, Real.exp_add]
  calc
    _ ≤ Real.exp (-(s / D)) / D^2 := by
      rw [hfactor]
      apply div_le_div_of_nonneg_right _ (sq_nonneg D)
      simpa only [one_mul] using
        mul_le_mul_of_nonneg_right hexp (Real.exp_pos (-(s / D))).le
    _ = ((s / D)^2 * Real.exp (-(s / D))) / s^2 := by
      field_simp
    _ ≤ 2 / s^2 := by
      gcongr
      exact sq_mul_exp_neg_le_two (s / D) (div_nonneg hs.le hD)

theorem sq_one_add_mul_exp_neg_le_eight (t : ℝ) (ht : 0 ≤ t) :
    t^2 * (1 + t) * Real.exp (-t) ≤ 8 := by
  have hcube : t^3 * Real.exp (-t) ≤ 6 := by
    rw [Real.exp_neg, ← div_eq_mul_inv, div_le_iff₀ (Real.exp_pos t)]
    have h := Real.pow_div_factorial_le_exp t ht 3
    norm_num at h
    linarith
  have hsq := sq_mul_exp_neg_le_two t ht
  calc
    _ = t^2 * Real.exp (-t) + t^3 * Real.exp (-t) := by ring
    _ ≤ 8 := by linarith

/-- The signed companion factor has the same uniform inverse-square control.
Absolute values are used only for the damping error, not for the integral
being certified. -/
theorem gaussian_companion_factor_le (s D : ℝ) (hs : 0 < s) (hD : 0 ≤ D) :
    |1 - s / D| * (Real.exp (-s - s / D) / D^2) ≤ 8 / s^2 := by
  by_cases hzero : D = 0
  · simp only [hzero, zero_pow (by decide : 2 ≠ 0), div_zero, mul_zero]
    positivity
  have ht : 0 ≤ s / D := div_nonneg hs.le hD
  have habs : |1 - s / D| ≤ 1 + s / D := by
    exact abs_le.mpr ⟨by linarith, by linarith⟩
  have hexp : Real.exp (-s) ≤ 1 := by
    simpa using Real.exp_le_exp.mpr (neg_nonpos.mpr hs.le)
  have hfactor : Real.exp (-s - s / D) =
      Real.exp (-s) * Real.exp (-(s / D)) := by
    rw [sub_eq_add_neg, Real.exp_add]
  have hgauss : Real.exp (-s - s / D) / D^2 ≤ Real.exp (-(s / D)) / D^2 := by
    rw [hfactor]
    apply div_le_div_of_nonneg_right _ (sq_nonneg D)
    simpa only [one_mul] using
      mul_le_mul_of_nonneg_right hexp (Real.exp_pos (-(s / D))).le
  calc
    _ ≤ (1 + s / D) * (Real.exp (-(s / D)) / D^2) :=
      mul_le_mul habs hgauss (by positivity) (by positivity)
    _ = ((s / D)^2 * (1 + s / D) * Real.exp (-(s / D))) / s^2 := by
      field_simp
    _ ≤ 8 / s^2 := by
      apply div_le_div_of_nonneg_right _ (sq_nonneg s)
      exact sq_one_add_mul_exp_neg_le_eight (s / D) ht

end Grothe.UpperChaos.ReciprocalDamping
