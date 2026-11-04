import Grothe.UpperChaos.OriginalRow227TriangleData0810
import Grothe.UpperChaos.OriginalRow227TriangleData0811
import Grothe.UpperChaos.OriginalRow227TriangleData0823
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0807
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_408, Icur := OriginalRow227TriangleData0810.coefficient55_407,
    output := OriginalRow227TriangleData0823.coefficient56_407, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_409, Icur := OriginalRow227TriangleData0810.coefficient55_408,
    output := OriginalRow227TriangleData0823.coefficient56_408, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_410, Icur := OriginalRow227TriangleData0810.coefficient55_409,
    output := OriginalRow227TriangleData0823.coefficient56_409, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_411, Icur := OriginalRow227TriangleData0810.coefficient55_410,
    output := OriginalRow227TriangleData0823.coefficient56_410, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_412, Icur := OriginalRow227TriangleData0810.coefficient55_411,
    output := OriginalRow227TriangleData0823.coefficient56_411, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_413, Icur := OriginalRow227TriangleData0810.coefficient55_412,
    output := OriginalRow227TriangleData0823.coefficient56_412, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_414, Icur := OriginalRow227TriangleData0810.coefficient55_413,
    output := OriginalRow227TriangleData0823.coefficient56_413, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_415, Icur := OriginalRow227TriangleData0810.coefficient55_414,
    output := OriginalRow227TriangleData0823.coefficient56_414, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_416, Icur := OriginalRow227TriangleData0810.coefficient55_415,
    output := OriginalRow227TriangleData0823.coefficient56_415, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_417, Icur := OriginalRow227TriangleData0810.coefficient55_416,
    output := OriginalRow227TriangleData0823.coefficient56_416, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_418, Icur := OriginalRow227TriangleData0810.coefficient55_417,
    output := OriginalRow227TriangleData0823.coefficient56_417, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_419, Icur := OriginalRow227TriangleData0810.coefficient55_418,
    output := OriginalRow227TriangleData0823.coefficient56_418, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_420, Icur := OriginalRow227TriangleData0810.coefficient55_419,
    output := OriginalRow227TriangleData0823.coefficient56_419, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_421, Icur := OriginalRow227TriangleData0810.coefficient55_420,
    output := OriginalRow227TriangleData0823.coefficient56_420, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_422, Icur := OriginalRow227TriangleData0810.coefficient55_421,
    output := OriginalRow227TriangleData0823.coefficient56_421, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_423, Icur := OriginalRow227TriangleData0810.coefficient55_422,
    output := OriginalRow227TriangleData0823.coefficient56_422, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_424, Icur := OriginalRow227TriangleData0810.coefficient55_423,
    output := OriginalRow227TriangleData0823.coefficient56_423, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_425, Icur := OriginalRow227TriangleData0810.coefficient55_424,
    output := OriginalRow227TriangleData0823.coefficient56_424, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_426, Icur := OriginalRow227TriangleData0810.coefficient55_425,
    output := OriginalRow227TriangleData0823.coefficient56_425, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_427, Icur := OriginalRow227TriangleData0810.coefficient55_426,
    output := OriginalRow227TriangleData0823.coefficient56_426, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_428, Icur := OriginalRow227TriangleData0810.coefficient55_427,
    output := OriginalRow227TriangleData0823.coefficient56_427, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_429, Icur := OriginalRow227TriangleData0810.coefficient55_428,
    output := OriginalRow227TriangleData0823.coefficient56_428, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_430, Icur := OriginalRow227TriangleData0810.coefficient55_429,
    output := OriginalRow227TriangleData0823.coefficient56_429, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_431, Icur := OriginalRow227TriangleData0810.coefficient55_430,
    output := OriginalRow227TriangleData0823.coefficient56_430, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_432, Icur := OriginalRow227TriangleData0810.coefficient55_431,
    output := OriginalRow227TriangleData0823.coefficient56_431, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_433, Icur := OriginalRow227TriangleData0810.coefficient55_432,
    output := OriginalRow227TriangleData0823.coefficient56_432, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_434, Icur := OriginalRow227TriangleData0810.coefficient55_433,
    output := OriginalRow227TriangleData0823.coefficient56_433, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_435, Icur := OriginalRow227TriangleData0810.coefficient55_434,
    output := OriginalRow227TriangleData0823.coefficient56_434, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_436, Icur := OriginalRow227TriangleData0810.coefficient55_435,
    output := OriginalRow227TriangleData0823.coefficient56_435, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0810.coefficient55_437, Icur := OriginalRow227TriangleData0810.coefficient55_436,
    output := OriginalRow227TriangleData0823.coefficient56_436, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_438, Icur := OriginalRow227TriangleData0810.coefficient55_437,
    output := OriginalRow227TriangleData0823.coefficient56_437, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_439, Icur := OriginalRow227TriangleData0811.coefficient55_438,
    output := OriginalRow227TriangleData0823.coefficient56_438, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0807

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0807.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
