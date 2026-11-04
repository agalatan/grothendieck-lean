import Grothe.UpperChaos.OriginalRow227TriangleData0457
import Grothe.UpperChaos.OriginalRow227TriangleData0458
import Grothe.UpperChaos.OriginalRow227TriangleData0471
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0455
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_382, Icur := OriginalRow227TriangleData0457.coefficient29_381,
    output := OriginalRow227TriangleData0471.coefficient30_381, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_383, Icur := OriginalRow227TriangleData0457.coefficient29_382,
    output := OriginalRow227TriangleData0471.coefficient30_382, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_384, Icur := OriginalRow227TriangleData0457.coefficient29_383,
    output := OriginalRow227TriangleData0471.coefficient30_383, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_385, Icur := OriginalRow227TriangleData0457.coefficient29_384,
    output := OriginalRow227TriangleData0471.coefficient30_384, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_386, Icur := OriginalRow227TriangleData0457.coefficient29_385,
    output := OriginalRow227TriangleData0471.coefficient30_385, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_387, Icur := OriginalRow227TriangleData0457.coefficient29_386,
    output := OriginalRow227TriangleData0471.coefficient30_386, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_388, Icur := OriginalRow227TriangleData0457.coefficient29_387,
    output := OriginalRow227TriangleData0471.coefficient30_387, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_389, Icur := OriginalRow227TriangleData0457.coefficient29_388,
    output := OriginalRow227TriangleData0471.coefficient30_388, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_390, Icur := OriginalRow227TriangleData0457.coefficient29_389,
    output := OriginalRow227TriangleData0471.coefficient30_389, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_391, Icur := OriginalRow227TriangleData0457.coefficient29_390,
    output := OriginalRow227TriangleData0471.coefficient30_390, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_392, Icur := OriginalRow227TriangleData0457.coefficient29_391,
    output := OriginalRow227TriangleData0471.coefficient30_391, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_393, Icur := OriginalRow227TriangleData0457.coefficient29_392,
    output := OriginalRow227TriangleData0471.coefficient30_392, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_394, Icur := OriginalRow227TriangleData0457.coefficient29_393,
    output := OriginalRow227TriangleData0471.coefficient30_393, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_395, Icur := OriginalRow227TriangleData0457.coefficient29_394,
    output := OriginalRow227TriangleData0471.coefficient30_394, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_396, Icur := OriginalRow227TriangleData0457.coefficient29_395,
    output := OriginalRow227TriangleData0471.coefficient30_395, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_397, Icur := OriginalRow227TriangleData0457.coefficient29_396,
    output := OriginalRow227TriangleData0471.coefficient30_396, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_398, Icur := OriginalRow227TriangleData0457.coefficient29_397,
    output := OriginalRow227TriangleData0471.coefficient30_397, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_399, Icur := OriginalRow227TriangleData0457.coefficient29_398,
    output := OriginalRow227TriangleData0471.coefficient30_398, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_400, Icur := OriginalRow227TriangleData0457.coefficient29_399,
    output := OriginalRow227TriangleData0471.coefficient30_399, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_401, Icur := OriginalRow227TriangleData0457.coefficient29_400,
    output := OriginalRow227TriangleData0471.coefficient30_400, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_402, Icur := OriginalRow227TriangleData0457.coefficient29_401,
    output := OriginalRow227TriangleData0471.coefficient30_401, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_403, Icur := OriginalRow227TriangleData0457.coefficient29_402,
    output := OriginalRow227TriangleData0471.coefficient30_402, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_404, Icur := OriginalRow227TriangleData0457.coefficient29_403,
    output := OriginalRow227TriangleData0471.coefficient30_403, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_405, Icur := OriginalRow227TriangleData0457.coefficient29_404,
    output := OriginalRow227TriangleData0471.coefficient30_404, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_406, Icur := OriginalRow227TriangleData0457.coefficient29_405,
    output := OriginalRow227TriangleData0471.coefficient30_405, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_407, Icur := OriginalRow227TriangleData0457.coefficient29_406,
    output := OriginalRow227TriangleData0471.coefficient30_406, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_408, Icur := OriginalRow227TriangleData0457.coefficient29_407,
    output := OriginalRow227TriangleData0471.coefficient30_407, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_409, Icur := OriginalRow227TriangleData0457.coefficient29_408,
    output := OriginalRow227TriangleData0471.coefficient30_408, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_410, Icur := OriginalRow227TriangleData0457.coefficient29_409,
    output := OriginalRow227TriangleData0471.coefficient30_409, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0457.coefficient29_411, Icur := OriginalRow227TriangleData0457.coefficient29_410,
    output := OriginalRow227TriangleData0471.coefficient30_410, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0458.coefficient29_412, Icur := OriginalRow227TriangleData0457.coefficient29_411,
    output := OriginalRow227TriangleData0471.coefficient30_411, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0458.coefficient29_413, Icur := OriginalRow227TriangleData0458.coefficient29_412,
    output := OriginalRow227TriangleData0471.coefficient30_412, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0455

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0455.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
