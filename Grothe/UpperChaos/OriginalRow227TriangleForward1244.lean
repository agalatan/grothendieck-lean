import Grothe.UpperChaos.OriginalRow227TriangleData1250
import Grothe.UpperChaos.OriginalRow227TriangleData1251
import Grothe.UpperChaos.OriginalRow227TriangleData1260
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1244
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_350, Icur := OriginalRow227TriangleData1250.coefficient93_349,
    output := OriginalRow227TriangleData1260.coefficient94_349, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_351, Icur := OriginalRow227TriangleData1250.coefficient93_350,
    output := OriginalRow227TriangleData1260.coefficient94_350, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_352, Icur := OriginalRow227TriangleData1250.coefficient93_351,
    output := OriginalRow227TriangleData1260.coefficient94_351, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_353, Icur := OriginalRow227TriangleData1250.coefficient93_352,
    output := OriginalRow227TriangleData1260.coefficient94_352, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_354, Icur := OriginalRow227TriangleData1250.coefficient93_353,
    output := OriginalRow227TriangleData1260.coefficient94_353, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_355, Icur := OriginalRow227TriangleData1250.coefficient93_354,
    output := OriginalRow227TriangleData1260.coefficient94_354, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_356, Icur := OriginalRow227TriangleData1250.coefficient93_355,
    output := OriginalRow227TriangleData1260.coefficient94_355, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_357, Icur := OriginalRow227TriangleData1250.coefficient93_356,
    output := OriginalRow227TriangleData1260.coefficient94_356, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_358, Icur := OriginalRow227TriangleData1250.coefficient93_357,
    output := OriginalRow227TriangleData1260.coefficient94_357, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_359, Icur := OriginalRow227TriangleData1250.coefficient93_358,
    output := OriginalRow227TriangleData1260.coefficient94_358, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_360, Icur := OriginalRow227TriangleData1250.coefficient93_359,
    output := OriginalRow227TriangleData1260.coefficient94_359, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_361, Icur := OriginalRow227TriangleData1250.coefficient93_360,
    output := OriginalRow227TriangleData1260.coefficient94_360, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_362, Icur := OriginalRow227TriangleData1250.coefficient93_361,
    output := OriginalRow227TriangleData1260.coefficient94_361, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_363, Icur := OriginalRow227TriangleData1250.coefficient93_362,
    output := OriginalRow227TriangleData1260.coefficient94_362, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_364, Icur := OriginalRow227TriangleData1250.coefficient93_363,
    output := OriginalRow227TriangleData1260.coefficient94_363, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_365, Icur := OriginalRow227TriangleData1250.coefficient93_364,
    output := OriginalRow227TriangleData1260.coefficient94_364, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_366, Icur := OriginalRow227TriangleData1250.coefficient93_365,
    output := OriginalRow227TriangleData1260.coefficient94_365, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_367, Icur := OriginalRow227TriangleData1250.coefficient93_366,
    output := OriginalRow227TriangleData1260.coefficient94_366, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_368, Icur := OriginalRow227TriangleData1250.coefficient93_367,
    output := OriginalRow227TriangleData1260.coefficient94_367, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_369, Icur := OriginalRow227TriangleData1250.coefficient93_368,
    output := OriginalRow227TriangleData1260.coefficient94_368, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_370, Icur := OriginalRow227TriangleData1250.coefficient93_369,
    output := OriginalRow227TriangleData1260.coefficient94_369, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_371, Icur := OriginalRow227TriangleData1250.coefficient93_370,
    output := OriginalRow227TriangleData1260.coefficient94_370, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_372, Icur := OriginalRow227TriangleData1250.coefficient93_371,
    output := OriginalRow227TriangleData1260.coefficient94_371, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_373, Icur := OriginalRow227TriangleData1250.coefficient93_372,
    output := OriginalRow227TriangleData1260.coefficient94_372, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_374, Icur := OriginalRow227TriangleData1250.coefficient93_373,
    output := OriginalRow227TriangleData1260.coefficient94_373, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_375, Icur := OriginalRow227TriangleData1250.coefficient93_374,
    output := OriginalRow227TriangleData1260.coefficient94_374, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_376, Icur := OriginalRow227TriangleData1250.coefficient93_375,
    output := OriginalRow227TriangleData1260.coefficient94_375, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_377, Icur := OriginalRow227TriangleData1250.coefficient93_376,
    output := OriginalRow227TriangleData1260.coefficient94_376, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_378, Icur := OriginalRow227TriangleData1250.coefficient93_377,
    output := OriginalRow227TriangleData1260.coefficient94_377, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1250.coefficient93_379, Icur := OriginalRow227TriangleData1250.coefficient93_378,
    output := OriginalRow227TriangleData1260.coefficient94_378, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1251.coefficient93_380, Icur := OriginalRow227TriangleData1250.coefficient93_379,
    output := OriginalRow227TriangleData1260.coefficient94_379, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1251.coefficient93_381, Icur := OriginalRow227TriangleData1251.coefficient93_380,
    output := OriginalRow227TriangleData1260.coefficient94_380, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1244

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1244.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
