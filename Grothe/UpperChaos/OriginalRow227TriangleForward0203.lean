import Grothe.UpperChaos.OriginalRow227TriangleData0204
import Grothe.UpperChaos.OriginalRow227TriangleData0205
import Grothe.UpperChaos.OriginalRow227TriangleData0219
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0203
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_397, Icur := OriginalRow227TriangleData0204.coefficient12_396,
    output := OriginalRow227TriangleData0219.coefficient13_396, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_398, Icur := OriginalRow227TriangleData0204.coefficient12_397,
    output := OriginalRow227TriangleData0219.coefficient13_397, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_399, Icur := OriginalRow227TriangleData0204.coefficient12_398,
    output := OriginalRow227TriangleData0219.coefficient13_398, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_400, Icur := OriginalRow227TriangleData0204.coefficient12_399,
    output := OriginalRow227TriangleData0219.coefficient13_399, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_401, Icur := OriginalRow227TriangleData0204.coefficient12_400,
    output := OriginalRow227TriangleData0219.coefficient13_400, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_402, Icur := OriginalRow227TriangleData0204.coefficient12_401,
    output := OriginalRow227TriangleData0219.coefficient13_401, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_403, Icur := OriginalRow227TriangleData0204.coefficient12_402,
    output := OriginalRow227TriangleData0219.coefficient13_402, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_404, Icur := OriginalRow227TriangleData0204.coefficient12_403,
    output := OriginalRow227TriangleData0219.coefficient13_403, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_405, Icur := OriginalRow227TriangleData0204.coefficient12_404,
    output := OriginalRow227TriangleData0219.coefficient13_404, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_406, Icur := OriginalRow227TriangleData0204.coefficient12_405,
    output := OriginalRow227TriangleData0219.coefficient13_405, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_407, Icur := OriginalRow227TriangleData0204.coefficient12_406,
    output := OriginalRow227TriangleData0219.coefficient13_406, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_408, Icur := OriginalRow227TriangleData0204.coefficient12_407,
    output := OriginalRow227TriangleData0219.coefficient13_407, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_409, Icur := OriginalRow227TriangleData0204.coefficient12_408,
    output := OriginalRow227TriangleData0219.coefficient13_408, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_410, Icur := OriginalRow227TriangleData0204.coefficient12_409,
    output := OriginalRow227TriangleData0219.coefficient13_409, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_411, Icur := OriginalRow227TriangleData0204.coefficient12_410,
    output := OriginalRow227TriangleData0219.coefficient13_410, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_412, Icur := OriginalRow227TriangleData0204.coefficient12_411,
    output := OriginalRow227TriangleData0219.coefficient13_411, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_413, Icur := OriginalRow227TriangleData0204.coefficient12_412,
    output := OriginalRow227TriangleData0219.coefficient13_412, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_414, Icur := OriginalRow227TriangleData0204.coefficient12_413,
    output := OriginalRow227TriangleData0219.coefficient13_413, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_415, Icur := OriginalRow227TriangleData0204.coefficient12_414,
    output := OriginalRow227TriangleData0219.coefficient13_414, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_416, Icur := OriginalRow227TriangleData0204.coefficient12_415,
    output := OriginalRow227TriangleData0219.coefficient13_415, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_417, Icur := OriginalRow227TriangleData0204.coefficient12_416,
    output := OriginalRow227TriangleData0219.coefficient13_416, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_418, Icur := OriginalRow227TriangleData0204.coefficient12_417,
    output := OriginalRow227TriangleData0219.coefficient13_417, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_419, Icur := OriginalRow227TriangleData0204.coefficient12_418,
    output := OriginalRow227TriangleData0219.coefficient13_418, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_420, Icur := OriginalRow227TriangleData0204.coefficient12_419,
    output := OriginalRow227TriangleData0219.coefficient13_419, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_421, Icur := OriginalRow227TriangleData0204.coefficient12_420,
    output := OriginalRow227TriangleData0219.coefficient13_420, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_422, Icur := OriginalRow227TriangleData0204.coefficient12_421,
    output := OriginalRow227TriangleData0219.coefficient13_421, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_423, Icur := OriginalRow227TriangleData0204.coefficient12_422,
    output := OriginalRow227TriangleData0219.coefficient13_422, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_424, Icur := OriginalRow227TriangleData0204.coefficient12_423,
    output := OriginalRow227TriangleData0219.coefficient13_423, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_425, Icur := OriginalRow227TriangleData0204.coefficient12_424,
    output := OriginalRow227TriangleData0219.coefficient13_424, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_426, Icur := OriginalRow227TriangleData0204.coefficient12_425,
    output := OriginalRow227TriangleData0219.coefficient13_425, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0205.coefficient12_427, Icur := OriginalRow227TriangleData0204.coefficient12_426,
    output := OriginalRow227TriangleData0219.coefficient13_426, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0205.coefficient12_428, Icur := OriginalRow227TriangleData0205.coefficient12_427,
    output := OriginalRow227TriangleData0219.coefficient13_427, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0203

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0203.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
