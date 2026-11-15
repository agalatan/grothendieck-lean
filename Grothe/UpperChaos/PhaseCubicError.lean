import Grothe.Haagerup.PhaseTaylorThird
import Grothe.UpperChaos.PhaseQuadraticError

/-!
# Gaussian phase errors with the exact cubic correction

The cubic phase polynomial occupies exactly the six modes of total degree one or three.
Its support is disjoint from the quadratic correction. A quartic Gaussian remainder then
improves the errors of the unchanged linear centers, especially outside the low modes.

Agent-ID: codex-c8a4. Refs #389.
-/

open MeasureTheory Grothe.LowerAnalytic Finset
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.ZeroProfilePhaseStability

noncomputable section

/-- The six Wick modes of the cubic phase polynomial. -/
def phaseCubicModes : Fin 6 → ℕ × ℕ := ![(3, 0), (2, 1), (1, 2), (0, 3), (1, 0), (0, 1)]

/-- Exact Wick weights, including the two linear contractions. -/
def phaseCubicWeights : Fin 6 → ℂ :=
  ![(Real.sqrt 6 : ℂ) / 16, (Real.sqrt 2 : ℂ) / 16, 3 * (Real.sqrt 2 : ℂ) / 16,
    -5 * (Real.sqrt 6 : ℂ) / 16, 1 / 8, 3 / 8]

/-- The cubic phase polynomial as a finite Gaussian vector. -/
def phaseCubicWick : Lp ℂ 2 gaussC := ∑ j, phaseCubicWeights j • hvec (phaseCubicModes j)

/-- The exact six-mode coefficient function of the cubic phase polynomial. -/
def phaseCubicCoefficient (i : ℕ × ℕ) : ℂ :=
  ∑ j, if i = phaseCubicModes j then phaseCubicWeights j else 0

private theorem wickSum_coe {n : ℕ} (k : Fin n → ℕ × ℕ) (c : Fin n → ℂ) :
    ∀ᵐ w ∂gaussC, (∑ j, c j • hvec (k j) : Lp ℂ 2 gaussC) w =
      ∑ j, c j * hfun (k j) w := by
  have hm (j : Fin n) : ∀ᵐ w ∂gaussC,
      (c j • hvec (k j) : Lp ℂ 2 gaussC) w = c j * hfun (k j) w := by
    filter_upwards [Lp.coeFn_smul (c j) (hvec (k j)), (memLp_hfun (k j)).coeFn_toLp]
      with w hs hh
    rw [hs]
    change c j * ((memLp_hfun (k j)).toLp _) w = _
    rw [hh]
  filter_upwards [Lp.coeFn_fun_finsetSum univ (fun j ↦ c j • hvec (k j)),
    ae_all_iff.2 hm] with w hs hh
  exact hs.trans (sum_congr rfl fun j _ ↦ hh j)

/-- The Wick vector is the actual homogeneous cubic phase polynomial. -/
theorem phaseCubicWick_coe : ∀ᵐ w ∂gaussC, phaseCubicWick w = Haag.phaseCubic w := by
  have hroot2 : (Real.sqrt 2 : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2)).ne'
  have hroot6 : (Real.sqrt 6 : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 6)).ne'
  filter_upwards [wickSum_coe phaseCubicModes phaseCubicWeights] with w hw
  change (∑ j, phaseCubicWeights j • hvec (phaseCubicModes j) : Lp ℂ 2 gaussC) w = _
  rw [hw, Haag.phaseCubic_eq]
  simp [phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
    hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv]
  field_simp [hroot2, hroot6]
  ring_nf
  simp only [mul_inv_cancel_right₀ hroot6, mul_inv_cancel₀ hroot6, one_mul]

/-- The coefficient function is the exact Gaussian inner product. -/
theorem phaseCubicCoefficient_eq_inner (i : ℕ × ℕ) :
    phaseCubicCoefficient i = ⟪hvec i, phaseCubicWick⟫_ℂ := by
  simp [phaseCubicCoefficient, phaseCubicWick, inner_sum, inner_smul_right, inner_hvec]

