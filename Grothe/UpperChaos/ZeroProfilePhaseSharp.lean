import Grothe.UpperChaos.ZeroProfileSavedCenter

/-!
# Orthogonality in the Gaussian phase remainder

The quadratic majorant `|w|²` is the sum of the two orthonormal Wick vectors for `1` and
`|w|² - 1`. Its exact Gaussian `L²` norm is therefore `√2`. Using that norm improves the
linearization error from `5 ρ²` to `(5 √2 / 2) ρ²`, uniformly over all conditional modes.
The rational relaxation `15 ρ² / 4` also enlarges the range of the saved-center certificate.

Agent-ID: codex-c8a4. Refs #369.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.ZeroProfilePhaseStability

noncomputable section

private theorem quadraticMajorant_coe :
    ∀ᵐ w ∂gaussC, (hvec (0, 0) + hvec (1, 1)) w = ((‖w‖ ^ 2 : ℝ) : ℂ) := by
  filter_upwards [Lp.coeFn_add (hvec (0, 0)) (hvec (1, 1)),
    (memLp_hfun (0, 0)).coeFn_toLp, (memLp_hfun (1, 1)).coeFn_toLp]
    with w ha h0 h11
  rw [ha]
  change ((memLp_hfun (0, 0)).toLp _) w + ((memLp_hfun (1, 1)).toLp _) w = _
  rw [h0, h11]
  simp [hfun, nrm, H_succ_left, H_zero_succ, H_zero_zero, A0, A1, ev, zv,
    Complex.mul_conj, Complex.normSq_eq_norm_sq]

/-- The exact Gaussian `L²` norm of the quadratic majorant `|w|²`. -/
theorem norm_quadraticMajorant : ‖hvec (0, 0) + hvec (1, 1)‖ = Real.sqrt 2 := by
  have hsq : ‖hvec (0, 0) + hvec (1, 1)‖ ^ 2 = 2 := by
    rw [norm_add_sq (𝕜 := ℂ), orthonormal_hvec.norm_eq_one (0, 0),
      orthonormal_hvec.norm_eq_one (1, 1), inner_hvec]
    norm_num
  nlinarith [norm_nonneg (hvec (0, 0) + hvec (1, 1)), Real.sqrt_nonneg 2,
    Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]

