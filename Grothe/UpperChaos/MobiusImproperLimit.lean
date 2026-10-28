import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Generic finite-to-improper substitution limit. The integrability, endpoint
limit, and finite-interval identities are explicit premises. -/
open MeasureTheory Set Filter
open scoped Topology Interval
namespace Grothe.UpperChaos.MobiusLimit

/-- If finite interval integrals agree under a map tending to the right endpoint,
then their improper limits agree. No pointwise substitution is assumed. -/
theorem integral_Ioi_eq_interval_of_finite
    (f g ψ : ℝ → ℝ)
    (hf : IntegrableOn f (Ioi 0))
    (hg : IntervalIntegrable g volume 0 1)
    (hψ : Tendsto ψ atTop (𝓝[Set.Icc (0 : ℝ) 1] 1))
    (heq : ∀ T : ℝ, 0 ≤ T → (∫ t in (0 : ℝ)..T, f t) = ∫ v in (0 : ℝ)..ψ T, g v) :
    (∫ t in Ioi (0 : ℝ), f t) = ∫ v in (0 : ℝ)..1, g v := by
  have hleft : Tendsto (fun T : ℝ => ∫ t in (0 : ℝ)..T, f t) atTop
      (𝓝 (∫ t in Ioi (0 : ℝ), f t)) :=
    intervalIntegral_tendsto_integral_Ioi 0 hf tendsto_id
  have hcont : ContinuousOn (fun v : ℝ => ∫ u in (0 : ℝ)..v, g u) (Icc 0 1) := by
    simpa using intervalIntegral.continuousOn_primitive_interval' hg (a := (0 : ℝ)) (by simp)
  have hright : Tendsto (fun T : ℝ => ∫ v in (0 : ℝ)..ψ T, g v) atTop
      (𝓝 (∫ v in (0 : ℝ)..1, g v)) :=
    (hcont 1 (by simp)).tendsto.comp hψ
  apply tendsto_nhds_unique_of_eventuallyEq hleft hright
  filter_upwards [eventually_ge_atTop (0 : ℝ)] with T hT
  exact heq T hT

#print axioms integral_Ioi_eq_interval_of_finite
end Grothe.UpperChaos.MobiusLimit
