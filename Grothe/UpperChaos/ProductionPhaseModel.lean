import Grothe.UpperChaos.Rounder
import Grothe.UpperChaos.PhasePolynomialStability
import Grothe.UpperChaos.ZeroProfilePhaseStability
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Actual rounding-source error from the Gaussian base and a phase certificate.
The comparison phase is bounded by one; the actual phase premise can be
supplied by the native whole-domain cover. It remains explicit to keep this
analytic estimate independent of that native computation. No numerical
source enclosure is supplied here. Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.ProductionPhaseModel
open ZeroProfilePhaseStability
noncomputable section

/-- Propagate the proved Gaussian base remainder and a real phase error. -/
theorem norm_roundingSlice_sub_model (s : ℝ) (hs : 0 < s) (w : ℂ) (p : ℝ)
    (hphase : |phiT ((Real.sqrt s : ℂ), w)| ≤ 1) (hp : |p| ≤ 1) :
    ‖Tround ((Real.sqrt s : ℂ), w) - linearSlice s w * P3 p‖ ≤
      (5 / 2 : ℝ) * signedProfileRatio s ^ 2 * ‖w‖ ^ 2 +
        (5 / 2 : ℝ) * |phiT ((Real.sqrt s : ℂ), w) - p| := by
  change ‖F0ConditionalNode.phaseSlice s w * P3 (phiT ((Real.sqrt s : ℂ), w)) -
      linearSlice s w * P3 p‖ ≤ _
  exact (PhasePolynomialStability.norm_base_mul_P3_sub
    (F0ConditionalNode.norm_phaseSlice_le_one s w) hphase hp).trans
      (add_le_add (phaseSlice_sub_linear_bound s hs w) le_rfl)

end
open Lean Elab Command
run_cmd do
  for target in #[``norm_roundingSlice_sub_model] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseModel
