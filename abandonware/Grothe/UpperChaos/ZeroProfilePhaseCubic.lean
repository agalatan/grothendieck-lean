import Grothe.UpperChaos.ZeroProfilePhaseSharp
import Grothe.Haagerup.PhaseTaylorCubic

/-!
# A quadratic and cubic Gaussian phase error

The local phase Taylor estimate improves the Gaussian remainder to
`√2 ρ² + 2 √6 |ρ|³`. Wick orthogonality computes the two majorant norms, and the
pointwise norm map puts their sum in real `L²`. The resulting saved-center certificate
allows `|ρ| ≤ 1 / 1780000` with the same parameter and stored-byte error reserves.

Agent-ID: codex-c8a4. Refs #369.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.ZeroProfilePhaseStability

noncomputable section

private def normLp (f : Lp ℂ 2 gaussC) : Lp ℝ 2 gaussC :=
  (lipschitzWith_one_norm : LipschitzWith 1 (norm : ℂ → ℝ)).compLp (by simp) f

private theorem normLp_coe (f : Lp ℂ 2 gaussC) :
    ∀ᵐ w ∂gaussC, normLp f w = ‖f w‖ :=
  lipschitzWith_one_norm.coeFn_compLp (by simp) f

private theorem norm_normLp_le (f : Lp ℂ 2 gaussC) : ‖normLp f‖ ≤ ‖f‖ := by
  simpa only [normLp, NNReal.coe_one, one_mul] using
    (lipschitzWith_one_norm : LipschitzWith 1 (norm : ℂ → ℝ)).norm_compLp_le (by simp) f

private theorem quadraticMajorant_norm_coe :
    ∀ᵐ w ∂gaussC, ‖(hvec (0, 0) + hvec (1, 1)) w‖ = ‖w‖ ^ 2 := by
  filter_upwards [Lp.coeFn_add (hvec (0, 0)) (hvec (1, 1)),
    (memLp_hfun (0, 0)).coeFn_toLp, (memLp_hfun (1, 1)).coeFn_toLp]
    with w ha h0 h11
  rw [ha]
  change ‖((memLp_hfun (0, 0)).toLp _) w + ((memLp_hfun (1, 1)).toLp _) w‖ = _
  rw [h0, h11]
  simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv,
    Complex.mul_conj, Complex.normSq_eq_norm_sq]

private theorem cubicMajorant_formula (w : ℂ) :
    (Real.sqrt 2 : ℂ) * hfun (2, 1) w + 2 * hfun (1, 0) w =
      (‖w‖ ^ 2 : ℂ) * w := by
  have hroot : (Real.sqrt 2 : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 2)).ne'
  simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv]
  have hnorm : (‖w‖ ^ 2 : ℂ) = w * conj w := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq, Complex.ofReal_pow]
  rw [hnorm]
  ring

private theorem cubicMajorant_norm_coe :
    ∀ᵐ w ∂gaussC,
      ‖(((Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)) :
        Lp ℂ 2 gaussC) w‖ = ‖w‖ ^ 3 := by
  filter_upwards [Lp.coeFn_add ((Real.sqrt 2 : ℂ) • hvec (2, 1))
      ((2 : ℂ) • hvec (1, 0)),
    Lp.coeFn_smul (Real.sqrt 2 : ℂ) (hvec (2, 1)),
    Lp.coeFn_smul (2 : ℂ) (hvec (1, 0)),
    (memLp_hfun (2, 1)).coeFn_toLp, (memLp_hfun (1, 0)).coeFn_toLp]
    with w ha hsmul2 hsmul1 h21 h10
  simp only [Pi.add_apply] at ha
  simp only [Pi.smul_apply] at hsmul2 hsmul1
  rw [ha, hsmul2, hsmul1]
  change ‖(Real.sqrt 2 : ℂ) * ((memLp_hfun (2, 1)).toLp _) w +
    2 * ((memLp_hfun (1, 0)).toLp _) w‖ = _
  rw [h21, h10, cubicMajorant_formula, norm_mul, norm_pow,
    Complex.norm_real, Real.norm_of_nonneg (norm_nonneg w)]
  ring

