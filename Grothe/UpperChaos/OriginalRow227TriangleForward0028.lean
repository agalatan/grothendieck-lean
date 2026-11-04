import Grothe.UpperChaos.OriginalRow227TriangleData0028
import Grothe.UpperChaos.OriginalRow227TriangleData0029
import Grothe.UpperChaos.OriginalRow227TriangleData0044
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0028
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_386, Icur := OriginalRow227TriangleData0028.coefficient1_385,
    output := OriginalRow227TriangleData0044.coefficient2_385, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_387, Icur := OriginalRow227TriangleData0028.coefficient1_386,
    output := OriginalRow227TriangleData0044.coefficient2_386, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_388, Icur := OriginalRow227TriangleData0028.coefficient1_387,
    output := OriginalRow227TriangleData0044.coefficient2_387, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_389, Icur := OriginalRow227TriangleData0028.coefficient1_388,
    output := OriginalRow227TriangleData0044.coefficient2_388, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_390, Icur := OriginalRow227TriangleData0028.coefficient1_389,
    output := OriginalRow227TriangleData0044.coefficient2_389, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_391, Icur := OriginalRow227TriangleData0028.coefficient1_390,
    output := OriginalRow227TriangleData0044.coefficient2_390, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_392, Icur := OriginalRow227TriangleData0028.coefficient1_391,
    output := OriginalRow227TriangleData0044.coefficient2_391, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_393, Icur := OriginalRow227TriangleData0028.coefficient1_392,
    output := OriginalRow227TriangleData0044.coefficient2_392, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_394, Icur := OriginalRow227TriangleData0028.coefficient1_393,
    output := OriginalRow227TriangleData0044.coefficient2_393, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_395, Icur := OriginalRow227TriangleData0028.coefficient1_394,
    output := OriginalRow227TriangleData0044.coefficient2_394, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_396, Icur := OriginalRow227TriangleData0028.coefficient1_395,
    output := OriginalRow227TriangleData0044.coefficient2_395, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_397, Icur := OriginalRow227TriangleData0028.coefficient1_396,
    output := OriginalRow227TriangleData0044.coefficient2_396, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_398, Icur := OriginalRow227TriangleData0028.coefficient1_397,
    output := OriginalRow227TriangleData0044.coefficient2_397, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_399, Icur := OriginalRow227TriangleData0028.coefficient1_398,
    output := OriginalRow227TriangleData0044.coefficient2_398, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_400, Icur := OriginalRow227TriangleData0028.coefficient1_399,
    output := OriginalRow227TriangleData0044.coefficient2_399, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_401, Icur := OriginalRow227TriangleData0028.coefficient1_400,
    output := OriginalRow227TriangleData0044.coefficient2_400, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_402, Icur := OriginalRow227TriangleData0028.coefficient1_401,
    output := OriginalRow227TriangleData0044.coefficient2_401, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_403, Icur := OriginalRow227TriangleData0028.coefficient1_402,
    output := OriginalRow227TriangleData0044.coefficient2_402, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_404, Icur := OriginalRow227TriangleData0028.coefficient1_403,
    output := OriginalRow227TriangleData0044.coefficient2_403, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_405, Icur := OriginalRow227TriangleData0028.coefficient1_404,
    output := OriginalRow227TriangleData0044.coefficient2_404, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_406, Icur := OriginalRow227TriangleData0028.coefficient1_405,
    output := OriginalRow227TriangleData0044.coefficient2_405, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_407, Icur := OriginalRow227TriangleData0028.coefficient1_406,
    output := OriginalRow227TriangleData0044.coefficient2_406, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_408, Icur := OriginalRow227TriangleData0028.coefficient1_407,
    output := OriginalRow227TriangleData0044.coefficient2_407, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_409, Icur := OriginalRow227TriangleData0028.coefficient1_408,
    output := OriginalRow227TriangleData0044.coefficient2_408, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_410, Icur := OriginalRow227TriangleData0028.coefficient1_409,
    output := OriginalRow227TriangleData0044.coefficient2_409, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_411, Icur := OriginalRow227TriangleData0028.coefficient1_410,
    output := OriginalRow227TriangleData0044.coefficient2_410, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_412, Icur := OriginalRow227TriangleData0028.coefficient1_411,
    output := OriginalRow227TriangleData0044.coefficient2_411, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_413, Icur := OriginalRow227TriangleData0028.coefficient1_412,
    output := OriginalRow227TriangleData0044.coefficient2_412, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_414, Icur := OriginalRow227TriangleData0028.coefficient1_413,
    output := OriginalRow227TriangleData0044.coefficient2_413, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_415, Icur := OriginalRow227TriangleData0028.coefficient1_414,
    output := OriginalRow227TriangleData0044.coefficient2_414, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0029.coefficient1_416, Icur := OriginalRow227TriangleData0028.coefficient1_415,
    output := OriginalRow227TriangleData0044.coefficient2_415, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0029.coefficient1_417, Icur := OriginalRow227TriangleData0029.coefficient1_416,
    output := OriginalRow227TriangleData0044.coefficient2_416, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0028

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0028.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
