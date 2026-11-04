import Grothe.UpperChaos.OriginalRow227TriangleData0368
import Grothe.UpperChaos.OriginalRow227TriangleData0369
import Grothe.UpperChaos.OriginalRow227TriangleData0383
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0367
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_376, Icur := OriginalRow227TriangleData0368.coefficient23_375,
    output := OriginalRow227TriangleData0383.coefficient24_375, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_377, Icur := OriginalRow227TriangleData0368.coefficient23_376,
    output := OriginalRow227TriangleData0383.coefficient24_376, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_378, Icur := OriginalRow227TriangleData0368.coefficient23_377,
    output := OriginalRow227TriangleData0383.coefficient24_377, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_379, Icur := OriginalRow227TriangleData0368.coefficient23_378,
    output := OriginalRow227TriangleData0383.coefficient24_378, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_380, Icur := OriginalRow227TriangleData0368.coefficient23_379,
    output := OriginalRow227TriangleData0383.coefficient24_379, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_381, Icur := OriginalRow227TriangleData0368.coefficient23_380,
    output := OriginalRow227TriangleData0383.coefficient24_380, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_382, Icur := OriginalRow227TriangleData0368.coefficient23_381,
    output := OriginalRow227TriangleData0383.coefficient24_381, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_383, Icur := OriginalRow227TriangleData0368.coefficient23_382,
    output := OriginalRow227TriangleData0383.coefficient24_382, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_384, Icur := OriginalRow227TriangleData0368.coefficient23_383,
    output := OriginalRow227TriangleData0383.coefficient24_383, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_385, Icur := OriginalRow227TriangleData0368.coefficient23_384,
    output := OriginalRow227TriangleData0383.coefficient24_384, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_386, Icur := OriginalRow227TriangleData0368.coefficient23_385,
    output := OriginalRow227TriangleData0383.coefficient24_385, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_387, Icur := OriginalRow227TriangleData0368.coefficient23_386,
    output := OriginalRow227TriangleData0383.coefficient24_386, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_388, Icur := OriginalRow227TriangleData0368.coefficient23_387,
    output := OriginalRow227TriangleData0383.coefficient24_387, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_389, Icur := OriginalRow227TriangleData0368.coefficient23_388,
    output := OriginalRow227TriangleData0383.coefficient24_388, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_390, Icur := OriginalRow227TriangleData0368.coefficient23_389,
    output := OriginalRow227TriangleData0383.coefficient24_389, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_391, Icur := OriginalRow227TriangleData0368.coefficient23_390,
    output := OriginalRow227TriangleData0383.coefficient24_390, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_392, Icur := OriginalRow227TriangleData0368.coefficient23_391,
    output := OriginalRow227TriangleData0383.coefficient24_391, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_393, Icur := OriginalRow227TriangleData0368.coefficient23_392,
    output := OriginalRow227TriangleData0383.coefficient24_392, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_394, Icur := OriginalRow227TriangleData0368.coefficient23_393,
    output := OriginalRow227TriangleData0383.coefficient24_393, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_395, Icur := OriginalRow227TriangleData0368.coefficient23_394,
    output := OriginalRow227TriangleData0383.coefficient24_394, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_396, Icur := OriginalRow227TriangleData0368.coefficient23_395,
    output := OriginalRow227TriangleData0383.coefficient24_395, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_397, Icur := OriginalRow227TriangleData0368.coefficient23_396,
    output := OriginalRow227TriangleData0383.coefficient24_396, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_398, Icur := OriginalRow227TriangleData0368.coefficient23_397,
    output := OriginalRow227TriangleData0383.coefficient24_397, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_399, Icur := OriginalRow227TriangleData0368.coefficient23_398,
    output := OriginalRow227TriangleData0383.coefficient24_398, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_400, Icur := OriginalRow227TriangleData0368.coefficient23_399,
    output := OriginalRow227TriangleData0383.coefficient24_399, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_401, Icur := OriginalRow227TriangleData0368.coefficient23_400,
    output := OriginalRow227TriangleData0383.coefficient24_400, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_402, Icur := OriginalRow227TriangleData0368.coefficient23_401,
    output := OriginalRow227TriangleData0383.coefficient24_401, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_403, Icur := OriginalRow227TriangleData0368.coefficient23_402,
    output := OriginalRow227TriangleData0383.coefficient24_402, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_404, Icur := OriginalRow227TriangleData0368.coefficient23_403,
    output := OriginalRow227TriangleData0383.coefficient24_403, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0368.coefficient23_405, Icur := OriginalRow227TriangleData0368.coefficient23_404,
    output := OriginalRow227TriangleData0383.coefficient24_404, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0369.coefficient23_406, Icur := OriginalRow227TriangleData0368.coefficient23_405,
    output := OriginalRow227TriangleData0383.coefficient24_405, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0369.coefficient23_407, Icur := OriginalRow227TriangleData0369.coefficient23_406,
    output := OriginalRow227TriangleData0383.coefficient24_406, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0367

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0367.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
