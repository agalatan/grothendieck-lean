import Grothe.UpperChaos.OriginalRow227TriangleData1583
import Grothe.UpperChaos.OriginalRow227TriangleData1591
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1575
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_354, Icur := OriginalRow227TriangleData1583.coefficient129_353,
    output := OriginalRow227TriangleData1591.coefficient130_353, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_355, Icur := OriginalRow227TriangleData1583.coefficient129_354,
    output := OriginalRow227TriangleData1591.coefficient130_354, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_356, Icur := OriginalRow227TriangleData1583.coefficient129_355,
    output := OriginalRow227TriangleData1591.coefficient130_355, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_357, Icur := OriginalRow227TriangleData1583.coefficient129_356,
    output := OriginalRow227TriangleData1591.coefficient130_356, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_358, Icur := OriginalRow227TriangleData1583.coefficient129_357,
    output := OriginalRow227TriangleData1591.coefficient130_357, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_359, Icur := OriginalRow227TriangleData1583.coefficient129_358,
    output := OriginalRow227TriangleData1591.coefficient130_358, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_360, Icur := OriginalRow227TriangleData1583.coefficient129_359,
    output := OriginalRow227TriangleData1591.coefficient130_359, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_361, Icur := OriginalRow227TriangleData1583.coefficient129_360,
    output := OriginalRow227TriangleData1591.coefficient130_360, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_362, Icur := OriginalRow227TriangleData1583.coefficient129_361,
    output := OriginalRow227TriangleData1591.coefficient130_361, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_363, Icur := OriginalRow227TriangleData1583.coefficient129_362,
    output := OriginalRow227TriangleData1591.coefficient130_362, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_364, Icur := OriginalRow227TriangleData1583.coefficient129_363,
    output := OriginalRow227TriangleData1591.coefficient130_363, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_365, Icur := OriginalRow227TriangleData1583.coefficient129_364,
    output := OriginalRow227TriangleData1591.coefficient130_364, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_366, Icur := OriginalRow227TriangleData1583.coefficient129_365,
    output := OriginalRow227TriangleData1591.coefficient130_365, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_367, Icur := OriginalRow227TriangleData1583.coefficient129_366,
    output := OriginalRow227TriangleData1591.coefficient130_366, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_368, Icur := OriginalRow227TriangleData1583.coefficient129_367,
    output := OriginalRow227TriangleData1591.coefficient130_367, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_369, Icur := OriginalRow227TriangleData1583.coefficient129_368,
    output := OriginalRow227TriangleData1591.coefficient130_368, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_370, Icur := OriginalRow227TriangleData1583.coefficient129_369,
    output := OriginalRow227TriangleData1591.coefficient130_369, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_371, Icur := OriginalRow227TriangleData1583.coefficient129_370,
    output := OriginalRow227TriangleData1591.coefficient130_370, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_372, Icur := OriginalRow227TriangleData1583.coefficient129_371,
    output := OriginalRow227TriangleData1591.coefficient130_371, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1575

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1575.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
