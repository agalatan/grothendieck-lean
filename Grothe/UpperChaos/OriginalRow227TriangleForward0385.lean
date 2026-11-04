import Grothe.UpperChaos.OriginalRow227TriangleData0386
import Grothe.UpperChaos.OriginalRow227TriangleData0401
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0385
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_473, Icur := OriginalRow227TriangleData0386.coefficient24_472,
    output := OriginalRow227TriangleData0401.coefficient25_472, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_474, Icur := OriginalRow227TriangleData0386.coefficient24_473,
    output := OriginalRow227TriangleData0401.coefficient25_473, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_475, Icur := OriginalRow227TriangleData0386.coefficient24_474,
    output := OriginalRow227TriangleData0401.coefficient25_474, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_476, Icur := OriginalRow227TriangleData0386.coefficient24_475,
    output := OriginalRow227TriangleData0401.coefficient25_475, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_477, Icur := OriginalRow227TriangleData0386.coefficient24_476,
    output := OriginalRow227TriangleData0401.coefficient25_476, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0385

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0385.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
