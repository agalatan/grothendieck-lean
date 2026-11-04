import Grothe.UpperChaos.ThreeBandEndpointAdapter
import Grothe.UpperChaos.ThreeBandComparison
import Lean.Util.CollectAxioms

/-! Agent-ID: codex-2ca4. Task295 SOURCE ONLY / UNCOMPILED.
The actual conditional endpoint has exactly three original low-band estimates,
three independent whole raw Taylor-error estimates, and actual table accuracy.
The external ThreeBandComparison source candidate discharges the regrouping
implication; neither that module nor this join has been compiled. The original
UpperTarget is unchanged. This is not a closed upper-bound certificate. -/

set_option warningAsError true

namespace Grothe.UpperChaos.ThreeBandEndpoint
open MeasureTheory Grothe.Upper
noncomputable section

theorem upper_of_three_low_three_whole
    (hfirst : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ 0 : ℝ))
    (hsecond : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ 0 : ℝ))
    (hthird : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ 0 : ℝ))
    (hwholeFirst : ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ))
    (hwholeSecond : ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ))
    (hwholeThird : ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ))
    (hclose : ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    Grothe.IsGrothendieckBound (threeBandValueQ : ℝ) ∧
      (threeBandValueQ : ℝ) < (1.40459988 : ℝ) := by
  exact endpoint_of_comparison
    (ThreeBandRegrouping.localized_comparison_three_band
      hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird hclose) hclose

end
end Grothe.UpperChaos.ThreeBandEndpoint

/- Exact union of the existing head, phase, comparison, rounding and Hardy
leaves. Every native name is already registered; the new transitive audit is
UNRUN. An additional or different leaf fails this guard rather than widening it. -/
run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound,
    `Grothe.head_check._native.native_decide.ax_1_1,
    `Grothe.Upper.comparison_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.rounding_energy_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_arc_part_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.hardy_region_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let target := ``Grothe.UpperChaos.ThreeBandEndpoint.upper_of_three_low_three_whole
  let deps ← Lean.collectAxioms target
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected inherited three-band endpoint axioms: {bad}"
