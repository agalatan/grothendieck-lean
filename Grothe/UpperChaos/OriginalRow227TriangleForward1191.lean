import Grothe.UpperChaos.OriginalRow227TriangleData1196
import Grothe.UpperChaos.OriginalRow227TriangleData1197
import Grothe.UpperChaos.OriginalRow227TriangleData1207
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1191
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_345, Icur := OriginalRow227TriangleData1196.coefficient88_344,
    output := OriginalRow227TriangleData1207.coefficient89_344, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_346, Icur := OriginalRow227TriangleData1196.coefficient88_345,
    output := OriginalRow227TriangleData1207.coefficient89_345, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_347, Icur := OriginalRow227TriangleData1196.coefficient88_346,
    output := OriginalRow227TriangleData1207.coefficient89_346, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_348, Icur := OriginalRow227TriangleData1196.coefficient88_347,
    output := OriginalRow227TriangleData1207.coefficient89_347, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_349, Icur := OriginalRow227TriangleData1196.coefficient88_348,
    output := OriginalRow227TriangleData1207.coefficient89_348, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_350, Icur := OriginalRow227TriangleData1196.coefficient88_349,
    output := OriginalRow227TriangleData1207.coefficient89_349, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_351, Icur := OriginalRow227TriangleData1196.coefficient88_350,
    output := OriginalRow227TriangleData1207.coefficient89_350, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_352, Icur := OriginalRow227TriangleData1196.coefficient88_351,
    output := OriginalRow227TriangleData1207.coefficient89_351, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_353, Icur := OriginalRow227TriangleData1196.coefficient88_352,
    output := OriginalRow227TriangleData1207.coefficient89_352, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_354, Icur := OriginalRow227TriangleData1196.coefficient88_353,
    output := OriginalRow227TriangleData1207.coefficient89_353, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_355, Icur := OriginalRow227TriangleData1196.coefficient88_354,
    output := OriginalRow227TriangleData1207.coefficient89_354, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_356, Icur := OriginalRow227TriangleData1196.coefficient88_355,
    output := OriginalRow227TriangleData1207.coefficient89_355, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_357, Icur := OriginalRow227TriangleData1196.coefficient88_356,
    output := OriginalRow227TriangleData1207.coefficient89_356, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_358, Icur := OriginalRow227TriangleData1196.coefficient88_357,
    output := OriginalRow227TriangleData1207.coefficient89_357, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_359, Icur := OriginalRow227TriangleData1196.coefficient88_358,
    output := OriginalRow227TriangleData1207.coefficient89_358, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_360, Icur := OriginalRow227TriangleData1196.coefficient88_359,
    output := OriginalRow227TriangleData1207.coefficient89_359, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_361, Icur := OriginalRow227TriangleData1196.coefficient88_360,
    output := OriginalRow227TriangleData1207.coefficient89_360, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_362, Icur := OriginalRow227TriangleData1196.coefficient88_361,
    output := OriginalRow227TriangleData1207.coefficient89_361, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_363, Icur := OriginalRow227TriangleData1196.coefficient88_362,
    output := OriginalRow227TriangleData1207.coefficient89_362, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_364, Icur := OriginalRow227TriangleData1196.coefficient88_363,
    output := OriginalRow227TriangleData1207.coefficient89_363, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_365, Icur := OriginalRow227TriangleData1196.coefficient88_364,
    output := OriginalRow227TriangleData1207.coefficient89_364, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_366, Icur := OriginalRow227TriangleData1196.coefficient88_365,
    output := OriginalRow227TriangleData1207.coefficient89_365, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_367, Icur := OriginalRow227TriangleData1196.coefficient88_366,
    output := OriginalRow227TriangleData1207.coefficient89_366, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_368, Icur := OriginalRow227TriangleData1196.coefficient88_367,
    output := OriginalRow227TriangleData1207.coefficient89_367, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_369, Icur := OriginalRow227TriangleData1196.coefficient88_368,
    output := OriginalRow227TriangleData1207.coefficient89_368, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_370, Icur := OriginalRow227TriangleData1196.coefficient88_369,
    output := OriginalRow227TriangleData1207.coefficient89_369, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_371, Icur := OriginalRow227TriangleData1196.coefficient88_370,
    output := OriginalRow227TriangleData1207.coefficient89_370, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_372, Icur := OriginalRow227TriangleData1196.coefficient88_371,
    output := OriginalRow227TriangleData1207.coefficient89_371, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_373, Icur := OriginalRow227TriangleData1196.coefficient88_372,
    output := OriginalRow227TriangleData1207.coefficient89_372, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_374, Icur := OriginalRow227TriangleData1196.coefficient88_373,
    output := OriginalRow227TriangleData1207.coefficient89_373, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1197.coefficient88_375, Icur := OriginalRow227TriangleData1196.coefficient88_374,
    output := OriginalRow227TriangleData1207.coefficient89_374, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1197.coefficient88_376, Icur := OriginalRow227TriangleData1197.coefficient88_375,
    output := OriginalRow227TriangleData1207.coefficient89_375, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1191

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1191.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
