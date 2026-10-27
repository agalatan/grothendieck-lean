import Grothe.Haagerup.PhaseLaplace
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Tactic.FunProp

/-!
# Absolute Fubini for polynomial-weighted complex phase

Agent-ID: codex-6f91. The source may be any integrable
complex-valued function; no Gaussian numerical enclosure is assumed.
-/

open MeasureTheory Set

namespace Grothe.Haag

noncomputable section

/-- The auxiliary phase kernel is jointly Borel measurable. -/
theorem measurable_phaseLaplaceKernel :
    Measurable (fun p : ℂ × ℝ => phaseLaplaceKernel p.1 p.2) := by
  unfold phaseLaplaceKernel
  fun_prop

/-- Any integrable source gives an absolutely integrable auxiliary product kernel. -/
theorem integrable_mul_phaseLaplaceKernel {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] {P f : Ω → ℂ}
    (hPm : Measurable P) (hf : Measurable f) (hP : Integrable P μ) :
    Integrable (fun p : Ω × ℝ => P p.1 * phaseLaplaceKernel (f p.1) p.2)
      (μ.prod (volume.restrict (Ioi 0))) := by
  let G : Ω × ℝ → ℂ := fun p => P p.1 * phaseLaplaceKernel (f p.1) p.2
  have hG : Measurable G :=
    (hPm.comp measurable_fst).mul
      (measurable_phaseLaplaceKernel.comp ((hf.comp measurable_fst).prodMk measurable_snd))
  apply (integrable_prod_iff hG.aestronglyMeasurable).mpr
  constructor
  · exact Filter.Eventually.of_forall (fun u => (integrableOn_phaseLaplaceKernel (f u)).const_mul (P u))
  · have hnonneg (u : Ω) : 0 ≤ ∫ t : ℝ in Ioi 0, ‖G (u, t)‖ :=
      integral_nonneg (fun t => norm_nonneg _)
    have hbound (u : Ω) : (∫ t : ℝ in Ioi 0, ‖G (u, t)‖) ≤ ‖P u‖ * Real.sqrt Real.pi := by
      simp only [G, norm_mul]
      rw [integral_const_mul]
      exact mul_le_mul_of_nonneg_left (integral_norm_phaseLaplaceKernel_le (f u)) (norm_nonneg _)
    exact (hP.norm.mul_const (Real.sqrt Real.pi)).mono_nonneg
      hG.aestronglyMeasurable.norm.integral_prod_right'
      (Filter.Eventually.of_forall hnonneg) (Filter.Eventually.of_forall hbound)

/-- The Laplace parameter can be placed outside any integrable weighted phase integral. -/
theorem integral_mul_ph_eq_phaseLaplace {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] {P f : Ω → ℂ}
    (hPm : Measurable P) (hf : Measurable f) (hP : Integrable P μ) :
    (∫ u, P u * ph (f u) ∂μ) = (Real.sqrt Real.pi : ℂ)⁻¹ *
      ∫ t : ℝ in Ioi 0, ∫ u, P u * phaseLaplaceKernel (f u) t ∂μ := by
  have hprod := integrable_mul_phaseLaplaceKernel μ hPm hf hP
  calc
    (∫ u, P u * ph (f u) ∂μ) =
        ∫ u, P u * ((Real.sqrt Real.pi : ℂ)⁻¹ *
          ∫ t : ℝ in Ioi 0, phaseLaplaceKernel (f u) t) ∂μ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun u => by
        change P u * ph (f u) = P u * ((Real.sqrt Real.pi : ℂ)⁻¹ *
          ∫ t : ℝ in Ioi 0, phaseLaplaceKernel (f u) t)
        rw [ph_eq_phaseLaplace])
    _ = (Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ u, (∫ t : ℝ in Ioi 0, P u * phaseLaplaceKernel (f u) t) ∂μ := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      refine Filter.Eventually.of_forall (fun u => ?_)
      change P u * ((Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ t : ℝ in Ioi 0, phaseLaplaceKernel (f u) t) =
          (Real.sqrt Real.pi : ℂ)⁻¹ * (∫ t : ℝ in Ioi 0, P u * phaseLaplaceKernel (f u) t)
      rw [integral_const_mul]
      ring
    _ = (Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ t : ℝ in Ioi 0, ∫ u, P u * phaseLaplaceKernel (f u) t ∂μ :=
      congrArg (fun z : ℂ => (Real.sqrt Real.pi : ℂ)⁻¹ * z) (integral_integral_swap hprod)

end
end Grothe.Haag
