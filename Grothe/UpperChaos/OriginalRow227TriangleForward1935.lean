import Grothe.UpperChaos.OriginalRow227TriangleData1946
import Grothe.UpperChaos.OriginalRow227TriangleData1951
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1935
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1946.coefficient186_315, Icur := OriginalRow227TriangleData1946.coefficient186_314,
    output := OriginalRow227TriangleData1951.coefficient187_314, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1935

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1935.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
