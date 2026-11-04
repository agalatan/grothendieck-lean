import Grothe.UpperChaos.OriginalRow227TriangleData0399
import Grothe.UpperChaos.OriginalRow227TriangleData0400
import Grothe.UpperChaos.OriginalRow227TriangleData0414
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0398
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_410, Icur := OriginalRow227TriangleData0399.coefficient25_409,
    output := OriginalRow227TriangleData0414.coefficient26_409, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_411, Icur := OriginalRow227TriangleData0399.coefficient25_410,
    output := OriginalRow227TriangleData0414.coefficient26_410, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_412, Icur := OriginalRow227TriangleData0399.coefficient25_411,
    output := OriginalRow227TriangleData0414.coefficient26_411, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_413, Icur := OriginalRow227TriangleData0399.coefficient25_412,
    output := OriginalRow227TriangleData0414.coefficient26_412, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_414, Icur := OriginalRow227TriangleData0399.coefficient25_413,
    output := OriginalRow227TriangleData0414.coefficient26_413, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_415, Icur := OriginalRow227TriangleData0399.coefficient25_414,
    output := OriginalRow227TriangleData0414.coefficient26_414, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_416, Icur := OriginalRow227TriangleData0399.coefficient25_415,
    output := OriginalRow227TriangleData0414.coefficient26_415, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_417, Icur := OriginalRow227TriangleData0399.coefficient25_416,
    output := OriginalRow227TriangleData0414.coefficient26_416, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_418, Icur := OriginalRow227TriangleData0399.coefficient25_417,
    output := OriginalRow227TriangleData0414.coefficient26_417, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_419, Icur := OriginalRow227TriangleData0399.coefficient25_418,
    output := OriginalRow227TriangleData0414.coefficient26_418, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_420, Icur := OriginalRow227TriangleData0399.coefficient25_419,
    output := OriginalRow227TriangleData0414.coefficient26_419, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_421, Icur := OriginalRow227TriangleData0399.coefficient25_420,
    output := OriginalRow227TriangleData0414.coefficient26_420, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_422, Icur := OriginalRow227TriangleData0399.coefficient25_421,
    output := OriginalRow227TriangleData0414.coefficient26_421, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_423, Icur := OriginalRow227TriangleData0399.coefficient25_422,
    output := OriginalRow227TriangleData0414.coefficient26_422, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_424, Icur := OriginalRow227TriangleData0399.coefficient25_423,
    output := OriginalRow227TriangleData0414.coefficient26_423, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_425, Icur := OriginalRow227TriangleData0399.coefficient25_424,
    output := OriginalRow227TriangleData0414.coefficient26_424, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_426, Icur := OriginalRow227TriangleData0399.coefficient25_425,
    output := OriginalRow227TriangleData0414.coefficient26_425, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_427, Icur := OriginalRow227TriangleData0399.coefficient25_426,
    output := OriginalRow227TriangleData0414.coefficient26_426, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_428, Icur := OriginalRow227TriangleData0399.coefficient25_427,
    output := OriginalRow227TriangleData0414.coefficient26_427, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_429, Icur := OriginalRow227TriangleData0399.coefficient25_428,
    output := OriginalRow227TriangleData0414.coefficient26_428, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_430, Icur := OriginalRow227TriangleData0399.coefficient25_429,
    output := OriginalRow227TriangleData0414.coefficient26_429, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_431, Icur := OriginalRow227TriangleData0399.coefficient25_430,
    output := OriginalRow227TriangleData0414.coefficient26_430, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_432, Icur := OriginalRow227TriangleData0399.coefficient25_431,
    output := OriginalRow227TriangleData0414.coefficient26_431, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_433, Icur := OriginalRow227TriangleData0399.coefficient25_432,
    output := OriginalRow227TriangleData0414.coefficient26_432, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_434, Icur := OriginalRow227TriangleData0399.coefficient25_433,
    output := OriginalRow227TriangleData0414.coefficient26_433, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_435, Icur := OriginalRow227TriangleData0399.coefficient25_434,
    output := OriginalRow227TriangleData0414.coefficient26_434, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_436, Icur := OriginalRow227TriangleData0399.coefficient25_435,
    output := OriginalRow227TriangleData0414.coefficient26_435, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_437, Icur := OriginalRow227TriangleData0399.coefficient25_436,
    output := OriginalRow227TriangleData0414.coefficient26_436, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_438, Icur := OriginalRow227TriangleData0399.coefficient25_437,
    output := OriginalRow227TriangleData0414.coefficient26_437, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0399.coefficient25_439, Icur := OriginalRow227TriangleData0399.coefficient25_438,
    output := OriginalRow227TriangleData0414.coefficient26_438, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0400.coefficient25_440, Icur := OriginalRow227TriangleData0399.coefficient25_439,
    output := OriginalRow227TriangleData0414.coefficient26_439, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0400.coefficient25_441, Icur := OriginalRow227TriangleData0400.coefficient25_440,
    output := OriginalRow227TriangleData0414.coefficient26_440, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0398

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0398.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
