import Grothe.UpperChaos.OriginalRow227TriangleData0541
import Grothe.UpperChaos.OriginalRow227TriangleData0542
import Grothe.UpperChaos.OriginalRow227TriangleData0555
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0539
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_388, Icur := OriginalRow227TriangleData0541.coefficient35_387,
    output := OriginalRow227TriangleData0555.coefficient36_387, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_389, Icur := OriginalRow227TriangleData0541.coefficient35_388,
    output := OriginalRow227TriangleData0555.coefficient36_388, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_390, Icur := OriginalRow227TriangleData0541.coefficient35_389,
    output := OriginalRow227TriangleData0555.coefficient36_389, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_391, Icur := OriginalRow227TriangleData0541.coefficient35_390,
    output := OriginalRow227TriangleData0555.coefficient36_390, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_392, Icur := OriginalRow227TriangleData0541.coefficient35_391,
    output := OriginalRow227TriangleData0555.coefficient36_391, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_393, Icur := OriginalRow227TriangleData0541.coefficient35_392,
    output := OriginalRow227TriangleData0555.coefficient36_392, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_394, Icur := OriginalRow227TriangleData0541.coefficient35_393,
    output := OriginalRow227TriangleData0555.coefficient36_393, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_395, Icur := OriginalRow227TriangleData0541.coefficient35_394,
    output := OriginalRow227TriangleData0555.coefficient36_394, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_396, Icur := OriginalRow227TriangleData0541.coefficient35_395,
    output := OriginalRow227TriangleData0555.coefficient36_395, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_397, Icur := OriginalRow227TriangleData0541.coefficient35_396,
    output := OriginalRow227TriangleData0555.coefficient36_396, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_398, Icur := OriginalRow227TriangleData0541.coefficient35_397,
    output := OriginalRow227TriangleData0555.coefficient36_397, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_399, Icur := OriginalRow227TriangleData0541.coefficient35_398,
    output := OriginalRow227TriangleData0555.coefficient36_398, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_400, Icur := OriginalRow227TriangleData0541.coefficient35_399,
    output := OriginalRow227TriangleData0555.coefficient36_399, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_401, Icur := OriginalRow227TriangleData0541.coefficient35_400,
    output := OriginalRow227TriangleData0555.coefficient36_400, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_402, Icur := OriginalRow227TriangleData0541.coefficient35_401,
    output := OriginalRow227TriangleData0555.coefficient36_401, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_403, Icur := OriginalRow227TriangleData0541.coefficient35_402,
    output := OriginalRow227TriangleData0555.coefficient36_402, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_404, Icur := OriginalRow227TriangleData0541.coefficient35_403,
    output := OriginalRow227TriangleData0555.coefficient36_403, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_405, Icur := OriginalRow227TriangleData0541.coefficient35_404,
    output := OriginalRow227TriangleData0555.coefficient36_404, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_406, Icur := OriginalRow227TriangleData0541.coefficient35_405,
    output := OriginalRow227TriangleData0555.coefficient36_405, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_407, Icur := OriginalRow227TriangleData0541.coefficient35_406,
    output := OriginalRow227TriangleData0555.coefficient36_406, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_408, Icur := OriginalRow227TriangleData0541.coefficient35_407,
    output := OriginalRow227TriangleData0555.coefficient36_407, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_409, Icur := OriginalRow227TriangleData0541.coefficient35_408,
    output := OriginalRow227TriangleData0555.coefficient36_408, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_410, Icur := OriginalRow227TriangleData0541.coefficient35_409,
    output := OriginalRow227TriangleData0555.coefficient36_409, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_411, Icur := OriginalRow227TriangleData0541.coefficient35_410,
    output := OriginalRow227TriangleData0555.coefficient36_410, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_412, Icur := OriginalRow227TriangleData0541.coefficient35_411,
    output := OriginalRow227TriangleData0555.coefficient36_411, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_413, Icur := OriginalRow227TriangleData0541.coefficient35_412,
    output := OriginalRow227TriangleData0555.coefficient36_412, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_414, Icur := OriginalRow227TriangleData0541.coefficient35_413,
    output := OriginalRow227TriangleData0555.coefficient36_413, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_415, Icur := OriginalRow227TriangleData0541.coefficient35_414,
    output := OriginalRow227TriangleData0555.coefficient36_414, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_416, Icur := OriginalRow227TriangleData0541.coefficient35_415,
    output := OriginalRow227TriangleData0555.coefficient36_415, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0541.coefficient35_417, Icur := OriginalRow227TriangleData0541.coefficient35_416,
    output := OriginalRow227TriangleData0555.coefficient36_416, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0542.coefficient35_418, Icur := OriginalRow227TriangleData0541.coefficient35_417,
    output := OriginalRow227TriangleData0555.coefficient36_417, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0542.coefficient35_419, Icur := OriginalRow227TriangleData0542.coefficient35_418,
    output := OriginalRow227TriangleData0555.coefficient36_418, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0539

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0539.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
