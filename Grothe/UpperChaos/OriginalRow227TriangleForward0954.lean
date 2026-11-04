import Grothe.UpperChaos.OriginalRow227TriangleData0958
import Grothe.UpperChaos.OriginalRow227TriangleData0959
import Grothe.UpperChaos.OriginalRow227TriangleData0970
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0954
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_388, Icur := OriginalRow227TriangleData0958.coefficient67_387,
    output := OriginalRow227TriangleData0970.coefficient68_387, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_389, Icur := OriginalRow227TriangleData0958.coefficient67_388,
    output := OriginalRow227TriangleData0970.coefficient68_388, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_390, Icur := OriginalRow227TriangleData0958.coefficient67_389,
    output := OriginalRow227TriangleData0970.coefficient68_389, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_391, Icur := OriginalRow227TriangleData0958.coefficient67_390,
    output := OriginalRow227TriangleData0970.coefficient68_390, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_392, Icur := OriginalRow227TriangleData0958.coefficient67_391,
    output := OriginalRow227TriangleData0970.coefficient68_391, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_393, Icur := OriginalRow227TriangleData0958.coefficient67_392,
    output := OriginalRow227TriangleData0970.coefficient68_392, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_394, Icur := OriginalRow227TriangleData0958.coefficient67_393,
    output := OriginalRow227TriangleData0970.coefficient68_393, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_395, Icur := OriginalRow227TriangleData0958.coefficient67_394,
    output := OriginalRow227TriangleData0970.coefficient68_394, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_396, Icur := OriginalRow227TriangleData0958.coefficient67_395,
    output := OriginalRow227TriangleData0970.coefficient68_395, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_397, Icur := OriginalRow227TriangleData0958.coefficient67_396,
    output := OriginalRow227TriangleData0970.coefficient68_396, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_398, Icur := OriginalRow227TriangleData0958.coefficient67_397,
    output := OriginalRow227TriangleData0970.coefficient68_397, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_399, Icur := OriginalRow227TriangleData0958.coefficient67_398,
    output := OriginalRow227TriangleData0970.coefficient68_398, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_400, Icur := OriginalRow227TriangleData0958.coefficient67_399,
    output := OriginalRow227TriangleData0970.coefficient68_399, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_401, Icur := OriginalRow227TriangleData0958.coefficient67_400,
    output := OriginalRow227TriangleData0970.coefficient68_400, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_402, Icur := OriginalRow227TriangleData0958.coefficient67_401,
    output := OriginalRow227TriangleData0970.coefficient68_401, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_403, Icur := OriginalRow227TriangleData0958.coefficient67_402,
    output := OriginalRow227TriangleData0970.coefficient68_402, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_404, Icur := OriginalRow227TriangleData0958.coefficient67_403,
    output := OriginalRow227TriangleData0970.coefficient68_403, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_405, Icur := OriginalRow227TriangleData0958.coefficient67_404,
    output := OriginalRow227TriangleData0970.coefficient68_404, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_406, Icur := OriginalRow227TriangleData0958.coefficient67_405,
    output := OriginalRow227TriangleData0970.coefficient68_405, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_407, Icur := OriginalRow227TriangleData0958.coefficient67_406,
    output := OriginalRow227TriangleData0970.coefficient68_406, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_408, Icur := OriginalRow227TriangleData0958.coefficient67_407,
    output := OriginalRow227TriangleData0970.coefficient68_407, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_409, Icur := OriginalRow227TriangleData0958.coefficient67_408,
    output := OriginalRow227TriangleData0970.coefficient68_408, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_410, Icur := OriginalRow227TriangleData0958.coefficient67_409,
    output := OriginalRow227TriangleData0970.coefficient68_409, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_411, Icur := OriginalRow227TriangleData0958.coefficient67_410,
    output := OriginalRow227TriangleData0970.coefficient68_410, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_412, Icur := OriginalRow227TriangleData0958.coefficient67_411,
    output := OriginalRow227TriangleData0970.coefficient68_411, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_413, Icur := OriginalRow227TriangleData0958.coefficient67_412,
    output := OriginalRow227TriangleData0970.coefficient68_412, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_414, Icur := OriginalRow227TriangleData0958.coefficient67_413,
    output := OriginalRow227TriangleData0970.coefficient68_413, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_415, Icur := OriginalRow227TriangleData0958.coefficient67_414,
    output := OriginalRow227TriangleData0970.coefficient68_414, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_416, Icur := OriginalRow227TriangleData0958.coefficient67_415,
    output := OriginalRow227TriangleData0970.coefficient68_415, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_417, Icur := OriginalRow227TriangleData0958.coefficient67_416,
    output := OriginalRow227TriangleData0970.coefficient68_416, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_418, Icur := OriginalRow227TriangleData0958.coefficient67_417,
    output := OriginalRow227TriangleData0970.coefficient68_417, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_419, Icur := OriginalRow227TriangleData0959.coefficient67_418,
    output := OriginalRow227TriangleData0970.coefficient68_418, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0954

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0954.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
