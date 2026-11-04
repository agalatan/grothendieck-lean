import Grothe.UpperChaos.OriginalRow227TriangleData0639
import Grothe.UpperChaos.OriginalRow227TriangleData0640
import Grothe.UpperChaos.OriginalRow227TriangleData0653
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0637
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_395, Icur := OriginalRow227TriangleData0639.coefficient42_394,
    output := OriginalRow227TriangleData0653.coefficient43_394, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_396, Icur := OriginalRow227TriangleData0639.coefficient42_395,
    output := OriginalRow227TriangleData0653.coefficient43_395, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_397, Icur := OriginalRow227TriangleData0639.coefficient42_396,
    output := OriginalRow227TriangleData0653.coefficient43_396, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_398, Icur := OriginalRow227TriangleData0639.coefficient42_397,
    output := OriginalRow227TriangleData0653.coefficient43_397, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_399, Icur := OriginalRow227TriangleData0639.coefficient42_398,
    output := OriginalRow227TriangleData0653.coefficient43_398, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_400, Icur := OriginalRow227TriangleData0639.coefficient42_399,
    output := OriginalRow227TriangleData0653.coefficient43_399, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_401, Icur := OriginalRow227TriangleData0639.coefficient42_400,
    output := OriginalRow227TriangleData0653.coefficient43_400, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_402, Icur := OriginalRow227TriangleData0639.coefficient42_401,
    output := OriginalRow227TriangleData0653.coefficient43_401, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_403, Icur := OriginalRow227TriangleData0639.coefficient42_402,
    output := OriginalRow227TriangleData0653.coefficient43_402, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_404, Icur := OriginalRow227TriangleData0639.coefficient42_403,
    output := OriginalRow227TriangleData0653.coefficient43_403, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_405, Icur := OriginalRow227TriangleData0639.coefficient42_404,
    output := OriginalRow227TriangleData0653.coefficient43_404, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_406, Icur := OriginalRow227TriangleData0639.coefficient42_405,
    output := OriginalRow227TriangleData0653.coefficient43_405, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_407, Icur := OriginalRow227TriangleData0639.coefficient42_406,
    output := OriginalRow227TriangleData0653.coefficient43_406, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_408, Icur := OriginalRow227TriangleData0639.coefficient42_407,
    output := OriginalRow227TriangleData0653.coefficient43_407, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_409, Icur := OriginalRow227TriangleData0639.coefficient42_408,
    output := OriginalRow227TriangleData0653.coefficient43_408, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_410, Icur := OriginalRow227TriangleData0639.coefficient42_409,
    output := OriginalRow227TriangleData0653.coefficient43_409, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_411, Icur := OriginalRow227TriangleData0639.coefficient42_410,
    output := OriginalRow227TriangleData0653.coefficient43_410, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_412, Icur := OriginalRow227TriangleData0639.coefficient42_411,
    output := OriginalRow227TriangleData0653.coefficient43_411, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_413, Icur := OriginalRow227TriangleData0639.coefficient42_412,
    output := OriginalRow227TriangleData0653.coefficient43_412, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_414, Icur := OriginalRow227TriangleData0639.coefficient42_413,
    output := OriginalRow227TriangleData0653.coefficient43_413, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_415, Icur := OriginalRow227TriangleData0639.coefficient42_414,
    output := OriginalRow227TriangleData0653.coefficient43_414, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_416, Icur := OriginalRow227TriangleData0639.coefficient42_415,
    output := OriginalRow227TriangleData0653.coefficient43_415, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_417, Icur := OriginalRow227TriangleData0639.coefficient42_416,
    output := OriginalRow227TriangleData0653.coefficient43_416, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_418, Icur := OriginalRow227TriangleData0639.coefficient42_417,
    output := OriginalRow227TriangleData0653.coefficient43_417, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_419, Icur := OriginalRow227TriangleData0639.coefficient42_418,
    output := OriginalRow227TriangleData0653.coefficient43_418, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_420, Icur := OriginalRow227TriangleData0639.coefficient42_419,
    output := OriginalRow227TriangleData0653.coefficient43_419, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_421, Icur := OriginalRow227TriangleData0639.coefficient42_420,
    output := OriginalRow227TriangleData0653.coefficient43_420, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_422, Icur := OriginalRow227TriangleData0639.coefficient42_421,
    output := OriginalRow227TriangleData0653.coefficient43_421, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_423, Icur := OriginalRow227TriangleData0639.coefficient42_422,
    output := OriginalRow227TriangleData0653.coefficient43_422, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0639.coefficient42_424, Icur := OriginalRow227TriangleData0639.coefficient42_423,
    output := OriginalRow227TriangleData0653.coefficient43_423, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_425, Icur := OriginalRow227TriangleData0639.coefficient42_424,
    output := OriginalRow227TriangleData0653.coefficient43_424, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_426, Icur := OriginalRow227TriangleData0640.coefficient42_425,
    output := OriginalRow227TriangleData0653.coefficient43_425, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0637

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0637.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