/-- The cubic correction has exact squared Gaussian norm `27 / 32`. -/
theorem norm_phaseCubicWick_sq : ‖phaseCubicWick‖ ^ 2 = (27 / 32 : ℝ) := by
  norm_num [phaseCubicWick, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
    norm_add_sq (𝕜 := ℂ), norm_smul, inner_add_left, inner_add_right,
    inner_smul_left, inner_smul_right, inner_hvec, orthonormal_hvec.norm_eq_one,
    Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg 2),
    Real.norm_of_nonneg (Real.sqrt_nonneg 6), mul_pow, div_pow,
    Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2),
    Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]

/-- Only total degrees one and three occur in the cubic correction. -/
theorem phaseCubicCoefficient_eq_zero {i : ℕ × ℕ}
    (h1 : i.1 + i.2 ≠ 1) (h3 : i.1 + i.2 ≠ 3) : phaseCubicCoefficient i = 0 := by
  have hi (j : Fin 6) : i ≠ phaseCubicModes j := by
    intro h
    have hd := congrArg (fun p : ℕ × ℕ ↦ p.1 + p.2) h
    fin_cases j <;> norm_num [phaseCubicModes] at hd <;> omega
  simp [phaseCubicCoefficient, hi]

/-- The largest cubic coefficient has norm `5 √6 / 16`, at mode `(0,3)`. -/
theorem norm_phaseCubicCoefficient_le (i : ℕ × ℕ) :
    ‖phaseCubicCoefficient i‖ ≤ 5 * Real.sqrt 6 / 16 := by
  have hs2 : 0 ≤ Real.sqrt 2 := Real.sqrt_nonneg 2
  have hs6 : 2 ≤ Real.sqrt 6 := by
    nlinarith [Real.sqrt_nonneg 6, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  have h26 : Real.sqrt 2 ≤ Real.sqrt 6 := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2),
      Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  by_cases h30 : i = (3, 0)
  · subst i
    norm_num [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
      Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg 6)]
    linarith
  by_cases h21 : i = (2, 1)
  · subst i
    norm_num [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
      Complex.norm_real, Real.norm_of_nonneg hs2]
    linarith
  by_cases h12 : i = (1, 2)
  · subst i
    norm_num [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
      Complex.norm_real, Real.norm_of_nonneg hs2]
    linarith
  by_cases h03 : i = (0, 3)
  · subst i
    norm_num [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
      Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg 6)]
  by_cases h10 : i = (1, 0)
  · subst i
    norm_num [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six]
    linarith
  by_cases h01 : i = (0, 1)
  · subst i
    norm_num [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six]
    linarith
  · simp [phaseCubicCoefficient, phaseCubicModes, phaseCubicWeights, Fin.sum_univ_six,
      h30, h21, h12, h03, h10, h01]
    positivity

private def quarticMajorant : Lp ℂ 2 gaussC :=
  (2 : ℂ) • hvec (2, 2) + (4 : ℂ) • hvec (1, 1) + (2 : ℂ) • hvec (0, 0)

private theorem quarticMajorant_coe :
    ∀ᵐ w ∂gaussC, ‖quarticMajorant w‖ = ‖w‖ ^ 4 := by
  filter_upwards [wickSum_coe (![(2, 2), (1, 1), (0, 0)]) (![2, 4, 2])] with w hw
  have he : quarticMajorant w = ((‖w‖ ^ 4 : ℝ) : ℂ) := by
    simp only [Fin.sum_univ_three, Matrix.cons_val] at hw
    change quarticMajorant w = _ at hw
    rw [hw]
    simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv]
    norm_num
    have hnorm : ((‖w‖ ^ 2 : ℝ) : ℂ) = w * conj w := by
      rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]
    calc
      _ = (w * conj w) ^ 2 := by ring
      _ = _ := by rw [← hnorm]; push_cast; ring
  rw [he, Complex.norm_real, Real.norm_of_nonneg (by positivity)]

private theorem norm_quarticMajorant : ‖quarticMajorant‖ = 2 * Real.sqrt 6 := by
  have hsq : ‖quarticMajorant‖ ^ 2 = (24 : ℝ) := by
    norm_num [quarticMajorant, norm_add_sq (𝕜 := ℂ), norm_smul,
      inner_add_left, inner_add_right, inner_smul_left, inner_smul_right,
      inner_hvec, orthonormal_hvec.norm_eq_one]
  nlinarith [norm_nonneg quarticMajorant, Real.sqrt_nonneg 6,
    Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]

