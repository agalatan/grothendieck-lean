import Grothe.UpperChaos.OriginalRow227TriangleData0371
import Grothe.UpperChaos.OriginalRow227TriangleData0386
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0370
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_472, Icur := OriginalRow227TriangleData0371.coefficient23_471,
    output := OriginalRow227TriangleData0386.coefficient24_471, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_473, Icur := OriginalRow227TriangleData0371.coefficient23_472,
    output := OriginalRow227TriangleData0386.coefficient24_472, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_474, Icur := OriginalRow227TriangleData0371.coefficient23_473,
    output := OriginalRow227TriangleData0386.coefficient24_473, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_475, Icur := OriginalRow227TriangleData0371.coefficient23_474,
    output := OriginalRow227TriangleData0386.coefficient24_474, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_476, Icur := OriginalRow227TriangleData0371.coefficient23_475,
    output := OriginalRow227TriangleData0386.coefficient24_475, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_477, Icur := OriginalRow227TriangleData0371.coefficient23_476,
    output := OriginalRow227TriangleData0386.coefficient24_476, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0371.coefficient23_478, Icur := OriginalRow227TriangleData0371.coefficient23_477,
    output := OriginalRow227TriangleData0386.coefficient24_477, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0370

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0370.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
