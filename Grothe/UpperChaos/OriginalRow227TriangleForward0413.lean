import Grothe.UpperChaos.OriginalRow227TriangleData0414
import Grothe.UpperChaos.OriginalRow227TriangleData0415
import Grothe.UpperChaos.OriginalRow227TriangleData0429
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0413
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_411, Icur := OriginalRow227TriangleData0414.coefficient26_410,
    output := OriginalRow227TriangleData0429.coefficient27_410, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_412, Icur := OriginalRow227TriangleData0414.coefficient26_411,
    output := OriginalRow227TriangleData0429.coefficient27_411, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_413, Icur := OriginalRow227TriangleData0414.coefficient26_412,
    output := OriginalRow227TriangleData0429.coefficient27_412, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_414, Icur := OriginalRow227TriangleData0414.coefficient26_413,
    output := OriginalRow227TriangleData0429.coefficient27_413, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_415, Icur := OriginalRow227TriangleData0414.coefficient26_414,
    output := OriginalRow227TriangleData0429.coefficient27_414, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_416, Icur := OriginalRow227TriangleData0414.coefficient26_415,
    output := OriginalRow227TriangleData0429.coefficient27_415, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_417, Icur := OriginalRow227TriangleData0414.coefficient26_416,
    output := OriginalRow227TriangleData0429.coefficient27_416, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_418, Icur := OriginalRow227TriangleData0414.coefficient26_417,
    output := OriginalRow227TriangleData0429.coefficient27_417, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_419, Icur := OriginalRow227TriangleData0414.coefficient26_418,
    output := OriginalRow227TriangleData0429.coefficient27_418, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_420, Icur := OriginalRow227TriangleData0414.coefficient26_419,
    output := OriginalRow227TriangleData0429.coefficient27_419, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_421, Icur := OriginalRow227TriangleData0414.coefficient26_420,
    output := OriginalRow227TriangleData0429.coefficient27_420, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_422, Icur := OriginalRow227TriangleData0414.coefficient26_421,
    output := OriginalRow227TriangleData0429.coefficient27_421, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_423, Icur := OriginalRow227TriangleData0414.coefficient26_422,
    output := OriginalRow227TriangleData0429.coefficient27_422, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_424, Icur := OriginalRow227TriangleData0414.coefficient26_423,
    output := OriginalRow227TriangleData0429.coefficient27_423, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_425, Icur := OriginalRow227TriangleData0414.coefficient26_424,
    output := OriginalRow227TriangleData0429.coefficient27_424, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_426, Icur := OriginalRow227TriangleData0414.coefficient26_425,
    output := OriginalRow227TriangleData0429.coefficient27_425, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_427, Icur := OriginalRow227TriangleData0414.coefficient26_426,
    output := OriginalRow227TriangleData0429.coefficient27_426, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_428, Icur := OriginalRow227TriangleData0414.coefficient26_427,
    output := OriginalRow227TriangleData0429.coefficient27_427, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_429, Icur := OriginalRow227TriangleData0414.coefficient26_428,
    output := OriginalRow227TriangleData0429.coefficient27_428, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_430, Icur := OriginalRow227TriangleData0414.coefficient26_429,
    output := OriginalRow227TriangleData0429.coefficient27_429, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_431, Icur := OriginalRow227TriangleData0414.coefficient26_430,
    output := OriginalRow227TriangleData0429.coefficient27_430, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_432, Icur := OriginalRow227TriangleData0414.coefficient26_431,
    output := OriginalRow227TriangleData0429.coefficient27_431, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_433, Icur := OriginalRow227TriangleData0414.coefficient26_432,
    output := OriginalRow227TriangleData0429.coefficient27_432, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_434, Icur := OriginalRow227TriangleData0414.coefficient26_433,
    output := OriginalRow227TriangleData0429.coefficient27_433, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_435, Icur := OriginalRow227TriangleData0414.coefficient26_434,
    output := OriginalRow227TriangleData0429.coefficient27_434, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_436, Icur := OriginalRow227TriangleData0414.coefficient26_435,
    output := OriginalRow227TriangleData0429.coefficient27_435, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_437, Icur := OriginalRow227TriangleData0414.coefficient26_436,
    output := OriginalRow227TriangleData0429.coefficient27_436, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_438, Icur := OriginalRow227TriangleData0414.coefficient26_437,
    output := OriginalRow227TriangleData0429.coefficient27_437, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_439, Icur := OriginalRow227TriangleData0414.coefficient26_438,
    output := OriginalRow227TriangleData0429.coefficient27_438, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0414.coefficient26_440, Icur := OriginalRow227TriangleData0414.coefficient26_439,
    output := OriginalRow227TriangleData0429.coefficient27_439, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0415.coefficient26_441, Icur := OriginalRow227TriangleData0414.coefficient26_440,
    output := OriginalRow227TriangleData0429.coefficient27_440, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0415.coefficient26_442, Icur := OriginalRow227TriangleData0415.coefficient26_441,
    output := OriginalRow227TriangleData0429.coefficient27_441, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0413

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0413.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
