import Grothe.UpperChaos.OriginalRow227TriangleData1097
import Grothe.UpperChaos.OriginalRow227TriangleData1098
import Grothe.UpperChaos.OriginalRow227TriangleData1108
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1092
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_336, Icur := OriginalRow227TriangleData1097.coefficient79_335,
    output := OriginalRow227TriangleData1108.coefficient80_335, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_337, Icur := OriginalRow227TriangleData1097.coefficient79_336,
    output := OriginalRow227TriangleData1108.coefficient80_336, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_338, Icur := OriginalRow227TriangleData1097.coefficient79_337,
    output := OriginalRow227TriangleData1108.coefficient80_337, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_339, Icur := OriginalRow227TriangleData1097.coefficient79_338,
    output := OriginalRow227TriangleData1108.coefficient80_338, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_340, Icur := OriginalRow227TriangleData1097.coefficient79_339,
    output := OriginalRow227TriangleData1108.coefficient80_339, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_341, Icur := OriginalRow227TriangleData1097.coefficient79_340,
    output := OriginalRow227TriangleData1108.coefficient80_340, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_342, Icur := OriginalRow227TriangleData1097.coefficient79_341,
    output := OriginalRow227TriangleData1108.coefficient80_341, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_343, Icur := OriginalRow227TriangleData1097.coefficient79_342,
    output := OriginalRow227TriangleData1108.coefficient80_342, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_344, Icur := OriginalRow227TriangleData1097.coefficient79_343,
    output := OriginalRow227TriangleData1108.coefficient80_343, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_345, Icur := OriginalRow227TriangleData1097.coefficient79_344,
    output := OriginalRow227TriangleData1108.coefficient80_344, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_346, Icur := OriginalRow227TriangleData1097.coefficient79_345,
    output := OriginalRow227TriangleData1108.coefficient80_345, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_347, Icur := OriginalRow227TriangleData1097.coefficient79_346,
    output := OriginalRow227TriangleData1108.coefficient80_346, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_348, Icur := OriginalRow227TriangleData1097.coefficient79_347,
    output := OriginalRow227TriangleData1108.coefficient80_347, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_349, Icur := OriginalRow227TriangleData1097.coefficient79_348,
    output := OriginalRow227TriangleData1108.coefficient80_348, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_350, Icur := OriginalRow227TriangleData1097.coefficient79_349,
    output := OriginalRow227TriangleData1108.coefficient80_349, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_351, Icur := OriginalRow227TriangleData1097.coefficient79_350,
    output := OriginalRow227TriangleData1108.coefficient80_350, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_352, Icur := OriginalRow227TriangleData1097.coefficient79_351,
    output := OriginalRow227TriangleData1108.coefficient80_351, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_353, Icur := OriginalRow227TriangleData1097.coefficient79_352,
    output := OriginalRow227TriangleData1108.coefficient80_352, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_354, Icur := OriginalRow227TriangleData1097.coefficient79_353,
    output := OriginalRow227TriangleData1108.coefficient80_353, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_355, Icur := OriginalRow227TriangleData1097.coefficient79_354,
    output := OriginalRow227TriangleData1108.coefficient80_354, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_356, Icur := OriginalRow227TriangleData1097.coefficient79_355,
    output := OriginalRow227TriangleData1108.coefficient80_355, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_357, Icur := OriginalRow227TriangleData1097.coefficient79_356,
    output := OriginalRow227TriangleData1108.coefficient80_356, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_358, Icur := OriginalRow227TriangleData1097.coefficient79_357,
    output := OriginalRow227TriangleData1108.coefficient80_357, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_359, Icur := OriginalRow227TriangleData1097.coefficient79_358,
    output := OriginalRow227TriangleData1108.coefficient80_358, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_360, Icur := OriginalRow227TriangleData1097.coefficient79_359,
    output := OriginalRow227TriangleData1108.coefficient80_359, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_361, Icur := OriginalRow227TriangleData1097.coefficient79_360,
    output := OriginalRow227TriangleData1108.coefficient80_360, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_362, Icur := OriginalRow227TriangleData1097.coefficient79_361,
    output := OriginalRow227TriangleData1108.coefficient80_361, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_363, Icur := OriginalRow227TriangleData1097.coefficient79_362,
    output := OriginalRow227TriangleData1108.coefficient80_362, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_364, Icur := OriginalRow227TriangleData1097.coefficient79_363,
    output := OriginalRow227TriangleData1108.coefficient80_363, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1097.coefficient79_365, Icur := OriginalRow227TriangleData1097.coefficient79_364,
    output := OriginalRow227TriangleData1108.coefficient80_364, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_366, Icur := OriginalRow227TriangleData1097.coefficient79_365,
    output := OriginalRow227TriangleData1108.coefficient80_365, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_367, Icur := OriginalRow227TriangleData1098.coefficient79_366,
    output := OriginalRow227TriangleData1108.coefficient80_366, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1092

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1092.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
