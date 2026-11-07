import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Complex.Liouville

/-!
# Holomorphic integrals from local domination

Measurable families of holomorphic functions can be integrated when their norms have a
locally uniform integrable majorant. Difference quotients supply derivative measurability,
and Cauchy's estimate supplies the derivative majorant. The integration variable needs no
topology, so a fixed measurable phase factor is allowed.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.HolomorphicIntegral

open MeasureTheory Metric Filter Complex Set
open scoped Topology

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {F : ℂ → Ω → ℂ}

/-- The derivative in the parameter remains measurable in the integration variable. -/
theorem aestronglyMeasurable_deriv
    (hFmeas : ∀ z, AEStronglyMeasurable (F z) μ) {z₀ : ℂ}
    (hFdiff : ∀ w, DifferentiableAt ℂ (fun z ↦ F z w) z₀) :
    AEStronglyMeasurable (fun w ↦ deriv (fun z ↦ F z w) z₀) μ := by
  refine aestronglyMeasurable_of_tendsto_ae (𝓝[≠] (0 : ℂ))
    (f := fun t w ↦ t⁻¹ • (F (z₀ + t) w - F z₀ w))
    (fun t ↦ ((hFmeas (z₀ + t)).sub (hFmeas z₀)).const_smul (t⁻¹)) ?_
  exact Eventually.of_forall fun w ↦ (hFdiff w).hasDerivAt.tendsto_slope_zero

/-- A uniform majorant on a closed disk permits differentiation under the integral at
its center. Holomorphy is needed only on that disk. -/
theorem hasDerivAt_integral_of_closedBall_bound
    (hFmeas : ∀ z, AEStronglyMeasurable (F z) μ) {z₀ : ℂ} {R : ℝ} (hR : 0 < R)
    (hFdiff : ∀ w, DifferentiableOn ℂ (fun z ↦ F z w) (closedBall z₀ R))
    {B : Ω → ℝ} (hB : Integrable B μ)
    (hbound : ∀ z ∈ closedBall z₀ R, ∀ w, ‖F z w‖ ≤ B w) :
    Integrable (fun w ↦ deriv (fun z ↦ F z w) z₀) μ ∧
      HasDerivAt (fun z ↦ ∫ w, F z w ∂μ)
        (∫ w, deriv (fun z ↦ F z w) z₀ ∂μ) z₀ := by
  have hhalf : 0 < R / 2 := half_pos hR
  have hsub {z : ℂ} (hz : z ∈ ball z₀ (R / 2)) :
      closedBall z (R / 2) ⊆ closedBall z₀ R := by
    intro u hu
    rw [mem_closedBall] at hu ⊢
    have hz' := mem_ball.mp hz
    exact (dist_triangle u z z₀).trans (by linarith)
  have hdiff {z : ℂ} (hz : z ∈ ball z₀ (R / 2)) (w : Ω) :
      DifferentiableAt ℂ (fun t ↦ F t w) z :=
    ((hFdiff w).mono (hsub hz)).differentiableAt (closedBall_mem_nhds z hhalf)
  refine hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F' := fun z w ↦ deriv (fun t ↦ F t w) z)
    (bound := fun w ↦ B w / (R / 2)) (ball_mem_nhds z₀ hhalf)
    (Eventually.of_forall hFmeas) ?_ ?_ ?_ (hB.div_const (R / 2)) ?_
  · exact hB.mono' (hFmeas z₀)
      (Eventually.of_forall (hbound z₀ (mem_closedBall_self hR.le)))
  · exact aestronglyMeasurable_deriv hFmeas (hdiff (mem_ball_self hhalf))
  · refine Eventually.of_forall fun w z hz ↦ ?_
    apply norm_deriv_le_of_forall_mem_sphere_norm_le hhalf
      ((hFdiff w).mono (closure_ball_subset_closedBall.trans (hsub hz))).diffContOnCl
    intro u hu
    exact hbound u (hsub hz (sphere_subset_closedBall hu)) w
  · exact Eventually.of_forall fun w z hz ↦ (hdiff hz w).hasDerivAt

