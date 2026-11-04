import Grothe.UpperChaos.OriginalRow227TriangleData0356
import Grothe.UpperChaos.OriginalRow227TriangleData0371
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0355
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_471, Icur := OriginalRow227TriangleData0356.coefficient22_470,
    output := OriginalRow227TriangleData0371.coefficient23_470, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_472, Icur := OriginalRow227TriangleData0356.coefficient22_471,
    output := OriginalRow227TriangleData0371.coefficient23_471, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_473, Icur := OriginalRow227TriangleData0356.coefficient22_472,
    output := OriginalRow227TriangleData0371.coefficient23_472, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_474, Icur := OriginalRow227TriangleData0356.coefficient22_473,
    output := OriginalRow227TriangleData0371.coefficient23_473, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_475, Icur := OriginalRow227TriangleData0356.coefficient22_474,
    output := OriginalRow227TriangleData0371.coefficient23_474, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_476, Icur := OriginalRow227TriangleData0356.coefficient22_475,
    output := OriginalRow227TriangleData0371.coefficient23_475, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_477, Icur := OriginalRow227TriangleData0356.coefficient22_476,
    output := OriginalRow227TriangleData0371.coefficient23_476, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_478, Icur := OriginalRow227TriangleData0356.coefficient22_477,
    output := OriginalRow227TriangleData0371.coefficient23_477, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_479, Icur := OriginalRow227TriangleData0356.coefficient22_478,
    output := OriginalRow227TriangleData0371.coefficient23_478, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0355

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0355.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
