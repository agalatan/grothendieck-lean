import Grothe.UpperChaos.OriginalRow227TriangleData0060
import Grothe.UpperChaos.OriginalRow227TriangleData0061
import Grothe.UpperChaos.OriginalRow227TriangleData0076
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0060
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_388, Icur := OriginalRow227TriangleData0060.coefficient3_387,
    output := OriginalRow227TriangleData0076.coefficient4_387, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_389, Icur := OriginalRow227TriangleData0060.coefficient3_388,
    output := OriginalRow227TriangleData0076.coefficient4_388, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_390, Icur := OriginalRow227TriangleData0060.coefficient3_389,
    output := OriginalRow227TriangleData0076.coefficient4_389, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_391, Icur := OriginalRow227TriangleData0060.coefficient3_390,
    output := OriginalRow227TriangleData0076.coefficient4_390, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_392, Icur := OriginalRow227TriangleData0060.coefficient3_391,
    output := OriginalRow227TriangleData0076.coefficient4_391, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_393, Icur := OriginalRow227TriangleData0060.coefficient3_392,
    output := OriginalRow227TriangleData0076.coefficient4_392, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_394, Icur := OriginalRow227TriangleData0060.coefficient3_393,
    output := OriginalRow227TriangleData0076.coefficient4_393, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_395, Icur := OriginalRow227TriangleData0060.coefficient3_394,
    output := OriginalRow227TriangleData0076.coefficient4_394, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_396, Icur := OriginalRow227TriangleData0060.coefficient3_395,
    output := OriginalRow227TriangleData0076.coefficient4_395, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_397, Icur := OriginalRow227TriangleData0060.coefficient3_396,
    output := OriginalRow227TriangleData0076.coefficient4_396, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_398, Icur := OriginalRow227TriangleData0060.coefficient3_397,
    output := OriginalRow227TriangleData0076.coefficient4_397, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_399, Icur := OriginalRow227TriangleData0060.coefficient3_398,
    output := OriginalRow227TriangleData0076.coefficient4_398, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_400, Icur := OriginalRow227TriangleData0060.coefficient3_399,
    output := OriginalRow227TriangleData0076.coefficient4_399, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_401, Icur := OriginalRow227TriangleData0060.coefficient3_400,
    output := OriginalRow227TriangleData0076.coefficient4_400, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_402, Icur := OriginalRow227TriangleData0060.coefficient3_401,
    output := OriginalRow227TriangleData0076.coefficient4_401, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_403, Icur := OriginalRow227TriangleData0060.coefficient3_402,
    output := OriginalRow227TriangleData0076.coefficient4_402, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_404, Icur := OriginalRow227TriangleData0060.coefficient3_403,
    output := OriginalRow227TriangleData0076.coefficient4_403, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_405, Icur := OriginalRow227TriangleData0060.coefficient3_404,
    output := OriginalRow227TriangleData0076.coefficient4_404, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_406, Icur := OriginalRow227TriangleData0060.coefficient3_405,
    output := OriginalRow227TriangleData0076.coefficient4_405, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_407, Icur := OriginalRow227TriangleData0060.coefficient3_406,
    output := OriginalRow227TriangleData0076.coefficient4_406, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_408, Icur := OriginalRow227TriangleData0060.coefficient3_407,
    output := OriginalRow227TriangleData0076.coefficient4_407, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_409, Icur := OriginalRow227TriangleData0060.coefficient3_408,
    output := OriginalRow227TriangleData0076.coefficient4_408, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_410, Icur := OriginalRow227TriangleData0060.coefficient3_409,
    output := OriginalRow227TriangleData0076.coefficient4_409, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_411, Icur := OriginalRow227TriangleData0060.coefficient3_410,
    output := OriginalRow227TriangleData0076.coefficient4_410, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_412, Icur := OriginalRow227TriangleData0060.coefficient3_411,
    output := OriginalRow227TriangleData0076.coefficient4_411, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_413, Icur := OriginalRow227TriangleData0060.coefficient3_412,
    output := OriginalRow227TriangleData0076.coefficient4_412, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_414, Icur := OriginalRow227TriangleData0060.coefficient3_413,
    output := OriginalRow227TriangleData0076.coefficient4_413, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_415, Icur := OriginalRow227TriangleData0060.coefficient3_414,
    output := OriginalRow227TriangleData0076.coefficient4_414, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_416, Icur := OriginalRow227TriangleData0060.coefficient3_415,
    output := OriginalRow227TriangleData0076.coefficient4_415, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0060.coefficient3_417, Icur := OriginalRow227TriangleData0060.coefficient3_416,
    output := OriginalRow227TriangleData0076.coefficient4_416, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0061.coefficient3_418, Icur := OriginalRow227TriangleData0060.coefficient3_417,
    output := OriginalRow227TriangleData0076.coefficient4_417, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0061.coefficient3_419, Icur := OriginalRow227TriangleData0061.coefficient3_418,
    output := OriginalRow227TriangleData0076.coefficient4_418, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0060

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0060.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
