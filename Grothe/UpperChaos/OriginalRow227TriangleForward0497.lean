import Grothe.UpperChaos.OriginalRow227TriangleData0499
import Grothe.UpperChaos.OriginalRow227TriangleData0500
import Grothe.UpperChaos.OriginalRow227TriangleData0513
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0497
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_385, Icur := OriginalRow227TriangleData0499.coefficient32_384,
    output := OriginalRow227TriangleData0513.coefficient33_384, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_386, Icur := OriginalRow227TriangleData0499.coefficient32_385,
    output := OriginalRow227TriangleData0513.coefficient33_385, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_387, Icur := OriginalRow227TriangleData0499.coefficient32_386,
    output := OriginalRow227TriangleData0513.coefficient33_386, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_388, Icur := OriginalRow227TriangleData0499.coefficient32_387,
    output := OriginalRow227TriangleData0513.coefficient33_387, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_389, Icur := OriginalRow227TriangleData0499.coefficient32_388,
    output := OriginalRow227TriangleData0513.coefficient33_388, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_390, Icur := OriginalRow227TriangleData0499.coefficient32_389,
    output := OriginalRow227TriangleData0513.coefficient33_389, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_391, Icur := OriginalRow227TriangleData0499.coefficient32_390,
    output := OriginalRow227TriangleData0513.coefficient33_390, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_392, Icur := OriginalRow227TriangleData0499.coefficient32_391,
    output := OriginalRow227TriangleData0513.coefficient33_391, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_393, Icur := OriginalRow227TriangleData0499.coefficient32_392,
    output := OriginalRow227TriangleData0513.coefficient33_392, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_394, Icur := OriginalRow227TriangleData0499.coefficient32_393,
    output := OriginalRow227TriangleData0513.coefficient33_393, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_395, Icur := OriginalRow227TriangleData0499.coefficient32_394,
    output := OriginalRow227TriangleData0513.coefficient33_394, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_396, Icur := OriginalRow227TriangleData0499.coefficient32_395,
    output := OriginalRow227TriangleData0513.coefficient33_395, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_397, Icur := OriginalRow227TriangleData0499.coefficient32_396,
    output := OriginalRow227TriangleData0513.coefficient33_396, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_398, Icur := OriginalRow227TriangleData0499.coefficient32_397,
    output := OriginalRow227TriangleData0513.coefficient33_397, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_399, Icur := OriginalRow227TriangleData0499.coefficient32_398,
    output := OriginalRow227TriangleData0513.coefficient33_398, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_400, Icur := OriginalRow227TriangleData0499.coefficient32_399,
    output := OriginalRow227TriangleData0513.coefficient33_399, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_401, Icur := OriginalRow227TriangleData0499.coefficient32_400,
    output := OriginalRow227TriangleData0513.coefficient33_400, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_402, Icur := OriginalRow227TriangleData0499.coefficient32_401,
    output := OriginalRow227TriangleData0513.coefficient33_401, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_403, Icur := OriginalRow227TriangleData0499.coefficient32_402,
    output := OriginalRow227TriangleData0513.coefficient33_402, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_404, Icur := OriginalRow227TriangleData0499.coefficient32_403,
    output := OriginalRow227TriangleData0513.coefficient33_403, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_405, Icur := OriginalRow227TriangleData0499.coefficient32_404,
    output := OriginalRow227TriangleData0513.coefficient33_404, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_406, Icur := OriginalRow227TriangleData0499.coefficient32_405,
    output := OriginalRow227TriangleData0513.coefficient33_405, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_407, Icur := OriginalRow227TriangleData0499.coefficient32_406,
    output := OriginalRow227TriangleData0513.coefficient33_406, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_408, Icur := OriginalRow227TriangleData0499.coefficient32_407,
    output := OriginalRow227TriangleData0513.coefficient33_407, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_409, Icur := OriginalRow227TriangleData0499.coefficient32_408,
    output := OriginalRow227TriangleData0513.coefficient33_408, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_410, Icur := OriginalRow227TriangleData0499.coefficient32_409,
    output := OriginalRow227TriangleData0513.coefficient33_409, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_411, Icur := OriginalRow227TriangleData0499.coefficient32_410,
    output := OriginalRow227TriangleData0513.coefficient33_410, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_412, Icur := OriginalRow227TriangleData0499.coefficient32_411,
    output := OriginalRow227TriangleData0513.coefficient33_411, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_413, Icur := OriginalRow227TriangleData0499.coefficient32_412,
    output := OriginalRow227TriangleData0513.coefficient33_412, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0499.coefficient32_414, Icur := OriginalRow227TriangleData0499.coefficient32_413,
    output := OriginalRow227TriangleData0513.coefficient33_413, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_415, Icur := OriginalRow227TriangleData0499.coefficient32_414,
    output := OriginalRow227TriangleData0513.coefficient33_414, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_416, Icur := OriginalRow227TriangleData0500.coefficient32_415,
    output := OriginalRow227TriangleData0513.coefficient33_415, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0497

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0497.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
