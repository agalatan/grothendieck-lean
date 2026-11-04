import Grothe.UpperChaos.OriginalRow227TriangleData0837
import Grothe.UpperChaos.OriginalRow227TriangleData0850
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0834
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0837.coefficient57_442, Icur := OriginalRow227TriangleData0837.coefficient57_441,
    output := OriginalRow227TriangleData0850.coefficient58_441, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0837.coefficient57_443, Icur := OriginalRow227TriangleData0837.coefficient57_442,
    output := OriginalRow227TriangleData0850.coefficient58_442, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0837.coefficient57_444, Icur := OriginalRow227TriangleData0837.coefficient57_443,
    output := OriginalRow227TriangleData0850.coefficient58_443, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0834

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0834.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
