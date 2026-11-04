import Grothe.UpperChaos.OriginalRow227TriangleData0401
import Grothe.UpperChaos.OriginalRow227TriangleData0416
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0400
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0401.coefficient25_474, Icur := OriginalRow227TriangleData0401.coefficient25_473,
    output := OriginalRow227TriangleData0416.coefficient26_473, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0401.coefficient25_475, Icur := OriginalRow227TriangleData0401.coefficient25_474,
    output := OriginalRow227TriangleData0416.coefficient26_474, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0401.coefficient25_476, Icur := OriginalRow227TriangleData0401.coefficient25_475,
    output := OriginalRow227TriangleData0416.coefficient26_475, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0400

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0400.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
