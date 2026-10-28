import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Derive half-line integrability from nonnegativity and finite-substitution
bounds. The finite identities and local integrability remain explicit. -/
open MeasureTheory Set Filter
open scoped Topology Interval
namespace Grothe.UpperChaos.MobiusLimit

/-- A nonnegative, locally integrable half-line integrand is integrable when
its finite integrals equal subinterval integrals of a fixed integrable function. -/
theorem integrable_Ioi_of_finite_substitution
    (f g ψ : ℝ → ℝ)
    (hlocal : ∀ T : ℝ, IntegrableOn f (Ioc 0 T))
    (hnonneg : ∀ t : ℝ, 0 < t → 0 ≤ f t)
    (hg : IntervalIntegrable g volume 0 1)
    (hrange : ∀ T : ℝ, 0 ≤ T → ψ T ∈ Icc (0 : ℝ) 1)
    (heq : ∀ T : ℝ, 0 ≤ T → (∫ t in (0 : ℝ)..T, f t) = ∫ v in (0 : ℝ)..ψ T, g v) :
    IntegrableOn f (Ioi 0) := by
  apply integrableOn_Ioi_of_intervalIntegral_norm_bounded (∫ v in (0 : ℝ)..1, ‖g v‖) 0
    (fun T : ℝ => hlocal T) (tendsto_id : Tendsto (fun T : ℝ => T) atTop atTop)
  filter_upwards [eventually_ge_atTop (0 : ℝ)] with T hT
  have hr := hrange T hT
  have hfn : (∫ t in (0 : ℝ)..T, ‖f t‖) = ∫ t in (0 : ℝ)..T, f t := by
    apply intervalIntegral.integral_congr_ae
    filter_upwards [] with t ht
    have ht' : t ∈ Ioc (0 : ℝ) T := by simpa only [uIoc_of_le hT] using ht
    rw [Real.norm_eq_abs, abs_of_nonneg (hnonneg t ht'.1)]
  have hupper : (∫ v in (0 : ℝ)..ψ T, ‖g v‖) ≤ ∫ v in (0 : ℝ)..1, ‖g v‖ :=
    intervalIntegral.integral_mono_interval (le_refl 0) hr.1 hr.2
      (Filter.Eventually.of_forall fun v => norm_nonneg (g v)) hg.norm
  calc
    (∫ t in (0 : ℝ)..T, ‖f t‖) = ∫ v in (0 : ℝ)..ψ T, g v := hfn.trans (heq T hT)
    _ ≤ |∫ v in (0 : ℝ)..ψ T, g v| := le_abs_self _
    _ ≤ ∫ v in (0 : ℝ)..ψ T, ‖g v‖ := by
      simpa only [Real.norm_eq_abs] using (intervalIntegral.norm_integral_le_integral_norm (f := g) hr.1)
    _ ≤ ∫ v in (0 : ℝ)..1, ‖g v‖ := hupper

#print axioms integrable_Ioi_of_finite_substitution
end Grothe.UpperChaos.MobiusLimit