/-- The cubic Wick majorant has exact Gaussian `L²` norm `√6`. -/
theorem norm_cubicMajorant :
    ‖(Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)‖ = Real.sqrt 6 := by
  have hsq :
      ‖(Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)‖ ^ 2 = 6 := by
    rw [norm_add_sq (𝕜 := ℂ), norm_smul, norm_smul,
      orthonormal_hvec.norm_eq_one (2, 1), orthonormal_hvec.norm_eq_one (1, 0),
      inner_smul_left, inner_smul_right, inner_hvec]
    norm_num [Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg 2),
      Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  nlinarith [norm_nonneg ((Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)),
    Real.sqrt_nonneg 6, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]

/-- The normalized physical phase error has a quadratic and cubic majorant. -/
theorem phaseSlice_sub_linear_bound_cubic (s : ℝ) (hs : 0 < s) (w : ℂ) :
    ‖F0ConditionalNode.phaseSlice s w - linearSlice s w‖ ≤
      signedProfileRatio s ^ 2 * ‖w‖ ^ 2 +
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
  have h := Haag.norm_ph_real_add_sub_linear_cubic (Real.sqrt s) (Real.sqrt_pos.2 hs)
    ((κ : ℂ) * w)
  calc
    _ = ‖Haag.ph ((Real.sqrt s : ℂ) + (κ : ℂ) * w) - 1 -
        ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w)‖ := by
      rw [F0ConditionalNode.phaseSlice_eq s hs.le]
      dsimp only [linearSlice, κ]
      congr 1
      ring
    _ ≤ ‖(κ : ℂ) * w‖ ^ 2 / Real.sqrt s ^ 2 +
        2 * ‖(κ : ℂ) * w‖ ^ 3 / Real.sqrt s ^ 3 := by simpa only [hlin] using h
    _ = _ := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
      dsimp only [signedProfileRatio, κ]
      rw [abs_div, abs_of_nonneg (Real.sqrt_nonneg s)]
      simp only [mul_pow, div_pow, sq_abs]
      ring

