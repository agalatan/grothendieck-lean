import Grothe.Haagerup.PhaseStability
import Grothe.UpperChaos.F0ConditionalNode

/-! Pointwise stability of the actual production phase near profile zeros.
No sign or nonzero-profile hypothesis is needed. Agent-ID: codex-8c4d. -/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.UpperChaos.ZeroProfilePhaseStability

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
