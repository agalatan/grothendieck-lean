import Grothe.UpperQuad.GaussianShiftDomination
import Grothe.UpperQuad.HolomorphicIntegral

/-!
# Analytic dependence of the shifted Gaussian coefficients

The fixed-phase representation and its Gaussian majorant permit integration of the pointwise
analytic parameter dependence. The local composition theorem applies on a closed disk, so the
radial and profile parameters need only be holomorphic on the selected zero-free domain.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open Complex MeasureTheory Metric Grothe.LowerAnalytic

noncomputable section

/-- The real and imaginary parts of any complex shift give its fixed-phase representation. -/
theorem coefficient_eq_fixedPhaseIntegral_complex (j : ℕ) (r A : ℂ) (i : ℕ × ℕ) :
    coefficient j r A.re A.im i = ∫ w, fixedPhaseIntegrand j r A i w ∂gaussC := by
  have hA : (A.re : ℂ) + I * (A.im : ℂ) = A := by
    apply Complex.ext <;> simp
  simpa only [hA] using coefficient_eq_fixedPhaseIntegral j r A.re A.im i

private theorem integrable_half_gaussian :
    Integrable (fun w : ℂ ↦ Real.exp (normSq w / 2)) gaussC := by
  simpa only [div_eq_mul_inv, one_mul, mul_comm] using
    GaussianGrowth.integrable_exp_normSq (1 / 2) (by norm_num)

/-- Analytic radial/profile substitutions can be integrated on any bounded closed disk. -/
theorem analyticAt_fixedPhaseIntegral_comp (j : ℕ) (hj : 0 < j) (i : ℕ × ℕ)
    {r A : ℂ → ℂ} {z₀ : ℂ} {R M : ℝ} (hR : 0 < R)
    (hr : DifferentiableOn ℂ r (closedBall z₀ R))
    (hA : DifferentiableOn ℂ A (closedBall z₀ R))
    (hbound : ∀ z ∈ closedBall z₀ R, ‖r z‖ ≤ M ∧ ‖A z‖ ≤ M) :
    AnalyticAt ℂ (fun z ↦ ∫ w, fixedPhaseIntegrand j (r z) (A z) i w ∂gaussC) z₀ := by
  obtain ⟨C, _, hC⟩ := exists_fixedPhaseIntegrand_majorant j hj i M
  apply HolomorphicIntegral.analyticAt_integral_of_closedBall_bound
    (fun z ↦ (measurable_fixedPhaseIntegrand j (r z) (A z) i).aestronglyMeasurable) hR
    (B := fun w ↦ C * Real.exp (normSq w / 2))
  · intro w z hz
    exact (analyticAt_fixedPhaseIntegrand j i w (r z, A z)).differentiableAt
      |>.comp_differentiableWithinAt z ((hr z hz).prodMk (hA z hz))
  · exact integrable_half_gaussian.const_mul C
  · intro z hz w
    exact hC (r z) (A z) (hbound z hz).1 (hbound z hz).2 w

/-- The norm-controlled coefficient has analytic local dependence on radial/profile parameters. -/
theorem analyticAt_coefficient_comp (j : ℕ) (hj : 0 < j) (i : ℕ × ℕ)
    {r A : ℂ → ℂ} {z₀ : ℂ} {R M : ℝ} (hR : 0 < R)
    (hr : DifferentiableOn ℂ r (closedBall z₀ R))
    (hA : DifferentiableOn ℂ A (closedBall z₀ R))
    (hbound : ∀ z ∈ closedBall z₀ R, ‖r z‖ ≤ M ∧ ‖A z‖ ≤ M) :
    AnalyticAt ℂ (fun z ↦ coefficient j (r z) (A z).re (A z).im i) z₀ := by
  have heq : (fun z ↦ coefficient j (r z) (A z).re (A z).im i) =
      (fun z ↦ ∫ w, fixedPhaseIntegrand j (r z) (A z) i w ∂gaussC) :=
    funext fun z ↦ coefficient_eq_fixedPhaseIntegral_complex j (r z) (A z) i
  rw [heq]
  exact analyticAt_fixedPhaseIntegral_comp j hj i hR hr hA hbound

/-- For a fixed radial coordinate, the shifted coefficient is entire in the complex shift. -/
theorem analyticAt_coefficient_shift (j : ℕ) (hj : 0 < j) (r A : ℂ) (i : ℕ × ℕ) :
    AnalyticAt ℂ (fun z ↦ coefficient j r z.re z.im i) A := by
  apply analyticAt_coefficient_comp j hj i (R := 1) (M := ‖r‖ + ‖A‖ + 1)
    (by norm_num) (differentiableOn_const r) differentiableOn_id
  intro z hz
  change ‖r‖ ≤ ‖r‖ + ‖A‖ + 1 ∧ ‖z‖ ≤ ‖r‖ + ‖A‖ + 1
  exact ⟨by linarith [norm_nonneg A], by linarith [norm_nonneg r, norm_le_of_mem_closedBall hz]⟩

/-- For a fixed complex shift, the shifted coefficient is entire in its radial coordinate. -/
theorem analyticAt_coefficient_radial (j : ℕ) (hj : 0 < j) (r A : ℂ) (i : ℕ × ℕ) :
    AnalyticAt ℂ (fun z ↦ coefficient j z A.re A.im i) r := by
  apply analyticAt_coefficient_comp j hj i (R := 1) (M := ‖r‖ + ‖A‖ + 1)
    (by norm_num) differentiableOn_id (differentiableOn_const A)
  intro z hz
  change ‖z‖ ≤ ‖r‖ + ‖A‖ + 1 ∧ ‖A‖ ≤ ‖r‖ + ‖A‖ + 1
  exact ⟨by linarith [norm_nonneg A, norm_le_of_mem_closedBall hz], by linarith [norm_nonneg r]⟩

end

end Grothe.UpperQuad.GaussianShift

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.norm_source_sq_le
  for target in #[``Grothe.UpperQuad.GaussianShift.coefficient_eq_fixedPhaseIntegral_complex,
      ``Grothe.UpperQuad.GaussianShift.analyticAt_coefficient_comp,
      ``Grothe.UpperQuad.GaussianShift.analyticAt_coefficient_shift,
      ``Grothe.UpperQuad.GaussianShift.analyticAt_coefficient_radial] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
