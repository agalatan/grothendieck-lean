import Grothe.UpperChaos.Q0SourceExceptionMassClosure
import Grothe.UpperChaos.ConditionalReconstruction
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Connect the selected source-vector error to exact reflection on the full
conditional rectangle. This uses F0ConditionalNode.coefficient at the actual
positive source radius, retaining its phase of sqrt(s), and the complete
physical Gaussian weight exactly once. Floating-point reconstruction, primary
contraction, final table fit, continuous omission and tails remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalSourceReconstruction

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourceExceptionGeometry
open Grothe.UpperChaos.Q0ConditionalSourceAssembly
open Grothe.UpperChaos.Q0ConditionalSourceError
open Grothe.UpperChaos.Q0ConditionalRetainedError
open Grothe.UpperChaos.Q0SourceExceptionMassClosure
open Grothe.UpperChaos.ConditionalNodeIndices
open Grothe.UpperChaos.F0ConditionalNode

noncomputable section

/-- Error on the full top rectangle after exact canonical reconstruction. -/
def reflectedErrorSq (center : Address → (ℕ × ℕ) → ℂ) : ℝ :=
  ∑ a : Address, nodeWeight a *
    (∑ i ∈ CanonicalReconstructionNorm.grade 250,
      ‖coefficient (sourceNode a) i -
        ConditionalReconstruction.reconstruct (completedCenter (joinedCenter center) a) i‖ ^ 2)

/-- Actual selected nodes and their physical Gaussian weights feed the exact
reconstruction theorem. The finite canonical mode set is not a storage prefix. -/
theorem reflected_error_le
    (center : Address → (ℕ × ℕ) → ℂ)
    (hpoint : ∀ a, ¬ exceptionalPanel a.1.val → ∀ p, p ∈ modes →
      ‖coefficient (sourceNode a) p - completedCenter center a p‖ ≤
        (1 / 10^12 : ℝ)) :
    Real.sqrt (reflectedErrorSq center) ≤ (10 / 7 : ℝ) * (253 / 10^12 : ℝ) := by
  have he : Real.sqrt (∑ a : Address, nodeWeight a *
      (∑ i ∈ modes,
        ‖coefficient (sourceNode a) i - completedCenter (joinedCenter center) a i‖ ^ 2)) ≤
        (253 / 10^12 : ℝ) := by
    simpa only [retainedErrorSq] using actual_source_error_sharp center hpoint
  simpa only [reflectedErrorSq] using
    ConditionalReconstruction.weighted_top_norm_le_of_canonical_error
      (Finset.univ : Finset Address) sourceNode nodeWeight
      (completedCenter (joinedCenter center))
      (fun a _ => sourceNode_nonneg a) (fun a _ => nodeWeight_nonneg a) he

end
end Grothe.UpperChaos.Q0ConditionalSourceReconstruction

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let target := ``Grothe.UpperChaos.Q0ConditionalSourceReconstruction.reflected_error_le
  let dependencies ← Lean.collectAxioms target
  for dependency in dependencies do
    unless allowed.contains dependency do
      throwError m!"{target} uses unexpected axiom {dependency}"
