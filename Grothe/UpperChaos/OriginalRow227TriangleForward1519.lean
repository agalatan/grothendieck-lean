import Grothe.UpperChaos.OriginalRow227TriangleData1526
import Grothe.UpperChaos.OriginalRow227TriangleData1535
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1519
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1526.coefficient122_379, Icur := OriginalRow227TriangleData1526.coefficient122_378,
    output := OriginalRow227TriangleData1535.coefficient123_378, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1519

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1519.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
