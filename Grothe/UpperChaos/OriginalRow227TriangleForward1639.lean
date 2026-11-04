import Grothe.UpperChaos.OriginalRow227TriangleData1647
import Grothe.UpperChaos.OriginalRow227TriangleData1655
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1639
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1647.coefficient137_362, Icur := OriginalRow227TriangleData1647.coefficient137_361,
    output := OriginalRow227TriangleData1655.coefficient138_361, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1647.coefficient137_363, Icur := OriginalRow227TriangleData1647.coefficient137_362,
    output := OriginalRow227TriangleData1655.coefficient138_362, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots04.root138,
    Inext := OriginalRow227TriangleData1647.coefficient137_364, Icur := OriginalRow227TriangleData1647.coefficient137_363,
    output := OriginalRow227TriangleData1655.coefficient138_363, hC := OriginalRow227TriangleRoots04.root138_pos, hAC := OriginalRow227TriangleRoots04.product138_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1639

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1639.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
