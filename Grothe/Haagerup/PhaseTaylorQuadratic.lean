import Grothe.Haagerup.PhaseTaylorSharp

/-!
# The sharp cubic error after the quadratic phase approximation

The actual quadratic Taylor term of the complex phase leaves a globally bounded cubic
remainder with optimal coefficient `2`, including when the perturbed argument is zero.
An exact nonnegative polynomial decomposition proves the estimate without a smallness condition.

Agent-ID: codex-c8a4. Refs #389.
-/

open scoped ComplexConjugate

namespace Grothe.Haag

/-- The homogeneous quadratic Taylor term of `ph (1 + h)`. -/
noncomputable def phaseQuadratic (h : ℂ) : ℂ :=
  -((h.im ^ 2 / 2 : ℝ) : ℂ) - Complex.I * (h.re : ℂ) * (h.im : ℂ)

/-- The quadratic phase term as a polynomial in `h` and its conjugate. -/
theorem phaseQuadratic_eq (h : ℂ) :
    phaseQuadratic h = -(h ^ 2) / 8 - h * conj h / 4 + 3 * conj h ^ 2 / 8 := by
  apply Complex.ext <;>
    simp [phaseQuadratic, Complex.mul_re, Complex.mul_im, pow_two] <;> ring

/-- Real scaling preserves homogeneity, including negative and zero scales. -/
theorem phaseQuadratic_real_mul (r : ℝ) (h : ℂ) :
    phaseQuadratic ((r : ℂ) * h) = (r : ℂ) ^ 2 * phaseQuadratic h := by
  rw [phaseQuadratic_eq, phaseQuadratic_eq, map_mul, Complex.conj_ofReal]
  ring

private theorem phase_quadratic_polynomial_le (s u : ℝ)
    (hs : 0 ≤ s) (hu : 0 ≤ u) (hu2 : u ≤ 2) :
    u ^ 2 * (-2 + s ^ 2 * (2 - u)) ^ 2 +
        4 * u * (2 - u) * ((s - 1) ^ 2 - s ^ 2 * u) ^ 2 ≤
      16 * ((s - 1) ^ 2 + 2 * s * u) ^ 3 := by
  have hv : 0 ≤ 2 - u := sub_nonneg.mpr hu2
  have h0 : 0 ≤ (s - 1) ^ 6 * (2 - u) ^ 4 := by positivity
  have h1 : 0 ≤ (s - 1) ^ 4 * (4 * s ^ 2 + 4 * s + 3) * u * (2 - u) ^ 3 := by
    positivity
  have h2 : 0 ≤ (s - 1) ^ 2 *
      (6 * s ^ 4 + 12 * s ^ 3 + 13 * s ^ 2 + 14 * s + 3) * u ^ 2 * (2 - u) ^ 2 := by
    positivity
  have h3 : 0 ≤ (1 + 16 * s + 12 * s ^ 2 + 4 * s ^ 3 +
      11 * s ^ 4 + 12 * s ^ 5 + 4 * s ^ 6) * u ^ 3 * (2 - u) := by positivity
  have h4 : 0 ≤ (6 * s + 15 * s ^ 2 + 20 * s ^ 3 +
      15 * s ^ 4 + 6 * s ^ 5 + s ^ 6) * u ^ 4 := by positivity
  nlinarith only [h0, h1, h2, h3, h4]

