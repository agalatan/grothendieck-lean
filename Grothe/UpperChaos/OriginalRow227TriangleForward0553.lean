import Grothe.UpperChaos.OriginalRow227TriangleData0555
import Grothe.UpperChaos.OriginalRow227TriangleData0556
import Grothe.UpperChaos.OriginalRow227TriangleData0569
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0553
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_389, Icur := OriginalRow227TriangleData0555.coefficient36_388,
    output := OriginalRow227TriangleData0569.coefficient37_388, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_390, Icur := OriginalRow227TriangleData0555.coefficient36_389,
    output := OriginalRow227TriangleData0569.coefficient37_389, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_391, Icur := OriginalRow227TriangleData0555.coefficient36_390,
    output := OriginalRow227TriangleData0569.coefficient37_390, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_392, Icur := OriginalRow227TriangleData0555.coefficient36_391,
    output := OriginalRow227TriangleData0569.coefficient37_391, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_393, Icur := OriginalRow227TriangleData0555.coefficient36_392,
    output := OriginalRow227TriangleData0569.coefficient37_392, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_394, Icur := OriginalRow227TriangleData0555.coefficient36_393,
    output := OriginalRow227TriangleData0569.coefficient37_393, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_395, Icur := OriginalRow227TriangleData0555.coefficient36_394,
    output := OriginalRow227TriangleData0569.coefficient37_394, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_396, Icur := OriginalRow227TriangleData0555.coefficient36_395,
    output := OriginalRow227TriangleData0569.coefficient37_395, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_397, Icur := OriginalRow227TriangleData0555.coefficient36_396,
    output := OriginalRow227TriangleData0569.coefficient37_396, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_398, Icur := OriginalRow227TriangleData0555.coefficient36_397,
    output := OriginalRow227TriangleData0569.coefficient37_397, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_399, Icur := OriginalRow227TriangleData0555.coefficient36_398,
    output := OriginalRow227TriangleData0569.coefficient37_398, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_400, Icur := OriginalRow227TriangleData0555.coefficient36_399,
    output := OriginalRow227TriangleData0569.coefficient37_399, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_401, Icur := OriginalRow227TriangleData0555.coefficient36_400,
    output := OriginalRow227TriangleData0569.coefficient37_400, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_402, Icur := OriginalRow227TriangleData0555.coefficient36_401,
    output := OriginalRow227TriangleData0569.coefficient37_401, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_403, Icur := OriginalRow227TriangleData0555.coefficient36_402,
    output := OriginalRow227TriangleData0569.coefficient37_402, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_404, Icur := OriginalRow227TriangleData0555.coefficient36_403,
    output := OriginalRow227TriangleData0569.coefficient37_403, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_405, Icur := OriginalRow227TriangleData0555.coefficient36_404,
    output := OriginalRow227TriangleData0569.coefficient37_404, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_406, Icur := OriginalRow227TriangleData0555.coefficient36_405,
    output := OriginalRow227TriangleData0569.coefficient37_405, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_407, Icur := OriginalRow227TriangleData0555.coefficient36_406,
    output := OriginalRow227TriangleData0569.coefficient37_406, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_408, Icur := OriginalRow227TriangleData0555.coefficient36_407,
    output := OriginalRow227TriangleData0569.coefficient37_407, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_409, Icur := OriginalRow227TriangleData0555.coefficient36_408,
    output := OriginalRow227TriangleData0569.coefficient37_408, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_410, Icur := OriginalRow227TriangleData0555.coefficient36_409,
    output := OriginalRow227TriangleData0569.coefficient37_409, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_411, Icur := OriginalRow227TriangleData0555.coefficient36_410,
    output := OriginalRow227TriangleData0569.coefficient37_410, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_412, Icur := OriginalRow227TriangleData0555.coefficient36_411,
    output := OriginalRow227TriangleData0569.coefficient37_411, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_413, Icur := OriginalRow227TriangleData0555.coefficient36_412,
    output := OriginalRow227TriangleData0569.coefficient37_412, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_414, Icur := OriginalRow227TriangleData0555.coefficient36_413,
    output := OriginalRow227TriangleData0569.coefficient37_413, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_415, Icur := OriginalRow227TriangleData0555.coefficient36_414,
    output := OriginalRow227TriangleData0569.coefficient37_414, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_416, Icur := OriginalRow227TriangleData0555.coefficient36_415,
    output := OriginalRow227TriangleData0569.coefficient37_415, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_417, Icur := OriginalRow227TriangleData0555.coefficient36_416,
    output := OriginalRow227TriangleData0569.coefficient37_416, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0555.coefficient36_418, Icur := OriginalRow227TriangleData0555.coefficient36_417,
    output := OriginalRow227TriangleData0569.coefficient37_417, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_419, Icur := OriginalRow227TriangleData0555.coefficient36_418,
    output := OriginalRow227TriangleData0569.coefficient37_418, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_420, Icur := OriginalRow227TriangleData0556.coefficient36_419,
    output := OriginalRow227TriangleData0569.coefficient37_419, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0553

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0553.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