/-- The physical phase has quartic pointwise error after the two homogeneous corrections. -/
theorem phaseSlice_sub_cubic_bound (s : ℝ) (hs : 0 < s) (w : ℂ) :
    ‖F0ConditionalNode.phaseSlice s w - linearSlice s w -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w -
      ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * Haag.phaseCubic w‖ ≤
        2 * signedProfileRatio s ^ 4 * ‖w‖ ^ 4 := by
  let κ : ℝ := Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s
  have himag (z : ℂ) : z - (z.re : ℂ) = (z - conj z) / 2 := by
    apply Complex.ext <;> simp
  have hlin :
      ((κ : ℂ) * w - (((κ : ℂ) * w).re : ℂ)) / (Real.sqrt s : ℂ) =
        ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w) := by
    rw [himag, map_mul, Complex.conj_ofReal]
    dsimp only [signedProfileRatio, κ]
    push_cast
    ring
  have hquad : Haag.phaseQuadratic ((κ : ℂ) * w) / (Real.sqrt s : ℂ) ^ 2 =
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w := by
    rw [Haag.phaseQuadratic_real_mul]
    dsimp only [signedProfileRatio, κ]
    push_cast
    ring
  have hcubic : Haag.phaseCubic ((κ : ℂ) * w) / (Real.sqrt s : ℂ) ^ 3 =
      ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * Haag.phaseCubic w := by
    rw [Haag.phaseCubic_real_mul]
    dsimp only [signedProfileRatio, κ]
    push_cast
    ring
  have h := Haag.norm_ph_real_add_sub_cubic_sharp (Real.sqrt s)
    (Real.sqrt_pos.2 hs) ((κ : ℂ) * w)
  calc
    _ = ‖Haag.ph ((Real.sqrt s : ℂ) + (κ : ℂ) * w) - 1 -
        ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w) -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w -
        ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * Haag.phaseCubic w‖ := by
      rw [F0ConditionalNode.phaseSlice_eq s hs.le]
      dsimp only [linearSlice, κ]
      congr 1
      ring
    _ ≤ 2 * ‖(κ : ℂ) * w‖ ^ 4 / Real.sqrt s ^ 4 := by
      simpa only [hlin, hquad, hcubic] using h
    _ = _ := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
      dsimp only [signedProfileRatio, κ]
      simp only [mul_pow, div_pow, (by decide : Even 4).pow_abs]
      ring