/-- The normalized phase has a zero-safe cubic remainder after its quadratic Taylor term. -/
theorem norm_ph_sub_quadratic_sharp (z : ℂ) :
    ‖ph z - 1 - (z - (z.re : ℂ)) - phaseQuadratic (z - 1)‖ ≤ 2 * ‖z - 1‖ ^ 3 := by
  by_cases hz : z = 0
  · subst z
    norm_num [ph, phaseQuadratic]
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
  have he : 4 * ‖ph z - 1 - (z - (z.re : ℂ)) - phaseQuadratic (z - 1)‖ ^ 2 =
      (1 - (ph z).re) ^ 2 * (-2 + ‖z‖ ^ 2 * (2 - (1 - (ph z).re))) ^ 2 +
      4 * (1 - (ph z).re) * (2 - (1 - (ph z).re)) *
        ((‖z‖ - 1) ^ 2 - ‖z‖ ^ 2 * (1 - (ph z).re)) ^ 2 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp only [phaseQuadratic, Complex.sub_re,
      Complex.one_re, Complex.ofReal_re, Complex.neg_re, Complex.mul_re,
      Complex.I_re, Complex.I_im, Complex.ofReal_im, Complex.sub_im, Complex.one_im,
      Complex.neg_im, Complex.mul_im, zero_mul, mul_zero, zero_add, sub_zero]
    rw [hre, him]
    linear_combination
      (4 * ‖z‖ ^ 2 * ((ph z).re - 1) +
        ‖z‖ ^ 4 * ((ph z).im ^ 2 + 1 - (ph z).re ^ 2) +
        4 * (1 - 2 * ‖z‖ + ‖z‖ ^ 2 * (ph z).re) ^ 2) * hunit
  have habs : |(ph z).re| ≤ 1 := by simpa only [hn] using Complex.abs_re_le_norm (ph z)
  obtain ⟨hlo, hhi⟩ := abs_le.mp habs
  have hsq := phase_quadratic_polynomial_le ‖z‖ (1 - (ph z).re)
    (norm_nonneg z) (by linarith) (by linarith)
  rw [← he, ← hd] at hsq
  have hpow : (‖z - 1‖ ^ 2) ^ 3 = (‖z - 1‖ ^ 3) ^ 2 := by ring
  rw [hpow] at hsq
  nlinarith [norm_nonneg (ph z - 1 - (z - (z.re : ℂ)) - phaseQuadratic (z - 1)),
    pow_nonneg (norm_nonneg (z - 1)) 3]

/-- The cubic phase remainder at base radius one. -/
theorem norm_ph_one_add_sub_quadratic_sharp (h : ℂ) :
    ‖ph (1 + h) - 1 - (h - (h.re : ℂ)) - phaseQuadratic h‖ ≤ 2 * ‖h‖ ^ 3 := by
  simpa only [Complex.add_re, Complex.one_re, Complex.ofReal_add, Complex.ofReal_one,
    add_sub_cancel_left, add_sub_add_left_eq_sub] using norm_ph_sub_quadratic_sharp (1 + h)

/-- The sharp cubic estimate at any positive real base radius. -/
theorem norm_ph_real_add_sub_quadratic_sharp (r : ℝ) (hr : 0 < r) (h : ℂ) :
    ‖ph ((r : ℂ) + h) - 1 - (h - (h.re : ℂ)) / (r : ℂ) -
      phaseQuadratic h / (r : ℂ) ^ 2‖ ≤ 2 * ‖h‖ ^ 3 / r ^ 3 := by
  have hr0 : (r : ℂ) ≠ 0 := by exact_mod_cast hr.ne'
  have hscale : (r : ℂ) + h = (r : ℂ) * (1 + h / (r : ℂ)) := by field_simp
  have hphase : ph ((r : ℂ) + h) = ph (1 + h / (r : ℂ)) := by
    rw [hscale]
    simp only [ph, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hr,
      Complex.ofReal_mul]
    exact mul_div_mul_left _ _ hr0
  have hlinear : h / (r : ℂ) - (((h / (r : ℂ)).re : ℝ) : ℂ) =
      (h - (h.re : ℂ)) / (r : ℂ) := by
    apply Complex.ext <;>
      simp [div_eq_mul_inv, ← Complex.ofReal_inv, Complex.mul_re, Complex.mul_im]
  have hquadratic : phaseQuadratic (h / (r : ℂ)) = phaseQuadratic h / (r : ℂ) ^ 2 := by
    rw [div_eq_mul_inv, mul_comm h, ← Complex.ofReal_inv, phaseQuadratic_real_mul]
    push_cast
    ring
  calc
    _ = ‖ph (1 + h / (r : ℂ)) - 1 -
        (h / (r : ℂ) - (((h / (r : ℂ)).re : ℝ) : ℂ)) -
        phaseQuadratic (h / (r : ℂ))‖ := by rw [hphase, hlinear, hquadratic]
    _ ≤ 2 * ‖h / (r : ℂ)‖ ^ 3 := norm_ph_one_add_sub_quadratic_sharp _
    _ = _ := by rw [norm_div, Complex.norm_real, Real.norm_of_nonneg hr.le, div_pow]; ring

