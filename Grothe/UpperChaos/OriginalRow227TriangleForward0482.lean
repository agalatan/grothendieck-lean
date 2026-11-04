import Grothe.UpperChaos.OriginalRow227TriangleData0484
import Grothe.UpperChaos.OriginalRow227TriangleData0485
import Grothe.UpperChaos.OriginalRow227TriangleData0498
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0482
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_352, Icur := OriginalRow227TriangleData0484.coefficient31_351,
    output := OriginalRow227TriangleData0498.coefficient32_351, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_353, Icur := OriginalRow227TriangleData0484.coefficient31_352,
    output := OriginalRow227TriangleData0498.coefficient32_352, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_354, Icur := OriginalRow227TriangleData0484.coefficient31_353,
    output := OriginalRow227TriangleData0498.coefficient32_353, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_355, Icur := OriginalRow227TriangleData0484.coefficient31_354,
    output := OriginalRow227TriangleData0498.coefficient32_354, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_356, Icur := OriginalRow227TriangleData0484.coefficient31_355,
    output := OriginalRow227TriangleData0498.coefficient32_355, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_357, Icur := OriginalRow227TriangleData0484.coefficient31_356,
    output := OriginalRow227TriangleData0498.coefficient32_356, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_358, Icur := OriginalRow227TriangleData0484.coefficient31_357,
    output := OriginalRow227TriangleData0498.coefficient32_357, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_359, Icur := OriginalRow227TriangleData0484.coefficient31_358,
    output := OriginalRow227TriangleData0498.coefficient32_358, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_360, Icur := OriginalRow227TriangleData0484.coefficient31_359,
    output := OriginalRow227TriangleData0498.coefficient32_359, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_361, Icur := OriginalRow227TriangleData0484.coefficient31_360,
    output := OriginalRow227TriangleData0498.coefficient32_360, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_362, Icur := OriginalRow227TriangleData0484.coefficient31_361,
    output := OriginalRow227TriangleData0498.coefficient32_361, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_363, Icur := OriginalRow227TriangleData0484.coefficient31_362,
    output := OriginalRow227TriangleData0498.coefficient32_362, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_364, Icur := OriginalRow227TriangleData0484.coefficient31_363,
    output := OriginalRow227TriangleData0498.coefficient32_363, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_365, Icur := OriginalRow227TriangleData0484.coefficient31_364,
    output := OriginalRow227TriangleData0498.coefficient32_364, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_366, Icur := OriginalRow227TriangleData0484.coefficient31_365,
    output := OriginalRow227TriangleData0498.coefficient32_365, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_367, Icur := OriginalRow227TriangleData0484.coefficient31_366,
    output := OriginalRow227TriangleData0498.coefficient32_366, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_368, Icur := OriginalRow227TriangleData0484.coefficient31_367,
    output := OriginalRow227TriangleData0498.coefficient32_367, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_369, Icur := OriginalRow227TriangleData0484.coefficient31_368,
    output := OriginalRow227TriangleData0498.coefficient32_368, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_370, Icur := OriginalRow227TriangleData0484.coefficient31_369,
    output := OriginalRow227TriangleData0498.coefficient32_369, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_371, Icur := OriginalRow227TriangleData0484.coefficient31_370,
    output := OriginalRow227TriangleData0498.coefficient32_370, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_372, Icur := OriginalRow227TriangleData0484.coefficient31_371,
    output := OriginalRow227TriangleData0498.coefficient32_371, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_373, Icur := OriginalRow227TriangleData0484.coefficient31_372,
    output := OriginalRow227TriangleData0498.coefficient32_372, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_374, Icur := OriginalRow227TriangleData0484.coefficient31_373,
    output := OriginalRow227TriangleData0498.coefficient32_373, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_375, Icur := OriginalRow227TriangleData0484.coefficient31_374,
    output := OriginalRow227TriangleData0498.coefficient32_374, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_376, Icur := OriginalRow227TriangleData0484.coefficient31_375,
    output := OriginalRow227TriangleData0498.coefficient32_375, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_377, Icur := OriginalRow227TriangleData0484.coefficient31_376,
    output := OriginalRow227TriangleData0498.coefficient32_376, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_378, Icur := OriginalRow227TriangleData0484.coefficient31_377,
    output := OriginalRow227TriangleData0498.coefficient32_377, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_379, Icur := OriginalRow227TriangleData0484.coefficient31_378,
    output := OriginalRow227TriangleData0498.coefficient32_378, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_380, Icur := OriginalRow227TriangleData0484.coefficient31_379,
    output := OriginalRow227TriangleData0498.coefficient32_379, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_381, Icur := OriginalRow227TriangleData0484.coefficient31_380,
    output := OriginalRow227TriangleData0498.coefficient32_380, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0485.coefficient31_382, Icur := OriginalRow227TriangleData0484.coefficient31_381,
    output := OriginalRow227TriangleData0498.coefficient32_381, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0485.coefficient31_383, Icur := OriginalRow227TriangleData0485.coefficient31_382,
    output := OriginalRow227TriangleData0498.coefficient32_382, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0482

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0482.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