/-- Holomorphy and domination on one closed disk make the integral analytic at its center. -/
theorem analyticAt_integral_of_closedBall_bound
    (hFmeas : ∀ z, AEStronglyMeasurable (F z) μ) {z₀ : ℂ} {R : ℝ} (hR : 0 < R)
    (hFdiff : ∀ w, DifferentiableOn ℂ (fun z ↦ F z w) (closedBall z₀ R))
    {B : Ω → ℝ} (hB : Integrable B μ)
    (hbound : ∀ z ∈ closedBall z₀ R, ∀ w, ‖F z w‖ ≤ B w) :
    AnalyticAt ℂ (fun z ↦ ∫ w, F z w ∂μ) z₀ := by
  have hhalf : 0 < R / 2 := half_pos hR
  refine DifferentiableOn.analyticAt (s := ball z₀ (R / 2)) ?_
    (ball_mem_nhds z₀ hhalf)
  intro z hz
  have hsub : closedBall z (R / 2) ⊆ closedBall z₀ R := by
    intro u hu
    rw [mem_closedBall] at hu ⊢
    have hz' := mem_ball.mp hz
    exact (dist_triangle u z z₀).trans (by linarith)
  exact (hasDerivAt_integral_of_closedBall_bound hFmeas hhalf
    (fun w ↦ (hFdiff w).mono hsub) hB
    (fun u hu ↦ hbound u (hsub hu))).2.differentiableAt.differentiableWithinAt

/-- A measurable family of entire functions with locally uniform integrable majorants
has an entire integral. -/
theorem differentiable_integral_of_locally_dominated
    (hFmeas : ∀ z, AEStronglyMeasurable (F z) μ)
    (hFdiff : ∀ w, Differentiable ℂ (fun z ↦ F z w))
    (hdom : ∀ z₀, ∃ R > 0, ∃ B : Ω → ℝ, Integrable B μ ∧
      ∀ z ∈ closedBall z₀ R, ∀ w, ‖F z w‖ ≤ B w) :
    Differentiable ℂ (fun z ↦ ∫ w, F z w ∂μ) := by
  intro z₀
  obtain ⟨R, hR, B, hB, hbound⟩ := hdom z₀
  exact (hasDerivAt_integral_of_closedBall_bound hFmeas hR
    (fun w ↦ (hFdiff w).differentiableOn) hB hbound).2.differentiableAt

/-- The locally dominated integral is analytic at every complex parameter. -/
theorem analyticAt_integral_of_locally_dominated
    (hFmeas : ∀ z, AEStronglyMeasurable (F z) μ)
    (hFdiff : ∀ w, Differentiable ℂ (fun z ↦ F z w))
    (hdom : ∀ z₀, ∃ R > 0, ∃ B : Ω → ℝ, Integrable B μ ∧
      ∀ z ∈ closedBall z₀ R, ∀ w, ‖F z w‖ ≤ B w) (z₀ : ℂ) :
    AnalyticAt ℂ (fun z ↦ ∫ w, F z w ∂μ) z₀ :=
  (differentiable_integral_of_locally_dominated hFmeas hFdiff hdom).analyticAt z₀

end Grothe.UpperQuad.HolomorphicIntegral

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperQuad.HolomorphicIntegral.aestronglyMeasurable_deriv,
      ``Grothe.UpperQuad.HolomorphicIntegral.hasDerivAt_integral_of_closedBall_bound,
      ``Grothe.UpperQuad.HolomorphicIntegral.analyticAt_integral_of_closedBall_bound,
      ``Grothe.UpperQuad.HolomorphicIntegral.differentiable_integral_of_locally_dominated,
      ``Grothe.UpperQuad.HolomorphicIntegral.analyticAt_integral_of_locally_dominated] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
