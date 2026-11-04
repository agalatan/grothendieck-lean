import Grothe.UpperChaos.OriginalRow227TriangleData1290
import Grothe.UpperChaos.OriginalRow227TriangleData1291
import Grothe.UpperChaos.OriginalRow227TriangleData1300
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1284
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_354, Icur := OriginalRow227TriangleData1290.coefficient97_353,
    output := OriginalRow227TriangleData1300.coefficient98_353, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_355, Icur := OriginalRow227TriangleData1290.coefficient97_354,
    output := OriginalRow227TriangleData1300.coefficient98_354, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_356, Icur := OriginalRow227TriangleData1290.coefficient97_355,
    output := OriginalRow227TriangleData1300.coefficient98_355, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_357, Icur := OriginalRow227TriangleData1290.coefficient97_356,
    output := OriginalRow227TriangleData1300.coefficient98_356, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_358, Icur := OriginalRow227TriangleData1290.coefficient97_357,
    output := OriginalRow227TriangleData1300.coefficient98_357, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_359, Icur := OriginalRow227TriangleData1290.coefficient97_358,
    output := OriginalRow227TriangleData1300.coefficient98_358, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_360, Icur := OriginalRow227TriangleData1290.coefficient97_359,
    output := OriginalRow227TriangleData1300.coefficient98_359, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_361, Icur := OriginalRow227TriangleData1290.coefficient97_360,
    output := OriginalRow227TriangleData1300.coefficient98_360, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_362, Icur := OriginalRow227TriangleData1290.coefficient97_361,
    output := OriginalRow227TriangleData1300.coefficient98_361, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_363, Icur := OriginalRow227TriangleData1290.coefficient97_362,
    output := OriginalRow227TriangleData1300.coefficient98_362, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_364, Icur := OriginalRow227TriangleData1290.coefficient97_363,
    output := OriginalRow227TriangleData1300.coefficient98_363, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_365, Icur := OriginalRow227TriangleData1290.coefficient97_364,
    output := OriginalRow227TriangleData1300.coefficient98_364, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_366, Icur := OriginalRow227TriangleData1290.coefficient97_365,
    output := OriginalRow227TriangleData1300.coefficient98_365, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_367, Icur := OriginalRow227TriangleData1290.coefficient97_366,
    output := OriginalRow227TriangleData1300.coefficient98_366, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_368, Icur := OriginalRow227TriangleData1290.coefficient97_367,
    output := OriginalRow227TriangleData1300.coefficient98_367, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_369, Icur := OriginalRow227TriangleData1290.coefficient97_368,
    output := OriginalRow227TriangleData1300.coefficient98_368, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_370, Icur := OriginalRow227TriangleData1290.coefficient97_369,
    output := OriginalRow227TriangleData1300.coefficient98_369, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_371, Icur := OriginalRow227TriangleData1290.coefficient97_370,
    output := OriginalRow227TriangleData1300.coefficient98_370, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_372, Icur := OriginalRow227TriangleData1290.coefficient97_371,
    output := OriginalRow227TriangleData1300.coefficient98_371, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_373, Icur := OriginalRow227TriangleData1290.coefficient97_372,
    output := OriginalRow227TriangleData1300.coefficient98_372, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_374, Icur := OriginalRow227TriangleData1290.coefficient97_373,
    output := OriginalRow227TriangleData1300.coefficient98_373, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_375, Icur := OriginalRow227TriangleData1290.coefficient97_374,
    output := OriginalRow227TriangleData1300.coefficient98_374, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_376, Icur := OriginalRow227TriangleData1290.coefficient97_375,
    output := OriginalRow227TriangleData1300.coefficient98_375, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_377, Icur := OriginalRow227TriangleData1290.coefficient97_376,
    output := OriginalRow227TriangleData1300.coefficient98_376, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_378, Icur := OriginalRow227TriangleData1290.coefficient97_377,
    output := OriginalRow227TriangleData1300.coefficient98_377, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_379, Icur := OriginalRow227TriangleData1290.coefficient97_378,
    output := OriginalRow227TriangleData1300.coefficient98_378, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_380, Icur := OriginalRow227TriangleData1290.coefficient97_379,
    output := OriginalRow227TriangleData1300.coefficient98_379, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_381, Icur := OriginalRow227TriangleData1290.coefficient97_380,
    output := OriginalRow227TriangleData1300.coefficient98_380, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_382, Icur := OriginalRow227TriangleData1290.coefficient97_381,
    output := OriginalRow227TriangleData1300.coefficient98_381, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1290.coefficient97_383, Icur := OriginalRow227TriangleData1290.coefficient97_382,
    output := OriginalRow227TriangleData1300.coefficient98_382, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_384, Icur := OriginalRow227TriangleData1290.coefficient97_383,
    output := OriginalRow227TriangleData1300.coefficient98_383, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_385, Icur := OriginalRow227TriangleData1291.coefficient97_384,
    output := OriginalRow227TriangleData1300.coefficient98_384, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1284

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1284.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
