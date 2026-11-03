import Grothe.UpperChaos.Q0RealPhaseSourceSum

/-!
# The q0 radial integrand in real source-term form

This substitutes the exact real Wick source sum into the actual unit-scale
radial integrand and the finite softened panel. It introduces no approximation,
compressed coefficient table or numerical bound. Agent-ID: codex-8c4d.
-/

open MeasureTheory Set

namespace Grothe.UpperChaos.Q0RealRadialSource

open Grothe.UpperChaos.LeanCertProductionPanel
open Grothe.UpperChaos.LeanCertProductionProfile
open Grothe.UpperChaos.Q0ConditionalShift
open Grothe.UpperChaos.Q0RadialWickReal
open Grothe.UpperChaos.Q0RealPhaseSourceSum

noncomputable section

/-- Exact real radial integrand in terms of the actual phase source list. -/
def q0RealRadial (s : ℝ) : ℝ :=
  (-q0Kappa s * s) *
    Real.exp (-(q0Alpha * s) - q0Alpha * s / q0Beta s) *
      realPhaseSourceSum (q0Beta s) (q0RealShift s) (Real.sqrt s) phaseTerms

/-- The actual unit-scale radial integrand is exactly this real expression on
nonnegative squared radii. -/
theorem q0RadialIntegrand_eq_realSource (s : ℝ) (hs : 0 ≤ s) :
    q0RadialIntegrand s = (q0RealRadial s : ℂ) := by
  rw [q0_radial_integrand_eq_ofReal s hs, q0RadialWickSum_eq_realSourceSum s hs]
  simp [q0RealRadial]

/-- Its real part is the same exact source expression. -/
theorem q0RadialIntegrand_re_eq_realSource (s : ℝ) (hs : 0 ≤ s) :
    (q0RadialIntegrand s).re = q0RealRadial s := by
  rw [q0RadialIntegrand_eq_realSource s hs]
  simp

/-- The actual `m = 0` finite panel is the real integral of the same complete
source expression with the actual softened-mixture weight. -/
theorem q0M0Panel_eq_real_integral :
    q0M0Panel =
      ((∫ s in (1 : ℝ)..(1001 / 1000 : ℝ), q0M0Weight * q0RealRadial s : ℝ) : ℂ) := by
  have hPanel :
      (∫ s in (1 : ℝ)..(1001 / 1000 : ℝ), q0RadialIntegrand s) =
        ∫ s in (1 : ℝ)..(1001 / 1000 : ℝ), (q0RealRadial s : ℂ) := by
    apply intervalIntegral.integral_congr
    intro s hs
    rw [uIcc_of_le (by norm_num : (1 : ℝ) ≤ 1001 / 1000)] at hs
    have hs0 : 0 ≤ s := by linarith [hs.1]
    exact q0RadialIntegrand_eq_realSource s hs0
  unfold q0M0Panel q0RadialPanel
  rw [hPanel, intervalIntegral.integral_ofReal, intervalIntegral.integral_const_mul,
    Complex.ofReal_mul]

end
end Grothe.UpperChaos.Q0RealRadialSource
