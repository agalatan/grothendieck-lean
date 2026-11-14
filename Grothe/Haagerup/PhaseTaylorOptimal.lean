import Grothe.Haagerup.PhaseTaylorSharp

/-!
# A necessary constant in the global quadratic phase remainder

Approaching zero from the negative real axis makes the phase remainder equal to two,
while the squared perturbation tends to one. The elementary argument below proves that
every uniform quadratic coefficient is at least two without taking a limit.

Agent-ID: codex-c8a4. Refs #369.
-/

namespace Grothe.Haag

/-- No uniform quadratic phase-Taylor estimate at radius one can have coefficient below two. -/
theorem two_le_phase_taylor_constant {C : ℝ}
    (hC : ∀ h : ℂ, ‖ph (1 + h) - 1 - (h - (h.re : ℂ))‖ ≤ C * ‖h‖ ^ 2) :
    2 ≤ C := by
  have hnegative (t : ℝ) (ht : 0 < t) : ph (-(t : ℂ)) = -1 := by
    rw [ph, norm_neg, Complex.norm_real, Real.norm_eq_abs, abs_of_pos ht]
    field_simp [Complex.ofReal_ne_zero.mpr ht.ne']
  have htest (t : ℝ) (ht : 0 < t) : 2 ≤ C * (1 + t) ^ 2 := by
    have h := hC (-((1 + t : ℝ) : ℂ))
    have harg : (1 : ℂ) + -((1 + t : ℝ) : ℂ) = -(t : ℂ) := by
      push_cast
      ring
    rw [harg, hnegative t ht] at h
    simp only [Complex.neg_re, Complex.ofReal_re, Complex.ofReal_neg, sub_self,
      sub_zero, norm_neg, Complex.norm_real, Real.norm_eq_abs,
      abs_of_pos (by linarith : 0 < 1 + t)] at h
    norm_num at h
    exact h
  have hCpos : 0 < C := by nlinarith [htest 1 (by norm_num)]
  by_contra hlt
  have hlt : C < 2 := lt_of_not_ge hlt
  let t : ℝ := (2 - C) / 8
  have ht : 0 < t := by dsimp [t]; linarith
  have ht1 : t ≤ 1 := by dsimp [t]; linarith
  have hsq : (1 + t) ^ 2 ≤ 1 + 3 * t := by nlinarith [mul_nonneg ht.le (sub_nonneg.mpr ht1)]
  have hbound := (htest t ht).trans (mul_le_mul_of_nonneg_left hsq hCpos.le)
  have hCt : C * t ≤ 2 * t := mul_le_mul_of_nonneg_right hlt.le ht.le
  dsimp [t] at hbound hCt
  nlinarith

/-- The global zero-safe quadratic phase-Taylor estimate holds exactly for coefficients
at least two. -/
theorem phase_taylor_bound_iff (C : ℝ) :
    (∀ (r : ℝ), 0 < r → ∀ h : ℂ,
      ‖ph ((r : ℂ) + h) - 1 - (h - (h.re : ℂ)) / (r : ℂ)‖ ≤
        C * ‖h‖ ^ 2 / r ^ 2) ↔ 2 ≤ C := by
  constructor
  · intro h
    apply two_le_phase_taylor_constant
    intro z
    simpa only [Complex.ofReal_one, one_pow, div_one] using h 1 zero_lt_one z
  · intro hC r hr h
    exact (norm_ph_real_add_sub_linear_sharp r hr h).trans
      (div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_right hC (sq_nonneg _))
        (sq_nonneg _))

end Grothe.Haag
