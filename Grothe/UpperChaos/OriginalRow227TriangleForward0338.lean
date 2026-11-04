import Grothe.UpperChaos.OriginalRow227TriangleData0339
import Grothe.UpperChaos.OriginalRow227TriangleData0340
import Grothe.UpperChaos.OriginalRow227TriangleData0354
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0338
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_406, Icur := OriginalRow227TriangleData0339.coefficient21_405,
    output := OriginalRow227TriangleData0354.coefficient22_405, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_407, Icur := OriginalRow227TriangleData0339.coefficient21_406,
    output := OriginalRow227TriangleData0354.coefficient22_406, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_408, Icur := OriginalRow227TriangleData0339.coefficient21_407,
    output := OriginalRow227TriangleData0354.coefficient22_407, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_409, Icur := OriginalRow227TriangleData0339.coefficient21_408,
    output := OriginalRow227TriangleData0354.coefficient22_408, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_410, Icur := OriginalRow227TriangleData0339.coefficient21_409,
    output := OriginalRow227TriangleData0354.coefficient22_409, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_411, Icur := OriginalRow227TriangleData0339.coefficient21_410,
    output := OriginalRow227TriangleData0354.coefficient22_410, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_412, Icur := OriginalRow227TriangleData0339.coefficient21_411,
    output := OriginalRow227TriangleData0354.coefficient22_411, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_413, Icur := OriginalRow227TriangleData0339.coefficient21_412,
    output := OriginalRow227TriangleData0354.coefficient22_412, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_414, Icur := OriginalRow227TriangleData0339.coefficient21_413,
    output := OriginalRow227TriangleData0354.coefficient22_413, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_415, Icur := OriginalRow227TriangleData0339.coefficient21_414,
    output := OriginalRow227TriangleData0354.coefficient22_414, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_416, Icur := OriginalRow227TriangleData0339.coefficient21_415,
    output := OriginalRow227TriangleData0354.coefficient22_415, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_417, Icur := OriginalRow227TriangleData0339.coefficient21_416,
    output := OriginalRow227TriangleData0354.coefficient22_416, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_418, Icur := OriginalRow227TriangleData0339.coefficient21_417,
    output := OriginalRow227TriangleData0354.coefficient22_417, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_419, Icur := OriginalRow227TriangleData0339.coefficient21_418,
    output := OriginalRow227TriangleData0354.coefficient22_418, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_420, Icur := OriginalRow227TriangleData0339.coefficient21_419,
    output := OriginalRow227TriangleData0354.coefficient22_419, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_421, Icur := OriginalRow227TriangleData0339.coefficient21_420,
    output := OriginalRow227TriangleData0354.coefficient22_420, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_422, Icur := OriginalRow227TriangleData0339.coefficient21_421,
    output := OriginalRow227TriangleData0354.coefficient22_421, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_423, Icur := OriginalRow227TriangleData0339.coefficient21_422,
    output := OriginalRow227TriangleData0354.coefficient22_422, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_424, Icur := OriginalRow227TriangleData0339.coefficient21_423,
    output := OriginalRow227TriangleData0354.coefficient22_423, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_425, Icur := OriginalRow227TriangleData0339.coefficient21_424,
    output := OriginalRow227TriangleData0354.coefficient22_424, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_426, Icur := OriginalRow227TriangleData0339.coefficient21_425,
    output := OriginalRow227TriangleData0354.coefficient22_425, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_427, Icur := OriginalRow227TriangleData0339.coefficient21_426,
    output := OriginalRow227TriangleData0354.coefficient22_426, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_428, Icur := OriginalRow227TriangleData0339.coefficient21_427,
    output := OriginalRow227TriangleData0354.coefficient22_427, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_429, Icur := OriginalRow227TriangleData0339.coefficient21_428,
    output := OriginalRow227TriangleData0354.coefficient22_428, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_430, Icur := OriginalRow227TriangleData0339.coefficient21_429,
    output := OriginalRow227TriangleData0354.coefficient22_429, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_431, Icur := OriginalRow227TriangleData0339.coefficient21_430,
    output := OriginalRow227TriangleData0354.coefficient22_430, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_432, Icur := OriginalRow227TriangleData0339.coefficient21_431,
    output := OriginalRow227TriangleData0354.coefficient22_431, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_433, Icur := OriginalRow227TriangleData0339.coefficient21_432,
    output := OriginalRow227TriangleData0354.coefficient22_432, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_434, Icur := OriginalRow227TriangleData0339.coefficient21_433,
    output := OriginalRow227TriangleData0354.coefficient22_433, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0339.coefficient21_435, Icur := OriginalRow227TriangleData0339.coefficient21_434,
    output := OriginalRow227TriangleData0354.coefficient22_434, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0340.coefficient21_436, Icur := OriginalRow227TriangleData0339.coefficient21_435,
    output := OriginalRow227TriangleData0354.coefficient22_435, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root22,
    Inext := OriginalRow227TriangleData0340.coefficient21_437, Icur := OriginalRow227TriangleData0340.coefficient21_436,
    output := OriginalRow227TriangleData0354.coefficient22_436, hC := OriginalRow227TriangleRoots00.root22_pos, hAC := OriginalRow227TriangleRoots00.product22_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0338

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0338.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
