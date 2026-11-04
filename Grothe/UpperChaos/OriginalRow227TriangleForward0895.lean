import Grothe.UpperChaos.OriginalRow227TriangleData0899
import Grothe.UpperChaos.OriginalRow227TriangleData0911
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0895
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_415, Icur := OriginalRow227TriangleData0899.coefficient62_414,
    output := OriginalRow227TriangleData0911.coefficient63_414, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_416, Icur := OriginalRow227TriangleData0899.coefficient62_415,
    output := OriginalRow227TriangleData0911.coefficient63_415, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_417, Icur := OriginalRow227TriangleData0899.coefficient62_416,
    output := OriginalRow227TriangleData0911.coefficient63_416, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_418, Icur := OriginalRow227TriangleData0899.coefficient62_417,
    output := OriginalRow227TriangleData0911.coefficient63_417, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_419, Icur := OriginalRow227TriangleData0899.coefficient62_418,
    output := OriginalRow227TriangleData0911.coefficient63_418, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_420, Icur := OriginalRow227TriangleData0899.coefficient62_419,
    output := OriginalRow227TriangleData0911.coefficient63_419, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_421, Icur := OriginalRow227TriangleData0899.coefficient62_420,
    output := OriginalRow227TriangleData0911.coefficient63_420, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_422, Icur := OriginalRow227TriangleData0899.coefficient62_421,
    output := OriginalRow227TriangleData0911.coefficient63_421, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_423, Icur := OriginalRow227TriangleData0899.coefficient62_422,
    output := OriginalRow227TriangleData0911.coefficient63_422, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_424, Icur := OriginalRow227TriangleData0899.coefficient62_423,
    output := OriginalRow227TriangleData0911.coefficient63_423, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_425, Icur := OriginalRow227TriangleData0899.coefficient62_424,
    output := OriginalRow227TriangleData0911.coefficient63_424, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_426, Icur := OriginalRow227TriangleData0899.coefficient62_425,
    output := OriginalRow227TriangleData0911.coefficient63_425, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_427, Icur := OriginalRow227TriangleData0899.coefficient62_426,
    output := OriginalRow227TriangleData0911.coefficient63_426, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_428, Icur := OriginalRow227TriangleData0899.coefficient62_427,
    output := OriginalRow227TriangleData0911.coefficient63_427, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_429, Icur := OriginalRow227TriangleData0899.coefficient62_428,
    output := OriginalRow227TriangleData0911.coefficient63_428, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_430, Icur := OriginalRow227TriangleData0899.coefficient62_429,
    output := OriginalRow227TriangleData0911.coefficient63_429, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_431, Icur := OriginalRow227TriangleData0899.coefficient62_430,
    output := OriginalRow227TriangleData0911.coefficient63_430, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_432, Icur := OriginalRow227TriangleData0899.coefficient62_431,
    output := OriginalRow227TriangleData0911.coefficient63_431, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_433, Icur := OriginalRow227TriangleData0899.coefficient62_432,
    output := OriginalRow227TriangleData0911.coefficient63_432, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_434, Icur := OriginalRow227TriangleData0899.coefficient62_433,
    output := OriginalRow227TriangleData0911.coefficient63_433, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_435, Icur := OriginalRow227TriangleData0899.coefficient62_434,
    output := OriginalRow227TriangleData0911.coefficient63_434, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_436, Icur := OriginalRow227TriangleData0899.coefficient62_435,
    output := OriginalRow227TriangleData0911.coefficient63_435, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_437, Icur := OriginalRow227TriangleData0899.coefficient62_436,
    output := OriginalRow227TriangleData0911.coefficient63_436, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_438, Icur := OriginalRow227TriangleData0899.coefficient62_437,
    output := OriginalRow227TriangleData0911.coefficient63_437, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0899.coefficient62_439, Icur := OriginalRow227TriangleData0899.coefficient62_438,
    output := OriginalRow227TriangleData0911.coefficient63_438, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0895

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0895.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