/-- No universal cubic coefficient below two bounds the quadratic phase Taylor remainder. -/
theorem two_le_phase_quadratic_constant {C : ℝ}
    (hC : ∀ h : ℂ, ‖ph (1 + h) - 1 - (h - (h.re : ℂ)) - phaseQuadratic h‖ ≤
      C * ‖h‖ ^ 3) : 2 ≤ C := by
  have hnegative (t : ℝ) (ht : 0 < t) : ph (-(t : ℂ)) = -1 := by
    rw [ph, norm_neg, Complex.norm_real, Real.norm_eq_abs, abs_of_pos ht]
    field_simp [Complex.ofReal_ne_zero.mpr ht.ne']
  have htest (t : ℝ) (ht : 0 < t) : 2 ≤ C * (1 + t) ^ 3 := by
    have h := hC (-((1 + t : ℝ) : ℂ))
    have harg : (1 : ℂ) + -((1 + t : ℝ) : ℂ) = -(t : ℂ) := by push_cast; ring
    rw [harg, hnegative t ht] at h
    simp only [phaseQuadratic, Complex.neg_re, Complex.ofReal_re, Complex.ofReal_neg,
      Complex.neg_im, Complex.ofReal_im, neg_zero, Complex.ofReal_zero,
      mul_zero, sub_zero, sub_self, norm_neg, Complex.norm_real, Real.norm_eq_abs,
      abs_of_pos (by linarith : 0 < 1 + t)] at h
    norm_num at h
    exact h
  have hCpos : 0 < C := by nlinarith [htest 1 (by norm_num)]
  by_contra hlt
  have hlt : C < 2 := lt_of_not_ge hlt
  let t : ℝ := (2 - C) / 16
  have ht : 0 < t := by dsimp [t]; linarith
  have ht1 : t ≤ 1 := by dsimp [t]; linarith
  have ht2 : t ^ 2 ≤ t := by nlinarith [mul_nonneg ht.le (sub_nonneg.mpr ht1)]
  have ht3 : t ^ 3 ≤ t := by
    have h := mul_le_mul_of_nonneg_left ht2 ht.le
    nlinarith
  have hcube : (1 + t) ^ 3 ≤ 1 + 7 * t := by nlinarith
  have hbound := (htest t ht).trans (mul_le_mul_of_nonneg_left hcube hCpos.le)
  have hCt : C * t ≤ 2 * t := mul_le_mul_of_nonneg_right hlt.le ht.le
  dsimp [t] at hbound hCt
  nlinarith

/-- The global cubic estimate after the quadratic phase term holds exactly for constants
at least two. -/
theorem phase_quadratic_bound_iff (C : ℝ) :
    (∀ h : ℂ, ‖ph (1 + h) - 1 - (h - (h.re : ℂ)) - phaseQuadratic h‖ ≤
      C * ‖h‖ ^ 3) ↔ 2 ≤ C := by
  constructor
  · exact two_le_phase_quadratic_constant
  · intro hC h
    exact (norm_ph_one_add_sub_quadratic_sharp h).trans
      (mul_le_mul_of_nonneg_right hC (by positivity))

end Grothe.Haag
