import Grothe.UpperChaos.OriginalRow227TriangleData1260
import Grothe.UpperChaos.OriginalRow227TriangleData1261
import Grothe.UpperChaos.OriginalRow227TriangleData1270
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1254
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_351, Icur := OriginalRow227TriangleData1260.coefficient94_350,
    output := OriginalRow227TriangleData1270.coefficient95_350, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_352, Icur := OriginalRow227TriangleData1260.coefficient94_351,
    output := OriginalRow227TriangleData1270.coefficient95_351, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_353, Icur := OriginalRow227TriangleData1260.coefficient94_352,
    output := OriginalRow227TriangleData1270.coefficient95_352, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_354, Icur := OriginalRow227TriangleData1260.coefficient94_353,
    output := OriginalRow227TriangleData1270.coefficient95_353, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_355, Icur := OriginalRow227TriangleData1260.coefficient94_354,
    output := OriginalRow227TriangleData1270.coefficient95_354, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_356, Icur := OriginalRow227TriangleData1260.coefficient94_355,
    output := OriginalRow227TriangleData1270.coefficient95_355, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_357, Icur := OriginalRow227TriangleData1260.coefficient94_356,
    output := OriginalRow227TriangleData1270.coefficient95_356, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_358, Icur := OriginalRow227TriangleData1260.coefficient94_357,
    output := OriginalRow227TriangleData1270.coefficient95_357, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_359, Icur := OriginalRow227TriangleData1260.coefficient94_358,
    output := OriginalRow227TriangleData1270.coefficient95_358, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_360, Icur := OriginalRow227TriangleData1260.coefficient94_359,
    output := OriginalRow227TriangleData1270.coefficient95_359, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_361, Icur := OriginalRow227TriangleData1260.coefficient94_360,
    output := OriginalRow227TriangleData1270.coefficient95_360, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_362, Icur := OriginalRow227TriangleData1260.coefficient94_361,
    output := OriginalRow227TriangleData1270.coefficient95_361, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_363, Icur := OriginalRow227TriangleData1260.coefficient94_362,
    output := OriginalRow227TriangleData1270.coefficient95_362, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_364, Icur := OriginalRow227TriangleData1260.coefficient94_363,
    output := OriginalRow227TriangleData1270.coefficient95_363, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_365, Icur := OriginalRow227TriangleData1260.coefficient94_364,
    output := OriginalRow227TriangleData1270.coefficient95_364, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_366, Icur := OriginalRow227TriangleData1260.coefficient94_365,
    output := OriginalRow227TriangleData1270.coefficient95_365, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_367, Icur := OriginalRow227TriangleData1260.coefficient94_366,
    output := OriginalRow227TriangleData1270.coefficient95_366, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_368, Icur := OriginalRow227TriangleData1260.coefficient94_367,
    output := OriginalRow227TriangleData1270.coefficient95_367, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_369, Icur := OriginalRow227TriangleData1260.coefficient94_368,
    output := OriginalRow227TriangleData1270.coefficient95_368, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_370, Icur := OriginalRow227TriangleData1260.coefficient94_369,
    output := OriginalRow227TriangleData1270.coefficient95_369, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_371, Icur := OriginalRow227TriangleData1260.coefficient94_370,
    output := OriginalRow227TriangleData1270.coefficient95_370, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_372, Icur := OriginalRow227TriangleData1260.coefficient94_371,
    output := OriginalRow227TriangleData1270.coefficient95_371, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_373, Icur := OriginalRow227TriangleData1260.coefficient94_372,
    output := OriginalRow227TriangleData1270.coefficient95_372, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_374, Icur := OriginalRow227TriangleData1260.coefficient94_373,
    output := OriginalRow227TriangleData1270.coefficient95_373, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_375, Icur := OriginalRow227TriangleData1260.coefficient94_374,
    output := OriginalRow227TriangleData1270.coefficient95_374, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_376, Icur := OriginalRow227TriangleData1260.coefficient94_375,
    output := OriginalRow227TriangleData1270.coefficient95_375, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_377, Icur := OriginalRow227TriangleData1260.coefficient94_376,
    output := OriginalRow227TriangleData1270.coefficient95_376, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_378, Icur := OriginalRow227TriangleData1260.coefficient94_377,
    output := OriginalRow227TriangleData1270.coefficient95_377, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_379, Icur := OriginalRow227TriangleData1260.coefficient94_378,
    output := OriginalRow227TriangleData1270.coefficient95_378, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_380, Icur := OriginalRow227TriangleData1260.coefficient94_379,
    output := OriginalRow227TriangleData1270.coefficient95_379, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1261.coefficient94_381, Icur := OriginalRow227TriangleData1260.coefficient94_380,
    output := OriginalRow227TriangleData1270.coefficient95_380, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1261.coefficient94_382, Icur := OriginalRow227TriangleData1261.coefficient94_381,
    output := OriginalRow227TriangleData1270.coefficient95_381, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1254

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1254.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