/-- Orthogonality sharpens the Gaussian phase linearization to `(5 √2 / 2) ρ²`. -/
theorem norm_phaseSliceLp_sub_linear_sqrt_two (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - linearSliceLp s‖ ≤
      (5 / 2 : ℝ) * Real.sqrt 2 * signedProfileRatio s ^ 2 := by
  let C : ℝ := (5 / 2) * signedProfileRatio s ^ 2
  have hC : 0 ≤ C := by dsimp only [C]; positivity
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖(F0ConditionalNode.phaseSliceLp s - linearSliceLp s) w‖ ≤
        ‖((C : ℂ) • (hvec (0, 0) + hvec (1, 1))) w‖ := by
    filter_upwards [Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (linearSliceLp s),
      Lp.coeFn_smul (C : ℂ) (hvec (0, 0) + hvec (1, 1)),
      (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp,
      linearSliceLp_coe s, quadraticMajorant_coe] with w hd hm hp hl hq
    simp only [Pi.sub_apply] at hd
    simp only [Pi.smul_apply] at hm
    rw [hd, hm, hl, hq]
    change ‖((F0ConditionalNode.phaseSlice_memLp s).toLp _) w - linearSlice s w‖ ≤ _
    rw [hp, norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hC,
      Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (sq_nonneg ‖w‖)]
    exact phaseSlice_sub_linear_bound s hs w
  calc
    _ ≤ ‖(C : ℂ) • (hvec (0, 0) + hvec (1, 1))‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ = C * Real.sqrt 2 := by
      rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hC,
        norm_quadraticMajorant]
    _ = _ := by dsimp only [C]; ring

/-- The sharper quadratic error controls every true conditional coefficient. -/
theorem norm_coefficient_sub_linear_sqrt_two (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (5 / 2 : ℝ) * Real.sqrt 2 * signedProfileRatio s ^ 2 := by
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
    _ ≤ _ := norm_phaseSliceLp_sub_linear_sqrt_two s hs

/-- Separate the sharper Gaussian remainder from the parameter and stored-center errors. -/
theorem actual_saved_error_bound_sqrt_two (s : ℝ) (hs : 0 < s) (r saved : ℝ)
    (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ ≤
      (5 / 2 : ℝ) * Real.sqrt 2 * signedProfileRatio s ^ 2 +
        |signedProfileRatio s - r| / 2 + ‖linearCenter r i - (saved : ℂ)‖ := by
  calc
    _ ≤ ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ +
        ‖linearCoefficient s i - (saved : ℂ)‖ := by
      simpa only [dist_eq_norm] using dist_triangle (F0ConditionalNode.coefficient s i)
        (linearCoefficient s i) (saved : ℂ)
    _ ≤ (5 / 2 : ℝ) * Real.sqrt 2 * signedProfileRatio s ^ 2 +
        (‖linearCoefficient s i - linearCenter r i‖ +
          ‖linearCenter r i - (saved : ℂ)‖) :=
      add_le_add (norm_coefficient_sub_linear_sqrt_two s hs i) (by
        simpa only [dist_eq_norm] using dist_triangle (linearCoefficient s i)
          (linearCenter r i) (saved : ℂ))
    _ ≤ (5 / 2 : ℝ) * Real.sqrt 2 * signedProfileRatio s ^ 2 +
        (|signedProfileRatio s - r| / 2 + ‖linearCenter r i - (saved : ℂ)‖) :=
      add_le_add le_rfl (add_le_add (linearCoefficient_parameter_error s r i) le_rfl)
    _ = _ := by ring

/-- A rational Gaussian remainder bound, convenient for exact scalar certificates. -/
theorem norm_coefficient_sub_linear_rat (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (15 / 4 : ℝ) * signedProfileRatio s ^ 2 := by
  have hroot : Real.sqrt 2 ≤ (3 / 2 : ℝ) := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  refine (norm_coefficient_sub_linear_sqrt_two s hs i).trans ?_
  exact mul_le_mul_of_nonneg_right (by linarith) (sq_nonneg _)

/-- The same saved-center accuracy holds on a profile-ratio interval enlarged by a factor `4/3`.
The parameter and saved-byte comparisons remain explicit certificate inputs. -/
theorem actual_saved_error_lt_of_ratio_le (s : ℝ) (hs : 0 < s) (r saved : ℝ)
    (i : ℕ × ℕ) (hρ : |signedProfileRatio s| ≤ 1 / 3000000)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / 3000000 : ℝ) ^ 2 := by
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hρ 2
  have hquad : ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ ≤
      (15 / 4 : ℝ) * (1 / 3000000) ^ 2 :=
    (norm_coefficient_sub_linear_rat s hs i).trans
      (mul_le_mul_of_nonneg_left hsq (by norm_num))
  have hparameter' : ‖linearCoefficient s i - linearCenter r i‖ ≤
      (1 / 10 ^ 13 : ℝ) / 2 :=
    (linearCoefficient_parameter_error s r i).trans
      (div_le_div_of_nonneg_right hparameter (by norm_num))
  calc
    _ ≤ ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ +
        ‖linearCoefficient s i - (saved : ℂ)‖ := by
      simpa only [dist_eq_norm] using dist_triangle (F0ConditionalNode.coefficient s i)
        (linearCoefficient s i) (saved : ℂ)
    _ ≤ (15 / 4 : ℝ) * (1 / 3000000) ^ 2 +
        (‖linearCoefficient s i - linearCenter r i‖ +
          ‖linearCenter r i - (saved : ℂ)‖) :=
      add_le_add hquad (by
        simpa only [dist_eq_norm] using dist_triangle (linearCoefficient s i)
          (linearCenter r i) (saved : ℂ))
    _ ≤ (15 / 4 : ℝ) * (1 / 3000000) ^ 2 +
        ((1 / 10 ^ 13) / 2 + 1 / (2 * 10 ^ 12)) :=
      add_le_add le_rfl (add_le_add hparameter' hsaved)
    _ < _ := by norm_num

end

end Grothe.UpperChaos.ZeroProfilePhaseStability
