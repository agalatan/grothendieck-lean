import Grothe.UpperChaos.OriginalRow227TriangleData0091
import Grothe.UpperChaos.OriginalRow227TriangleData0092
import Grothe.UpperChaos.OriginalRow227TriangleData0107
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0091
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_358, Icur := OriginalRow227TriangleData0091.coefficient5_357,
    output := OriginalRow227TriangleData0107.coefficient6_357, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_359, Icur := OriginalRow227TriangleData0091.coefficient5_358,
    output := OriginalRow227TriangleData0107.coefficient6_358, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_360, Icur := OriginalRow227TriangleData0091.coefficient5_359,
    output := OriginalRow227TriangleData0107.coefficient6_359, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_361, Icur := OriginalRow227TriangleData0091.coefficient5_360,
    output := OriginalRow227TriangleData0107.coefficient6_360, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_362, Icur := OriginalRow227TriangleData0091.coefficient5_361,
    output := OriginalRow227TriangleData0107.coefficient6_361, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_363, Icur := OriginalRow227TriangleData0091.coefficient5_362,
    output := OriginalRow227TriangleData0107.coefficient6_362, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_364, Icur := OriginalRow227TriangleData0091.coefficient5_363,
    output := OriginalRow227TriangleData0107.coefficient6_363, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_365, Icur := OriginalRow227TriangleData0091.coefficient5_364,
    output := OriginalRow227TriangleData0107.coefficient6_364, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_366, Icur := OriginalRow227TriangleData0091.coefficient5_365,
    output := OriginalRow227TriangleData0107.coefficient6_365, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_367, Icur := OriginalRow227TriangleData0091.coefficient5_366,
    output := OriginalRow227TriangleData0107.coefficient6_366, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_368, Icur := OriginalRow227TriangleData0091.coefficient5_367,
    output := OriginalRow227TriangleData0107.coefficient6_367, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_369, Icur := OriginalRow227TriangleData0091.coefficient5_368,
    output := OriginalRow227TriangleData0107.coefficient6_368, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_370, Icur := OriginalRow227TriangleData0091.coefficient5_369,
    output := OriginalRow227TriangleData0107.coefficient6_369, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_371, Icur := OriginalRow227TriangleData0091.coefficient5_370,
    output := OriginalRow227TriangleData0107.coefficient6_370, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_372, Icur := OriginalRow227TriangleData0091.coefficient5_371,
    output := OriginalRow227TriangleData0107.coefficient6_371, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_373, Icur := OriginalRow227TriangleData0091.coefficient5_372,
    output := OriginalRow227TriangleData0107.coefficient6_372, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_374, Icur := OriginalRow227TriangleData0091.coefficient5_373,
    output := OriginalRow227TriangleData0107.coefficient6_373, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_375, Icur := OriginalRow227TriangleData0091.coefficient5_374,
    output := OriginalRow227TriangleData0107.coefficient6_374, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_376, Icur := OriginalRow227TriangleData0091.coefficient5_375,
    output := OriginalRow227TriangleData0107.coefficient6_375, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_377, Icur := OriginalRow227TriangleData0091.coefficient5_376,
    output := OriginalRow227TriangleData0107.coefficient6_376, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_378, Icur := OriginalRow227TriangleData0091.coefficient5_377,
    output := OriginalRow227TriangleData0107.coefficient6_377, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_379, Icur := OriginalRow227TriangleData0091.coefficient5_378,
    output := OriginalRow227TriangleData0107.coefficient6_378, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_380, Icur := OriginalRow227TriangleData0091.coefficient5_379,
    output := OriginalRow227TriangleData0107.coefficient6_379, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_381, Icur := OriginalRow227TriangleData0091.coefficient5_380,
    output := OriginalRow227TriangleData0107.coefficient6_380, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_382, Icur := OriginalRow227TriangleData0091.coefficient5_381,
    output := OriginalRow227TriangleData0107.coefficient6_381, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_383, Icur := OriginalRow227TriangleData0091.coefficient5_382,
    output := OriginalRow227TriangleData0107.coefficient6_382, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_384, Icur := OriginalRow227TriangleData0091.coefficient5_383,
    output := OriginalRow227TriangleData0107.coefficient6_383, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_385, Icur := OriginalRow227TriangleData0091.coefficient5_384,
    output := OriginalRow227TriangleData0107.coefficient6_384, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_386, Icur := OriginalRow227TriangleData0091.coefficient5_385,
    output := OriginalRow227TriangleData0107.coefficient6_385, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_387, Icur := OriginalRow227TriangleData0091.coefficient5_386,
    output := OriginalRow227TriangleData0107.coefficient6_386, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0092.coefficient5_388, Icur := OriginalRow227TriangleData0091.coefficient5_387,
    output := OriginalRow227TriangleData0107.coefficient6_387, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0092.coefficient5_389, Icur := OriginalRow227TriangleData0092.coefficient5_388,
    output := OriginalRow227TriangleData0107.coefficient6_388, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0091

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0091.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
