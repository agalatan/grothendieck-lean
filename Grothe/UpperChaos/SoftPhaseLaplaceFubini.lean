import Grothe.UpperChaos.SoftPhaseIntegral
import Grothe.Haagerup.PhaseLaplaceFubini

/-! Absolute Fubini for the softened phase against an integrable source.
Agent-ID: codex-2ca4. -/

open MeasureTheory Set

namespace Grothe.UpperChaos
noncomputable section

theorem measurable_softPhaseLaplaceKernel (η : ℝ) :
    Measurable (fun p : ℂ × ℝ => softPhaseLaplaceKernel η p.1 p.2) := by
  unfold softPhaseLaplaceKernel Grothe.Haag.phaseLaplaceKernel
  fun_prop

/-- Softening retains absolute integrability for every integrable polynomial source. -/
theorem integrable_mul_softPhaseLaplaceKernel {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] {P f : Ω → ℂ} (η : ℝ)
    (hPm : Measurable P) (hf : Measurable f) (hP : Integrable P μ) :
    Integrable (fun p : Ω × ℝ => P p.1 * softPhaseLaplaceKernel η (f p.1) p.2)
      (μ.prod (volume.restrict (Ioi 0))) := by
  let G : Ω × ℝ → ℂ := fun p => P p.1 * softPhaseLaplaceKernel η (f p.1) p.2
  have hG : Measurable G :=
    (hPm.comp measurable_fst).mul
      ((measurable_softPhaseLaplaceKernel η).comp
        ((hf.comp measurable_fst).prodMk measurable_snd))
  apply (integrable_prod_iff hG.aestronglyMeasurable).mpr
  constructor
  · exact Filter.Eventually.of_forall (fun u =>
      (integrableOn_softPhaseLaplaceKernel η (f u)).const_mul (P u))
  · have hnonneg (u : Ω) : 0 ≤ ∫ t : ℝ in Ioi 0, ‖G (u, t)‖ :=
      integral_nonneg (fun _ => norm_nonneg _)
    have hbound (u : Ω) : (∫ t : ℝ in Ioi 0, ‖G (u, t)‖) ≤
        ‖P u‖ * Real.sqrt Real.pi := by
      simp only [G, norm_mul]
      rw [integral_const_mul]
      exact mul_le_mul_of_nonneg_left
        (integral_norm_softPhaseLaplaceKernel_le η (f u)) (norm_nonneg _)
    exact (hP.norm.mul_const (Real.sqrt Real.pi)).mono_nonneg
      hG.aestronglyMeasurable.norm.integral_prod_right'
      (Filter.Eventually.of_forall hnonneg) (Filter.Eventually.of_forall hbound)

/-- The auxiliary integral can be moved outside the actual softened response integral. -/
theorem integral_mul_softPhase_eq_laplace {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] {P f : Ω → ℂ} (η : ℝ) (hη : 0 < η)
    (hPm : Measurable P) (hf : Measurable f) (hP : Integrable P μ) :
    (∫ u, P u * softPhase η (f u) ∂μ) = (Real.sqrt Real.pi : ℂ)⁻¹ *
      ∫ t : ℝ in Ioi 0, ∫ u, P u * softPhaseLaplaceKernel η (f u) t ∂μ := by
  have hprod := integrable_mul_softPhaseLaplaceKernel μ η hPm hf hP
  calc
    (∫ u, P u * softPhase η (f u) ∂μ) =
        ∫ u, P u * ((Real.sqrt Real.pi : ℂ)⁻¹ *
          ∫ t : ℝ in Ioi 0, softPhaseLaplaceKernel η (f u) t) ∂μ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun u => by
        dsimp only
        rw [softPhase_eq_laplace η hη])
    _ = (Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ u, (∫ t : ℝ in Ioi 0, P u * softPhaseLaplaceKernel η (f u) t) ∂μ := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      refine Filter.Eventually.of_forall (fun u => ?_)
      dsimp only
      rw [integral_const_mul]
      ring
    _ = (Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ t : ℝ in Ioi 0, ∫ u, P u * softPhaseLaplaceKernel η (f u) t ∂μ :=
      congrArg (fun z : ℂ => (Real.sqrt Real.pi : ℂ)⁻¹ * z) (integral_integral_swap hprod)

/-- A finite upper cutoff of the auxiliary integral has a certified exponential error. -/
theorem norm_integral_softPhaseLaplace_tail_le {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] {P f : Ω → ℂ} (η T : ℝ) (hT : 0 ≤ T)
    (hPm : Measurable P) (hf : Measurable f) (hP : Integrable P μ) :
    ‖∫ t : ℝ in Ioi T, ∫ u, P u * softPhaseLaplaceKernel η (f u) t ∂μ‖ ≤
      Real.exp (-(η ^ 2 * T)) * Real.sqrt Real.pi * ∫ u, ‖P u‖ ∂μ := by
  have hprod : Integrable (fun p : Ω × ℝ =>
      P p.1 * softPhaseLaplaceKernel η (f p.1) p.2)
      (μ.prod (volume.restrict (Ioi T))) :=
    (integrable_mul_softPhaseLaplaceKernel μ η hPm hf hP).mono_measure
      (Measure.prod_mono le_rfl (Measure.restrict_mono (Ioi_subset_Ioi hT) le_rfl))
  rw [← integral_integral_swap hprod]
  calc
    _ ≤ ∫ u, ‖∫ t : ℝ in Ioi T, P u * softPhaseLaplaceKernel η (f u) t‖ ∂μ :=
      norm_integral_le_integral_norm _
    _ ≤ ∫ u, ‖P u‖ * (Real.exp (-(η ^ 2 * T)) * Real.sqrt Real.pi) ∂μ := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
        (hP.norm.mul_const _)
      exact Filter.Eventually.of_forall fun u => by
        calc
          _ ≤ ∫ t : ℝ in Ioi T, ‖P u * softPhaseLaplaceKernel η (f u) t‖ :=
            norm_integral_le_integral_norm _
          _ = ‖P u‖ * ∫ t : ℝ in Ioi T, ‖softPhaseLaplaceKernel η (f u) t‖ := by
            simp_rw [norm_mul]
            rw [integral_const_mul]
          _ ≤ _ := mul_le_mul_of_nonneg_left
            (integral_norm_softPhaseLaplaceKernel_tail_le η (f u) T hT) (norm_nonneg _)
    _ = _ := by rw [integral_mul_const]; ring

end
end Grothe.UpperChaos
