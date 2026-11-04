import Grothe.UpperChaos.OriginalRow227TriangleData1176
import Grothe.UpperChaos.OriginalRow227TriangleData1187
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1171
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_407, Icur := OriginalRow227TriangleData1176.coefficient86_406,
    output := OriginalRow227TriangleData1187.coefficient87_406, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_408, Icur := OriginalRow227TriangleData1176.coefficient86_407,
    output := OriginalRow227TriangleData1187.coefficient87_407, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_409, Icur := OriginalRow227TriangleData1176.coefficient86_408,
    output := OriginalRow227TriangleData1187.coefficient87_408, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_410, Icur := OriginalRow227TriangleData1176.coefficient86_409,
    output := OriginalRow227TriangleData1187.coefficient87_409, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_411, Icur := OriginalRow227TriangleData1176.coefficient86_410,
    output := OriginalRow227TriangleData1187.coefficient87_410, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_412, Icur := OriginalRow227TriangleData1176.coefficient86_411,
    output := OriginalRow227TriangleData1187.coefficient87_411, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_413, Icur := OriginalRow227TriangleData1176.coefficient86_412,
    output := OriginalRow227TriangleData1187.coefficient87_412, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_414, Icur := OriginalRow227TriangleData1176.coefficient86_413,
    output := OriginalRow227TriangleData1187.coefficient87_413, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1176.coefficient86_415, Icur := OriginalRow227TriangleData1176.coefficient86_414,
    output := OriginalRow227TriangleData1187.coefficient87_414, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1171

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1171.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
