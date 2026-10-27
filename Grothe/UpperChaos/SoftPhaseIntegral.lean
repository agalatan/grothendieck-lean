import Grothe.UpperChaos.SoftPhase
import Grothe.Haagerup.PhaseLaplace
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! The softened production phase has an exact Laplace representation with
exponential damping in the auxiliary parameter. Agent-ID: codex-2ca4. -/

open MeasureTheory Set

namespace Grothe.UpperChaos
noncomputable section

/-- Softening multiplies the original phase kernel by a scalar exponential. -/
def softPhaseLaplaceKernel (η : ℝ) (z : ℂ) (t : ℝ) : ℂ :=
  (Real.exp (-(η ^ 2 * t)) : ℂ) * Grothe.Haag.phaseLaplaceKernel z t

theorem softPhaseLaplaceKernel_eq (η : ℝ) (z : ℂ) (t : ℝ) :
    softPhaseLaplaceKernel η z t =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-((‖z‖ ^ 2 + η ^ 2) * t)) : ℝ) : ℂ) * z := by
  unfold softPhaseLaplaceKernel Grothe.Haag.phaseLaplaceKernel
  have he : -((‖z‖ ^ 2 + η ^ 2) * t) = -(η ^ 2 * t) + -(‖z‖ ^ 2 * t) := by ring
  rw [he, Real.exp_add]
  push_cast
  ring

/-- The scalar Gamma integral is finite and exact even when the phase argument is zero. -/
theorem integral_softPhaseLaplace_weight (η : ℝ) (hη : 0 < η) (z : ℂ) :
    (∫ t : ℝ in Ioi 0, t ^ (-(1 / 2 : ℝ)) *
      Real.exp (-((‖z‖ ^ 2 + η ^ 2) * t))) =
      Real.sqrt Real.pi / Real.sqrt (‖z‖ ^ 2 + η ^ 2) := by
  have hrate : 0 < ‖z‖ ^ 2 + η ^ 2 := by positivity
  have hsqrt : (1 / (‖z‖ ^ 2 + η ^ 2) : ℝ) ^ (1 / 2 : ℝ) =
      (Real.sqrt (‖z‖ ^ 2 + η ^ 2))⁻¹ := by
    rw [← Real.sqrt_eq_rpow, one_div, Real.sqrt_inv]
  have h := Real.integral_rpow_mul_exp_neg_mul_Ioi
    (a := (1 / 2 : ℝ)) (r := ‖z‖ ^ 2 + η ^ 2) (by norm_num) hrate
  rw [show (1 / 2 : ℝ) - 1 = -(1 / 2 : ℝ) by norm_num,
    hsqrt, Real.Gamma_one_half_eq] at h
  simpa only [div_eq_mul_inv, mul_comm] using h

/-- Exact Laplace formula for the actual regularized phase, with no nonzero-argument premise. -/
theorem softPhase_eq_laplace (η : ℝ) (hη : 0 < η) (z : ℂ) :
    softPhase η z = (Real.sqrt Real.pi : ℂ)⁻¹ *
      ∫ t : ℝ in Ioi 0, softPhaseLaplaceKernel η z t := by
  simp_rw [softPhaseLaplaceKernel_eq]
  rw [integral_mul_const, integral_complex_ofReal, integral_softPhaseLaplace_weight η hη,
    Complex.ofReal_div]
  have hpi : (Real.sqrt Real.pi : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.mpr Real.pi_pos).ne'
  have hden : (Real.sqrt (‖z‖ ^ 2 + η ^ 2) : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.mpr (show 0 < ‖z‖ ^ 2 + η ^ 2 by positivity)).ne'
  unfold softPhase
  field_simp

/-- Auxiliary damping never increases the original phase kernel's norm. -/
theorem norm_softPhaseLaplaceKernel_le (η : ℝ) (z : ℂ) (t : ℝ) (ht : 0 ≤ t) :
    ‖softPhaseLaplaceKernel η z t‖ ≤ ‖Grothe.Haag.phaseLaplaceKernel z t‖ := by
  rw [softPhaseLaplaceKernel, norm_mul, Complex.norm_real,
    Real.norm_of_nonneg (Real.exp_pos _).le]
  apply mul_le_of_le_one_left (norm_nonneg _)
  exact Real.exp_le_one_iff.mpr (neg_nonpos.mpr (mul_nonneg (sq_nonneg η) ht))

