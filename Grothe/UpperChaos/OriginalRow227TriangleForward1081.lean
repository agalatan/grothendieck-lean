import Grothe.UpperChaos.OriginalRow227TriangleData1086
import Grothe.UpperChaos.OriginalRow227TriangleData1087
import Grothe.UpperChaos.OriginalRow227TriangleData1097
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1081
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_335, Icur := OriginalRow227TriangleData1086.coefficient78_334,
    output := OriginalRow227TriangleData1097.coefficient79_334, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_336, Icur := OriginalRow227TriangleData1086.coefficient78_335,
    output := OriginalRow227TriangleData1097.coefficient79_335, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_337, Icur := OriginalRow227TriangleData1086.coefficient78_336,
    output := OriginalRow227TriangleData1097.coefficient79_336, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_338, Icur := OriginalRow227TriangleData1086.coefficient78_337,
    output := OriginalRow227TriangleData1097.coefficient79_337, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_339, Icur := OriginalRow227TriangleData1086.coefficient78_338,
    output := OriginalRow227TriangleData1097.coefficient79_338, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_340, Icur := OriginalRow227TriangleData1086.coefficient78_339,
    output := OriginalRow227TriangleData1097.coefficient79_339, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_341, Icur := OriginalRow227TriangleData1086.coefficient78_340,
    output := OriginalRow227TriangleData1097.coefficient79_340, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_342, Icur := OriginalRow227TriangleData1086.coefficient78_341,
    output := OriginalRow227TriangleData1097.coefficient79_341, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_343, Icur := OriginalRow227TriangleData1086.coefficient78_342,
    output := OriginalRow227TriangleData1097.coefficient79_342, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_344, Icur := OriginalRow227TriangleData1086.coefficient78_343,
    output := OriginalRow227TriangleData1097.coefficient79_343, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_345, Icur := OriginalRow227TriangleData1086.coefficient78_344,
    output := OriginalRow227TriangleData1097.coefficient79_344, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_346, Icur := OriginalRow227TriangleData1086.coefficient78_345,
    output := OriginalRow227TriangleData1097.coefficient79_345, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_347, Icur := OriginalRow227TriangleData1086.coefficient78_346,
    output := OriginalRow227TriangleData1097.coefficient79_346, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_348, Icur := OriginalRow227TriangleData1086.coefficient78_347,
    output := OriginalRow227TriangleData1097.coefficient79_347, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_349, Icur := OriginalRow227TriangleData1086.coefficient78_348,
    output := OriginalRow227TriangleData1097.coefficient79_348, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_350, Icur := OriginalRow227TriangleData1086.coefficient78_349,
    output := OriginalRow227TriangleData1097.coefficient79_349, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_351, Icur := OriginalRow227TriangleData1086.coefficient78_350,
    output := OriginalRow227TriangleData1097.coefficient79_350, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_352, Icur := OriginalRow227TriangleData1086.coefficient78_351,
    output := OriginalRow227TriangleData1097.coefficient79_351, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_353, Icur := OriginalRow227TriangleData1086.coefficient78_352,
    output := OriginalRow227TriangleData1097.coefficient79_352, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_354, Icur := OriginalRow227TriangleData1086.coefficient78_353,
    output := OriginalRow227TriangleData1097.coefficient79_353, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_355, Icur := OriginalRow227TriangleData1086.coefficient78_354,
    output := OriginalRow227TriangleData1097.coefficient79_354, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_356, Icur := OriginalRow227TriangleData1086.coefficient78_355,
    output := OriginalRow227TriangleData1097.coefficient79_355, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_357, Icur := OriginalRow227TriangleData1086.coefficient78_356,
    output := OriginalRow227TriangleData1097.coefficient79_356, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_358, Icur := OriginalRow227TriangleData1086.coefficient78_357,
    output := OriginalRow227TriangleData1097.coefficient79_357, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_359, Icur := OriginalRow227TriangleData1086.coefficient78_358,
    output := OriginalRow227TriangleData1097.coefficient79_358, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_360, Icur := OriginalRow227TriangleData1086.coefficient78_359,
    output := OriginalRow227TriangleData1097.coefficient79_359, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_361, Icur := OriginalRow227TriangleData1086.coefficient78_360,
    output := OriginalRow227TriangleData1097.coefficient79_360, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_362, Icur := OriginalRow227TriangleData1086.coefficient78_361,
    output := OriginalRow227TriangleData1097.coefficient79_361, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_363, Icur := OriginalRow227TriangleData1086.coefficient78_362,
    output := OriginalRow227TriangleData1097.coefficient79_362, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1086.coefficient78_364, Icur := OriginalRow227TriangleData1086.coefficient78_363,
    output := OriginalRow227TriangleData1097.coefficient79_363, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1087.coefficient78_365, Icur := OriginalRow227TriangleData1086.coefficient78_364,
    output := OriginalRow227TriangleData1097.coefficient79_364, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1087.coefficient78_366, Icur := OriginalRow227TriangleData1087.coefficient78_365,
    output := OriginalRow227TriangleData1097.coefficient79_365, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1081

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1081.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
