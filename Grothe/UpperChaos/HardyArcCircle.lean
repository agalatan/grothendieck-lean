import Mathlib

/-!
# The trigonometry-free circle chart

For `|θ| < π` and `τ = tan(θ/2)`: `e^{iθ} = ((1 − τ²) + 2iτ)/(1 + τ²)` (`exp_eq_chart`); `θ ∈ [2 arctan a, 2 arctan b]`
gives `tan(θ/2) ∈ [a, b]` (`tan_half_mem`); and the arc length is bounded without `π`:
`arctan b − arctan a ≤ (b − a)/(1 + min(a², b²))` when `a ≤ b` have the same sign (`arctan_sub_le`).
Step 4 of the `hardy` plan (`GrotheKernel/HardyArc.lean`, `circleBox`, `arcLenUp`).
-/

open Real

namespace Grothe.UpperChaos.HardyArcCircle

/-- (T1) The half-angle parametrization of the unit circle. -/
lemma exp_eq_chart {θ : ℝ} (h1 : -π < θ) (h2 : θ < π) :
    Complex.exp (θ * Complex.I) =
      (((1 - tan (θ / 2) ^ 2) / (1 + tan (θ / 2) ^ 2) : ℝ) : ℂ) +
        ((2 * tan (θ / 2) / (1 + tan (θ / 2) ^ 2) : ℝ) : ℂ) * Complex.I := by
  have hc : 0 < cos (θ / 2) := cos_pos_of_mem_Ioo ⟨by linarith, by linarith⟩
  have hc0 : cos (θ / 2) ≠ 0 := hc.ne'
  have hsec : 1 + tan (θ / 2) ^ 2 = 1 / cos (θ / 2) ^ 2 := by
    rw [tan_eq_sin_div_cos]; field_simp; rw [cos_sq_add_sin_sq]
  have hcos : cos θ = (1 - tan (θ / 2) ^ 2) / (1 + tan (θ / 2) ^ 2) := by
    rw [hsec, tan_eq_sin_div_cos, show θ = 2 * (θ / 2) by ring, cos_two_mul]
    field_simp
    have := sin_sq_add_cos_sq (θ / 2)
    nlinarith [this]
  have hsin : sin θ = 2 * tan (θ / 2) / (1 + tan (θ / 2) ^ 2) := by
    rw [hsec, tan_eq_sin_div_cos, show θ = 2 * (θ / 2) by ring, sin_two_mul]
    field_simp
  rw [← hcos, ← hsin, Complex.ofReal_cos, Complex.ofReal_sin, Complex.exp_mul_I]

/-- (T2) The half-angle tangent of an angle between `2 arctan a` and `2 arctan b`. -/
lemma tan_half_mem {a b θ : ℝ} (h1 : 2 * arctan a ≤ θ) (h2 : θ ≤ 2 * arctan b) :
    a ≤ tan (θ / 2) ∧ tan (θ / 2) ≤ b := by
  have ha := arctan_lt_pi_div_two a
  have ha' := neg_pi_div_two_lt_arctan a
  have hb := arctan_lt_pi_div_two b
  have hb' := neg_pi_div_two_lt_arctan b
  have hlo : arctan a ≤ θ / 2 := by linarith
  have hhi : θ / 2 ≤ arctan b := by linarith
  constructor
  · calc a = tan (arctan a) := (tan_arctan a).symm
      _ ≤ tan (θ / 2) := strictMonoOn_tan.monotoneOn ⟨by linarith, by linarith⟩ ⟨by linarith, by linarith⟩ hlo
  · calc tan (θ / 2) ≤ tan (arctan b) :=
        strictMonoOn_tan.monotoneOn ⟨by linarith, by linarith⟩ ⟨by linarith, by linarith⟩ hhi
      _ = b := tan_arctan b

/-- (T3) The arc-length bound for `a ≤ b` of the same sign. -/
lemma arctan_sub_le {a b : ℝ} (hab : a ≤ b) (hs : 0 ≤ a ∨ b ≤ 0) :
    arctan b - arctan a ≤ (b - a) / (1 + min (a ^ 2) (b ^ 2)) := by
  -- on [a, b] the derivative 1/(1 + x²) is at most 1/(1 + min(a², b²))
  have hbound : ∀ x ∈ Set.Icc a b, ‖deriv arctan x‖ ≤ 1 / (1 + min (a ^ 2) (b ^ 2)) := by
    intro x hx
    rw [Real.deriv_arctan, Real.norm_eq_abs, abs_of_pos (by positivity)]
    apply one_div_le_one_div_of_le (by positivity)
    have : min (a ^ 2) (b ^ 2) ≤ x ^ 2 := by
      rcases hs with hs | hs
      · exact (min_le_left _ _).trans (pow_le_pow_left₀ hs hx.1 2)
      · refine (min_le_right _ _).trans ?_
        nlinarith [hx.2, hx.1]
    linarith
  have hd : ∀ x ∈ Set.Icc a b, HasDerivWithinAt arctan (deriv arctan x) (Set.Icc a b) x :=
    fun x _ => (Real.hasDerivAt_arctan x).hasDerivWithinAt.congr_deriv (by rw [Real.deriv_arctan])
  have := (convex_Icc a b).norm_image_sub_le_of_norm_hasDerivWithin_le hd hbound
    (Set.left_mem_Icc.2 hab) (Set.right_mem_Icc.2 hab)
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (by linarith : (0 : ℝ) ≤ b - a)] at this
  calc arctan b - arctan a ≤ |arctan b - arctan a| := le_abs_self _
    _ ≤ 1 / (1 + min (a ^ 2) (b ^ 2)) * (b - a) := this
    _ = (b - a) / (1 + min (a ^ 2) (b ^ 2)) := by ring

end Grothe.UpperChaos.HardyArcCircle
