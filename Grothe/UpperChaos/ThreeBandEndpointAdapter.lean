import Grothe.Upper.ThreeBandEndpointCore
import Grothe.UpperChaos.PhiBound
import Grothe.UpperChaos.HardyReal
import Grothe.UpperChaos.Structural
import Grothe.UpperChaos.ConcreteTaylorUpper
import Lean.Util.CollectAxioms

/-! Agent-ID: codex-2ca4. Task295 SOURCE ONLY / UNCOMPILED.
Concrete adapter to the actual unchanged production GT and frozen correction.
This adapter deliberately consumes the original registered finite/native facts;
its strict allowlist is distinct from the standard-three core. No new native
decision or axiom is introduced. The regrouping implication below is an explicit
temporary proof argument until the disjoint actual regrouping module is joined. -/

set_option warningAsError true

namespace Grothe.UpperChaos.ThreeBandEndpoint
open MeasureTheory Grothe.Upper
noncomputable section

def actualE : ℕ × ℕ → ℝ := energy ((memLp_GT phiBound).toLp GT)

def actualEX : ℕ × ℕ → ℝ :=
  energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))

def TableAccuracy : Prop :=
  ∑ p ∈ headIdx 501, |actualEX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)

def ComparisonConclusion : Prop :=
  ∑ p ∈ headIdx 501, comparisonWeight p * |actualE p - actualEX p| ≤
    (threeBandCompareQ : ℝ)

/-- Exactly three actual low-band bounds and three independent whole raw
Taylor errors. The raw phase hpow j=(i*phi)^j F0 and the center functions are
unchanged; whole raw radii are R1, 2R2, 6R3. No old high-band premise appears. -/
structure AnalyticInputs : Prop where
  firstLow : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
    (firstCapturedErrorQ 0 : ℝ)
  secondLow : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
    (secondCapturedErrorQ 0 : ℝ)
  thirdLow : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
    (thirdCapturedErrorQ 0 : ℝ)
  firstWhole : ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ)
  secondWhole : ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ)
  thirdWhole : ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ)

/-- The old head and Hardy facts are discharged by their actual accepted
production proofs, while the NEW comparison and actual table accuracy remain
explicit. In particular no DirectHyps.compare at the old budget is fabricated. -/
theorem actual_inputs_of_comparison (hcompare : ComparisonConclusion) (hclose : TableAccuracy) :
    ThreeBandDirectInputs actualE actualEX := by
  obtain ⟨hv, hs, hpX⟩ := structural_fields measurable_GT (norm_GT_le phiBound)
    (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound)
    (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
  exact ⟨hv, hs, hpX,
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc => GT_rot2 hc u),
    hcompare, hclose, Grothe.head_check, HardyReal.hardy_GT phiBound⟩

theorem endpoint_of_comparison (hcompare : ComparisonConclusion) (hclose : TableAccuracy) :
    Grothe.IsGrothendieckBound (threeBandValueQ : ℝ) ∧
      (threeBandValueQ : ℝ) < (1.40459988 : ℝ) :=
  threeBand_endpoint_from_inputs (actual_inputs_of_comparison hcompare hclose)

/-- Explicit assembly boundary: `hregrouping` is the missing actual seven-piece
linear/four-unsplit-source quadratic theorem, not asserted to be available by
this file. Joining the separate module discharges this function argument. -/
theorem endpoint_of_regrouping
    (hregrouping : AnalyticInputs → TableAccuracy → ComparisonConclusion)
    (h : AnalyticInputs) (hclose : TableAccuracy) :
    Grothe.IsGrothendieckBound (threeBandValueQ : ℝ) ∧
      (threeBandValueQ : ℝ) < (1.40459988 : ℝ) :=
  endpoint_of_comparison (hregrouping h hclose) hclose

end
end Grothe.UpperChaos.ThreeBandEndpoint

/- The exact permitted inherited leaves below are all already registered in
data/axioms/native.txt. Accepted 7e88 master audit reports identify the five
Hardy leaves, six phase-cover leaves, and original head leaf. This new adapter's
actual transitive closure remains unrun; any unexpected leaf is fatal. -/
run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound,
    `Grothe.head_check._native.native_decide.ax_1_1,
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
  for target in #[``Grothe.UpperChaos.ThreeBandEndpoint.actualE,
      ``Grothe.UpperChaos.ThreeBandEndpoint.actualEX,
      ``Grothe.UpperChaos.ThreeBandEndpoint.TableAccuracy,
      ``Grothe.UpperChaos.ThreeBandEndpoint.ComparisonConclusion,
      ``Grothe.UpperChaos.ThreeBandEndpoint.AnalyticInputs,
      ``Grothe.UpperChaos.ThreeBandEndpoint.actual_inputs_of_comparison,
      ``Grothe.UpperChaos.ThreeBandEndpoint.endpoint_of_comparison,
      ``Grothe.UpperChaos.ThreeBandEndpoint.endpoint_of_regrouping] do
    let deps ← Lean.collectAxioms target
    let bad := deps.filter fun n => !allowed.contains n
    unless bad.isEmpty do throwError m!"Unexpected inherited three-band adapter axioms: {bad}"
