import Grothe.UpperChaos.ThreeBandRegrouping

/-!
# Production adapter for the actual three-band comparison

SOURCE ONLY / UNCOMPILED. Task #295. Agent-ID: codex-2ca4.

The six actual Gaussian inequalities and original actual-X table accuracy are
the only analytic inputs. Existing production phase and finite arithmetic
certificates discharge the core's exposed proof inputs unchanged.

This adapter is not standard-three-only: it deliberately retains exactly the
original registered native leaves named below. No new native checker, native
fact registration, numerical allowance or source-data replacement is introduced.
The declared allowlist is a source candidate; the transitive audit is unexecuted.
-/

set_option warningAsError true

open MeasureTheory Finset Grothe.Upper GrotheKernel

namespace Grothe.UpperChaos.ThreeBandRegrouping
noncomputable section

/-- The same finite facts already consumed by the original comparison route. -/
theorem productionFiniteChecks : OriginalFiniteChecks :=
  ⟨energyRows_within, comparison_check, rounding_energy_check⟩

/-- Actual comparison from three low bands, three independent whole errors,
and the unchanged original energy-table accuracy. Factorials enter once. -/
theorem localized_comparison_three_band
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
    ∑ p ∈ headIdx 501, comparisonWeight p *
      |energy ((memLp_GT phiBound).toLp GT) p -
        energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
          (Xfun frozenCorrectionFn)) p| ≤ (threeBandCompareQ : ℝ) := by
  exact localized_comparison_three_band_of_checks phiBound productionFiniteChecks
    hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird hclose

open Lean Elab Command
run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound,
    `Grothe.Upper.comparison_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.rounding_energy_check._native.native_decide.ax_1_1,
    `Grothe.head_check._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  for target in #[``productionFiniteChecks, ``localized_comparison_three_band] do
    for ax in ← Lean.collectAxioms target do
      unless allowed.contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.ThreeBandRegrouping
