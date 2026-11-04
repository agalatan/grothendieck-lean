import Grothe.UpperChaos.OriginalRow227TriangleData1031
import Grothe.UpperChaos.OriginalRow227TriangleData1043
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1027
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1031.coefficient73_426, Icur := OriginalRow227TriangleData1031.coefficient73_425,
    output := OriginalRow227TriangleData1043.coefficient74_425, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1031.coefficient73_427, Icur := OriginalRow227TriangleData1031.coefficient73_426,
    output := OriginalRow227TriangleData1043.coefficient74_426, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1031.coefficient73_428, Icur := OriginalRow227TriangleData1031.coefficient73_427,
    output := OriginalRow227TriangleData1043.coefficient74_427, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1027

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1027.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
