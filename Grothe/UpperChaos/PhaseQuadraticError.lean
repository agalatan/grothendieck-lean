import Grothe.Haagerup.PhaseTaylorQuadratic
import Grothe.UpperChaos.ZeroProfilePhaseCubic

/-!
# Gaussian coefficient errors after retaining the quadratic phase term

The exact four-mode Wick expansion of the quadratic phase term improves the error for
the existing linear centers. Outside these four modes the error is cubic in the signed
profile ratio. Both saved-center interfaces retain the parameter and stored-byte reserves.

Agent-ID: codex-c8a4. Refs #389.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.ZeroProfilePhaseStability

noncomputable section

/-- The four Wick modes of the homogeneous quadratic phase term. -/
def phaseQuadraticWick : Lp ℂ 2 gaussC :=
  (-1 / 4 : ℂ) • (hvec (0, 0) + hvec (1, 1)) +
    (-(Real.sqrt 2 : ℂ) / 8) • hvec (2, 0) +
    (3 * (Real.sqrt 2 : ℂ) / 8) • hvec (0, 2)

/-- Exact coefficients of the homogeneous quadratic phase term. -/
def phaseQuadraticCoefficient (i : ℕ × ℕ) : ℂ :=
  (if i = (0, 0) then -1 / 4 else 0) + (if i = (1, 1) then -1 / 4 else 0) +
    (if i = (2, 0) then -(Real.sqrt 2 : ℂ) / 8 else 0) +
    (if i = (0, 2) then 3 * (Real.sqrt 2 : ℂ) / 8 else 0)

/-- The finite Wick vector represents the actual quadratic phase polynomial. -/
theorem phaseQuadraticWick_coe :
    ∀ᵐ w ∂gaussC, phaseQuadraticWick w = Haag.phaseQuadratic w := by
  let A : Lp ℂ 2 gaussC := (-1 / 4 : ℂ) • (hvec (0, 0) + hvec (1, 1))
  let B : Lp ℂ 2 gaussC := (-(Real.sqrt 2 : ℂ) / 8) • hvec (2, 0)
  let C : Lp ℂ 2 gaussC := (3 * (Real.sqrt 2 : ℂ) / 8) • hvec (0, 2)
  have hroot : (Real.sqrt 2 : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2)).ne'
  filter_upwards [Lp.coeFn_add (A + B) C, Lp.coeFn_add A B,
    Lp.coeFn_smul (-1 / 4 : ℂ) (hvec (0, 0) + hvec (1, 1)),
    Lp.coeFn_add (hvec (0, 0)) (hvec (1, 1)),
    Lp.coeFn_smul (-(Real.sqrt 2 : ℂ) / 8) (hvec (2, 0)),
    Lp.coeFn_smul (3 * (Real.sqrt 2 : ℂ) / 8) (hvec (0, 2)),
    (memLp_hfun (0, 0)).coeFn_toLp, (memLp_hfun (1, 1)).coeFn_toLp,
    (memLp_hfun (2, 0)).coeFn_toLp, (memLp_hfun (0, 2)).coeFn_toLp]
    with w hsum hab ha h00 hb hc hfun00 hfun11 hfun20 hfun02
  simp only [Pi.add_apply] at hsum hab h00
  simp only [Pi.smul_apply] at ha hb hc
  change ((A + B + C) : Lp ℂ 2 gaussC) w = _
  rw [hsum, hab, ha, hb, hc, h00]
  change (-1 / 4 : ℂ) * (((memLp_hfun (0, 0)).toLp _) w +
      ((memLp_hfun (1, 1)).toLp _) w) +
      (-(Real.sqrt 2 : ℂ) / 8) * ((memLp_hfun (2, 0)).toLp _) w +
      (3 * (Real.sqrt 2 : ℂ) / 8) * ((memLp_hfun (0, 2)).toLp _) w = _
  rw [hfun00, hfun11, hfun20, hfun02, Haag.phaseQuadratic_eq]
  simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv]
  field_simp
  ring

/-- The finite coefficient formula is its exact Gaussian inner product. -/
theorem phaseQuadraticCoefficient_eq_inner (i : ℕ × ℕ) :
    phaseQuadraticCoefficient i = ⟪hvec i, phaseQuadraticWick⟫_ℂ := by
  simp only [phaseQuadraticWick, phaseQuadraticCoefficient, inner_add_right,
    inner_smul_right, inner_hvec]
  split_ifs <;> simp_all

