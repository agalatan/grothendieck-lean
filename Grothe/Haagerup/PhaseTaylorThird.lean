import Grothe.Haagerup.PhaseTaylorQuadratic

/-!
# The sharp quartic remainder after the cubic phase approximation

The homogeneous cubic Taylor term leaves a global fourth-order remainder with optimal
coefficient `2`. The proof includes the zero of the perturbed argument and uses an exact
nonnegative polynomial decomposition, without any smallness hypothesis.

Agent-ID: codex-c8a4. Refs #389.
-/

open scoped ComplexConjugate

namespace Grothe.Haag

/-- The homogeneous cubic Taylor term of `ph (1 + h)`. -/
noncomputable def phaseCubic (h : ℂ) : ℂ :=
  ((h.re * h.im ^ 2 : ℝ) : ℂ) +
    Complex.I * ((h.re ^ 2 * h.im - h.im ^ 3 / 2 : ℝ) : ℂ)

/-- The cubic phase term as a polynomial in `h` and its conjugate. -/
theorem phaseCubic_eq (h : ℂ) :
    phaseCubic h = h ^ 3 / 16 + h ^ 2 * conj h / 16 +
      3 * h * conj h ^ 2 / 16 - 5 * conj h ^ 3 / 16 := by
  apply Complex.ext <;>
    simp [phaseCubic, Complex.mul_re, Complex.mul_im, pow_succ] <;> ring

/-- Real scaling preserves cubic homogeneity, including negative and zero scales. -/
theorem phaseCubic_real_mul (r : ℝ) (h : ℂ) :
    phaseCubic ((r : ℂ) * h) = (r : ℂ) ^ 3 * phaseCubic h := by
  rw [phaseCubic_eq, phaseCubic_eq, map_mul, Complex.conj_ofReal]
  ring

private theorem phase_cubic_polynomial_le (s u : ℝ)
    (hs : 0 ≤ s) (hu : 0 ≤ u) (hu2 : u ≤ 2) :
    u ^ 2 * (-2 + s ^ 2 * (2 - u) * (3 - 2 * s + 2 * s * u)) ^ 2 +
        u * (2 - u) * (2 - 2 * s + 2 * s * (s * (1 - u) - 1) -
          2 * s * (s * (1 - u) - 1) ^ 2 + s ^ 3 * (2 * u - u ^ 2)) ^ 2 ≤
      16 * ((s - 1) ^ 2 + 2 * s * u) ^ 4 := by
  have hv : 0 ≤ 2 - u := sub_nonneg.mpr hu2
  have h0 : 0 ≤ (s - 1) ^ 8 * (2 - u) ^ 6 := by positivity
  have h1 : 0 ≤ (s - 1) ^ 6 * (6 * s ^ 2 + 4 * s + 5) * u * (2 - u) ^ 5 := by
    positivity
  have h2 : 0 ≤ (s - 1) ^ 4 *
      (15 * s ^ 4 + 20 * s ^ 3 + 30 * s ^ 2 + 24 * s + 10) * u ^ 2 *
        (2 - u) ^ 4 := by positivity
  have h3 : 0 ≤ 2 * (s - 1) ^ 2 * (10 * s ^ 6 + 20 * s ^ 5 + 17 * s ^ 4 +
      14 * s ^ 3 + 25 * s ^ 2 + 28 * s + 5) * u ^ 3 * (2 - u) ^ 3 := by positivity
  have h4 : 0 ≤ (15 * s ^ 8 + 40 * s ^ 7 + 40 * s ^ 6 + 36 * s ^ 5 +
      23 * s ^ 4 + 6 * s ^ 2 * (s - 1) ^ 2 + 24 * s ^ 2 + 64 * s + 5) *
        u ^ 4 * (2 - u) ^ 2 := by positivity
  have h5 : 0 ≤ (6 * s ^ 8 + 32 * s ^ 7 + 71 * s ^ 6 + 90 * s ^ 5 +
      85 * s ^ 4 + 84 * s ^ 3 + 75 * s ^ 2 + 38 * s + 1) * u ^ 5 * (2 - u) := by
    positivity
  have h6 : 0 ≤ s * (s + 2) * (s ^ 2 + 2 * s + 2) *
      (s ^ 4 + 4 * s ^ 3 + 6 * s ^ 2 + 4 * s + 2) * u ^ 6 := by positivity
  nlinarith only [h0, h1, h2, h3, h4, h5, h6]

