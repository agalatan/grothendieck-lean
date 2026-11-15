import Grothe.Haagerup.PhaseStability
import Grothe.Haagerup.PhaseTaylorAlgebra

/-!
# Sharp quadratic approximation of the complex phase

The phase remainder has a global quadratic bound with coefficient `2`, including at the
point where the perturbed argument vanishes. The proof uses the radius and angular defect
of the perturbed point, followed by positive real scaling.

Agent-ID: codex-c8a4. Refs #369.
-/

namespace Grothe.Haag

/-- The normalized phase Taylor remainder is bounded by twice the squared perturbation. -/
theorem norm_ph_sub_linear_sharp (z : ℂ) :
    ‖ph z - 1 - (z - (z.re : ℂ))‖ ≤ 2 * ‖z - 1‖ ^ 2 := by
  by_cases hz : z = 0
  · subst z
    norm_num [ph]
  have hn : ‖ph z‖ = 1 := by
    simp [ph, Complex.norm_real, norm_ne_zero_iff.mpr hz]
  have hunit : (ph z).re ^ 2 + (ph z).im ^ 2 = 1 := by
    calc
      _ = ‖ph z‖ ^ 2 := by rw [Complex.sq_norm, Complex.normSq_apply]; ring
      _ = 1 := by rw [hn]; norm_num
  have hpolar : (‖z‖ : ℂ) * ph z = z := by
    unfold ph
    rw [mul_comm, div_mul_cancel₀ z (by exact_mod_cast norm_ne_zero_iff.mpr hz)]
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
  have habs : |(ph z).re| ≤ 1 := by simpa only [hn] using Complex.abs_re_le_norm (ph z)
  obtain ⟨hlo, hhi⟩ := abs_le.mp habs
  have hsq := phase_taylor_polynomial_le ‖z‖ (1 - (ph z).re) (norm_nonneg z)
    (by linarith) (by linarith)
  rw [← he, ← hd] at hsq
  nlinarith [norm_nonneg (ph z - 1 - (z - (z.re : ℂ))), sq_nonneg ‖z - 1‖]

private theorem ph_pos_mul (r : ℝ) (hr : 0 < r) (z : ℂ) :
    ph ((r : ℂ) * z) = ph z := by
  simp only [ph, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hr,
    Complex.ofReal_mul]
  exact mul_div_mul_left z (↑‖z‖) (by exact_mod_cast hr.ne')

/-- The zero-safe first-order phase approximation with the optimal universal coefficient `2`. -/
theorem norm_ph_real_add_sub_linear_sharp (r : ℝ) (hr : 0 < r) (h : ℂ) :
    ‖ph ((r : ℂ) + h) - 1 - (h - (h.re : ℂ)) / (r : ℂ)‖ ≤
      2 * ‖h‖ ^ 2 / r ^ 2 := by
  have hr0 : (r : ℂ) ≠ 0 := by exact_mod_cast hr.ne'
  have hscale : (r : ℂ) + h = (r : ℂ) * (1 + h / (r : ℂ)) := by
    field_simp
  have hphase : ph ((r : ℂ) + h) = ph (1 + h / (r : ℂ)) := by
    rw [hscale, ph_pos_mul r hr]
  have hlinear :
      (1 + h / (r : ℂ)) - (((1 + h / (r : ℂ)).re : ℝ) : ℂ) =
        (h - (h.re : ℂ)) / (r : ℂ) := by
    apply Complex.ext <;>
      simp [div_eq_mul_inv, ← Complex.ofReal_inv, Complex.mul_re, Complex.mul_im]
  calc
    _ = ‖ph (1 + h / (r : ℂ)) - 1 -
        ((1 + h / (r : ℂ)) - (((1 + h / (r : ℂ)).re : ℝ) : ℂ))‖ := by
      rw [hphase, hlinear]
    _ ≤ 2 * ‖(1 + h / (r : ℂ)) - 1‖ ^ 2 := norm_ph_sub_linear_sharp _
    _ = 2 * ‖h‖ ^ 2 / r ^ 2 := by
      rw [add_sub_cancel_left, norm_div, Complex.norm_real, Real.norm_of_nonneg hr.le,
        div_pow]
      ring

end Grothe.Haag
