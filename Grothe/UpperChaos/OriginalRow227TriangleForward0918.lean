import Grothe.UpperChaos.OriginalRow227TriangleData0922
import Grothe.UpperChaos.OriginalRow227TriangleData0923
import Grothe.UpperChaos.OriginalRow227TriangleData0934
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0918
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_385, Icur := OriginalRow227TriangleData0922.coefficient64_384,
    output := OriginalRow227TriangleData0934.coefficient65_384, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_386, Icur := OriginalRow227TriangleData0922.coefficient64_385,
    output := OriginalRow227TriangleData0934.coefficient65_385, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_387, Icur := OriginalRow227TriangleData0922.coefficient64_386,
    output := OriginalRow227TriangleData0934.coefficient65_386, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_388, Icur := OriginalRow227TriangleData0922.coefficient64_387,
    output := OriginalRow227TriangleData0934.coefficient65_387, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_389, Icur := OriginalRow227TriangleData0922.coefficient64_388,
    output := OriginalRow227TriangleData0934.coefficient65_388, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_390, Icur := OriginalRow227TriangleData0922.coefficient64_389,
    output := OriginalRow227TriangleData0934.coefficient65_389, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_391, Icur := OriginalRow227TriangleData0922.coefficient64_390,
    output := OriginalRow227TriangleData0934.coefficient65_390, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_392, Icur := OriginalRow227TriangleData0922.coefficient64_391,
    output := OriginalRow227TriangleData0934.coefficient65_391, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_393, Icur := OriginalRow227TriangleData0922.coefficient64_392,
    output := OriginalRow227TriangleData0934.coefficient65_392, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_394, Icur := OriginalRow227TriangleData0922.coefficient64_393,
    output := OriginalRow227TriangleData0934.coefficient65_393, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_395, Icur := OriginalRow227TriangleData0922.coefficient64_394,
    output := OriginalRow227TriangleData0934.coefficient65_394, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_396, Icur := OriginalRow227TriangleData0922.coefficient64_395,
    output := OriginalRow227TriangleData0934.coefficient65_395, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_397, Icur := OriginalRow227TriangleData0922.coefficient64_396,
    output := OriginalRow227TriangleData0934.coefficient65_396, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_398, Icur := OriginalRow227TriangleData0922.coefficient64_397,
    output := OriginalRow227TriangleData0934.coefficient65_397, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_399, Icur := OriginalRow227TriangleData0922.coefficient64_398,
    output := OriginalRow227TriangleData0934.coefficient65_398, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_400, Icur := OriginalRow227TriangleData0922.coefficient64_399,
    output := OriginalRow227TriangleData0934.coefficient65_399, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_401, Icur := OriginalRow227TriangleData0922.coefficient64_400,
    output := OriginalRow227TriangleData0934.coefficient65_400, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_402, Icur := OriginalRow227TriangleData0922.coefficient64_401,
    output := OriginalRow227TriangleData0934.coefficient65_401, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_403, Icur := OriginalRow227TriangleData0922.coefficient64_402,
    output := OriginalRow227TriangleData0934.coefficient65_402, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_404, Icur := OriginalRow227TriangleData0922.coefficient64_403,
    output := OriginalRow227TriangleData0934.coefficient65_403, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_405, Icur := OriginalRow227TriangleData0922.coefficient64_404,
    output := OriginalRow227TriangleData0934.coefficient65_404, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_406, Icur := OriginalRow227TriangleData0922.coefficient64_405,
    output := OriginalRow227TriangleData0934.coefficient65_405, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_407, Icur := OriginalRow227TriangleData0922.coefficient64_406,
    output := OriginalRow227TriangleData0934.coefficient65_406, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_408, Icur := OriginalRow227TriangleData0922.coefficient64_407,
    output := OriginalRow227TriangleData0934.coefficient65_407, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_409, Icur := OriginalRow227TriangleData0922.coefficient64_408,
    output := OriginalRow227TriangleData0934.coefficient65_408, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_410, Icur := OriginalRow227TriangleData0922.coefficient64_409,
    output := OriginalRow227TriangleData0934.coefficient65_409, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_411, Icur := OriginalRow227TriangleData0922.coefficient64_410,
    output := OriginalRow227TriangleData0934.coefficient65_410, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_412, Icur := OriginalRow227TriangleData0922.coefficient64_411,
    output := OriginalRow227TriangleData0934.coefficient65_411, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_413, Icur := OriginalRow227TriangleData0922.coefficient64_412,
    output := OriginalRow227TriangleData0934.coefficient65_412, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_414, Icur := OriginalRow227TriangleData0922.coefficient64_413,
    output := OriginalRow227TriangleData0934.coefficient65_413, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_415, Icur := OriginalRow227TriangleData0922.coefficient64_414,
    output := OriginalRow227TriangleData0934.coefficient65_414, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_416, Icur := OriginalRow227TriangleData0923.coefficient64_415,
    output := OriginalRow227TriangleData0934.coefficient65_415, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0918

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0918.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
