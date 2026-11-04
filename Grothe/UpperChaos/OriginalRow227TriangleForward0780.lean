import Grothe.UpperChaos.OriginalRow227TriangleData0783
import Grothe.UpperChaos.OriginalRow227TriangleData0784
import Grothe.UpperChaos.OriginalRow227TriangleData0796
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0780
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_374, Icur := OriginalRow227TriangleData0783.coefficient53_373,
    output := OriginalRow227TriangleData0796.coefficient54_373, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_375, Icur := OriginalRow227TriangleData0783.coefficient53_374,
    output := OriginalRow227TriangleData0796.coefficient54_374, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_376, Icur := OriginalRow227TriangleData0783.coefficient53_375,
    output := OriginalRow227TriangleData0796.coefficient54_375, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_377, Icur := OriginalRow227TriangleData0783.coefficient53_376,
    output := OriginalRow227TriangleData0796.coefficient54_376, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_378, Icur := OriginalRow227TriangleData0783.coefficient53_377,
    output := OriginalRow227TriangleData0796.coefficient54_377, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_379, Icur := OriginalRow227TriangleData0783.coefficient53_378,
    output := OriginalRow227TriangleData0796.coefficient54_378, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_380, Icur := OriginalRow227TriangleData0783.coefficient53_379,
    output := OriginalRow227TriangleData0796.coefficient54_379, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_381, Icur := OriginalRow227TriangleData0783.coefficient53_380,
    output := OriginalRow227TriangleData0796.coefficient54_380, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_382, Icur := OriginalRow227TriangleData0783.coefficient53_381,
    output := OriginalRow227TriangleData0796.coefficient54_381, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_383, Icur := OriginalRow227TriangleData0783.coefficient53_382,
    output := OriginalRow227TriangleData0796.coefficient54_382, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_384, Icur := OriginalRow227TriangleData0783.coefficient53_383,
    output := OriginalRow227TriangleData0796.coefficient54_383, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_385, Icur := OriginalRow227TriangleData0783.coefficient53_384,
    output := OriginalRow227TriangleData0796.coefficient54_384, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_386, Icur := OriginalRow227TriangleData0783.coefficient53_385,
    output := OriginalRow227TriangleData0796.coefficient54_385, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_387, Icur := OriginalRow227TriangleData0783.coefficient53_386,
    output := OriginalRow227TriangleData0796.coefficient54_386, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_388, Icur := OriginalRow227TriangleData0783.coefficient53_387,
    output := OriginalRow227TriangleData0796.coefficient54_387, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_389, Icur := OriginalRow227TriangleData0783.coefficient53_388,
    output := OriginalRow227TriangleData0796.coefficient54_388, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_390, Icur := OriginalRow227TriangleData0783.coefficient53_389,
    output := OriginalRow227TriangleData0796.coefficient54_389, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_391, Icur := OriginalRow227TriangleData0783.coefficient53_390,
    output := OriginalRow227TriangleData0796.coefficient54_390, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_392, Icur := OriginalRow227TriangleData0783.coefficient53_391,
    output := OriginalRow227TriangleData0796.coefficient54_391, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_393, Icur := OriginalRow227TriangleData0783.coefficient53_392,
    output := OriginalRow227TriangleData0796.coefficient54_392, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_394, Icur := OriginalRow227TriangleData0783.coefficient53_393,
    output := OriginalRow227TriangleData0796.coefficient54_393, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_395, Icur := OriginalRow227TriangleData0783.coefficient53_394,
    output := OriginalRow227TriangleData0796.coefficient54_394, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_396, Icur := OriginalRow227TriangleData0783.coefficient53_395,
    output := OriginalRow227TriangleData0796.coefficient54_395, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_397, Icur := OriginalRow227TriangleData0783.coefficient53_396,
    output := OriginalRow227TriangleData0796.coefficient54_396, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_398, Icur := OriginalRow227TriangleData0783.coefficient53_397,
    output := OriginalRow227TriangleData0796.coefficient54_397, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_399, Icur := OriginalRow227TriangleData0783.coefficient53_398,
    output := OriginalRow227TriangleData0796.coefficient54_398, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_400, Icur := OriginalRow227TriangleData0783.coefficient53_399,
    output := OriginalRow227TriangleData0796.coefficient54_399, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_401, Icur := OriginalRow227TriangleData0783.coefficient53_400,
    output := OriginalRow227TriangleData0796.coefficient54_400, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_402, Icur := OriginalRow227TriangleData0783.coefficient53_401,
    output := OriginalRow227TriangleData0796.coefficient54_401, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0783.coefficient53_403, Icur := OriginalRow227TriangleData0783.coefficient53_402,
    output := OriginalRow227TriangleData0796.coefficient54_402, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_404, Icur := OriginalRow227TriangleData0783.coefficient53_403,
    output := OriginalRow227TriangleData0796.coefficient54_403, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0784.coefficient53_405, Icur := OriginalRow227TriangleData0784.coefficient53_404,
    output := OriginalRow227TriangleData0796.coefficient54_404, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0780

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0780.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
