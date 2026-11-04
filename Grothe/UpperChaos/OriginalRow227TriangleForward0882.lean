import Grothe.UpperChaos.OriginalRow227TriangleData0886
import Grothe.UpperChaos.OriginalRow227TriangleData0887
import Grothe.UpperChaos.OriginalRow227TriangleData0898
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0882
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_382, Icur := OriginalRow227TriangleData0886.coefficient61_381,
    output := OriginalRow227TriangleData0898.coefficient62_381, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_383, Icur := OriginalRow227TriangleData0886.coefficient61_382,
    output := OriginalRow227TriangleData0898.coefficient62_382, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_384, Icur := OriginalRow227TriangleData0886.coefficient61_383,
    output := OriginalRow227TriangleData0898.coefficient62_383, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_385, Icur := OriginalRow227TriangleData0886.coefficient61_384,
    output := OriginalRow227TriangleData0898.coefficient62_384, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_386, Icur := OriginalRow227TriangleData0886.coefficient61_385,
    output := OriginalRow227TriangleData0898.coefficient62_385, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_387, Icur := OriginalRow227TriangleData0886.coefficient61_386,
    output := OriginalRow227TriangleData0898.coefficient62_386, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_388, Icur := OriginalRow227TriangleData0886.coefficient61_387,
    output := OriginalRow227TriangleData0898.coefficient62_387, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_389, Icur := OriginalRow227TriangleData0886.coefficient61_388,
    output := OriginalRow227TriangleData0898.coefficient62_388, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_390, Icur := OriginalRow227TriangleData0886.coefficient61_389,
    output := OriginalRow227TriangleData0898.coefficient62_389, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_391, Icur := OriginalRow227TriangleData0886.coefficient61_390,
    output := OriginalRow227TriangleData0898.coefficient62_390, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_392, Icur := OriginalRow227TriangleData0886.coefficient61_391,
    output := OriginalRow227TriangleData0898.coefficient62_391, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_393, Icur := OriginalRow227TriangleData0886.coefficient61_392,
    output := OriginalRow227TriangleData0898.coefficient62_392, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_394, Icur := OriginalRow227TriangleData0886.coefficient61_393,
    output := OriginalRow227TriangleData0898.coefficient62_393, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_395, Icur := OriginalRow227TriangleData0886.coefficient61_394,
    output := OriginalRow227TriangleData0898.coefficient62_394, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_396, Icur := OriginalRow227TriangleData0886.coefficient61_395,
    output := OriginalRow227TriangleData0898.coefficient62_395, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_397, Icur := OriginalRow227TriangleData0886.coefficient61_396,
    output := OriginalRow227TriangleData0898.coefficient62_396, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_398, Icur := OriginalRow227TriangleData0886.coefficient61_397,
    output := OriginalRow227TriangleData0898.coefficient62_397, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_399, Icur := OriginalRow227TriangleData0886.coefficient61_398,
    output := OriginalRow227TriangleData0898.coefficient62_398, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_400, Icur := OriginalRow227TriangleData0886.coefficient61_399,
    output := OriginalRow227TriangleData0898.coefficient62_399, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_401, Icur := OriginalRow227TriangleData0886.coefficient61_400,
    output := OriginalRow227TriangleData0898.coefficient62_400, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_402, Icur := OriginalRow227TriangleData0886.coefficient61_401,
    output := OriginalRow227TriangleData0898.coefficient62_401, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_403, Icur := OriginalRow227TriangleData0886.coefficient61_402,
    output := OriginalRow227TriangleData0898.coefficient62_402, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_404, Icur := OriginalRow227TriangleData0886.coefficient61_403,
    output := OriginalRow227TriangleData0898.coefficient62_403, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_405, Icur := OriginalRow227TriangleData0886.coefficient61_404,
    output := OriginalRow227TriangleData0898.coefficient62_404, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_406, Icur := OriginalRow227TriangleData0886.coefficient61_405,
    output := OriginalRow227TriangleData0898.coefficient62_405, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_407, Icur := OriginalRow227TriangleData0886.coefficient61_406,
    output := OriginalRow227TriangleData0898.coefficient62_406, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_408, Icur := OriginalRow227TriangleData0886.coefficient61_407,
    output := OriginalRow227TriangleData0898.coefficient62_407, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_409, Icur := OriginalRow227TriangleData0886.coefficient61_408,
    output := OriginalRow227TriangleData0898.coefficient62_408, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_410, Icur := OriginalRow227TriangleData0886.coefficient61_409,
    output := OriginalRow227TriangleData0898.coefficient62_409, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_411, Icur := OriginalRow227TriangleData0886.coefficient61_410,
    output := OriginalRow227TriangleData0898.coefficient62_410, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0887.coefficient61_412, Icur := OriginalRow227TriangleData0886.coefficient61_411,
    output := OriginalRow227TriangleData0898.coefficient62_411, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0887.coefficient61_413, Icur := OriginalRow227TriangleData0887.coefficient61_412,
    output := OriginalRow227TriangleData0898.coefficient62_412, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0882

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0882.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
