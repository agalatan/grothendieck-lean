import Grothe.UpperChaos.OriginalRow227TriangleData0706
import Grothe.UpperChaos.OriginalRow227TriangleData0707
import Grothe.UpperChaos.OriginalRow227TriangleData0719
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0703
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_400, Icur := OriginalRow227TriangleData0706.coefficient47_399,
    output := OriginalRow227TriangleData0719.coefficient48_399, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_401, Icur := OriginalRow227TriangleData0706.coefficient47_400,
    output := OriginalRow227TriangleData0719.coefficient48_400, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_402, Icur := OriginalRow227TriangleData0706.coefficient47_401,
    output := OriginalRow227TriangleData0719.coefficient48_401, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_403, Icur := OriginalRow227TriangleData0706.coefficient47_402,
    output := OriginalRow227TriangleData0719.coefficient48_402, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_404, Icur := OriginalRow227TriangleData0706.coefficient47_403,
    output := OriginalRow227TriangleData0719.coefficient48_403, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_405, Icur := OriginalRow227TriangleData0706.coefficient47_404,
    output := OriginalRow227TriangleData0719.coefficient48_404, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_406, Icur := OriginalRow227TriangleData0706.coefficient47_405,
    output := OriginalRow227TriangleData0719.coefficient48_405, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_407, Icur := OriginalRow227TriangleData0706.coefficient47_406,
    output := OriginalRow227TriangleData0719.coefficient48_406, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_408, Icur := OriginalRow227TriangleData0706.coefficient47_407,
    output := OriginalRow227TriangleData0719.coefficient48_407, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_409, Icur := OriginalRow227TriangleData0706.coefficient47_408,
    output := OriginalRow227TriangleData0719.coefficient48_408, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_410, Icur := OriginalRow227TriangleData0706.coefficient47_409,
    output := OriginalRow227TriangleData0719.coefficient48_409, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_411, Icur := OriginalRow227TriangleData0706.coefficient47_410,
    output := OriginalRow227TriangleData0719.coefficient48_410, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_412, Icur := OriginalRow227TriangleData0706.coefficient47_411,
    output := OriginalRow227TriangleData0719.coefficient48_411, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_413, Icur := OriginalRow227TriangleData0706.coefficient47_412,
    output := OriginalRow227TriangleData0719.coefficient48_412, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_414, Icur := OriginalRow227TriangleData0706.coefficient47_413,
    output := OriginalRow227TriangleData0719.coefficient48_413, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_415, Icur := OriginalRow227TriangleData0706.coefficient47_414,
    output := OriginalRow227TriangleData0719.coefficient48_414, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_416, Icur := OriginalRow227TriangleData0706.coefficient47_415,
    output := OriginalRow227TriangleData0719.coefficient48_415, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_417, Icur := OriginalRow227TriangleData0706.coefficient47_416,
    output := OriginalRow227TriangleData0719.coefficient48_416, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_418, Icur := OriginalRow227TriangleData0706.coefficient47_417,
    output := OriginalRow227TriangleData0719.coefficient48_417, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_419, Icur := OriginalRow227TriangleData0706.coefficient47_418,
    output := OriginalRow227TriangleData0719.coefficient48_418, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_420, Icur := OriginalRow227TriangleData0706.coefficient47_419,
    output := OriginalRow227TriangleData0719.coefficient48_419, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_421, Icur := OriginalRow227TriangleData0706.coefficient47_420,
    output := OriginalRow227TriangleData0719.coefficient48_420, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_422, Icur := OriginalRow227TriangleData0706.coefficient47_421,
    output := OriginalRow227TriangleData0719.coefficient48_421, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_423, Icur := OriginalRow227TriangleData0706.coefficient47_422,
    output := OriginalRow227TriangleData0719.coefficient48_422, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_424, Icur := OriginalRow227TriangleData0706.coefficient47_423,
    output := OriginalRow227TriangleData0719.coefficient48_423, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_425, Icur := OriginalRow227TriangleData0706.coefficient47_424,
    output := OriginalRow227TriangleData0719.coefficient48_424, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_426, Icur := OriginalRow227TriangleData0706.coefficient47_425,
    output := OriginalRow227TriangleData0719.coefficient48_425, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_427, Icur := OriginalRow227TriangleData0706.coefficient47_426,
    output := OriginalRow227TriangleData0719.coefficient48_426, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_428, Icur := OriginalRow227TriangleData0706.coefficient47_427,
    output := OriginalRow227TriangleData0719.coefficient48_427, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_429, Icur := OriginalRow227TriangleData0706.coefficient47_428,
    output := OriginalRow227TriangleData0719.coefficient48_428, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0707.coefficient47_430, Icur := OriginalRow227TriangleData0706.coefficient47_429,
    output := OriginalRow227TriangleData0719.coefficient48_429, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0707.coefficient47_431, Icur := OriginalRow227TriangleData0707.coefficient47_430,
    output := OriginalRow227TriangleData0719.coefficient48_430, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0703

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0703.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
