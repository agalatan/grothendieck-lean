import Grothe.UpperChaos.OriginalRow227TriangleData0159
import Grothe.UpperChaos.OriginalRow227TriangleData0175
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0159
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0159.coefficient9_490, Icur := OriginalRow227TriangleData0159.coefficient9_489,
    output := OriginalRow227TriangleData0175.coefficient10_489, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0159.coefficient9_491, Icur := OriginalRow227TriangleData0159.coefficient9_490,
    output := OriginalRow227TriangleData0175.coefficient10_490, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0159.coefficient9_492, Icur := OriginalRow227TriangleData0159.coefficient9_491,
    output := OriginalRow227TriangleData0175.coefficient10_491, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0159

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0159.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
