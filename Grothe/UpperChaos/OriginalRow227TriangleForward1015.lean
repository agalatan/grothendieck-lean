import Grothe.UpperChaos.OriginalRow227TriangleData1019
import Grothe.UpperChaos.OriginalRow227TriangleData1031
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1015
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1019.coefficient72_425, Icur := OriginalRow227TriangleData1019.coefficient72_424,
    output := OriginalRow227TriangleData1031.coefficient73_424, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1019.coefficient72_426, Icur := OriginalRow227TriangleData1019.coefficient72_425,
    output := OriginalRow227TriangleData1031.coefficient73_425, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1019.coefficient72_427, Icur := OriginalRow227TriangleData1019.coefficient72_426,
    output := OriginalRow227TriangleData1031.coefficient73_426, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1019.coefficient72_428, Icur := OriginalRow227TriangleData1019.coefficient72_427,
    output := OriginalRow227TriangleData1031.coefficient73_427, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1019.coefficient72_429, Icur := OriginalRow227TriangleData1019.coefficient72_428,
    output := OriginalRow227TriangleData1031.coefficient73_428, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1015

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1015.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