/-- The exact Gaussian norm of the quadratic phase term. -/
theorem norm_phaseQuadraticWick : ‖phaseQuadraticWick‖ = Real.sqrt 7 / 4 := by
  have h00 : ‖hvec (0, 0) + hvec (1, 1)‖ ^ 2 = (2 : ℝ) := by
    norm_num [norm_add_sq (𝕜 := ℂ), inner_hvec, orthonormal_hvec.norm_eq_one]
  have hsq : ‖phaseQuadraticWick‖ ^ 2 = (7 / 16 : ℝ) := by
    simp only [phaseQuadraticWick, norm_add_sq (𝕜 := ℂ), norm_smul,
      inner_add_left, inner_smul_left, inner_smul_right,
      inner_hvec, orthonormal_hvec.norm_eq_one]
    norm_num [Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg 2),
      mul_pow, div_pow, h00, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  nlinarith [norm_nonneg phaseQuadraticWick, Real.sqrt_nonneg 7,
    Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 7)]

/-- Every quadratic coefficient is bounded by the exact largest one, at mode `(0,2)`. -/
theorem norm_phaseQuadraticCoefficient_le (i : ℕ × ℕ) :
    ‖phaseQuadraticCoefficient i‖ ≤ 3 * Real.sqrt 2 / 8 := by
  have hs : 1 ≤ Real.sqrt 2 := by
    nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  by_cases h00 : i = (0, 0)
  · subst i
    norm_num [phaseQuadraticCoefficient]
    linarith
  by_cases h11 : i = (1, 1)
  · subst i
    norm_num [phaseQuadraticCoefficient]
    linarith
  by_cases h20 : i = (2, 0)
  · subst i
    simp [phaseQuadraticCoefficient, Complex.norm_real, Real.norm_of_nonneg
      (Real.sqrt_nonneg 2)]
    linarith
  by_cases h02 : i = (0, 2)
  · subst i
    simp [phaseQuadraticCoefficient, Complex.norm_real,
      Real.norm_of_nonneg (Real.sqrt_nonneg 2)]
  · simp [phaseQuadraticCoefficient, h00, h11, h20, h02]
    positivity

/-- The quadratic correction vanishes outside its four explicit modes. -/
theorem phaseQuadraticCoefficient_eq_zero {i : ℕ × ℕ}
    (h00 : i ≠ (0, 0)) (h11 : i ≠ (1, 1)) (h20 : i ≠ (2, 0)) (h02 : i ≠ (0, 2)) :
    phaseQuadraticCoefficient i = 0 := by
  simp [phaseQuadraticCoefficient, h00, h11, h20, h02]

/-- Pointwise cubic error after retaining the actual quadratic phase term. -/
theorem phaseSlice_sub_quadratic_bound (s : ℝ) (hs : 0 < s) (w : ℂ) :
    ‖F0ConditionalNode.phaseSlice s w - linearSlice s w -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w‖ ≤
      2 * |signedProfileRatio s| ^ 3 * ‖w‖ ^ 3 := by
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
  have h := Haag.norm_ph_real_add_sub_quadratic_sharp (Real.sqrt s)
    (Real.sqrt_pos.2 hs) ((κ : ℂ) * w)
  calc
    _ = ‖Haag.ph ((Real.sqrt s : ℂ) + (κ : ℂ) * w) - 1 -
        ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w) -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w‖ := by
      rw [F0ConditionalNode.phaseSlice_eq s hs.le]
      dsimp only [linearSlice, κ]
      congr 1
      ring
    _ ≤ 2 * ‖(κ : ℂ) * w‖ ^ 3 / Real.sqrt s ^ 3 := by
      simpa only [hlin, hquad] using h
    _ = _ := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
      dsimp only [signedProfileRatio, κ]
      rw [abs_div, abs_of_nonneg (Real.sqrt_nonneg s)]
      simp only [mul_pow, div_pow]
      ring

private theorem phaseCubicMajorant_coe :
    ∀ᵐ w ∂gaussC, ‖(((Real.sqrt 2 : ℂ) • hvec (2, 1) +
      (2 : ℂ) • hvec (1, 0)) : Lp ℂ 2 gaussC) w‖ = ‖w‖ ^ 3 := by
  have hf (w : ℂ) : (Real.sqrt 2 : ℂ) * hfun (2, 1) w + 2 * hfun (1, 0) w =
      (‖w‖ ^ 2 : ℂ) * w := by
    have hroot : (Real.sqrt 2 : ℂ) ≠ 0 := by
      exact_mod_cast (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2)).ne'
    simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv]
    have hnorm : (‖w‖ ^ 2 : ℂ) = w * conj w := by
      rw [Complex.mul_conj, Complex.normSq_eq_norm_sq, Complex.ofReal_pow]
    rw [hnorm]
    ring
  filter_upwards [Lp.coeFn_add ((Real.sqrt 2 : ℂ) • hvec (2, 1))
      ((2 : ℂ) • hvec (1, 0)), Lp.coeFn_smul (Real.sqrt 2 : ℂ) (hvec (2, 1)),
    Lp.coeFn_smul (2 : ℂ) (hvec (1, 0)),
    (memLp_hfun (2, 1)).coeFn_toLp, (memLp_hfun (1, 0)).coeFn_toLp]
    with w ha h2 h1 h21 h10
  simp only [Pi.add_apply] at ha
  simp only [Pi.smul_apply] at h2 h1
  rw [ha, h2, h1]
  change ‖(Real.sqrt 2 : ℂ) * ((memLp_hfun (2, 1)).toLp _) w +
    2 * ((memLp_hfun (1, 0)).toLp _) w‖ = _
  rw [h21, h10, hf, norm_mul, norm_pow, Complex.norm_real,
    Real.norm_of_nonneg (norm_nonneg w)]
  ring