/-- The softened kernel is absolutely integrable for every complex argument. -/
theorem integrableOn_softPhaseLaplaceKernel (η : ℝ) (z : ℂ) :
    IntegrableOn (softPhaseLaplaceKernel η z) (Ioi 0) := by
  have hm : Measurable (softPhaseLaplaceKernel η z) := by
    unfold softPhaseLaplaceKernel Grothe.Haag.phaseLaplaceKernel
    fun_prop
  refine (Grothe.Haag.integrableOn_phaseLaplaceKernel z).norm.mono'
    hm.aestronglyMeasurable ?_
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  exact norm_softPhaseLaplaceKernel_le η z t ht.le

/-- Its absolute auxiliary integral is the exact softened modulus times `sqrt π`. -/
theorem integral_norm_softPhaseLaplaceKernel (η : ℝ) (hη : 0 < η) (z : ℂ) :
    (∫ t : ℝ in Ioi 0, ‖softPhaseLaplaceKernel η z t‖) =
      Real.sqrt Real.pi * ‖z‖ / Real.sqrt (‖z‖ ^ 2 + η ^ 2) := by
  have he (t : ℝ) (ht : t ∈ Ioi (0 : ℝ)) :
      ‖softPhaseLaplaceKernel η z t‖ =
        (t ^ (-(1 / 2 : ℝ)) * Real.exp (-((‖z‖ ^ 2 + η ^ 2) * t))) * ‖z‖ := by
    rw [softPhaseLaplaceKernel_eq, norm_mul, Complex.norm_real,
      Real.norm_of_nonneg (mul_nonneg (Real.rpow_nonneg ht.le _) (Real.exp_pos _).le)]
  rw [setIntegral_congr_fun measurableSet_Ioi he, integral_mul_const,
    integral_softPhaseLaplace_weight η hη]
  ring

/-- The uniform absolute-integral bound needed for polynomial-source Fubini. -/
theorem integral_norm_softPhaseLaplaceKernel_le (η : ℝ) (z : ℂ) :
    (∫ t : ℝ in Ioi 0, ‖softPhaseLaplaceKernel η z t‖) ≤ Real.sqrt Real.pi := by
  refine le_trans ?_ (Grothe.Haag.integral_norm_phaseLaplaceKernel_le z)
  apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
    (Grothe.Haag.integrableOn_phaseLaplaceKernel z).norm
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  exact norm_softPhaseLaplaceKernel_le η z t ht.le

/-- Softening gives a uniform exponential tail in the auxiliary parameter. -/
theorem integral_norm_softPhaseLaplaceKernel_tail_le (η : ℝ) (z : ℂ)
    (T : ℝ) (hT : 0 ≤ T) :
    (∫ t : ℝ in Ioi T, ‖softPhaseLaplaceKernel η z t‖) ≤
      Real.exp (-(η ^ 2 * T)) * Real.sqrt Real.pi := by
  have hsub : Ioi T ⊆ Ioi (0 : ℝ) := Ioi_subset_Ioi hT
  have hphase : IntegrableOn (fun t : ℝ => ‖Grothe.Haag.phaseLaplaceKernel z t‖)
      (Ioi 0) := (Grothe.Haag.integrableOn_phaseLaplaceKernel z).norm
  have htail : (∫ t : ℝ in Ioi T, ‖Grothe.Haag.phaseLaplaceKernel z t‖) ≤
      Real.sqrt Real.pi :=
    (setIntegral_mono_set hphase (Filter.Eventually.of_forall fun _ => norm_nonneg _)
      (Filter.Eventually.of_forall hsub)).trans (Grothe.Haag.integral_norm_phaseLaplaceKernel_le z)
  calc
    _ ≤ ∫ t : ℝ in Ioi T,
        Real.exp (-(η ^ 2 * T)) * ‖Grothe.Haag.phaseLaplaceKernel z t‖ := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
        ((hphase.mono_set hsub).const_mul _)
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
      rw [softPhaseLaplaceKernel, norm_mul, Complex.norm_real,
        Real.norm_of_nonneg (Real.exp_pos _).le]
      apply mul_le_mul_of_nonneg_right _ (norm_nonneg _)
      exact Real.exp_le_exp.mpr
        (neg_le_neg (mul_le_mul_of_nonneg_left ht.le (sq_nonneg η)))
    _ = Real.exp (-(η ^ 2 * T)) *
        ∫ t : ℝ in Ioi T, ‖Grothe.Haag.phaseLaplaceKernel z t‖ := integral_const_mul _ _
    _ ≤ _ := mul_le_mul_of_nonneg_left htail (Real.exp_pos _).le

end
end Grothe.UpperChaos
