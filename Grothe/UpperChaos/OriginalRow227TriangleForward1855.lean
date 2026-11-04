import Grothe.UpperChaos.OriginalRow227TriangleData1865
import Grothe.UpperChaos.OriginalRow227TriangleData1871
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1855
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1865.coefficient170_331, Icur := OriginalRow227TriangleData1865.coefficient170_330,
    output := OriginalRow227TriangleData1871.coefficient171_330, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1855

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1855.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
