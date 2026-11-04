import Grothe.UpperChaos.Q0GaussSourcePanelMass
import Grothe.UpperChaos.Q0ConditionalSourceAssembly
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Concrete normalization and error bounds for the exceptional source panels.
The finite order scan selects orders one through four in the same root family
used by sourceNode and sourceWeight. No normalization hypothesis or midpoint
substitution enters these conclusions. The regular evaluator and production
sign/basis/table binding remain separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionMassClosure

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0ConditionalSourceAssembly
open Grothe.UpperChaos.Q0ConditionalSourceError
open Grothe.UpperChaos.Q0ConditionalRetainedError
open Grothe.UpperChaos.ConditionalNodeIndices
open Grothe.UpperChaos.F0ConditionalNode

/-- The actual exceptional-panel weights sum to their physical panel length. -/
theorem exceptional_panel_normalization
    (p : Fin sourcePanels.length) (hp : exceptionalPanel p.val) :
    (∑ j : Fin (sourcePanels.get p).order, sourceWeight ⟨p, j⟩) =
      ((sourcePanels.get p).hi : ℝ) - ((sourcePanels.get p).lo : ℝ) :=
  Q0GaussSourcePanelMass.source_panel_weight_sum p
    (Q0SourceExceptionRegion.exceptional_panel_order p hp).2

/-- Discrete mass, including the Gaussian density exactly once. -/
theorem exceptional_mass_le :
    Q0SourceExceptionMass.exceptionMass ≤ (8 / 10^16 : ℝ) / 400000 :=
  Q0SourceExceptionMass.exceptionMass_le_thirteen exceptional_panel_normalization

/-- The true finite coefficient vector is compared with the saved sparse row;
omitted stored entries are zero-completed, not true Gaussian coefficients. -/
theorem exceptional_error_le :
    Real.sqrt (Q0SourceExceptionError.errorSq modes) ≤ (1575 / 10^13 : ℝ) :=
  Q0SourceExceptionError.error_le modes (fun _ hp => storage_bounds hp)
    exceptional_panel_normalization

/-- The panel-weight premise has been discharged. Only the actual regular
finite-mode enclosure remains as an input to this selected-vector estimate. -/
theorem actual_source_error_sharp
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (253 / 10^12 : ℝ) :=
  actual_error_le center hpoint exceptional_panel_normalization

/-- Compatibility with the source-error ledger; floating operations and the
final numerical table are not included in this mathematical-vector bound. -/
theorem actual_source_error
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ)) :
    Real.sqrt (retainedErrorSq (fun _ => modes)
      (completedCenter (joinedCenter center))) ≤ (36 / 10^11 : ℝ) :=
  (actual_source_error_sharp center hpoint).trans (by norm_num)

end Grothe.UpperChaos.Q0SourceExceptionMassClosure

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionMassClosure.exceptional_panel_normalization,
      ``Grothe.UpperChaos.Q0SourceExceptionMassClosure.exceptional_mass_le,
      ``Grothe.UpperChaos.Q0SourceExceptionMassClosure.exceptional_error_le,
      ``Grothe.UpperChaos.Q0SourceExceptionMassClosure.actual_source_error_sharp,
      ``Grothe.UpperChaos.Q0SourceExceptionMassClosure.actual_source_error] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
