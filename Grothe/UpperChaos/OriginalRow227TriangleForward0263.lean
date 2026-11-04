import Grothe.UpperChaos.OriginalRow227TriangleData0264
import Grothe.UpperChaos.OriginalRow227TriangleData0265
import Grothe.UpperChaos.OriginalRow227TriangleData0279
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0263
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_401, Icur := OriginalRow227TriangleData0264.coefficient16_400,
    output := OriginalRow227TriangleData0279.coefficient17_400, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_402, Icur := OriginalRow227TriangleData0264.coefficient16_401,
    output := OriginalRow227TriangleData0279.coefficient17_401, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_403, Icur := OriginalRow227TriangleData0264.coefficient16_402,
    output := OriginalRow227TriangleData0279.coefficient17_402, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_404, Icur := OriginalRow227TriangleData0264.coefficient16_403,
    output := OriginalRow227TriangleData0279.coefficient17_403, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_405, Icur := OriginalRow227TriangleData0264.coefficient16_404,
    output := OriginalRow227TriangleData0279.coefficient17_404, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_406, Icur := OriginalRow227TriangleData0264.coefficient16_405,
    output := OriginalRow227TriangleData0279.coefficient17_405, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_407, Icur := OriginalRow227TriangleData0264.coefficient16_406,
    output := OriginalRow227TriangleData0279.coefficient17_406, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_408, Icur := OriginalRow227TriangleData0264.coefficient16_407,
    output := OriginalRow227TriangleData0279.coefficient17_407, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_409, Icur := OriginalRow227TriangleData0264.coefficient16_408,
    output := OriginalRow227TriangleData0279.coefficient17_408, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_410, Icur := OriginalRow227TriangleData0264.coefficient16_409,
    output := OriginalRow227TriangleData0279.coefficient17_409, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_411, Icur := OriginalRow227TriangleData0264.coefficient16_410,
    output := OriginalRow227TriangleData0279.coefficient17_410, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_412, Icur := OriginalRow227TriangleData0264.coefficient16_411,
    output := OriginalRow227TriangleData0279.coefficient17_411, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_413, Icur := OriginalRow227TriangleData0264.coefficient16_412,
    output := OriginalRow227TriangleData0279.coefficient17_412, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_414, Icur := OriginalRow227TriangleData0264.coefficient16_413,
    output := OriginalRow227TriangleData0279.coefficient17_413, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_415, Icur := OriginalRow227TriangleData0264.coefficient16_414,
    output := OriginalRow227TriangleData0279.coefficient17_414, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_416, Icur := OriginalRow227TriangleData0264.coefficient16_415,
    output := OriginalRow227TriangleData0279.coefficient17_415, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_417, Icur := OriginalRow227TriangleData0264.coefficient16_416,
    output := OriginalRow227TriangleData0279.coefficient17_416, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_418, Icur := OriginalRow227TriangleData0264.coefficient16_417,
    output := OriginalRow227TriangleData0279.coefficient17_417, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_419, Icur := OriginalRow227TriangleData0264.coefficient16_418,
    output := OriginalRow227TriangleData0279.coefficient17_418, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_420, Icur := OriginalRow227TriangleData0264.coefficient16_419,
    output := OriginalRow227TriangleData0279.coefficient17_419, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_421, Icur := OriginalRow227TriangleData0264.coefficient16_420,
    output := OriginalRow227TriangleData0279.coefficient17_420, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_422, Icur := OriginalRow227TriangleData0264.coefficient16_421,
    output := OriginalRow227TriangleData0279.coefficient17_421, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_423, Icur := OriginalRow227TriangleData0264.coefficient16_422,
    output := OriginalRow227TriangleData0279.coefficient17_422, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_424, Icur := OriginalRow227TriangleData0264.coefficient16_423,
    output := OriginalRow227TriangleData0279.coefficient17_423, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_425, Icur := OriginalRow227TriangleData0264.coefficient16_424,
    output := OriginalRow227TriangleData0279.coefficient17_424, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_426, Icur := OriginalRow227TriangleData0264.coefficient16_425,
    output := OriginalRow227TriangleData0279.coefficient17_425, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_427, Icur := OriginalRow227TriangleData0264.coefficient16_426,
    output := OriginalRow227TriangleData0279.coefficient17_426, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_428, Icur := OriginalRow227TriangleData0264.coefficient16_427,
    output := OriginalRow227TriangleData0279.coefficient17_427, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_429, Icur := OriginalRow227TriangleData0264.coefficient16_428,
    output := OriginalRow227TriangleData0279.coefficient17_428, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0264.coefficient16_430, Icur := OriginalRow227TriangleData0264.coefficient16_429,
    output := OriginalRow227TriangleData0279.coefficient17_429, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_431, Icur := OriginalRow227TriangleData0264.coefficient16_430,
    output := OriginalRow227TriangleData0279.coefficient17_430, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_432, Icur := OriginalRow227TriangleData0265.coefficient16_431,
    output := OriginalRow227TriangleData0279.coefficient17_431, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0263

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0263.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
