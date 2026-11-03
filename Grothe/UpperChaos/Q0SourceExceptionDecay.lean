import Grothe.UpperChaos.Q0SourceExceptionGeometry
import Grothe.UpperChaos.Q0RadialDensity
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Gaussian decay on the three exceptional source-panel blocks. The panel
width and quadrature-weight mass checks are separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionDecay

open Finset
open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourceExceptionGeometry

/-- Shared elementary bound, with no source-data dependency in its proof. -/
theorem exp_thirteen_lower : (400000 : ℝ) ≤ Real.exp 13 :=
  Q0RadialDensity.exp_thirteen_lower

/-- The true Gaussian radial factor is uniformly small on every excluded
source node, with no assumption on its profile sign. -/
theorem exceptional_decay (a : Address) (ha : exceptionalPanel a.1.val) :
    Real.exp (-(sourceNode a)) ≤ (1 / 400000 : ℝ) :=
  Q0RadialDensity.density_le_of_thirteen (exception_source_ge_13 a ha)

end Grothe.UpperChaos.Q0SourceExceptionDecay

open Lean Elab Command
run_cmd do
  let dependencies ← Lean.collectAxioms
    ``Grothe.UpperChaos.Q0SourceExceptionDecay.exceptional_decay
  for dependency in dependencies do
    unless (#[`propext, `Classical.choice, `Quot.sound] : Array Name).contains dependency do
      throwError m!"source exception decay uses unexpected axiom {dependency}"
