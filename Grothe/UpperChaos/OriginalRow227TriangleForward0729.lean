import Grothe.UpperChaos.OriginalRow227TriangleData0732
import Grothe.UpperChaos.OriginalRow227TriangleData0733
import Grothe.UpperChaos.OriginalRow227TriangleData0745
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0729
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_402, Icur := OriginalRow227TriangleData0732.coefficient49_401,
    output := OriginalRow227TriangleData0745.coefficient50_401, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_403, Icur := OriginalRow227TriangleData0732.coefficient49_402,
    output := OriginalRow227TriangleData0745.coefficient50_402, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_404, Icur := OriginalRow227TriangleData0732.coefficient49_403,
    output := OriginalRow227TriangleData0745.coefficient50_403, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_405, Icur := OriginalRow227TriangleData0732.coefficient49_404,
    output := OriginalRow227TriangleData0745.coefficient50_404, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_406, Icur := OriginalRow227TriangleData0732.coefficient49_405,
    output := OriginalRow227TriangleData0745.coefficient50_405, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_407, Icur := OriginalRow227TriangleData0732.coefficient49_406,
    output := OriginalRow227TriangleData0745.coefficient50_406, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_408, Icur := OriginalRow227TriangleData0732.coefficient49_407,
    output := OriginalRow227TriangleData0745.coefficient50_407, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_409, Icur := OriginalRow227TriangleData0732.coefficient49_408,
    output := OriginalRow227TriangleData0745.coefficient50_408, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_410, Icur := OriginalRow227TriangleData0732.coefficient49_409,
    output := OriginalRow227TriangleData0745.coefficient50_409, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_411, Icur := OriginalRow227TriangleData0732.coefficient49_410,
    output := OriginalRow227TriangleData0745.coefficient50_410, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_412, Icur := OriginalRow227TriangleData0732.coefficient49_411,
    output := OriginalRow227TriangleData0745.coefficient50_411, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_413, Icur := OriginalRow227TriangleData0732.coefficient49_412,
    output := OriginalRow227TriangleData0745.coefficient50_412, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_414, Icur := OriginalRow227TriangleData0732.coefficient49_413,
    output := OriginalRow227TriangleData0745.coefficient50_413, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_415, Icur := OriginalRow227TriangleData0732.coefficient49_414,
    output := OriginalRow227TriangleData0745.coefficient50_414, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_416, Icur := OriginalRow227TriangleData0732.coefficient49_415,
    output := OriginalRow227TriangleData0745.coefficient50_415, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_417, Icur := OriginalRow227TriangleData0732.coefficient49_416,
    output := OriginalRow227TriangleData0745.coefficient50_416, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_418, Icur := OriginalRow227TriangleData0732.coefficient49_417,
    output := OriginalRow227TriangleData0745.coefficient50_417, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_419, Icur := OriginalRow227TriangleData0732.coefficient49_418,
    output := OriginalRow227TriangleData0745.coefficient50_418, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_420, Icur := OriginalRow227TriangleData0732.coefficient49_419,
    output := OriginalRow227TriangleData0745.coefficient50_419, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_421, Icur := OriginalRow227TriangleData0732.coefficient49_420,
    output := OriginalRow227TriangleData0745.coefficient50_420, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_422, Icur := OriginalRow227TriangleData0732.coefficient49_421,
    output := OriginalRow227TriangleData0745.coefficient50_421, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_423, Icur := OriginalRow227TriangleData0732.coefficient49_422,
    output := OriginalRow227TriangleData0745.coefficient50_422, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_424, Icur := OriginalRow227TriangleData0732.coefficient49_423,
    output := OriginalRow227TriangleData0745.coefficient50_423, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_425, Icur := OriginalRow227TriangleData0732.coefficient49_424,
    output := OriginalRow227TriangleData0745.coefficient50_424, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_426, Icur := OriginalRow227TriangleData0732.coefficient49_425,
    output := OriginalRow227TriangleData0745.coefficient50_425, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_427, Icur := OriginalRow227TriangleData0732.coefficient49_426,
    output := OriginalRow227TriangleData0745.coefficient50_426, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_428, Icur := OriginalRow227TriangleData0732.coefficient49_427,
    output := OriginalRow227TriangleData0745.coefficient50_427, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_429, Icur := OriginalRow227TriangleData0732.coefficient49_428,
    output := OriginalRow227TriangleData0745.coefficient50_428, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_430, Icur := OriginalRow227TriangleData0732.coefficient49_429,
    output := OriginalRow227TriangleData0745.coefficient50_429, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0732.coefficient49_431, Icur := OriginalRow227TriangleData0732.coefficient49_430,
    output := OriginalRow227TriangleData0745.coefficient50_430, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0733.coefficient49_432, Icur := OriginalRow227TriangleData0732.coefficient49_431,
    output := OriginalRow227TriangleData0745.coefficient50_431, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0733.coefficient49_433, Icur := OriginalRow227TriangleData0733.coefficient49_432,
    output := OriginalRow227TriangleData0745.coefficient50_432, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0729

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0729.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
