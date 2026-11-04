import Grothe.UpperChaos.OriginalRow227TriangleData2093
import Grothe.UpperChaos.OriginalRow227TriangleData2095
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2079
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots07.root235,
    Inext := OriginalRow227TriangleData2093.coefficient234_267, Icur := OriginalRow227TriangleData2093.coefficient234_266,
    output := OriginalRow227TriangleData2095.coefficient235_266, hC := OriginalRow227TriangleRoots07.root235_pos, hAC := OriginalRow227TriangleRoots07.product235_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2079

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2079.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
