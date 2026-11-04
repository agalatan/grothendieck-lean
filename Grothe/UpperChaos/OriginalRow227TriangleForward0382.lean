import Grothe.UpperChaos.OriginalRow227TriangleData0383
import Grothe.UpperChaos.OriginalRow227TriangleData0384
import Grothe.UpperChaos.OriginalRow227TriangleData0398
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0382
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_377, Icur := OriginalRow227TriangleData0383.coefficient24_376,
    output := OriginalRow227TriangleData0398.coefficient25_376, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_378, Icur := OriginalRow227TriangleData0383.coefficient24_377,
    output := OriginalRow227TriangleData0398.coefficient25_377, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_379, Icur := OriginalRow227TriangleData0383.coefficient24_378,
    output := OriginalRow227TriangleData0398.coefficient25_378, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_380, Icur := OriginalRow227TriangleData0383.coefficient24_379,
    output := OriginalRow227TriangleData0398.coefficient25_379, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_381, Icur := OriginalRow227TriangleData0383.coefficient24_380,
    output := OriginalRow227TriangleData0398.coefficient25_380, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_382, Icur := OriginalRow227TriangleData0383.coefficient24_381,
    output := OriginalRow227TriangleData0398.coefficient25_381, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_383, Icur := OriginalRow227TriangleData0383.coefficient24_382,
    output := OriginalRow227TriangleData0398.coefficient25_382, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_384, Icur := OriginalRow227TriangleData0383.coefficient24_383,
    output := OriginalRow227TriangleData0398.coefficient25_383, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_385, Icur := OriginalRow227TriangleData0383.coefficient24_384,
    output := OriginalRow227TriangleData0398.coefficient25_384, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_386, Icur := OriginalRow227TriangleData0383.coefficient24_385,
    output := OriginalRow227TriangleData0398.coefficient25_385, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_387, Icur := OriginalRow227TriangleData0383.coefficient24_386,
    output := OriginalRow227TriangleData0398.coefficient25_386, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_388, Icur := OriginalRow227TriangleData0383.coefficient24_387,
    output := OriginalRow227TriangleData0398.coefficient25_387, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_389, Icur := OriginalRow227TriangleData0383.coefficient24_388,
    output := OriginalRow227TriangleData0398.coefficient25_388, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_390, Icur := OriginalRow227TriangleData0383.coefficient24_389,
    output := OriginalRow227TriangleData0398.coefficient25_389, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_391, Icur := OriginalRow227TriangleData0383.coefficient24_390,
    output := OriginalRow227TriangleData0398.coefficient25_390, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_392, Icur := OriginalRow227TriangleData0383.coefficient24_391,
    output := OriginalRow227TriangleData0398.coefficient25_391, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_393, Icur := OriginalRow227TriangleData0383.coefficient24_392,
    output := OriginalRow227TriangleData0398.coefficient25_392, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_394, Icur := OriginalRow227TriangleData0383.coefficient24_393,
    output := OriginalRow227TriangleData0398.coefficient25_393, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_395, Icur := OriginalRow227TriangleData0383.coefficient24_394,
    output := OriginalRow227TriangleData0398.coefficient25_394, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_396, Icur := OriginalRow227TriangleData0383.coefficient24_395,
    output := OriginalRow227TriangleData0398.coefficient25_395, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_397, Icur := OriginalRow227TriangleData0383.coefficient24_396,
    output := OriginalRow227TriangleData0398.coefficient25_396, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_398, Icur := OriginalRow227TriangleData0383.coefficient24_397,
    output := OriginalRow227TriangleData0398.coefficient25_397, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_399, Icur := OriginalRow227TriangleData0383.coefficient24_398,
    output := OriginalRow227TriangleData0398.coefficient25_398, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_400, Icur := OriginalRow227TriangleData0383.coefficient24_399,
    output := OriginalRow227TriangleData0398.coefficient25_399, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_401, Icur := OriginalRow227TriangleData0383.coefficient24_400,
    output := OriginalRow227TriangleData0398.coefficient25_400, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_402, Icur := OriginalRow227TriangleData0383.coefficient24_401,
    output := OriginalRow227TriangleData0398.coefficient25_401, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_403, Icur := OriginalRow227TriangleData0383.coefficient24_402,
    output := OriginalRow227TriangleData0398.coefficient25_402, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_404, Icur := OriginalRow227TriangleData0383.coefficient24_403,
    output := OriginalRow227TriangleData0398.coefficient25_403, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_405, Icur := OriginalRow227TriangleData0383.coefficient24_404,
    output := OriginalRow227TriangleData0398.coefficient25_404, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_406, Icur := OriginalRow227TriangleData0383.coefficient24_405,
    output := OriginalRow227TriangleData0398.coefficient25_405, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0384.coefficient24_407, Icur := OriginalRow227TriangleData0383.coefficient24_406,
    output := OriginalRow227TriangleData0398.coefficient25_406, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0384.coefficient24_408, Icur := OriginalRow227TriangleData0384.coefficient24_407,
    output := OriginalRow227TriangleData0398.coefficient25_407, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0382

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0382.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