/-- Wick moments give a Gaussian phase error with leading coefficient `√2`. -/
theorem norm_phaseSliceLp_sub_linear_cubic (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ ≤
      Real.sqrt 2 * signedProfileRatio s ^ 2 +
        2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  let Q : Lp ℂ 2 gaussC := hvec (0, 0) + hvec (1, 1)
  let C : Lp ℂ 2 gaussC := (Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)
  let a : ℝ := signedProfileRatio s ^ 2
  let b : ℝ := 2 * |signedProfileRatio s| ^ 3
  have ha : 0 ≤ a := by dsimp only [a]; positivity
  have hb : 0 ≤ b := by dsimp only [b]; positivity
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖(F0ConditionalNode.phaseSliceLp s - linearSliceLp s) w‖ ≤
        ‖((a • normLp Q + b • normLp C) : Lp ℝ 2 gaussC) w‖ := by
    filter_upwards [Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (linearSliceLp s),
      (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp, linearSliceLp_coe s,
      Lp.coeFn_add (a • normLp Q) (b • normLp C),
      Lp.coeFn_smul a (normLp Q), Lp.coeFn_smul b (normLp C),
      normLp_coe Q, normLp_coe C, quadraticMajorant_norm_coe, cubicMajorant_norm_coe]
      with w he hp hl hm hma hmb hQ hC hq hc
    simp only [Pi.sub_apply] at he
    simp only [Pi.add_apply] at hm
    simp only [Pi.smul_apply] at hma hmb
    rw [he, hm, hma, hmb, hQ, hC]
    change ‖((F0ConditionalNode.phaseSlice_memLp s).toLp _) w - linearSliceLp s w‖ ≤
      ‖a * ‖Q w‖ + b * ‖C w‖‖
    rw [hp, hl]
    change ‖F0ConditionalNode.phaseSlice s w - linearSlice s w‖ ≤
      ‖a * ‖(hvec (0, 0) + hvec (1, 1)) w‖ +
        b * ‖(((Real.sqrt 2 : ℂ) • hvec (2, 1) + (2 : ℂ) • hvec (1, 0)) :
          Lp ℂ 2 gaussC) w‖‖
    rw [hq, hc, Real.norm_eq_abs, abs_of_nonneg (by positivity)]
    exact phaseSlice_sub_linear_bound_cubic s hs w
  calc
    _ ≤ ‖a • normLp Q + b • normLp C‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ ≤ ‖a • normLp Q‖ + ‖b • normLp C‖ := norm_add_le _ _
    _ = a * ‖normLp Q‖ + b * ‖normLp C‖ := by
      rw [norm_smul, norm_smul, Real.norm_eq_abs, Real.norm_eq_abs,
        abs_of_nonneg ha, abs_of_nonneg hb]
    _ ≤ a * ‖Q‖ + b * ‖C‖ := add_le_add
      (mul_le_mul_of_nonneg_left (norm_normLp_le Q) ha)
      (mul_le_mul_of_nonneg_left (norm_normLp_le C) hb)
    _ = _ := by
      dsimp only [Q, C, a, b]
      rw [norm_quadraticMajorant, norm_cubicMajorant]
      ring

/-- The quadratic and cubic estimate controls every true conditional coefficient. -/
theorem norm_coefficient_sub_linear_cubic (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      Real.sqrt 2 * signedProfileRatio s ^ 2 +
        2 * Real.sqrt 6 * |signedProfileRatio s| ^ 3 := by
  have heq : F0ConditionalNode.coefficient s i - linearCoefficient s i =
      ⟪hvec i, F0ConditionalNode.phaseSliceLp s - linearSliceLp s⟫_ℂ := by
    rw [inner_sub_right, ← linearCoefficient_eq_inner]
    rfl
  rw [heq]
  calc
    _ ≤ ‖hvec i‖ * ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ :=
      norm_inner_le_norm _ _
    _ = ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ := by
      rw [orthonormal_hvec.norm_eq_one i, one_mul]
    _ ≤ _ := norm_phaseSliceLp_sub_linear_cubic s hs

/-- A rational relaxation of the quadratic and cubic Gaussian remainder. -/
theorem norm_coefficient_sub_linear_cubic_rat (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (17 / 12 : ℝ) * signedProfileRatio s ^ 2 + 5 * |signedProfileRatio s| ^ 3 := by
  have h2 : Real.sqrt 2 ≤ (17 / 12 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  have h6 : 2 * Real.sqrt 6 ≤ (5 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
  exact (norm_coefficient_sub_linear_cubic s hs i).trans
    (add_le_add (mul_le_mul_of_nonneg_right h2 (sq_nonneg _))
      (mul_le_mul_of_nonneg_right h6 (by positivity)))

/-- The cubic remainder certifies a larger profile interval with unchanged saved-center reserves. -/
theorem actual_saved_error_lt_of_ratio_cubic (s : ℝ) (hs : 0 < s) (r saved : ℝ)
    (i : ℕ × ℕ) (hρ : |signedProfileRatio s| ≤ 1 / 1780000)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / 1780000 : ℝ) ^ 2 := by
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 2
  have hcube : |signedProfileRatio s| ^ 3 ≤ (1 / 1780000 : ℝ) ^ 3 :=
    pow_le_pow_left₀ (abs_nonneg _) hρ 3
  have hrem : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (17 / 12 : ℝ) * (1 / 1780000) ^ 2 + 5 * (1 / 1780000) ^ 3 :=
    (norm_coefficient_sub_linear_cubic_rat s hs i).trans
      (add_le_add (mul_le_mul_of_nonneg_left hsq (by norm_num))
        (mul_le_mul_of_nonneg_left hcube (by norm_num)))
  have hparameter' : ‖linearCoefficient s i - linearCenter r i‖ ≤
      (1 / 10 ^ 13 : ℝ) / 2 :=
    (linearCoefficient_parameter_error s r i).trans
      (div_le_div_of_nonneg_right hparameter (by norm_num))
  calc
    _ ≤ ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ +
        ‖linearCoefficient s i - (saved : ℂ)‖ := by
      simpa only [dist_eq_norm] using dist_triangle (F0ConditionalNode.coefficient s i)
        (linearCoefficient s i) (saved : ℂ)
    _ ≤ ((17 / 12 : ℝ) * (1 / 1780000) ^ 2 + 5 * (1 / 1780000) ^ 3) +
        (‖linearCoefficient s i - linearCenter r i‖ +
          ‖linearCenter r i - (saved : ℂ)‖) := add_le_add hrem (by
      simpa only [dist_eq_norm] using dist_triangle (linearCoefficient s i)
        (linearCenter r i) (saved : ℂ))
    _ ≤ ((17 / 12 : ℝ) * (1 / 1780000) ^ 2 + 5 * (1 / 1780000) ^ 3) +
        ((1 / 10 ^ 13) / 2 + 1 / (2 * 10 ^ 12)) :=
      add_le_add le_rfl (add_le_add hparameter' hsaved)
    _ < _ := by norm_num

end

end Grothe.UpperChaos.ZeroProfilePhaseStability