/-- The Gaussian error after the cubic approximation is at most `4 √6 ρ⁴`. -/
theorem norm_phaseSliceLp_sub_cubic (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick -
      ((signedProfileRatio s ^ 3 : ℝ) : ℂ) • phaseCubicWick‖ ≤
        4 * Real.sqrt 6 * signedProfileRatio s ^ 4 := by
  let a : ℝ := 2 * signedProfileRatio s ^ 4
  have ha : 0 ≤ a := by dsimp [a]; positivity
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖(F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick -
        ((signedProfileRatio s ^ 3 : ℝ) : ℂ) • phaseCubicWick) w‖ ≤
          ‖((a : ℂ) • quarticMajorant) w‖ := by
    filter_upwards [Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick)
        (((signedProfileRatio s ^ 3 : ℝ) : ℂ) • phaseCubicWick),
      Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s - linearSliceLp s)
        (((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick),
      Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (linearSliceLp s),
      Lp.coeFn_smul ((signedProfileRatio s ^ 2 : ℝ) : ℂ) phaseQuadraticWick,
      Lp.coeFn_smul ((signedProfileRatio s ^ 3 : ℝ) : ℂ) phaseCubicWick,
      Lp.coeFn_smul (a : ℂ) quarticMajorant, (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp,
      linearSliceLp_coe s, phaseQuadraticWick_coe, phaseCubicWick_coe, quarticMajorant_coe]
      with w hd hd' hd'' hq ht hc hp hl hw ht' hC
    simp only [Pi.sub_apply] at hd hd' hd''
    simp only [Pi.smul_apply] at hq ht hc
    rw [hd, hd', hd'', hq, ht, hc, hl, hw, ht']
    change ‖((F0ConditionalNode.phaseSlice_memLp s).toLp _) w - linearSlice s w -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w -
        ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * Haag.phaseCubic w‖ ≤
          ‖(a : ℂ) * quarticMajorant w‖
    rw [hp, norm_mul, Complex.norm_real, Real.norm_of_nonneg ha, hC]
    exact phaseSlice_sub_cubic_bound s hs w
  calc
    _ ≤ ‖(a : ℂ) • quarticMajorant‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ = a * ‖quarticMajorant‖ := by
      rw [norm_smul, Complex.norm_real, Real.norm_of_nonneg ha]
    _ = _ := by rw [norm_quarticMajorant]; dsimp [a]; ring

/-- Each coefficient has quartic error after its exact quadratic and cubic corrections. -/
theorem norm_coefficient_sub_cubic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i -
      ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * phaseCubicCoefficient i‖ ≤
        4 * Real.sqrt 6 * signedProfileRatio s ^ 4 := by
  have heq : F0ConditionalNode.coefficient s i - linearCoefficient s i -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i -
      ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * phaseCubicCoefficient i =
      ⟪hvec i, F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick -
        ((signedProfileRatio s ^ 3 : ℝ) : ℂ) • phaseCubicWick⟫_ℂ := by
    rw [inner_sub_right, inner_sub_right, inner_sub_right, inner_smul_right,
      inner_smul_right, ← linearCoefficient_eq_inner, ← phaseQuadraticCoefficient_eq_inner,
      ← phaseCubicCoefficient_eq_inner]
    rfl
  rw [heq]
  calc
    _ ≤ ‖hvec i‖ * ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick -
        ((signedProfileRatio s ^ 3 : ℝ) : ℂ) • phaseCubicWick‖ := norm_inner_le_norm _ _
    _ = _ := by rw [orthonormal_hvec.norm_eq_one i, one_mul]
    _ ≤ _ := norm_phaseSliceLp_sub_cubic s hs

/-- Outside the four quadratic modes, only the cubic coefficient and quartic error remain. -/
theorem norm_coefficient_sub_linear_cubic_off_quadratic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ)
    (h00 : i ≠ (0, 0)) (h11 : i ≠ (1, 1)) (h20 : i ≠ (2, 0)) (h02 : i ≠ (0, 2)) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (5 * Real.sqrt 6 / 16) * |signedProfileRatio s| ^ 3 +
        4 * Real.sqrt 6 * signedProfileRatio s ^ 4 := by
  have h := norm_coefficient_sub_cubic s hs i
  rw [phaseQuadraticCoefficient_eq_zero h00 h11 h20 h02, mul_zero, sub_zero] at h
  have ht := norm_add_le
    (F0ConditionalNode.coefficient s i - linearCoefficient s i -
      ((signedProfileRatio s ^ 3 : ℝ) : ℂ) * phaseCubicCoefficient i)
    (((signedProfileRatio s ^ 3 : ℝ) : ℂ) * phaseCubicCoefficient i)
  rw [sub_add_cancel, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_pow] at ht
  have hc := mul_le_mul_of_nonneg_left (norm_phaseCubicCoefficient_le i)
    (by positivity : 0 ≤ |signedProfileRatio s| ^ 3)
  linarith

/-- Above total degree three, the original linear model already has quartic error. -/
theorem norm_coefficient_sub_linear_high_degree (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ)
    (hi : 4 ≤ i.1 + i.2) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      4 * Real.sqrt 6 * signedProfileRatio s ^ 4 := by
  have h00 : i ≠ (0, 0) := by rintro rfl; norm_num at hi
  have h11 : i ≠ (1, 1) := by rintro rfl; norm_num at hi
  have h20 : i ≠ (2, 0) := by rintro rfl; norm_num at hi
  have h02 : i ≠ (0, 2) := by rintro rfl; norm_num at hi
  simpa only [phaseQuadraticCoefficient_eq_zero h00 h11 h20 h02,
    phaseCubicCoefficient_eq_zero (by omega : i.1 + i.2 ≠ 1) (by omega : i.1 + i.2 ≠ 3),
    mul_zero, sub_zero] using norm_coefficient_sub_cubic s hs i

/-- Disjoint quadratic and cubic supports remove the cubic term from the uniform small-profile
bound for the unchanged linear centers. -/
theorem norm_coefficient_sub_linear_quartic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ)
    (hρ : |signedProfileRatio s| ≤ 1 / 2) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (3 * Real.sqrt 2 / 8) * signedProfileRatio s ^ 2 +
        4 * Real.sqrt 6 * signedProfileRatio s ^ 4 := by
  by_cases hquad : i = (0, 0) ∨ i = (1, 1) ∨ i = (2, 0) ∨ i = (0, 2)
  · have hc : phaseCubicCoefficient i = 0 := by
      apply phaseCubicCoefficient_eq_zero <;> rcases hquad with h | h | h | h <;>
        subst i <;> norm_num
    have h := norm_coefficient_sub_cubic s hs i
    rw [hc, mul_zero, sub_zero] at h
    have ht := norm_add_le
      (F0ConditionalNode.coefficient s i - linearCoefficient s i -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i)
      (((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i)
    rw [sub_add_cancel, norm_mul, Complex.norm_real,
      Real.norm_of_nonneg (sq_nonneg _)] at ht
    have hq := mul_le_mul_of_nonneg_left (norm_phaseQuadraticCoefficient_le i)
      (sq_nonneg (signedProfileRatio s))
    linarith
  · push Not at hquad
    have h := norm_coefficient_sub_linear_cubic_off_quadratic s hs i
      hquad.1 hquad.2.1 hquad.2.2.1 hquad.2.2.2
    have h2 : (4 / 3 : ℝ) ≤ Real.sqrt 2 := by
      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
    have h6 : Real.sqrt 6 ≤ (5 / 2 : ℝ) := by
      nlinarith [Real.sqrt_nonneg 6, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
    have hc : (5 * Real.sqrt 6 / 16) * |signedProfileRatio s| ≤
        3 * Real.sqrt 2 / 8 := by
      have hm := mul_le_mul_of_nonneg_left hρ
        (by positivity : 0 ≤ 5 * Real.sqrt 6 / 16)
      nlinarith
    have hp : (5 * Real.sqrt 6 / 16) * |signedProfileRatio s| ^ 3 ≤
        (3 * Real.sqrt 2 / 8) * signedProfileRatio s ^ 2 := by
      calc
        _ = ((5 * Real.sqrt 6 / 16) * |signedProfileRatio s|) *
            |signedProfileRatio s| ^ 2 := by ring
        _ ≤ (3 * Real.sqrt 2 / 8) * |signedProfileRatio s| ^ 2 :=
          mul_le_mul_of_nonneg_right hc (sq_nonneg _)
        _ = _ := by rw [sq_abs]
    exact h.trans (add_le_add hp le_rfl)

private theorem saved_error_le_of_cubic_remainder (s r saved B : ℝ) (i : ℕ × ℕ)
    (hB : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤ B) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ ≤
      B + |signedProfileRatio s - r| / 2 + ‖linearCenter r i - (saved : ℂ)‖ := by
  have h1 := dist_triangle (F0ConditionalNode.coefficient s i) (linearCoefficient s i)
    (saved : ℂ)
  have h2 := dist_triangle (linearCoefficient s i) (linearCenter r i) (saved : ℂ)
  simp only [dist_eq_norm] at h1 h2
  have hp := linearCoefficient_parameter_error s r i
  linarith

/-- The uniform saved-center interval improves to `1 / 1086000` with unchanged reserves. -/
theorem actual_saved_error_lt_quartic (s : ℝ) (hs : 0 < s) (r saved : ℝ) (i : ℕ × ℕ)
    (hρ : |signedProfileRatio s| ≤ 1 / 1086000)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have h2 : 3 * Real.sqrt 2 / 8 ≤ (577 / 1088 : ℝ) := by
    nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  have h6 : 4 * Real.sqrt 6 ≤ (10 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / 1086000 : ℝ) ^ 2 := by
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 2
  have hfour : signedProfileRatio s ^ 4 ≤ (1 / 1086000 : ℝ) ^ 4 := by
    simpa only [(by decide : Even 4).pow_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 4
  have hrem := norm_coefficient_sub_linear_quartic s hs i (by linarith)
  have hb : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (577 / 1088 : ℝ) * (1 / 1086000) ^ 2 + 10 * (1 / 1086000) ^ 4 := by
    have ha := mul_le_mul_of_nonneg_right h2 (sq_nonneg (signedProfileRatio s))
    have hb := mul_le_mul_of_nonneg_right h6 (by positivity : 0 ≤ signedProfileRatio s ^ 4)
    nlinarith
  have h := saved_error_le_of_cubic_remainder s r saved _ i hb
  have hbudget : (577 / 1088 : ℝ) * (1 / 1086000) ^ 2 + 10 * (1 / 1086000) ^ 4 +
      (1 / 10 ^ 13) / 2 + 1 / (2 * 10 ^ 12) < 1 / 10 ^ 12 := by norm_num
  linarith

/-- Off the quadratic support, the unchanged saved centers work up to `1 / 12000`. -/
theorem actual_saved_error_lt_cubic_off_quadratic (s : ℝ) (hs : 0 < s) (r saved : ℝ)
    (i : ℕ × ℕ) (h00 : i ≠ (0, 0)) (h11 : i ≠ (1, 1)) (h20 : i ≠ (2, 0))
    (h02 : i ≠ (0, 2)) (hρ : |signedProfileRatio s| ≤ 1 / 12000)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have h6 : 5 * Real.sqrt 6 / 16 ≤ (49 / 64 : ℝ) := by
    nlinarith [Real.sqrt_nonneg 6, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  have h6' : 4 * Real.sqrt 6 ≤ (10 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  have hcube := pow_le_pow_left₀ (abs_nonneg _) hρ 3
  have hfour : signedProfileRatio s ^ 4 ≤ (1 / 12000 : ℝ) ^ 4 := by
    simpa only [(by decide : Even 4).pow_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 4
  have hrem := norm_coefficient_sub_linear_cubic_off_quadratic s hs i h00 h11 h20 h02
  have hb : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (49 / 64 : ℝ) * (1 / 12000) ^ 3 + 10 * (1 / 12000) ^ 4 := by
    have ha := mul_le_mul_of_nonneg_right h6 (by positivity : 0 ≤ |signedProfileRatio s| ^ 3)
    have hb := mul_le_mul_of_nonneg_right h6' (by positivity : 0 ≤ signedProfileRatio s ^ 4)
    nlinarith
  have h := saved_error_le_of_cubic_remainder s r saved _ i hb
  have hbudget : (49 / 64 : ℝ) * (1 / 12000) ^ 3 + 10 * (1 / 12000) ^ 4 +
      (1 / 10 ^ 13) / 2 + 1 / (2 * 10 ^ 12) < 1 / 10 ^ 12 := by norm_num
  linarith

/-- Above total degree three the linear centers are zero, so no parameter error is needed.
The saved-value reserve alone permits `|ρ| ≤ 1 / 2120`. -/
theorem actual_saved_error_lt_high_degree (s : ℝ) (hs : 0 < s) (r saved : ℝ) (i : ℕ × ℕ)
    (hi : 4 ≤ i.1 + i.2) (hρ : |signedProfileRatio s| ≤ 1 / 2120)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have h00 : i ≠ (0, 0) := by rintro rfl; norm_num at hi
  have h10 : i ≠ (1, 0) := by rintro rfl; norm_num at hi
  have h01 : i ≠ (0, 1) := by rintro rfl; norm_num at hi
  have hlin : linearCoefficient s i = 0 := by simp [linearCoefficient, h00, h10, h01]
  have hcenter : linearCenter r i = 0 := by simp [linearCenter, h00, h10, h01]
  rw [hcenter, zero_sub, norm_neg] at hsaved
  have h6 : 4 * Real.sqrt 6 ≤ (10 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  have hfour : signedProfileRatio s ^ 4 ≤ (1 / 2120 : ℝ) ^ 4 := by
    simpa only [(by decide : Even 4).pow_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 4
  have hrem := norm_coefficient_sub_linear_high_degree s hs i hi
  rw [hlin, sub_zero] at hrem
  have hb : ‖F0ConditionalNode.coefficient s i‖ ≤ 10 * (1 / 2120 : ℝ) ^ 4 := by
    have h := mul_le_mul_of_nonneg_right h6 (by positivity : 0 ≤ signedProfileRatio s ^ 4)
    nlinarith
  have h := norm_sub_le (F0ConditionalNode.coefficient s i) (saved : ℂ)
  have hbudget : (10 : ℝ) * (1 / 2120) ^ 4 + 1 / (2 * 10 ^ 12) < 1 / 10 ^ 12 := by
    norm_num
  linarith

end

end Grothe.UpperChaos.ZeroProfilePhaseStability