/-- The phase has a zero-safe quartic remainder after its cubic Taylor term. -/
theorem norm_ph_sub_cubic_sharp (z : ℂ) :
    ‖ph z - 1 - (z - (z.re : ℂ)) - phaseQuadratic (z - 1) - phaseCubic (z - 1)‖ ≤
      2 * ‖z - 1‖ ^ 4 := by
  by_cases hz : z = 0
  · subst z
    norm_num [ph, phaseQuadratic, phaseCubic]
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
  have he : 4 * ‖ph z - 1 - (z - (z.re : ℂ)) -
      phaseQuadratic (z - 1) - phaseCubic (z - 1)‖ ^ 2 =
      (1 - (ph z).re) ^ 2 * (-2 + ‖z‖ ^ 2 * (2 - (1 - (ph z).re)) *
        (3 - 2 * ‖z‖ + 2 * ‖z‖ * (1 - (ph z).re))) ^ 2 +
      (1 - (ph z).re) * (2 - (1 - (ph z).re)) *
        (2 - 2 * ‖z‖ + 2 * ‖z‖ * (‖z‖ * (1 - (1 - (ph z).re)) - 1) -
          2 * ‖z‖ * (‖z‖ * (1 - (1 - (ph z).re)) - 1) ^ 2 +
            ‖z‖ ^ 3 * (2 * (1 - (ph z).re) - (1 - (ph z).re) ^ 2)) ^ 2 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp only [phaseQuadratic, phaseCubic, Complex.sub_re, Complex.add_re,
      Complex.one_re, Complex.ofReal_re, Complex.neg_re, Complex.mul_re,
      Complex.I_re, Complex.I_im, Complex.ofReal_im, Complex.sub_im, Complex.add_im,
      Complex.one_im, Complex.neg_im, Complex.mul_im, zero_mul, mul_zero, zero_add,
      sub_zero]
    rw [hre, him]
    linear_combination
      (‖z‖ ^ 4 * (3 - 2 * ‖z‖ * (ph z).re) ^ 2 *
          ((ph z).im ^ 2 + 1 - (ph z).re ^ 2) +
        4 * ((ph z).re - 1) * ‖z‖ ^ 2 * (3 - 2 * ‖z‖ * (ph z).re) +
        (2 - 6 * ‖z‖ + 6 * ‖z‖ ^ 2 * (ph z).re - 2 * ‖z‖ ^ 3 * (ph z).re ^ 2) ^ 2 +
        2 * (2 - 6 * ‖z‖ + 6 * ‖z‖ ^ 2 * (ph z).re -
          2 * ‖z‖ ^ 3 * (ph z).re ^ 2) * ‖z‖ ^ 3 *
          ((ph z).im ^ 2 + 1 - (ph z).re ^ 2) +
        ‖z‖ ^ 6 * ((ph z).im ^ 4 + (ph z).im ^ 2 * (1 - (ph z).re ^ 2) +
          (1 - (ph z).re ^ 2) ^ 2)) * hunit
  have habs : |(ph z).re| ≤ 1 := by simpa only [hn] using Complex.abs_re_le_norm (ph z)
  obtain ⟨hlo, hhi⟩ := abs_le.mp habs
  have hsq := phase_cubic_polynomial_le ‖z‖ (1 - (ph z).re)
    (norm_nonneg z) (by linarith) (by linarith)
  rw [← he, ← hd] at hsq
  have hpow : (‖z - 1‖ ^ 2) ^ 4 = (‖z - 1‖ ^ 4) ^ 2 := by ring
  rw [hpow] at hsq
  nlinarith [norm_nonneg (ph z - 1 - (z - (z.re : ℂ)) -
    phaseQuadratic (z - 1) - phaseCubic (z - 1)), pow_nonneg (norm_nonneg (z - 1)) 4]

/-- The sharp quartic phase remainder at base radius one. -/
theorem norm_ph_one_add_sub_cubic_sharp (h : ℂ) :
    ‖ph (1 + h) - 1 - (h - (h.re : ℂ)) - phaseQuadratic h - phaseCubic h‖ ≤
      2 * ‖h‖ ^ 4 := by
  simpa only [Complex.add_re, Complex.one_re, Complex.ofReal_add, Complex.ofReal_one,
    add_sub_cancel_left, add_sub_add_left_eq_sub] using norm_ph_sub_cubic_sharp (1 + h)

