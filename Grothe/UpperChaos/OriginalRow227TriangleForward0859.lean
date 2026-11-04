import Grothe.UpperChaos.OriginalRow227TriangleData0862
import Grothe.UpperChaos.OriginalRow227TriangleData0863
import Grothe.UpperChaos.OriginalRow227TriangleData0875
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0859
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_412, Icur := OriginalRow227TriangleData0862.coefficient59_411,
    output := OriginalRow227TriangleData0875.coefficient60_411, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_413, Icur := OriginalRow227TriangleData0862.coefficient59_412,
    output := OriginalRow227TriangleData0875.coefficient60_412, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_414, Icur := OriginalRow227TriangleData0862.coefficient59_413,
    output := OriginalRow227TriangleData0875.coefficient60_413, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_415, Icur := OriginalRow227TriangleData0862.coefficient59_414,
    output := OriginalRow227TriangleData0875.coefficient60_414, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_416, Icur := OriginalRow227TriangleData0862.coefficient59_415,
    output := OriginalRow227TriangleData0875.coefficient60_415, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_417, Icur := OriginalRow227TriangleData0862.coefficient59_416,
    output := OriginalRow227TriangleData0875.coefficient60_416, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_418, Icur := OriginalRow227TriangleData0862.coefficient59_417,
    output := OriginalRow227TriangleData0875.coefficient60_417, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_419, Icur := OriginalRow227TriangleData0862.coefficient59_418,
    output := OriginalRow227TriangleData0875.coefficient60_418, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_420, Icur := OriginalRow227TriangleData0862.coefficient59_419,
    output := OriginalRow227TriangleData0875.coefficient60_419, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_421, Icur := OriginalRow227TriangleData0862.coefficient59_420,
    output := OriginalRow227TriangleData0875.coefficient60_420, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_422, Icur := OriginalRow227TriangleData0862.coefficient59_421,
    output := OriginalRow227TriangleData0875.coefficient60_421, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_423, Icur := OriginalRow227TriangleData0862.coefficient59_422,
    output := OriginalRow227TriangleData0875.coefficient60_422, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_424, Icur := OriginalRow227TriangleData0862.coefficient59_423,
    output := OriginalRow227TriangleData0875.coefficient60_423, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_425, Icur := OriginalRow227TriangleData0862.coefficient59_424,
    output := OriginalRow227TriangleData0875.coefficient60_424, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_426, Icur := OriginalRow227TriangleData0862.coefficient59_425,
    output := OriginalRow227TriangleData0875.coefficient60_425, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_427, Icur := OriginalRow227TriangleData0862.coefficient59_426,
    output := OriginalRow227TriangleData0875.coefficient60_426, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_428, Icur := OriginalRow227TriangleData0862.coefficient59_427,
    output := OriginalRow227TriangleData0875.coefficient60_427, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_429, Icur := OriginalRow227TriangleData0862.coefficient59_428,
    output := OriginalRow227TriangleData0875.coefficient60_428, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_430, Icur := OriginalRow227TriangleData0862.coefficient59_429,
    output := OriginalRow227TriangleData0875.coefficient60_429, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_431, Icur := OriginalRow227TriangleData0862.coefficient59_430,
    output := OriginalRow227TriangleData0875.coefficient60_430, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_432, Icur := OriginalRow227TriangleData0862.coefficient59_431,
    output := OriginalRow227TriangleData0875.coefficient60_431, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_433, Icur := OriginalRow227TriangleData0862.coefficient59_432,
    output := OriginalRow227TriangleData0875.coefficient60_432, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_434, Icur := OriginalRow227TriangleData0862.coefficient59_433,
    output := OriginalRow227TriangleData0875.coefficient60_433, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_435, Icur := OriginalRow227TriangleData0862.coefficient59_434,
    output := OriginalRow227TriangleData0875.coefficient60_434, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_436, Icur := OriginalRow227TriangleData0862.coefficient59_435,
    output := OriginalRow227TriangleData0875.coefficient60_435, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_437, Icur := OriginalRow227TriangleData0862.coefficient59_436,
    output := OriginalRow227TriangleData0875.coefficient60_436, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_438, Icur := OriginalRow227TriangleData0862.coefficient59_437,
    output := OriginalRow227TriangleData0875.coefficient60_437, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_439, Icur := OriginalRow227TriangleData0862.coefficient59_438,
    output := OriginalRow227TriangleData0875.coefficient60_438, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_440, Icur := OriginalRow227TriangleData0862.coefficient59_439,
    output := OriginalRow227TriangleData0875.coefficient60_439, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0862.coefficient59_441, Icur := OriginalRow227TriangleData0862.coefficient59_440,
    output := OriginalRow227TriangleData0875.coefficient60_440, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0863.coefficient59_442, Icur := OriginalRow227TriangleData0862.coefficient59_441,
    output := OriginalRow227TriangleData0875.coefficient60_441, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0859

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0859.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
