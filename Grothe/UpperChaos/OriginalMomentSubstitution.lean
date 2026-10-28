import Grothe.UpperChaos.OriginalMomentPullback
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts

/-! Angular change of variables for the original endpoint-singular moment.
Agent-ID: codex-8c4d. -/
open MeasureTheory Set Filter
namespace Grothe.UpperChaos.OriginalPositiveMoment
noncomputable section

def pullback (h : ℕ) (x t : ℝ) : ℝ :=
  integrand h x (sinSq t) * (2 * Real.sin t * Real.cos t)

/-- The smooth expression agrees with the pullback a.e.; the endpoint where
h=0 is deliberately omitted. -/
theorem pullback_ae_Icc (h : ℕ) (x : ℝ) :
    (fun t => 2 * PositiveMomentTheta.density h x t) =ᵐ[volume.restrict (Icc 0 (Real.pi / 2))]
      pullback h x := by
  rw [← restrict_Ioo_eq_restrict_Icc]
  filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
  exact (pullback_interior h x t ht).symm

theorem pullback_integrableOn (h : ℕ) (x : ℝ) :
    IntegrableOn (pullback h x) (uIcc 0 (Real.pi / 2)) volume := by
  rw [uIcc_of_le Real.pi_div_two_pos.le]
  have hc : Continuous (fun t => 2 * PositiveMomentTheta.density h x t) :=
    continuous_const.mul (PositiveMomentTheta.density_continuous h x)
  exact hc.continuousOn.integrableOn_Icc.congr_fun_ae (pullback_ae_Icc h x)

theorem source_integrableOn_image (h : ℕ) (x : ℝ) :
    IntegrableOn (integrand h x) (sinSq '' uIcc 0 (Real.pi / 2)) volume := by
  have hi : IntegrableOn (integrand h x) (Icc 0 1) volume :=
    (intervalIntegrable_iff_integrableOn_Icc_of_le (by norm_num : (0 : ℝ) ≤ 1)).1
      (integrand_intervalIntegrable h x)
  apply hi.mono_set
  rintro y ⟨t, _, rfl⟩
  exact sinSq_mem_Icc t

theorem source_continuousOn_image (h : ℕ) (x : ℝ) :
    ContinuousOn (integrand h x) (sinSq '' Ioo (min 0 (Real.pi / 2)) (max 0 (Real.pi / 2))) := by
  apply (integrand_continuousOn_pos h x).mono
  rintro y ⟨t, ht, rfl⟩
  have ht' : t ∈ Ioo (0 : ℝ) (Real.pi / 2) := by
    simpa only [min_eq_left Real.pi_div_two_pos.le, max_eq_right Real.pi_div_two_pos.le] using ht
  exact (sinSq_mem_Ioo ht').1

theorem sinSq_continuous : Continuous sinSq := by
  unfold sinSq
  fun_prop

/-- The actual singular integral equals twice the angular integral. -/
theorem integral_eq_two_angular (h : ℕ) (x : ℝ) :
    (∫ t in (0 : ℝ)..1, integrand h x t) = 2 * PositiveMomentTheta.moment h x := by
  have hderiv : ∀ t ∈ Ioo (min 0 (Real.pi / 2)) (max 0 (Real.pi / 2)),
      HasDerivWithinAt sinSq (2 * Real.sin t * Real.cos t) (Ioi t) t := by
    intro t _
    exact (sinSq_hasDerivAt t).hasDerivWithinAt
  have hc := intervalIntegral.integral_comp_mul_deriv'''
    sinSq_continuous.continuousOn hderiv (source_continuousOn_image h x)
    (source_integrableOn_image h x) (pullback_integrableOn h x)
  have heq : pullback h x =ᵐ[volume.restrict (uIoc 0 (Real.pi / 2))]
      (fun t => 2 * PositiveMomentTheta.density h x t) := by
    rw [uIoc_of_le Real.pi_div_two_pos.le, ← restrict_Ioo_eq_restrict_Ioc]
    filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
    exact pullback_interior h x t ht
  have hp := intervalIntegral.integral_congr_ae_restrict heq
  rw [intervalIntegral.integral_const_mul] at hp
  change (∫ t in (0 : ℝ)..(Real.pi / 2), pullback h x t) =
    2 * PositiveMomentTheta.moment h x at hp
  simpa [pullback, Function.comp_def, sinSq] using hc.symm.trans hp

/-- The historical J moment equals the angular moment times 4/π. -/
theorem moment_eq_angular (h : ℕ) (x : ℝ) :
    moment h x = (4 / Real.pi) * PositiveMomentTheta.moment h x := by
  unfold moment
  rw [integral_eq_two_angular]
  ring

end
end Grothe.UpperChaos.OriginalPositiveMoment
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.moment_eq_angular