/-- The Gaussian remainder after the exact quadratic correction is cubic. -/
theorem norm_phaseSliceLp_sub_quadratic (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick‖ ≤
      2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  let C : Lp ℂ 2 gaussC := (Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)
  let a : ℝ := 2 * |signedProfileRatio s| ^ 3
  have ha : 0 ≤ a := by dsimp [a]; positivity
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖(F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick) w‖ ≤
      ‖((a : ℂ) • C) w‖ := by
    filter_upwards [Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s - linearSliceLp s)
        (((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick),
      Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (linearSliceLp s),
      Lp.coeFn_smul ((signedProfileRatio s ^ 2 : ℝ) : ℂ) phaseQuadraticWick,
      Lp.coeFn_smul (a : ℂ) C, (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp,
      linearSliceLp_coe s, phaseQuadraticWick_coe, phaseCubicMajorant_coe]
      with w hd hd' hq hc hp hl hw hC
    simp only [Pi.sub_apply] at hd hd'
    simp only [Pi.smul_apply] at hq hc
    rw [hd, hd', hq, hc, hl, hw]
    change ‖((F0ConditionalNode.phaseSlice_memLp s).toLp _) w - linearSlice s w -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * Haag.phaseQuadratic w‖ ≤ ‖(a : ℂ) * C w‖
    rw [hp, norm_mul, Complex.norm_real, Real.norm_of_nonneg ha]
    change _ ≤ a * ‖(((Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)) :
      Lp ℂ 2 gaussC) w‖
    rw [hC]
    exact phaseSlice_sub_quadratic_bound s hs w
  calc
    _ ≤ ‖(a : ℂ) • C‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ = a * ‖C‖ := by rw [norm_smul, Complex.norm_real, Real.norm_of_nonneg ha]
    _ = _ := by
      change (2 * |signedProfileRatio s| ^ 3) *
        ‖((Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0))‖ = _
      rw [norm_cubicMajorant]
      ring

/-- Every actual Gaussian coefficient is within the cubic error of its quadratic model. -/
theorem norm_coefficient_sub_quadratic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i‖ ≤
      2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  have heq : F0ConditionalNode.coefficient s i - linearCoefficient s i -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i =
      ⟪hvec i, F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick⟫_ℂ := by
    rw [inner_sub_right, inner_sub_right, inner_smul_right,
      ← linearCoefficient_eq_inner, ← phaseQuadraticCoefficient_eq_inner]
    rfl
  rw [heq]
  calc
    _ ≤ ‖hvec i‖ * ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
        ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick‖ := norm_inner_le_norm _ _
    _ = _ := by rw [orthonormal_hvec.norm_eq_one i, one_mul]
    _ ≤ _ := norm_phaseSliceLp_sub_quadratic s hs

/-- The whole Gaussian linearization error has leading constant `√7 / 4`. -/
theorem norm_phaseSliceLp_sub_linear_quadratic (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ ≤
      (Real.sqrt 7 / 4) * signedProfileRatio s ^ 2 +
        2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  have htri := norm_add_le
    (F0ConditionalNode.phaseSliceLp s - linearSliceLp s -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick)
    (((signedProfileRatio s ^ 2 : ℝ) : ℂ) • phaseQuadraticWick)
  rw [sub_add_cancel, norm_smul, Complex.norm_real,
    Real.norm_of_nonneg (sq_nonneg _), norm_phaseQuadraticWick] at htri
  have h := norm_phaseSliceLp_sub_quadratic s hs
  linarith

/-- Keeping the existing linear centers costs only the largest quadratic coefficient. -/
theorem norm_coefficient_sub_linear_quadratic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (3 * Real.sqrt 2 / 8) * signedProfileRatio s ^ 2 +
        2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  have htri := norm_add_le
    (F0ConditionalNode.coefficient s i - linearCoefficient s i -
      ((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i)
    (((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i)
  rw [sub_add_cancel] at htri
  have hq : ‖((signedProfileRatio s ^ 2 : ℝ) : ℂ) * phaseQuadraticCoefficient i‖ ≤
      signedProfileRatio s ^ 2 * (3 * Real.sqrt 2 / 8) := by
    rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (sq_nonneg _)]
    exact mul_le_mul_of_nonneg_left (norm_phaseQuadraticCoefficient_le i) (sq_nonneg _)
  have h := htri.trans (add_le_add (norm_coefficient_sub_quadratic s hs i) hq)
  linarith

/-- A rational bound for every coefficient with the existing linear model. -/
theorem norm_coefficient_sub_linear_quadratic_rat (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (17 / 32 : ℝ) * signedProfileRatio s ^ 2 + 5 * |signedProfileRatio s| ^ 3 := by
  have h2 : 3 * Real.sqrt 2 / 8 ≤ (17 / 32 : ℝ) := by
    nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  have h6 : 2 * Real.sqrt 6 ≤ (5 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  exact (norm_coefficient_sub_linear_quadratic s hs i).trans
    (add_le_add (mul_le_mul_of_nonneg_right h2 (sq_nonneg _))
      (mul_le_mul_of_nonneg_right h6 (by positivity)))

/-- Outside the four quadratic modes, the existing linear model already has cubic error. -/
theorem norm_coefficient_sub_linear_off_quadratic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ)
    (h00 : i ≠ (0, 0)) (h11 : i ≠ (1, 1)) (h20 : i ≠ (2, 0)) (h02 : i ≠ (0, 2)) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  simpa only [phaseQuadraticCoefficient_eq_zero h00 h11 h20 h02, mul_zero, sub_zero]
    using norm_coefficient_sub_quadratic s hs i

private theorem saved_error_le_of_phase_remainder (s r saved B : ℝ) (i : ℕ × ℕ)
    (hB : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤ B) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ ≤
      B + |signedProfileRatio s - r| / 2 + ‖linearCenter r i - (saved : ℂ)‖ := by
  have h1 := dist_triangle (F0ConditionalNode.coefficient s i) (linearCoefficient s i)
    (saved : ℂ)
  have h2 := dist_triangle (linearCoefficient s i) (linearCenter r i) (saved : ℂ)
  simp only [dist_eq_norm] at h1 h2
  have hp := linearCoefficient_parameter_error s r i
  linarith

/-- The same linear centers and error reserves now permit `|ρ| ≤ 1 / 1090000`. -/
theorem actual_saved_error_lt_quadratic (s : ℝ) (hs : 0 < s) (r saved : ℝ) (i : ℕ × ℕ)
    (hρ : |signedProfileRatio s| ≤ 1 / 1090000)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / 1090000 : ℝ) ^ 2 := by
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 2
  have hcube := pow_le_pow_left₀ (abs_nonneg _) hρ 3
  have hrem := norm_coefficient_sub_linear_quadratic_rat s hs i
  have hb : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (17 / 32 : ℝ) * (1 / 1090000) ^ 2 + 5 * (1 / 1090000) ^ 3 := by
    nlinarith
  have h := saved_error_le_of_phase_remainder s r saved _ i hb
  have hbudget : (17 / 32 : ℝ) * (1 / 1090000) ^ 2 + 5 * (1 / 1090000) ^ 3 +
      (1 / 10 ^ 13) / 2 + 1 / (2 * 10 ^ 12) < 1 / 10 ^ 12 := by norm_num
  linarith

/-- Off the quadratic support, the same saved-center reserves permit `|ρ| ≤ 1 / 22500`. -/
theorem actual_saved_error_lt_off_quadratic (s : ℝ) (hs : 0 < s) (r saved : ℝ) (i : ℕ × ℕ)
    (h00 : i ≠ (0, 0)) (h11 : i ≠ (1, 1)) (h20 : i ≠ (2, 0)) (h02 : i ≠ (0, 2))
    (hρ : |signedProfileRatio s| ≤ 1 / 22500)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have h6 : 2 * Real.sqrt 6 ≤ (5 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  have hcube := pow_le_pow_left₀ (abs_nonneg _) hρ 3
  have hrem := norm_coefficient_sub_linear_off_quadratic s hs i h00 h11 h20 h02
  have hb : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      5 * (1 / 22500 : ℝ) ^ 3 := by
    have h := mul_le_mul_of_nonneg_right h6 (by positivity : 0 ≤ |signedProfileRatio s| ^ 3)
    nlinarith
  have h := saved_error_le_of_phase_remainder s r saved _ i hb
  have hbudget : (5 : ℝ) * (1 / 22500) ^ 3 + (1 / 10 ^ 13) / 2 +
      1 / (2 * 10 ^ 12) < 1 / 10 ^ 12 := by norm_num
  linarith

end

end Grothe.UpperChaos.ZeroProfilePhaseStability
