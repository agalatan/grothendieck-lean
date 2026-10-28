import Grothe.UpperChaos.MobiusGeometry
import Grothe.UpperChaos.MobiusSeedPullback
import Grothe.UpperChaos.OriginalMomentSubstitutionLemmas
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts
import Mathlib.Analysis.SpecialFunctions.Integrability.Basic
import Mathlib.Tactic.FunProp

/-! Finite-interval substitution for the actual J moment integrand. The
improper limit and conditional Gaussian coefficient are not claimed here. -/
open MeasureTheory Set Filter
namespace Grothe.UpperChaos.MobiusFiniteSubstitution
open MobiusGeometry MobiusSeedPullback
noncomputable section

def pullback (d : ℕ) (x t : ℝ) : ℝ :=
  OriginalPositiveMoment.integrand d x (forward t) * (1 / (1 + t) ^ 2)

def smooth (d : ℕ) (x t : ℝ) : ℝ :=
  (forward t) ^ d * Real.exp (-x * forward t) / (1 + t) ^ 2

theorem forward_continuousOn (T : ℝ) (hT : 0 ≤ T) : ContinuousOn forward (uIcc 0 T) := by
  rw [uIcc_of_le hT]
  unfold forward
  apply ContinuousOn.div continuousOn_id (continuousOn_const.add continuousOn_id)
  intro t ht
  have hp : 0 < 1 + t := by linarith [ht.1]
  exact ne_of_gt hp

theorem smooth_continuousOn (d : ℕ) (x T : ℝ) (hT : 0 ≤ T) :
    ContinuousOn (smooth d x) (uIcc 0 T) := by
  have hf := forward_continuousOn T hT
  unfold smooth
  apply ContinuousOn.div ((hf.pow d).mul ((continuousOn_const.mul hf).rexp))
    ((continuousOn_const.add continuousOn_id).pow 2)
  intro t ht
  rw [uIcc_of_le hT] at ht
  have hp : 0 < 1 + t := by linarith [ht.1]
  exact pow_ne_zero 2 (ne_of_gt hp)

theorem kernel_intervalIntegrable (d : ℕ) (x T : ℝ) (hT : 0 ≤ T) :
    IntervalIntegrable (kernel d x) volume 0 T := by
  have hp : IntervalIntegrable (fun t : ℝ => t ^ (-(1 / 2 : ℝ))) volume 0 T :=
    intervalIntegral.intervalIntegrable_rpow' (by norm_num)
  have h := hp.mul_continuousOn (smooth_continuousOn d x T hT)
  convert h using 1
  funext t
  unfold kernel smooth forward
  ring

theorem pullback_ae_Icc (d : ℕ) (x T : ℝ) :
    pullback d x =ᵐ[volume.restrict (Icc 0 T)] kernel d x := by
  rw [← restrict_Ioo_eq_restrict_Icc]
  filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
  exact source_integrand_pullback d x t ht.1

theorem pullback_integrableOn (d : ℕ) (x T : ℝ) (hT : 0 ≤ T) :
    IntegrableOn (pullback d x) (uIcc 0 T) volume := by
  rw [uIcc_of_le hT]
  have hk : IntegrableOn (kernel d x) (Icc 0 T) volume :=
    (intervalIntegrable_iff_integrableOn_Icc_of_le hT).1 (kernel_intervalIntegrable d x T hT)
  exact hk.congr_fun_ae (pullback_ae_Icc d x T).symm

theorem original_integrableOn_image (d : ℕ) (x T : ℝ) (hT : 0 ≤ T) :
    IntegrableOn (OriginalPositiveMoment.integrand d x) (forward '' uIcc 0 T) volume := by
  have hi : IntegrableOn (OriginalPositiveMoment.integrand d x) (Icc 0 1) volume :=
    (intervalIntegrable_iff_integrableOn_Icc_of_le (by norm_num : (0 : ℝ) ≤ 1)).1
      (OriginalPositiveMoment.integrand_intervalIntegrable d x)
  apply hi.mono_set
  rintro y ⟨t, ht, rfl⟩
  rw [uIcc_of_le hT] at ht
  have hf := forward_mem t ht.1
  exact ⟨hf.1, hf.2.le⟩

theorem original_continuousOn_image (d : ℕ) (x T : ℝ) (hT : 0 ≤ T) :
    ContinuousOn (OriginalPositiveMoment.integrand d x)
      (forward '' Ioo (min 0 T) (max 0 T)) := by
  apply (OriginalPositiveMoment.integrand_continuousOn_pos d x).mono
  rintro y ⟨t, ht, rfl⟩
  have ht0 : 0 < t := by simpa only [min_eq_left hT] using ht.1
  unfold forward
  exact div_pos ht0 (by linarith)

/-- Finite integral equality; the endpoint t=0 is handled almost everywhere. -/
theorem finite_substitution (d : ℕ) (x T : ℝ) (hT : 0 ≤ T) :
    (∫ t in (0 : ℝ)..T, kernel d x t) =
      ∫ v in (0 : ℝ)..(forward T), OriginalPositiveMoment.integrand d x v := by
  have hderiv : ∀ t ∈ Ioo (min 0 T) (max 0 T),
      HasDerivWithinAt forward (1 / (1 + t) ^ 2) (Ioi t) t := by
    intro t ht
    have ht0 : 0 < t := by simpa only [min_eq_left hT] using ht.1
    exact (forward_deriv t ht0.le).hasDerivWithinAt
  have h := intervalIntegral.integral_comp_mul_deriv'''
    (forward_continuousOn T hT) hderiv (original_continuousOn_image d x T hT)
    (original_integrableOn_image d x T hT) (pullback_integrableOn d x T hT)
  have heq : pullback d x =ᵐ[volume.restrict (uIoc 0 T)] kernel d x := by
    rw [uIoc_of_le hT, ← restrict_Ioo_eq_restrict_Ioc]
    filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
    exact source_integrand_pullback d x t ht.1
  have hp := intervalIntegral.integral_congr_ae_restrict heq
  simpa [pullback, Function.comp_def, forward] using hp.symm.trans h

end
end Grothe.UpperChaos.MobiusFiniteSubstitution
#print axioms Grothe.UpperChaos.MobiusFiniteSubstitution.finite_substitution
