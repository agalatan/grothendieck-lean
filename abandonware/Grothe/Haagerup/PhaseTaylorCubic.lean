import Grothe.Haagerup.PhaseTaylorSharp

/-!
# A quadratic phase remainder with a cubic correction

Away from the origin, the normalized phase remainder is bounded by the squared perturbation.
Combining this with the sharp global quadratic estimate gives a zero-safe bound with quadratic
coefficient `1` and a cubic correction of coefficient `2`.

Agent-ID: codex-c8a4. Refs #369.
-/

namespace Grothe.Haag

private theorem phase_taylor_polynomial_le_of_half (s u : ℝ)
    (hs : (1 : ℝ) / 2 ≤ s) (hu : 0 ≤ u) :
    u ^ 2 + (s - 1) ^ 2 * (2 * u - u ^ 2) ≤ ((s - 1) ^ 2 + 2 * s * u) ^ 2 := by
  have hs0 : 0 ≤ s := by linarith
  have h2 : 0 ≤ 2 * s - 1 := by linarith
  have h5 : 0 ≤ 5 * s - 2 := by linarith
  have hfirst : 0 ≤ 2 * u * (s - 1) ^ 2 * (2 * s - 1) := by positivity
  have hsecond : 0 ≤ u ^ 2 * s * (5 * s - 2) := by positivity
  nlinarith [sq_nonneg ((s - 1) ^ 2)]

/-- The normalized phase Taylor remainder has quadratic coefficient `1` whenever the
perturbed point has norm at least one half. -/
theorem norm_ph_sub_linear_le_sq_of_half_le_norm (z : ℂ) (hz : (1 : ℝ) / 2 ≤ ‖z‖) :
    ‖ph z - 1 - (z - (z.re : ℂ))‖ ≤ ‖z - 1‖ ^ 2 := by
  have hz0 : z ≠ 0 := by intro h; norm_num [h] at hz
  have hn : ‖ph z‖ = 1 := by
    simp [ph, Complex.norm_real, norm_ne_zero_iff.mpr hz0]
  have hunit : (ph z).re ^ 2 + (ph z).im ^ 2 = 1 := by
    calc
      _ = ‖ph z‖ ^ 2 := by rw [Complex.sq_norm, Complex.normSq_apply]; ring
      _ = 1 := by rw [hn]; norm_num
  have hpolar : (‖z‖ : ℂ) * ph z = z := by
    unfold ph
    rw [mul_comm, div_mul_cancel₀ z (by exact_mod_cast norm_ne_zero_iff.mpr hz0)]
  have hre : z.re = ‖z‖ * (ph z).re := by
    simpa using (congrArg Complex.re hpolar).symm
  have him : z.im = ‖z‖ * (ph z).im := by
    simpa using (congrArg Complex.im hpolar).symm
  have hd : ‖z - 1‖ ^ 2 = (‖z‖ - 1) ^ 2 + 2 * ‖z‖ * (1 - (ph z).re) := by
    simp only [Complex.sq_norm, Complex.normSq_apply, Complex.sub_re, Complex.one_re,
      Complex.sub_im, Complex.one_im, sub_zero]
    rw [hre, him]
    linear_combination ‖z‖ ^ 2 * hunit
  have he : ‖ph z - 1 - (z - (z.re : ℂ))‖ ^ 2 =
      (1 - (ph z).re) ^ 2 + (‖z‖ - 1) ^ 2 *
        (2 * (1 - (ph z).re) - (1 - (ph z).re) ^ 2) := by
    simp only [Complex.sq_norm, Complex.normSq_apply, Complex.sub_re, Complex.one_re,
      Complex.ofReal_re, sub_self, sub_zero, Complex.sub_im, Complex.one_im,
      Complex.ofReal_im]
    rw [him]
    linear_combination (‖z‖ - 1) ^ 2 * hunit
  have hu : 0 ≤ 1 - (ph z).re := by
    have h := Complex.re_le_norm (ph z)
    rw [hn] at h
    linarith
  have hsq := phase_taylor_polynomial_le_of_half ‖z‖ (1 - (ph z).re) hz hu
  rw [← he, ← hd] at hsq
  nlinarith [norm_nonneg (ph z - 1 - (z - (z.re : ℂ))), sq_nonneg ‖z - 1‖]

/-- A global normalized phase Taylor estimate with quadratic coefficient `1` and cubic
correction coefficient `2`, including at the origin. -/
theorem norm_ph_sub_linear_cubic (z : ℂ) :
    ‖ph z - 1 - (z - (z.re : ℂ))‖ ≤ ‖z - 1‖ ^ 2 + 2 * ‖z - 1‖ ^ 3 := by
  by_cases hz : (1 : ℝ) / 2 ≤ ‖z‖
  · exact (norm_ph_sub_linear_le_sq_of_half_le_norm z hz).trans
      (le_add_of_nonneg_right (by positivity))
  · have htriangle : 1 ≤ ‖z‖ + ‖z - 1‖ := by simpa using norm_sub_le z (z - 1)
    have ht : 0 ≤ 2 * ‖z - 1‖ - 1 := by linarith [lt_of_not_ge hz]
    exact (norm_ph_sub_linear_sharp z).trans (by
      nlinarith [mul_nonneg (sq_nonneg ‖z - 1‖) ht])

/-- A zero-safe phase Taylor estimate with quadratic coefficient `1` and a cubic correction. -/
theorem norm_ph_real_add_sub_linear_cubic (r : ℝ) (hr : 0 < r) (h : ℂ) :
    ‖ph ((r : ℂ) + h) - 1 - (h - (h.re : ℂ)) / (r : ℂ)‖ ≤
      ‖h‖ ^ 2 / r ^ 2 + 2 * ‖h‖ ^ 3 / r ^ 3 := by
  have hr0 : (r : ℂ) ≠ 0 := by exact_mod_cast hr.ne'
  have hscale : (r : ℂ) + h = (r : ℂ) * (1 + h / (r : ℂ)) := by field_simp
  have hphase : ph ((r : ℂ) + h) = ph (1 + h / (r : ℂ)) := by
    rw [hscale]
    simp only [ph, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hr,
      Complex.ofReal_mul]
    exact mul_div_mul_left _ _ hr0
  have hlinear :
      (1 + h / (r : ℂ)) - (((1 + h / (r : ℂ)).re : ℝ) : ℂ) =
        (h - (h.re : ℂ)) / (r : ℂ) := by
    apply Complex.ext <;>
      simp [div_eq_mul_inv, ← Complex.ofReal_inv, Complex.mul_re, Complex.mul_im]
  calc
    _ = ‖ph (1 + h / (r : ℂ)) - 1 -
        ((1 + h / (r : ℂ)) - (((1 + h / (r : ℂ)).re : ℝ) : ℂ))‖ := by
      rw [hphase, hlinear]
    _ ≤ ‖(1 + h / (r : ℂ)) - 1‖ ^ 2 + 2 * ‖(1 + h / (r : ℂ)) - 1‖ ^ 3 :=
      norm_ph_sub_linear_cubic _
    _ = ‖h‖ ^ 2 / r ^ 2 + 2 * ‖h‖ ^ 3 / r ^ 3 := by
      simp only [add_sub_cancel_left, norm_div, Complex.norm_real,
        Real.norm_of_nonneg hr.le, div_pow]
      ring

end Grothe.Haag
