import Grothe.HJM.OriginRegularity
import Grothe.HJM.OriginPhaseQuotient

/-!
# Continuous origin energy amplitudes

Agent-ID: codex-aa04.

The exact phase divided differences remove the apparent singularity in the
endpoint-subtracted radial number operator. The resulting actual amplitudes
are continuous on the closed half-line. They agree with the differential
expression on the positive half-line; no assertion is made about its
arbitrary totalized value at zero. Numerical integral enclosures and control
at infinity remain separate obligations.
-/

open MeasureTheory Set

namespace Grothe.HJM.Origin

noncomputable section

/-- Continuous extension of the actual left radial energy amplitude. -/
def fEnergyAmplitude (s : ℝ) : ℂ :=
  -2 * (s : ℂ) * deriv (deriv f) s +
    (2 * (s : ℂ) - 2) * deriv f s + fPhaseQuotient s / 2

/-- Continuous extension of the actual right radial energy amplitude. -/
def gEnergyAmplitude (s : ℝ) : ℂ :=
  -2 * (s : ℂ) * deriv (deriv g) s +
    (2 * (s : ℂ) - 2) * deriv g s + gPhaseQuotient s / 2

theorem continuousOn_fEnergyAmplitude : ContinuousOn fEnergyAmplitude (Ici 0) := by
  intro s hs
  have h1 : ContinuousWithinAt (deriv f) (Ici 0) s :=
    (contDiffAt_deriv_f s hs).continuousAt.continuousWithinAt
  have h2 : ContinuousWithinAt (deriv (deriv f)) (Ici 0) s :=
    ((contDiffAt_deriv_f s hs).derivWithin (m := 0) (by simp)).continuousAt.continuousWithinAt
  have hq := continuousOn_fPhaseQuotient s hs
  unfold fEnergyAmplitude
  fun_prop

theorem continuousOn_gEnergyAmplitude : ContinuousOn gEnergyAmplitude (Ici 0) := by
  intro s hs
  have h1 : ContinuousWithinAt (deriv g) (Ici 0) s :=
    (contDiffAt_deriv_g s hs).continuousAt.continuousWithinAt
  have h2 : ContinuousWithinAt (deriv (deriv g)) (Ici 0) s :=
    ((contDiffAt_deriv_g s hs).derivWithin (m := 0) (by simp)).continuousAt.continuousWithinAt
  have hq := continuousOn_gPhaseQuotient s hs
  unfold gEnergyAmplitude
  fun_prop

/-- The continuous extension replaces the differential expression everywhere
on the positive radial domain used by the Gaussian integral. -/
theorem f_radialDifferential_eq (s : ℝ) (hs : 0 < s) :
    originRadialDifferential fResidual (deriv f) (deriv (deriv f)) s =
      fEnergyAmplitude s := by
  unfold originRadialDifferential fEnergyAmplitude fResidual
  rw [← f_difference_quotient s hs]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

theorem g_radialDifferential_eq (s : ℝ) (hs : 0 < s) :
    originRadialDifferential gResidual (deriv g) (deriv (deriv g)) s =
      gEnergyAmplitude s := by
  unfold originRadialDifferential gEnergyAmplitude gResidual
  rw [← g_difference_quotient s hs]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

/-- The left energy density is integrable on every finite closed panel,
including panels that contain the endpoint. -/
theorem integrableOn_fEnergyDensity (R : ℝ) :
    IntegrableOn (fun s => Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) (Icc 0 R) := by
  have hc : ContinuousOn fEnergyAmplitude (Icc 0 R) :=
    continuousOn_fEnergyAmplitude.mono (fun _ hs => hs.1)
  exact ((Real.continuous_exp.comp continuous_neg).continuousOn.mul
    (hc.norm.pow 2)).integrableOn_Icc

/-- The same finite-panel energy integrability for the right response. -/
theorem integrableOn_gEnergyDensity (R : ℝ) :
    IntegrableOn (fun s => Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) (Icc 0 R) := by
  have hc : ContinuousOn gEnergyAmplitude (Icc 0 R) :=
    continuousOn_gEnergyAmplitude.mono (fun _ hs => hs.1)
  exact ((Real.continuous_exp.comp continuous_neg).continuousOn.mul
    (hc.norm.pow 2)).integrableOn_Icc

end

end Grothe.HJM.Origin
