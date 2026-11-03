import Grothe.Haagerup.PhaseStability
import Grothe.UpperChaos.F0ConditionalNode

/-! Pointwise stability of the actual production phase near profile zeros.
No sign or nonzero-profile hypothesis is needed. Agent-ID: codex-8c4d. -/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.ZeroProfilePhaseStability

/-- Signed physical perturbation, which stays defined at a profile zero. -/
noncomputable def signedProfileRatio (s : ℝ) : ℝ :=
  Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s / Real.sqrt s

/-- The constant and linear Gaussian terms of the actual phase slice. -/
noncomputable def linearSlice (s : ℝ) (w : ℂ) : ℂ :=
  1 + ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w)

/-- Actual production phase linearization, without a profile-sign or nonzero
profile condition. The remaining Gaussian L2 transfer is separate. -/
theorem phaseSlice_sub_linear_bound (s : ℝ) (hs : 0 < s) (w : ℂ) :
    ‖F0ConditionalNode.phaseSlice s w - linearSlice s w‖ ≤
      (5 / 2 : ℝ) * signedProfileRatio s ^ 2 * ‖w‖ ^ 2 := by
  let κ : ℝ := Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s
  have himag (z : ℂ) : z - (z.re : ℂ) = (z - conj z) / 2 := by
    apply Complex.ext <;> simp [Complex.div_re, Complex.div_im] <;> ring
  have hlin :
      ((κ : ℂ) * w - (((κ : ℂ) * w).re : ℂ)) / (Real.sqrt s : ℂ) =
        ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w) := by
    rw [himag, map_mul, Complex.conj_ofReal]
    dsimp only [signedProfileRatio, κ]
    push_cast
    ring
  have h := Haag.norm_ph_real_add_sub_linear (Real.sqrt s) (Real.sqrt_pos.2 hs)
    ((κ : ℂ) * w)
  calc
    _ = ‖Haag.ph ((Real.sqrt s : ℂ) + (κ : ℂ) * w) - 1 -
        ((signedProfileRatio s / 2 : ℝ) : ℂ) * (w - conj w)‖ := by
      rw [F0ConditionalNode.phaseSlice_eq s hs.le]
      dsimp only [linearSlice, κ]
      congr 1
      ring
    _ ≤ (5 / 2 : ℝ) * ‖(κ : ℂ) * w‖ ^ 2 / Real.sqrt s ^ 2 := by
      simpa only [hlin] using h
    _ = _ := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs]
      dsimp only [signedProfileRatio, κ]
      rw [div_pow]
      ring

private theorem hfun_zero_zero (w : ℂ) : hfun (0, 0) w = 1 := by
  simp [hfun, nrm, H_zero_zero, ev]

private theorem hfun_one_zero (w : ℂ) : hfun (1, 0) w = w := by
  have hH : H 1 0 = (MvPolynomial.X 0 : CPoly) := by
    change H (0 + 1) 0 = _
    rw [H_succ_left, H_zero_zero]
    simp [A0]
  simp [hfun, nrm, hH, ev, zv]

theorem phaseSlice_sub_one_bound (s : ℝ) (hs : 0 < s) (w : ℂ) :
    ‖F0ConditionalNode.phaseSlice s w - 1‖ ≤
      (2 * (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * |vprof s|) / Real.sqrt s) * ‖w‖ := by
  rw [F0ConditionalNode.phaseSlice_eq s hs.le]
  simpa only [abs_mul, abs_of_nonneg (Real.sqrt_nonneg _)] using
    Haag.norm_ph_real_scaled_add_sub_one (Real.sqrt s) (Real.sqrt_pos.2 hs)
      (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s) w

theorem norm_phaseSliceLp_sub_constant (s : ℝ) (hs : 0 < s) :
    ‖F0ConditionalNode.phaseSliceLp s - hvec (0, 0)‖ ≤
      2 * (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * |vprof s|) / Real.sqrt s := by
  let C : ℝ := 2 * (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * |vprof s|) / Real.sqrt s
  have hC : 0 ≤ C := by dsimp only [C]; positivity
  have hpoint : ∀ᵐ w ∂gaussC,
      ‖(F0ConditionalNode.phaseSliceLp s - hvec (0, 0)) w‖ ≤
        ‖((C : ℂ) • hvec (1, 0)) w‖ := by
    filter_upwards [Lp.coeFn_sub (F0ConditionalNode.phaseSliceLp s) (hvec (0, 0)),
      Lp.coeFn_smul (C : ℂ) (hvec (1, 0)),
      (F0ConditionalNode.phaseSlice_memLp s).coeFn_toLp,
      (memLp_hfun (0, 0)).coeFn_toLp, (memLp_hfun (1, 0)).coeFn_toLp]
      with w hsub hsmul hphase hzero hone
    rw [hsub, hsmul]
    change ‖((F0ConditionalNode.phaseSlice_memLp s).toLp _) w -
        ((memLp_hfun (0, 0)).toLp _) w‖ ≤
      ‖(C : ℂ) • ((memLp_hfun (1, 0)).toLp _) w‖
    rw [hphase, hzero, hone, hfun_zero_zero, hfun_one_zero]
    rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hC]
    exact phaseSlice_sub_one_bound s hs w
  calc
    _ ≤ ‖(C : ℂ) • hvec (1, 0)‖ := Lp.norm_le_norm_of_ae_le hpoint
    _ = C := by
      rw [norm_smul, orthonormal_hvec.norm_eq_one (1, 0), mul_one,
        Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hC]

theorem norm_coefficient_sub_constant (s : ℝ) (hs : 0 < s) (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - (if i = (0, 0) then (1 : ℂ) else 0)‖ ≤
      2 * (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * |vprof s|) / Real.sqrt s := by
  have heq : F0ConditionalNode.coefficient s i - (if i = (0, 0) then (1 : ℂ) else 0) =
      ⟪hvec i, F0ConditionalNode.phaseSliceLp s - hvec (0, 0)⟫_ℂ := by
    rw [inner_sub_right, inner_hvec]
    rfl
  rw [heq]
  calc
    _ ≤ ‖hvec i‖ * ‖F0ConditionalNode.phaseSliceLp s - hvec (0, 0)‖ := norm_inner_le_norm _ _
    _ = ‖F0ConditionalNode.phaseSliceLp s - hvec (0, 0)‖ := by
      rw [orthonormal_hvec.norm_eq_one i, one_mul]
    _ ≤ _ := norm_phaseSliceLp_sub_constant s hs

end Grothe.UpperChaos.ZeroProfilePhaseStability
