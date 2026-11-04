import Grothe.UpperChaos.OriginalRow227TriangleData1006
import Grothe.UpperChaos.OriginalRow227TriangleData1007
import Grothe.UpperChaos.OriginalRow227TriangleData1018
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1002
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_392, Icur := OriginalRow227TriangleData1006.coefficient71_391,
    output := OriginalRow227TriangleData1018.coefficient72_391, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_393, Icur := OriginalRow227TriangleData1006.coefficient71_392,
    output := OriginalRow227TriangleData1018.coefficient72_392, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_394, Icur := OriginalRow227TriangleData1006.coefficient71_393,
    output := OriginalRow227TriangleData1018.coefficient72_393, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_395, Icur := OriginalRow227TriangleData1006.coefficient71_394,
    output := OriginalRow227TriangleData1018.coefficient72_394, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_396, Icur := OriginalRow227TriangleData1006.coefficient71_395,
    output := OriginalRow227TriangleData1018.coefficient72_395, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_397, Icur := OriginalRow227TriangleData1006.coefficient71_396,
    output := OriginalRow227TriangleData1018.coefficient72_396, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_398, Icur := OriginalRow227TriangleData1006.coefficient71_397,
    output := OriginalRow227TriangleData1018.coefficient72_397, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_399, Icur := OriginalRow227TriangleData1006.coefficient71_398,
    output := OriginalRow227TriangleData1018.coefficient72_398, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_400, Icur := OriginalRow227TriangleData1006.coefficient71_399,
    output := OriginalRow227TriangleData1018.coefficient72_399, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_401, Icur := OriginalRow227TriangleData1006.coefficient71_400,
    output := OriginalRow227TriangleData1018.coefficient72_400, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_402, Icur := OriginalRow227TriangleData1006.coefficient71_401,
    output := OriginalRow227TriangleData1018.coefficient72_401, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_403, Icur := OriginalRow227TriangleData1006.coefficient71_402,
    output := OriginalRow227TriangleData1018.coefficient72_402, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_404, Icur := OriginalRow227TriangleData1006.coefficient71_403,
    output := OriginalRow227TriangleData1018.coefficient72_403, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_405, Icur := OriginalRow227TriangleData1006.coefficient71_404,
    output := OriginalRow227TriangleData1018.coefficient72_404, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_406, Icur := OriginalRow227TriangleData1006.coefficient71_405,
    output := OriginalRow227TriangleData1018.coefficient72_405, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_407, Icur := OriginalRow227TriangleData1006.coefficient71_406,
    output := OriginalRow227TriangleData1018.coefficient72_406, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_408, Icur := OriginalRow227TriangleData1006.coefficient71_407,
    output := OriginalRow227TriangleData1018.coefficient72_407, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_409, Icur := OriginalRow227TriangleData1006.coefficient71_408,
    output := OriginalRow227TriangleData1018.coefficient72_408, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_410, Icur := OriginalRow227TriangleData1006.coefficient71_409,
    output := OriginalRow227TriangleData1018.coefficient72_409, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_411, Icur := OriginalRow227TriangleData1006.coefficient71_410,
    output := OriginalRow227TriangleData1018.coefficient72_410, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_412, Icur := OriginalRow227TriangleData1006.coefficient71_411,
    output := OriginalRow227TriangleData1018.coefficient72_411, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_413, Icur := OriginalRow227TriangleData1006.coefficient71_412,
    output := OriginalRow227TriangleData1018.coefficient72_412, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_414, Icur := OriginalRow227TriangleData1006.coefficient71_413,
    output := OriginalRow227TriangleData1018.coefficient72_413, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_415, Icur := OriginalRow227TriangleData1006.coefficient71_414,
    output := OriginalRow227TriangleData1018.coefficient72_414, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_416, Icur := OriginalRow227TriangleData1006.coefficient71_415,
    output := OriginalRow227TriangleData1018.coefficient72_415, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_417, Icur := OriginalRow227TriangleData1006.coefficient71_416,
    output := OriginalRow227TriangleData1018.coefficient72_416, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_418, Icur := OriginalRow227TriangleData1006.coefficient71_417,
    output := OriginalRow227TriangleData1018.coefficient72_417, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_419, Icur := OriginalRow227TriangleData1006.coefficient71_418,
    output := OriginalRow227TriangleData1018.coefficient72_418, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_420, Icur := OriginalRow227TriangleData1006.coefficient71_419,
    output := OriginalRow227TriangleData1018.coefficient72_419, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1006.coefficient71_421, Icur := OriginalRow227TriangleData1006.coefficient71_420,
    output := OriginalRow227TriangleData1018.coefficient72_420, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1007.coefficient71_422, Icur := OriginalRow227TriangleData1006.coefficient71_421,
    output := OriginalRow227TriangleData1018.coefficient72_421, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1007.coefficient71_423, Icur := OriginalRow227TriangleData1007.coefficient71_422,
    output := OriginalRow227TriangleData1018.coefficient72_422, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1002

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1002.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
