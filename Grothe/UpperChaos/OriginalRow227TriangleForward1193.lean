import Grothe.UpperChaos.OriginalRow227TriangleData1198
import Grothe.UpperChaos.OriginalRow227TriangleData1209
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1193
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1198.coefficient88_409, Icur := OriginalRow227TriangleData1198.coefficient88_408,
    output := OriginalRow227TriangleData1209.coefficient89_408, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1198.coefficient88_410, Icur := OriginalRow227TriangleData1198.coefficient88_409,
    output := OriginalRow227TriangleData1209.coefficient89_409, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1198.coefficient88_411, Icur := OriginalRow227TriangleData1198.coefficient88_410,
    output := OriginalRow227TriangleData1209.coefficient89_410, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1198.coefficient88_412, Icur := OriginalRow227TriangleData1198.coefficient88_411,
    output := OriginalRow227TriangleData1209.coefficient89_411, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1198.coefficient88_413, Icur := OriginalRow227TriangleData1198.coefficient88_412,
    output := OriginalRow227TriangleData1209.coefficient89_412, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1193

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1193.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