/-- The sharp quartic estimate at any positive real base radius. -/
theorem norm_ph_real_add_sub_cubic_sharp (r : ℝ) (hr : 0 < r) (h : ℂ) :
    ‖ph ((r : ℂ) + h) - 1 - (h - (h.re : ℂ)) / (r : ℂ) -
      phaseQuadratic h / (r : ℂ) ^ 2 - phaseCubic h / (r : ℂ) ^ 3‖ ≤
        2 * ‖h‖ ^ 4 / r ^ 4 := by
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
  have hcubic : phaseCubic (h / (r : ℂ)) = phaseCubic h / (r : ℂ) ^ 3 := by
    rw [div_eq_mul_inv, mul_comm h, ← Complex.ofReal_inv, phaseCubic_real_mul]
    push_cast
    ring
  calc
    _ = ‖ph (1 + h / (r : ℂ)) - 1 -
        (h / (r : ℂ) - (((h / (r : ℂ)).re : ℝ) : ℂ)) -
        phaseQuadratic (h / (r : ℂ)) - phaseCubic (h / (r : ℂ))‖ := by
      rw [hphase, hlinear, hquadratic, hcubic]
    _ ≤ 2 * ‖h / (r : ℂ)‖ ^ 4 := norm_ph_one_add_sub_cubic_sharp _
    _ = _ := by rw [norm_div, Complex.norm_real, Real.norm_of_nonneg hr.le, div_pow]; ring

/-- No universal quartic coefficient below two bounds the cubic phase Taylor remainder. -/
theorem two_le_phase_cubic_constant {C : ℝ}
    (hC : ∀ h : ℂ, ‖ph (1 + h) - 1 - (h - (h.re : ℂ)) -
      phaseQuadratic h - phaseCubic h‖ ≤ C * ‖h‖ ^ 4) : 2 ≤ C := by
  have hnegative (t : ℝ) (ht : 0 < t) : ph (-(t : ℂ)) = -1 := by
    rw [ph, norm_neg, Complex.norm_real, Real.norm_eq_abs, abs_of_pos ht]
    field_simp [Complex.ofReal_ne_zero.mpr ht.ne']
  have htest (t : ℝ) (ht : 0 < t) : 2 ≤ C * (1 + t) ^ 4 := by
    have h := hC (-((1 + t : ℝ) : ℂ))
    have harg : (1 : ℂ) + -((1 + t : ℝ) : ℂ) = -(t : ℂ) := by push_cast; ring
    rw [harg, hnegative t ht] at h
    simp only [phaseQuadratic, phaseCubic, Complex.neg_re, Complex.ofReal_re,
      Complex.ofReal_neg, Complex.neg_im, Complex.ofReal_im, neg_zero,
      Complex.ofReal_zero, mul_zero, sub_zero, sub_self, norm_neg, Complex.norm_real,
      Real.norm_eq_abs, abs_of_pos (by linarith : 0 < 1 + t)] at h
    norm_num at h
    exact h
  have hCpos : 0 < C := by nlinarith [htest 1 (by norm_num)]
  by_contra hlt
  have hlt : C < 2 := lt_of_not_ge hlt
  let t : ℝ := (2 - C) / 32
  have ht : 0 < t := by dsimp [t]; linarith
  have ht1 : t ≤ 1 := by dsimp [t]; linarith
  have ht2 : t ^ 2 ≤ t := by nlinarith [mul_nonneg ht.le (sub_nonneg.mpr ht1)]
  have ht3 : t ^ 3 ≤ t := by
    have h := mul_le_mul_of_nonneg_left ht2 ht.le
    nlinarith
  have ht4 : t ^ 4 ≤ t := by
    have h := mul_le_mul_of_nonneg_left ht3 ht.le
    nlinarith
  have hpower : (1 + t) ^ 4 ≤ 1 + 15 * t := by nlinarith
  have hbound := (htest t ht).trans (mul_le_mul_of_nonneg_left hpower hCpos.le)
  have hCt : C * t ≤ 2 * t := mul_le_mul_of_nonneg_right hlt.le ht.le
  dsimp [t] at hbound hCt
  nlinarith

/-- The global quartic estimate after the cubic term holds exactly for constants at least two. -/
theorem phase_cubic_bound_iff (C : ℝ) :
    (∀ h : ℂ, ‖ph (1 + h) - 1 - (h - (h.re : ℂ)) - phaseQuadratic h - phaseCubic h‖ ≤
      C * ‖h‖ ^ 4) ↔ 2 ≤ C := by
  constructor
  · exact two_le_phase_cubic_constant
  · intro hC h
    exact (norm_ph_one_add_sub_cubic_sharp h).trans
      (mul_le_mul_of_nonneg_right hC (by positivity))

end Grothe.Haag
