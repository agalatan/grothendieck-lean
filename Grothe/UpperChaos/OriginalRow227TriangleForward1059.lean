import Grothe.UpperChaos.OriginalRow227TriangleData1064
import Grothe.UpperChaos.OriginalRow227TriangleData1065
import Grothe.UpperChaos.OriginalRow227TriangleData1075
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1059
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_333, Icur := OriginalRow227TriangleData1064.coefficient76_332,
    output := OriginalRow227TriangleData1075.coefficient77_332, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_334, Icur := OriginalRow227TriangleData1064.coefficient76_333,
    output := OriginalRow227TriangleData1075.coefficient77_333, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_335, Icur := OriginalRow227TriangleData1064.coefficient76_334,
    output := OriginalRow227TriangleData1075.coefficient77_334, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_336, Icur := OriginalRow227TriangleData1064.coefficient76_335,
    output := OriginalRow227TriangleData1075.coefficient77_335, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_337, Icur := OriginalRow227TriangleData1064.coefficient76_336,
    output := OriginalRow227TriangleData1075.coefficient77_336, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_338, Icur := OriginalRow227TriangleData1064.coefficient76_337,
    output := OriginalRow227TriangleData1075.coefficient77_337, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_339, Icur := OriginalRow227TriangleData1064.coefficient76_338,
    output := OriginalRow227TriangleData1075.coefficient77_338, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_340, Icur := OriginalRow227TriangleData1064.coefficient76_339,
    output := OriginalRow227TriangleData1075.coefficient77_339, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_341, Icur := OriginalRow227TriangleData1064.coefficient76_340,
    output := OriginalRow227TriangleData1075.coefficient77_340, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_342, Icur := OriginalRow227TriangleData1064.coefficient76_341,
    output := OriginalRow227TriangleData1075.coefficient77_341, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_343, Icur := OriginalRow227TriangleData1064.coefficient76_342,
    output := OriginalRow227TriangleData1075.coefficient77_342, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_344, Icur := OriginalRow227TriangleData1064.coefficient76_343,
    output := OriginalRow227TriangleData1075.coefficient77_343, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_345, Icur := OriginalRow227TriangleData1064.coefficient76_344,
    output := OriginalRow227TriangleData1075.coefficient77_344, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_346, Icur := OriginalRow227TriangleData1064.coefficient76_345,
    output := OriginalRow227TriangleData1075.coefficient77_345, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_347, Icur := OriginalRow227TriangleData1064.coefficient76_346,
    output := OriginalRow227TriangleData1075.coefficient77_346, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_348, Icur := OriginalRow227TriangleData1064.coefficient76_347,
    output := OriginalRow227TriangleData1075.coefficient77_347, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_349, Icur := OriginalRow227TriangleData1064.coefficient76_348,
    output := OriginalRow227TriangleData1075.coefficient77_348, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_350, Icur := OriginalRow227TriangleData1064.coefficient76_349,
    output := OriginalRow227TriangleData1075.coefficient77_349, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_351, Icur := OriginalRow227TriangleData1064.coefficient76_350,
    output := OriginalRow227TriangleData1075.coefficient77_350, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_352, Icur := OriginalRow227TriangleData1064.coefficient76_351,
    output := OriginalRow227TriangleData1075.coefficient77_351, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_353, Icur := OriginalRow227TriangleData1064.coefficient76_352,
    output := OriginalRow227TriangleData1075.coefficient77_352, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_354, Icur := OriginalRow227TriangleData1064.coefficient76_353,
    output := OriginalRow227TriangleData1075.coefficient77_353, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_355, Icur := OriginalRow227TriangleData1064.coefficient76_354,
    output := OriginalRow227TriangleData1075.coefficient77_354, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_356, Icur := OriginalRow227TriangleData1064.coefficient76_355,
    output := OriginalRow227TriangleData1075.coefficient77_355, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_357, Icur := OriginalRow227TriangleData1064.coefficient76_356,
    output := OriginalRow227TriangleData1075.coefficient77_356, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_358, Icur := OriginalRow227TriangleData1064.coefficient76_357,
    output := OriginalRow227TriangleData1075.coefficient77_357, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_359, Icur := OriginalRow227TriangleData1064.coefficient76_358,
    output := OriginalRow227TriangleData1075.coefficient77_358, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_360, Icur := OriginalRow227TriangleData1064.coefficient76_359,
    output := OriginalRow227TriangleData1075.coefficient77_359, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_361, Icur := OriginalRow227TriangleData1064.coefficient76_360,
    output := OriginalRow227TriangleData1075.coefficient77_360, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1064.coefficient76_362, Icur := OriginalRow227TriangleData1064.coefficient76_361,
    output := OriginalRow227TriangleData1075.coefficient77_361, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1065.coefficient76_363, Icur := OriginalRow227TriangleData1064.coefficient76_362,
    output := OriginalRow227TriangleData1075.coefficient77_362, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1065.coefficient76_364, Icur := OriginalRow227TriangleData1065.coefficient76_363,
    output := OriginalRow227TriangleData1075.coefficient77_363, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1059

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1059.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
