import Grothe.UpperChaos.OriginalRow227TriangleData0582
import Grothe.UpperChaos.OriginalRow227TriangleData0583
import Grothe.UpperChaos.OriginalRow227TriangleData0596
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0580
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_359, Icur := OriginalRow227TriangleData0582.coefficient38_358,
    output := OriginalRow227TriangleData0596.coefficient39_358, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_360, Icur := OriginalRow227TriangleData0582.coefficient38_359,
    output := OriginalRow227TriangleData0596.coefficient39_359, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_361, Icur := OriginalRow227TriangleData0582.coefficient38_360,
    output := OriginalRow227TriangleData0596.coefficient39_360, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_362, Icur := OriginalRow227TriangleData0582.coefficient38_361,
    output := OriginalRow227TriangleData0596.coefficient39_361, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_363, Icur := OriginalRow227TriangleData0582.coefficient38_362,
    output := OriginalRow227TriangleData0596.coefficient39_362, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_364, Icur := OriginalRow227TriangleData0582.coefficient38_363,
    output := OriginalRow227TriangleData0596.coefficient39_363, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_365, Icur := OriginalRow227TriangleData0582.coefficient38_364,
    output := OriginalRow227TriangleData0596.coefficient39_364, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_366, Icur := OriginalRow227TriangleData0582.coefficient38_365,
    output := OriginalRow227TriangleData0596.coefficient39_365, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_367, Icur := OriginalRow227TriangleData0582.coefficient38_366,
    output := OriginalRow227TriangleData0596.coefficient39_366, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_368, Icur := OriginalRow227TriangleData0582.coefficient38_367,
    output := OriginalRow227TriangleData0596.coefficient39_367, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_369, Icur := OriginalRow227TriangleData0582.coefficient38_368,
    output := OriginalRow227TriangleData0596.coefficient39_368, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_370, Icur := OriginalRow227TriangleData0582.coefficient38_369,
    output := OriginalRow227TriangleData0596.coefficient39_369, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_371, Icur := OriginalRow227TriangleData0582.coefficient38_370,
    output := OriginalRow227TriangleData0596.coefficient39_370, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_372, Icur := OriginalRow227TriangleData0582.coefficient38_371,
    output := OriginalRow227TriangleData0596.coefficient39_371, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_373, Icur := OriginalRow227TriangleData0582.coefficient38_372,
    output := OriginalRow227TriangleData0596.coefficient39_372, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_374, Icur := OriginalRow227TriangleData0582.coefficient38_373,
    output := OriginalRow227TriangleData0596.coefficient39_373, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_375, Icur := OriginalRow227TriangleData0582.coefficient38_374,
    output := OriginalRow227TriangleData0596.coefficient39_374, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_376, Icur := OriginalRow227TriangleData0582.coefficient38_375,
    output := OriginalRow227TriangleData0596.coefficient39_375, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_377, Icur := OriginalRow227TriangleData0582.coefficient38_376,
    output := OriginalRow227TriangleData0596.coefficient39_376, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_378, Icur := OriginalRow227TriangleData0582.coefficient38_377,
    output := OriginalRow227TriangleData0596.coefficient39_377, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_379, Icur := OriginalRow227TriangleData0582.coefficient38_378,
    output := OriginalRow227TriangleData0596.coefficient39_378, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_380, Icur := OriginalRow227TriangleData0582.coefficient38_379,
    output := OriginalRow227TriangleData0596.coefficient39_379, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_381, Icur := OriginalRow227TriangleData0582.coefficient38_380,
    output := OriginalRow227TriangleData0596.coefficient39_380, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_382, Icur := OriginalRow227TriangleData0582.coefficient38_381,
    output := OriginalRow227TriangleData0596.coefficient39_381, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_383, Icur := OriginalRow227TriangleData0582.coefficient38_382,
    output := OriginalRow227TriangleData0596.coefficient39_382, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_384, Icur := OriginalRow227TriangleData0582.coefficient38_383,
    output := OriginalRow227TriangleData0596.coefficient39_383, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_385, Icur := OriginalRow227TriangleData0582.coefficient38_384,
    output := OriginalRow227TriangleData0596.coefficient39_384, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_386, Icur := OriginalRow227TriangleData0582.coefficient38_385,
    output := OriginalRow227TriangleData0596.coefficient39_385, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_387, Icur := OriginalRow227TriangleData0582.coefficient38_386,
    output := OriginalRow227TriangleData0596.coefficient39_386, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0582.coefficient38_388, Icur := OriginalRow227TriangleData0582.coefficient38_387,
    output := OriginalRow227TriangleData0596.coefficient39_387, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0583.coefficient38_389, Icur := OriginalRow227TriangleData0582.coefficient38_388,
    output := OriginalRow227TriangleData0596.coefficient39_388, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0583.coefficient38_390, Icur := OriginalRow227TriangleData0583.coefficient38_389,
    output := OriginalRow227TriangleData0596.coefficient39_389, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0580

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0580.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
