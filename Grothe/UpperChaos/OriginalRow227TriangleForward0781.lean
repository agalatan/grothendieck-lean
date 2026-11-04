import Grothe.UpperChaos.OriginalRow227TriangleData0784
import Grothe.UpperChaos.OriginalRow227TriangleData0785
import Grothe.UpperChaos.OriginalRow227TriangleData0797
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0781
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_406, Icur := OriginalRow227TriangleData0784.coefficient53_405,
    output := OriginalRow227TriangleData0797.coefficient54_405, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_407, Icur := OriginalRow227TriangleData0784.coefficient53_406,
    output := OriginalRow227TriangleData0797.coefficient54_406, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_408, Icur := OriginalRow227TriangleData0784.coefficient53_407,
    output := OriginalRow227TriangleData0797.coefficient54_407, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_409, Icur := OriginalRow227TriangleData0784.coefficient53_408,
    output := OriginalRow227TriangleData0797.coefficient54_408, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_410, Icur := OriginalRow227TriangleData0784.coefficient53_409,
    output := OriginalRow227TriangleData0797.coefficient54_409, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_411, Icur := OriginalRow227TriangleData0784.coefficient53_410,
    output := OriginalRow227TriangleData0797.coefficient54_410, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_412, Icur := OriginalRow227TriangleData0784.coefficient53_411,
    output := OriginalRow227TriangleData0797.coefficient54_411, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_413, Icur := OriginalRow227TriangleData0784.coefficient53_412,
    output := OriginalRow227TriangleData0797.coefficient54_412, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_414, Icur := OriginalRow227TriangleData0784.coefficient53_413,
    output := OriginalRow227TriangleData0797.coefficient54_413, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_415, Icur := OriginalRow227TriangleData0784.coefficient53_414,
    output := OriginalRow227TriangleData0797.coefficient54_414, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_416, Icur := OriginalRow227TriangleData0784.coefficient53_415,
    output := OriginalRow227TriangleData0797.coefficient54_415, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_417, Icur := OriginalRow227TriangleData0784.coefficient53_416,
    output := OriginalRow227TriangleData0797.coefficient54_416, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_418, Icur := OriginalRow227TriangleData0784.coefficient53_417,
    output := OriginalRow227TriangleData0797.coefficient54_417, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_419, Icur := OriginalRow227TriangleData0784.coefficient53_418,
    output := OriginalRow227TriangleData0797.coefficient54_418, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_420, Icur := OriginalRow227TriangleData0784.coefficient53_419,
    output := OriginalRow227TriangleData0797.coefficient54_419, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_421, Icur := OriginalRow227TriangleData0784.coefficient53_420,
    output := OriginalRow227TriangleData0797.coefficient54_420, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_422, Icur := OriginalRow227TriangleData0784.coefficient53_421,
    output := OriginalRow227TriangleData0797.coefficient54_421, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_423, Icur := OriginalRow227TriangleData0784.coefficient53_422,
    output := OriginalRow227TriangleData0797.coefficient54_422, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_424, Icur := OriginalRow227TriangleData0784.coefficient53_423,
    output := OriginalRow227TriangleData0797.coefficient54_423, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_425, Icur := OriginalRow227TriangleData0784.coefficient53_424,
    output := OriginalRow227TriangleData0797.coefficient54_424, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_426, Icur := OriginalRow227TriangleData0784.coefficient53_425,
    output := OriginalRow227TriangleData0797.coefficient54_425, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_427, Icur := OriginalRow227TriangleData0784.coefficient53_426,
    output := OriginalRow227TriangleData0797.coefficient54_426, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_428, Icur := OriginalRow227TriangleData0784.coefficient53_427,
    output := OriginalRow227TriangleData0797.coefficient54_427, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_429, Icur := OriginalRow227TriangleData0784.coefficient53_428,
    output := OriginalRow227TriangleData0797.coefficient54_428, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_430, Icur := OriginalRow227TriangleData0784.coefficient53_429,
    output := OriginalRow227TriangleData0797.coefficient54_429, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_431, Icur := OriginalRow227TriangleData0784.coefficient53_430,
    output := OriginalRow227TriangleData0797.coefficient54_430, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_432, Icur := OriginalRow227TriangleData0784.coefficient53_431,
    output := OriginalRow227TriangleData0797.coefficient54_431, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_433, Icur := OriginalRow227TriangleData0784.coefficient53_432,
    output := OriginalRow227TriangleData0797.coefficient54_432, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_434, Icur := OriginalRow227TriangleData0784.coefficient53_433,
    output := OriginalRow227TriangleData0797.coefficient54_433, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_435, Icur := OriginalRow227TriangleData0784.coefficient53_434,
    output := OriginalRow227TriangleData0797.coefficient54_434, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_436, Icur := OriginalRow227TriangleData0784.coefficient53_435,
    output := OriginalRow227TriangleData0797.coefficient54_435, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_437, Icur := OriginalRow227TriangleData0785.coefficient53_436,
    output := OriginalRow227TriangleData0797.coefficient54_436, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0781

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0781.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
