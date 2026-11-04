import Grothe.UpperChaos.OriginalRow227TriangleData1310
import Grothe.UpperChaos.OriginalRow227TriangleData1311
import Grothe.UpperChaos.OriginalRow227TriangleData1320
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1304
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_356, Icur := OriginalRow227TriangleData1310.coefficient99_355,
    output := OriginalRow227TriangleData1320.coefficient100_355, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_357, Icur := OriginalRow227TriangleData1310.coefficient99_356,
    output := OriginalRow227TriangleData1320.coefficient100_356, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_358, Icur := OriginalRow227TriangleData1310.coefficient99_357,
    output := OriginalRow227TriangleData1320.coefficient100_357, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_359, Icur := OriginalRow227TriangleData1310.coefficient99_358,
    output := OriginalRow227TriangleData1320.coefficient100_358, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_360, Icur := OriginalRow227TriangleData1310.coefficient99_359,
    output := OriginalRow227TriangleData1320.coefficient100_359, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_361, Icur := OriginalRow227TriangleData1310.coefficient99_360,
    output := OriginalRow227TriangleData1320.coefficient100_360, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_362, Icur := OriginalRow227TriangleData1310.coefficient99_361,
    output := OriginalRow227TriangleData1320.coefficient100_361, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_363, Icur := OriginalRow227TriangleData1310.coefficient99_362,
    output := OriginalRow227TriangleData1320.coefficient100_362, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_364, Icur := OriginalRow227TriangleData1310.coefficient99_363,
    output := OriginalRow227TriangleData1320.coefficient100_363, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_365, Icur := OriginalRow227TriangleData1310.coefficient99_364,
    output := OriginalRow227TriangleData1320.coefficient100_364, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_366, Icur := OriginalRow227TriangleData1310.coefficient99_365,
    output := OriginalRow227TriangleData1320.coefficient100_365, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_367, Icur := OriginalRow227TriangleData1310.coefficient99_366,
    output := OriginalRow227TriangleData1320.coefficient100_366, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_368, Icur := OriginalRow227TriangleData1310.coefficient99_367,
    output := OriginalRow227TriangleData1320.coefficient100_367, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_369, Icur := OriginalRow227TriangleData1310.coefficient99_368,
    output := OriginalRow227TriangleData1320.coefficient100_368, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_370, Icur := OriginalRow227TriangleData1310.coefficient99_369,
    output := OriginalRow227TriangleData1320.coefficient100_369, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_371, Icur := OriginalRow227TriangleData1310.coefficient99_370,
    output := OriginalRow227TriangleData1320.coefficient100_370, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_372, Icur := OriginalRow227TriangleData1310.coefficient99_371,
    output := OriginalRow227TriangleData1320.coefficient100_371, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_373, Icur := OriginalRow227TriangleData1310.coefficient99_372,
    output := OriginalRow227TriangleData1320.coefficient100_372, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_374, Icur := OriginalRow227TriangleData1310.coefficient99_373,
    output := OriginalRow227TriangleData1320.coefficient100_373, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_375, Icur := OriginalRow227TriangleData1310.coefficient99_374,
    output := OriginalRow227TriangleData1320.coefficient100_374, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_376, Icur := OriginalRow227TriangleData1310.coefficient99_375,
    output := OriginalRow227TriangleData1320.coefficient100_375, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_377, Icur := OriginalRow227TriangleData1310.coefficient99_376,
    output := OriginalRow227TriangleData1320.coefficient100_376, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_378, Icur := OriginalRow227TriangleData1310.coefficient99_377,
    output := OriginalRow227TriangleData1320.coefficient100_377, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_379, Icur := OriginalRow227TriangleData1310.coefficient99_378,
    output := OriginalRow227TriangleData1320.coefficient100_378, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_380, Icur := OriginalRow227TriangleData1310.coefficient99_379,
    output := OriginalRow227TriangleData1320.coefficient100_379, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_381, Icur := OriginalRow227TriangleData1310.coefficient99_380,
    output := OriginalRow227TriangleData1320.coefficient100_380, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_382, Icur := OriginalRow227TriangleData1310.coefficient99_381,
    output := OriginalRow227TriangleData1320.coefficient100_381, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_383, Icur := OriginalRow227TriangleData1310.coefficient99_382,
    output := OriginalRow227TriangleData1320.coefficient100_382, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_384, Icur := OriginalRow227TriangleData1310.coefficient99_383,
    output := OriginalRow227TriangleData1320.coefficient100_383, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1310.coefficient99_385, Icur := OriginalRow227TriangleData1310.coefficient99_384,
    output := OriginalRow227TriangleData1320.coefficient100_384, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1311.coefficient99_386, Icur := OriginalRow227TriangleData1310.coefficient99_385,
    output := OriginalRow227TriangleData1320.coefficient100_385, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1311.coefficient99_387, Icur := OriginalRow227TriangleData1311.coefficient99_386,
    output := OriginalRow227TriangleData1320.coefficient100_386, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1304

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1304.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
