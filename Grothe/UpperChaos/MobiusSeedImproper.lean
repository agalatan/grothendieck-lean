import Grothe.UpperChaos.MobiusFiniteSubstitution
import Grothe.UpperChaos.MobiusImproperIntegrable
import Grothe.UpperChaos.MobiusImproperLimit
import Grothe.UpperChaos.MobiusEndpoint
import Mathlib.Tactic.FieldSimp

/-! Source-specific improper seed kernel identity. This does not yet identify
it with an actual Gaussian coefficient. Agent-ID: codex-8c4d. -/
open MeasureTheory Set Filter
open scoped Topology Interval
namespace Grothe.UpperChaos.MobiusSeedImproper
open MobiusGeometry MobiusSeedPullback MobiusFiniteSubstitution
noncomputable section

theorem kernel_nonneg (d : ℕ) (x t : ℝ) (ht : 0 < t) : 0 ≤ kernel d x t := by
  have hf := (forward_mem t ht.le).1
  have hp : 0 ≤ t ^ (-(1 / 2 : ℝ)) := Real.rpow_nonneg ht.le _
  change 0 ≤ forward t ^ d * t ^ (-(1 / 2 : ℝ)) * Real.exp (-x * forward t) / (1 + t) ^ 2
  exact div_nonneg (mul_nonneg (mul_nonneg (pow_nonneg hf _) hp) (Real.exp_pos _).le) (sq_nonneg _)

theorem kernel_local (d : ℕ) (x T : ℝ) : IntegrableOn (kernel d x) (Ioc 0 T) := by
  by_cases hT : 0 ≤ T
  · exact (kernel_intervalIntegrable d x T hT).1
  · have h : Ioc (0 : ℝ) T = ∅ := Ioc_eq_empty (not_lt.mpr (le_of_not_ge hT))
    simp [h]

theorem forward_limit : Tendsto forward atTop (𝓝[Icc (0 : ℝ) 1] 1) := by
  exact MobiusEndpoint.forward_tendsto

theorem kernel_integrable (d : ℕ) (x : ℝ) : IntegrableOn (kernel d x) (Ioi 0) := by
  apply MobiusLimit.integrable_Ioi_of_finite_substitution (kernel d x)
    (OriginalPositiveMoment.integrand d x) forward
  · exact kernel_local d x
  · exact kernel_nonneg d x
  · exact OriginalPositiveMoment.integrand_intervalIntegrable d x
  · intro T hT
    exact ⟨(forward_mem T hT).1, (forward_mem T hT).2.le⟩
  · exact finite_substitution d x

theorem kernel_integral_eq (d : ℕ) (x : ℝ) :
    (∫ t in Ioi (0 : ℝ), kernel d x t) = ∫ v in (0 : ℝ)..1, OriginalPositiveMoment.integrand d x v := by
  exact MobiusLimit.integral_Ioi_eq_interval_of_finite (kernel d x)
    (OriginalPositiveMoment.integrand d x) forward (kernel_integrable d x)
    (OriginalPositiveMoment.integrand_intervalIntegrable d x) forward_limit (finite_substitution d x)

theorem kernel_eq_moment (d : ℕ) (x : ℝ) :
    (∫ t in Ioi (0 : ℝ), kernel d x t) = (Real.pi / 2) * OriginalPositiveMoment.moment d x := by
  rw [kernel_integral_eq]
  unfold OriginalPositiveMoment.moment
  have hp : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  field_simp

end
end Grothe.UpperChaos.MobiusSeedImproper
#print axioms Grothe.UpperChaos.MobiusSeedImproper.kernel_eq_moment
