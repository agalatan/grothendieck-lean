import Grothe.UpperChaos.OriginalRow227TriangleData1042
import Grothe.UpperChaos.OriginalRow227TriangleData1043
import Grothe.UpperChaos.OriginalRow227TriangleData1054
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1038
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_395, Icur := OriginalRow227TriangleData1042.coefficient74_394,
    output := OriginalRow227TriangleData1054.coefficient75_394, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_396, Icur := OriginalRow227TriangleData1042.coefficient74_395,
    output := OriginalRow227TriangleData1054.coefficient75_395, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_397, Icur := OriginalRow227TriangleData1042.coefficient74_396,
    output := OriginalRow227TriangleData1054.coefficient75_396, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_398, Icur := OriginalRow227TriangleData1042.coefficient74_397,
    output := OriginalRow227TriangleData1054.coefficient75_397, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_399, Icur := OriginalRow227TriangleData1042.coefficient74_398,
    output := OriginalRow227TriangleData1054.coefficient75_398, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_400, Icur := OriginalRow227TriangleData1042.coefficient74_399,
    output := OriginalRow227TriangleData1054.coefficient75_399, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_401, Icur := OriginalRow227TriangleData1042.coefficient74_400,
    output := OriginalRow227TriangleData1054.coefficient75_400, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_402, Icur := OriginalRow227TriangleData1042.coefficient74_401,
    output := OriginalRow227TriangleData1054.coefficient75_401, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_403, Icur := OriginalRow227TriangleData1042.coefficient74_402,
    output := OriginalRow227TriangleData1054.coefficient75_402, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_404, Icur := OriginalRow227TriangleData1042.coefficient74_403,
    output := OriginalRow227TriangleData1054.coefficient75_403, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_405, Icur := OriginalRow227TriangleData1042.coefficient74_404,
    output := OriginalRow227TriangleData1054.coefficient75_404, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_406, Icur := OriginalRow227TriangleData1042.coefficient74_405,
    output := OriginalRow227TriangleData1054.coefficient75_405, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_407, Icur := OriginalRow227TriangleData1042.coefficient74_406,
    output := OriginalRow227TriangleData1054.coefficient75_406, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_408, Icur := OriginalRow227TriangleData1042.coefficient74_407,
    output := OriginalRow227TriangleData1054.coefficient75_407, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_409, Icur := OriginalRow227TriangleData1042.coefficient74_408,
    output := OriginalRow227TriangleData1054.coefficient75_408, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_410, Icur := OriginalRow227TriangleData1042.coefficient74_409,
    output := OriginalRow227TriangleData1054.coefficient75_409, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_411, Icur := OriginalRow227TriangleData1042.coefficient74_410,
    output := OriginalRow227TriangleData1054.coefficient75_410, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_412, Icur := OriginalRow227TriangleData1042.coefficient74_411,
    output := OriginalRow227TriangleData1054.coefficient75_411, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_413, Icur := OriginalRow227TriangleData1042.coefficient74_412,
    output := OriginalRow227TriangleData1054.coefficient75_412, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_414, Icur := OriginalRow227TriangleData1042.coefficient74_413,
    output := OriginalRow227TriangleData1054.coefficient75_413, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_415, Icur := OriginalRow227TriangleData1042.coefficient74_414,
    output := OriginalRow227TriangleData1054.coefficient75_414, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_416, Icur := OriginalRow227TriangleData1042.coefficient74_415,
    output := OriginalRow227TriangleData1054.coefficient75_415, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_417, Icur := OriginalRow227TriangleData1042.coefficient74_416,
    output := OriginalRow227TriangleData1054.coefficient75_416, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_418, Icur := OriginalRow227TriangleData1042.coefficient74_417,
    output := OriginalRow227TriangleData1054.coefficient75_417, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_419, Icur := OriginalRow227TriangleData1042.coefficient74_418,
    output := OriginalRow227TriangleData1054.coefficient75_418, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_420, Icur := OriginalRow227TriangleData1042.coefficient74_419,
    output := OriginalRow227TriangleData1054.coefficient75_419, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_421, Icur := OriginalRow227TriangleData1042.coefficient74_420,
    output := OriginalRow227TriangleData1054.coefficient75_420, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_422, Icur := OriginalRow227TriangleData1042.coefficient74_421,
    output := OriginalRow227TriangleData1054.coefficient75_421, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_423, Icur := OriginalRow227TriangleData1042.coefficient74_422,
    output := OriginalRow227TriangleData1054.coefficient75_422, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1042.coefficient74_424, Icur := OriginalRow227TriangleData1042.coefficient74_423,
    output := OriginalRow227TriangleData1054.coefficient75_423, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1043.coefficient74_425, Icur := OriginalRow227TriangleData1042.coefficient74_424,
    output := OriginalRow227TriangleData1054.coefficient75_424, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1043.coefficient74_426, Icur := OriginalRow227TriangleData1043.coefficient74_425,
    output := OriginalRow227TriangleData1054.coefficient75_425, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1038

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1038.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
