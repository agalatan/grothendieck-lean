import Grothe.UpperChaos.OriginalRow227TriangleData0934
import Grothe.UpperChaos.OriginalRow227TriangleData0935
import Grothe.UpperChaos.OriginalRow227TriangleData0946
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0930
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_386, Icur := OriginalRow227TriangleData0934.coefficient65_385,
    output := OriginalRow227TriangleData0946.coefficient66_385, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_387, Icur := OriginalRow227TriangleData0934.coefficient65_386,
    output := OriginalRow227TriangleData0946.coefficient66_386, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_388, Icur := OriginalRow227TriangleData0934.coefficient65_387,
    output := OriginalRow227TriangleData0946.coefficient66_387, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_389, Icur := OriginalRow227TriangleData0934.coefficient65_388,
    output := OriginalRow227TriangleData0946.coefficient66_388, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_390, Icur := OriginalRow227TriangleData0934.coefficient65_389,
    output := OriginalRow227TriangleData0946.coefficient66_389, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_391, Icur := OriginalRow227TriangleData0934.coefficient65_390,
    output := OriginalRow227TriangleData0946.coefficient66_390, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_392, Icur := OriginalRow227TriangleData0934.coefficient65_391,
    output := OriginalRow227TriangleData0946.coefficient66_391, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_393, Icur := OriginalRow227TriangleData0934.coefficient65_392,
    output := OriginalRow227TriangleData0946.coefficient66_392, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_394, Icur := OriginalRow227TriangleData0934.coefficient65_393,
    output := OriginalRow227TriangleData0946.coefficient66_393, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_395, Icur := OriginalRow227TriangleData0934.coefficient65_394,
    output := OriginalRow227TriangleData0946.coefficient66_394, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_396, Icur := OriginalRow227TriangleData0934.coefficient65_395,
    output := OriginalRow227TriangleData0946.coefficient66_395, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_397, Icur := OriginalRow227TriangleData0934.coefficient65_396,
    output := OriginalRow227TriangleData0946.coefficient66_396, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_398, Icur := OriginalRow227TriangleData0934.coefficient65_397,
    output := OriginalRow227TriangleData0946.coefficient66_397, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_399, Icur := OriginalRow227TriangleData0934.coefficient65_398,
    output := OriginalRow227TriangleData0946.coefficient66_398, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_400, Icur := OriginalRow227TriangleData0934.coefficient65_399,
    output := OriginalRow227TriangleData0946.coefficient66_399, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_401, Icur := OriginalRow227TriangleData0934.coefficient65_400,
    output := OriginalRow227TriangleData0946.coefficient66_400, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_402, Icur := OriginalRow227TriangleData0934.coefficient65_401,
    output := OriginalRow227TriangleData0946.coefficient66_401, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_403, Icur := OriginalRow227TriangleData0934.coefficient65_402,
    output := OriginalRow227TriangleData0946.coefficient66_402, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_404, Icur := OriginalRow227TriangleData0934.coefficient65_403,
    output := OriginalRow227TriangleData0946.coefficient66_403, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_405, Icur := OriginalRow227TriangleData0934.coefficient65_404,
    output := OriginalRow227TriangleData0946.coefficient66_404, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_406, Icur := OriginalRow227TriangleData0934.coefficient65_405,
    output := OriginalRow227TriangleData0946.coefficient66_405, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_407, Icur := OriginalRow227TriangleData0934.coefficient65_406,
    output := OriginalRow227TriangleData0946.coefficient66_406, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_408, Icur := OriginalRow227TriangleData0934.coefficient65_407,
    output := OriginalRow227TriangleData0946.coefficient66_407, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_409, Icur := OriginalRow227TriangleData0934.coefficient65_408,
    output := OriginalRow227TriangleData0946.coefficient66_408, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_410, Icur := OriginalRow227TriangleData0934.coefficient65_409,
    output := OriginalRow227TriangleData0946.coefficient66_409, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_411, Icur := OriginalRow227TriangleData0934.coefficient65_410,
    output := OriginalRow227TriangleData0946.coefficient66_410, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_412, Icur := OriginalRow227TriangleData0934.coefficient65_411,
    output := OriginalRow227TriangleData0946.coefficient66_411, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_413, Icur := OriginalRow227TriangleData0934.coefficient65_412,
    output := OriginalRow227TriangleData0946.coefficient66_412, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_414, Icur := OriginalRow227TriangleData0934.coefficient65_413,
    output := OriginalRow227TriangleData0946.coefficient66_413, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_415, Icur := OriginalRow227TriangleData0934.coefficient65_414,
    output := OriginalRow227TriangleData0946.coefficient66_414, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0935.coefficient65_416, Icur := OriginalRow227TriangleData0934.coefficient65_415,
    output := OriginalRow227TriangleData0946.coefficient66_415, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0935.coefficient65_417, Icur := OriginalRow227TriangleData0935.coefficient65_416,
    output := OriginalRow227TriangleData0946.coefficient66_416, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0930

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0930.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
