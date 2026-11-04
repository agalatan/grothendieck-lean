import Grothe.UpperChaos.OriginalRow227TriangleData0693
import Grothe.UpperChaos.OriginalRow227TriangleData0694
import Grothe.UpperChaos.OriginalRow227TriangleData0706
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0690
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_399, Icur := OriginalRow227TriangleData0693.coefficient46_398,
    output := OriginalRow227TriangleData0706.coefficient47_398, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_400, Icur := OriginalRow227TriangleData0693.coefficient46_399,
    output := OriginalRow227TriangleData0706.coefficient47_399, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_401, Icur := OriginalRow227TriangleData0693.coefficient46_400,
    output := OriginalRow227TriangleData0706.coefficient47_400, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_402, Icur := OriginalRow227TriangleData0693.coefficient46_401,
    output := OriginalRow227TriangleData0706.coefficient47_401, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_403, Icur := OriginalRow227TriangleData0693.coefficient46_402,
    output := OriginalRow227TriangleData0706.coefficient47_402, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_404, Icur := OriginalRow227TriangleData0693.coefficient46_403,
    output := OriginalRow227TriangleData0706.coefficient47_403, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_405, Icur := OriginalRow227TriangleData0693.coefficient46_404,
    output := OriginalRow227TriangleData0706.coefficient47_404, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_406, Icur := OriginalRow227TriangleData0693.coefficient46_405,
    output := OriginalRow227TriangleData0706.coefficient47_405, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_407, Icur := OriginalRow227TriangleData0693.coefficient46_406,
    output := OriginalRow227TriangleData0706.coefficient47_406, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_408, Icur := OriginalRow227TriangleData0693.coefficient46_407,
    output := OriginalRow227TriangleData0706.coefficient47_407, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_409, Icur := OriginalRow227TriangleData0693.coefficient46_408,
    output := OriginalRow227TriangleData0706.coefficient47_408, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_410, Icur := OriginalRow227TriangleData0693.coefficient46_409,
    output := OriginalRow227TriangleData0706.coefficient47_409, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_411, Icur := OriginalRow227TriangleData0693.coefficient46_410,
    output := OriginalRow227TriangleData0706.coefficient47_410, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_412, Icur := OriginalRow227TriangleData0693.coefficient46_411,
    output := OriginalRow227TriangleData0706.coefficient47_411, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_413, Icur := OriginalRow227TriangleData0693.coefficient46_412,
    output := OriginalRow227TriangleData0706.coefficient47_412, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_414, Icur := OriginalRow227TriangleData0693.coefficient46_413,
    output := OriginalRow227TriangleData0706.coefficient47_413, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_415, Icur := OriginalRow227TriangleData0693.coefficient46_414,
    output := OriginalRow227TriangleData0706.coefficient47_414, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_416, Icur := OriginalRow227TriangleData0693.coefficient46_415,
    output := OriginalRow227TriangleData0706.coefficient47_415, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_417, Icur := OriginalRow227TriangleData0693.coefficient46_416,
    output := OriginalRow227TriangleData0706.coefficient47_416, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_418, Icur := OriginalRow227TriangleData0693.coefficient46_417,
    output := OriginalRow227TriangleData0706.coefficient47_417, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_419, Icur := OriginalRow227TriangleData0693.coefficient46_418,
    output := OriginalRow227TriangleData0706.coefficient47_418, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_420, Icur := OriginalRow227TriangleData0693.coefficient46_419,
    output := OriginalRow227TriangleData0706.coefficient47_419, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_421, Icur := OriginalRow227TriangleData0693.coefficient46_420,
    output := OriginalRow227TriangleData0706.coefficient47_420, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_422, Icur := OriginalRow227TriangleData0693.coefficient46_421,
    output := OriginalRow227TriangleData0706.coefficient47_421, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_423, Icur := OriginalRow227TriangleData0693.coefficient46_422,
    output := OriginalRow227TriangleData0706.coefficient47_422, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_424, Icur := OriginalRow227TriangleData0693.coefficient46_423,
    output := OriginalRow227TriangleData0706.coefficient47_423, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_425, Icur := OriginalRow227TriangleData0693.coefficient46_424,
    output := OriginalRow227TriangleData0706.coefficient47_424, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_426, Icur := OriginalRow227TriangleData0693.coefficient46_425,
    output := OriginalRow227TriangleData0706.coefficient47_425, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_427, Icur := OriginalRow227TriangleData0693.coefficient46_426,
    output := OriginalRow227TriangleData0706.coefficient47_426, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0693.coefficient46_428, Icur := OriginalRow227TriangleData0693.coefficient46_427,
    output := OriginalRow227TriangleData0706.coefficient47_427, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_429, Icur := OriginalRow227TriangleData0693.coefficient46_428,
    output := OriginalRow227TriangleData0706.coefficient47_428, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_430, Icur := OriginalRow227TriangleData0694.coefficient46_429,
    output := OriginalRow227TriangleData0706.coefficient47_429, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0690

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0690.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
