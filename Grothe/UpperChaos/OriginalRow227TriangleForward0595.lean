import Grothe.UpperChaos.OriginalRow227TriangleData0597
import Grothe.UpperChaos.OriginalRow227TriangleData0598
import Grothe.UpperChaos.OriginalRow227TriangleData0611
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0595
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_392, Icur := OriginalRow227TriangleData0597.coefficient39_391,
    output := OriginalRow227TriangleData0611.coefficient40_391, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_393, Icur := OriginalRow227TriangleData0597.coefficient39_392,
    output := OriginalRow227TriangleData0611.coefficient40_392, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_394, Icur := OriginalRow227TriangleData0597.coefficient39_393,
    output := OriginalRow227TriangleData0611.coefficient40_393, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_395, Icur := OriginalRow227TriangleData0597.coefficient39_394,
    output := OriginalRow227TriangleData0611.coefficient40_394, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_396, Icur := OriginalRow227TriangleData0597.coefficient39_395,
    output := OriginalRow227TriangleData0611.coefficient40_395, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_397, Icur := OriginalRow227TriangleData0597.coefficient39_396,
    output := OriginalRow227TriangleData0611.coefficient40_396, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_398, Icur := OriginalRow227TriangleData0597.coefficient39_397,
    output := OriginalRow227TriangleData0611.coefficient40_397, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_399, Icur := OriginalRow227TriangleData0597.coefficient39_398,
    output := OriginalRow227TriangleData0611.coefficient40_398, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_400, Icur := OriginalRow227TriangleData0597.coefficient39_399,
    output := OriginalRow227TriangleData0611.coefficient40_399, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_401, Icur := OriginalRow227TriangleData0597.coefficient39_400,
    output := OriginalRow227TriangleData0611.coefficient40_400, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_402, Icur := OriginalRow227TriangleData0597.coefficient39_401,
    output := OriginalRow227TriangleData0611.coefficient40_401, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_403, Icur := OriginalRow227TriangleData0597.coefficient39_402,
    output := OriginalRow227TriangleData0611.coefficient40_402, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_404, Icur := OriginalRow227TriangleData0597.coefficient39_403,
    output := OriginalRow227TriangleData0611.coefficient40_403, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_405, Icur := OriginalRow227TriangleData0597.coefficient39_404,
    output := OriginalRow227TriangleData0611.coefficient40_404, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_406, Icur := OriginalRow227TriangleData0597.coefficient39_405,
    output := OriginalRow227TriangleData0611.coefficient40_405, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_407, Icur := OriginalRow227TriangleData0597.coefficient39_406,
    output := OriginalRow227TriangleData0611.coefficient40_406, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_408, Icur := OriginalRow227TriangleData0597.coefficient39_407,
    output := OriginalRow227TriangleData0611.coefficient40_407, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_409, Icur := OriginalRow227TriangleData0597.coefficient39_408,
    output := OriginalRow227TriangleData0611.coefficient40_408, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_410, Icur := OriginalRow227TriangleData0597.coefficient39_409,
    output := OriginalRow227TriangleData0611.coefficient40_409, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_411, Icur := OriginalRow227TriangleData0597.coefficient39_410,
    output := OriginalRow227TriangleData0611.coefficient40_410, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_412, Icur := OriginalRow227TriangleData0597.coefficient39_411,
    output := OriginalRow227TriangleData0611.coefficient40_411, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_413, Icur := OriginalRow227TriangleData0597.coefficient39_412,
    output := OriginalRow227TriangleData0611.coefficient40_412, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_414, Icur := OriginalRow227TriangleData0597.coefficient39_413,
    output := OriginalRow227TriangleData0611.coefficient40_413, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_415, Icur := OriginalRow227TriangleData0597.coefficient39_414,
    output := OriginalRow227TriangleData0611.coefficient40_414, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_416, Icur := OriginalRow227TriangleData0597.coefficient39_415,
    output := OriginalRow227TriangleData0611.coefficient40_415, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_417, Icur := OriginalRow227TriangleData0597.coefficient39_416,
    output := OriginalRow227TriangleData0611.coefficient40_416, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_418, Icur := OriginalRow227TriangleData0597.coefficient39_417,
    output := OriginalRow227TriangleData0611.coefficient40_417, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_419, Icur := OriginalRow227TriangleData0597.coefficient39_418,
    output := OriginalRow227TriangleData0611.coefficient40_418, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_420, Icur := OriginalRow227TriangleData0597.coefficient39_419,
    output := OriginalRow227TriangleData0611.coefficient40_419, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0597.coefficient39_421, Icur := OriginalRow227TriangleData0597.coefficient39_420,
    output := OriginalRow227TriangleData0611.coefficient40_420, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_422, Icur := OriginalRow227TriangleData0597.coefficient39_421,
    output := OriginalRow227TriangleData0611.coefficient40_421, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_423, Icur := OriginalRow227TriangleData0598.coefficient39_422,
    output := OriginalRow227TriangleData0611.coefficient40_422, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0595

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0595.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
