import Grothe.UpperChaos.OriginalRow227TriangleData0234
import Grothe.UpperChaos.OriginalRow227TriangleData0235
import Grothe.UpperChaos.OriginalRow227TriangleData0249
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0233
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_399, Icur := OriginalRow227TriangleData0234.coefficient14_398,
    output := OriginalRow227TriangleData0249.coefficient15_398, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_400, Icur := OriginalRow227TriangleData0234.coefficient14_399,
    output := OriginalRow227TriangleData0249.coefficient15_399, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_401, Icur := OriginalRow227TriangleData0234.coefficient14_400,
    output := OriginalRow227TriangleData0249.coefficient15_400, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_402, Icur := OriginalRow227TriangleData0234.coefficient14_401,
    output := OriginalRow227TriangleData0249.coefficient15_401, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_403, Icur := OriginalRow227TriangleData0234.coefficient14_402,
    output := OriginalRow227TriangleData0249.coefficient15_402, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_404, Icur := OriginalRow227TriangleData0234.coefficient14_403,
    output := OriginalRow227TriangleData0249.coefficient15_403, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_405, Icur := OriginalRow227TriangleData0234.coefficient14_404,
    output := OriginalRow227TriangleData0249.coefficient15_404, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_406, Icur := OriginalRow227TriangleData0234.coefficient14_405,
    output := OriginalRow227TriangleData0249.coefficient15_405, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_407, Icur := OriginalRow227TriangleData0234.coefficient14_406,
    output := OriginalRow227TriangleData0249.coefficient15_406, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_408, Icur := OriginalRow227TriangleData0234.coefficient14_407,
    output := OriginalRow227TriangleData0249.coefficient15_407, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_409, Icur := OriginalRow227TriangleData0234.coefficient14_408,
    output := OriginalRow227TriangleData0249.coefficient15_408, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_410, Icur := OriginalRow227TriangleData0234.coefficient14_409,
    output := OriginalRow227TriangleData0249.coefficient15_409, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_411, Icur := OriginalRow227TriangleData0234.coefficient14_410,
    output := OriginalRow227TriangleData0249.coefficient15_410, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_412, Icur := OriginalRow227TriangleData0234.coefficient14_411,
    output := OriginalRow227TriangleData0249.coefficient15_411, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_413, Icur := OriginalRow227TriangleData0234.coefficient14_412,
    output := OriginalRow227TriangleData0249.coefficient15_412, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_414, Icur := OriginalRow227TriangleData0234.coefficient14_413,
    output := OriginalRow227TriangleData0249.coefficient15_413, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_415, Icur := OriginalRow227TriangleData0234.coefficient14_414,
    output := OriginalRow227TriangleData0249.coefficient15_414, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_416, Icur := OriginalRow227TriangleData0234.coefficient14_415,
    output := OriginalRow227TriangleData0249.coefficient15_415, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_417, Icur := OriginalRow227TriangleData0234.coefficient14_416,
    output := OriginalRow227TriangleData0249.coefficient15_416, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_418, Icur := OriginalRow227TriangleData0234.coefficient14_417,
    output := OriginalRow227TriangleData0249.coefficient15_417, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_419, Icur := OriginalRow227TriangleData0234.coefficient14_418,
    output := OriginalRow227TriangleData0249.coefficient15_418, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_420, Icur := OriginalRow227TriangleData0234.coefficient14_419,
    output := OriginalRow227TriangleData0249.coefficient15_419, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_421, Icur := OriginalRow227TriangleData0234.coefficient14_420,
    output := OriginalRow227TriangleData0249.coefficient15_420, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_422, Icur := OriginalRow227TriangleData0234.coefficient14_421,
    output := OriginalRow227TriangleData0249.coefficient15_421, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_423, Icur := OriginalRow227TriangleData0234.coefficient14_422,
    output := OriginalRow227TriangleData0249.coefficient15_422, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_424, Icur := OriginalRow227TriangleData0234.coefficient14_423,
    output := OriginalRow227TriangleData0249.coefficient15_423, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_425, Icur := OriginalRow227TriangleData0234.coefficient14_424,
    output := OriginalRow227TriangleData0249.coefficient15_424, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_426, Icur := OriginalRow227TriangleData0234.coefficient14_425,
    output := OriginalRow227TriangleData0249.coefficient15_425, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_427, Icur := OriginalRow227TriangleData0234.coefficient14_426,
    output := OriginalRow227TriangleData0249.coefficient15_426, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0234.coefficient14_428, Icur := OriginalRow227TriangleData0234.coefficient14_427,
    output := OriginalRow227TriangleData0249.coefficient15_427, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_429, Icur := OriginalRow227TriangleData0234.coefficient14_428,
    output := OriginalRow227TriangleData0249.coefficient15_428, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_430, Icur := OriginalRow227TriangleData0235.coefficient14_429,
    output := OriginalRow227TriangleData0249.coefficient15_429, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0233

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0233.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
