import Grothe.UpperChaos.OriginalRow227TriangleData1435
import Grothe.UpperChaos.OriginalRow227TriangleData1436
import Grothe.UpperChaos.OriginalRow227TriangleData1444
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1428
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_337, Icur := OriginalRow227TriangleData1435.coefficient112_336,
    output := OriginalRow227TriangleData1444.coefficient113_336, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_338, Icur := OriginalRow227TriangleData1435.coefficient112_337,
    output := OriginalRow227TriangleData1444.coefficient113_337, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_339, Icur := OriginalRow227TriangleData1435.coefficient112_338,
    output := OriginalRow227TriangleData1444.coefficient113_338, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_340, Icur := OriginalRow227TriangleData1435.coefficient112_339,
    output := OriginalRow227TriangleData1444.coefficient113_339, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_341, Icur := OriginalRow227TriangleData1435.coefficient112_340,
    output := OriginalRow227TriangleData1444.coefficient113_340, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_342, Icur := OriginalRow227TriangleData1435.coefficient112_341,
    output := OriginalRow227TriangleData1444.coefficient113_341, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_343, Icur := OriginalRow227TriangleData1435.coefficient112_342,
    output := OriginalRow227TriangleData1444.coefficient113_342, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_344, Icur := OriginalRow227TriangleData1435.coefficient112_343,
    output := OriginalRow227TriangleData1444.coefficient113_343, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_345, Icur := OriginalRow227TriangleData1435.coefficient112_344,
    output := OriginalRow227TriangleData1444.coefficient113_344, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_346, Icur := OriginalRow227TriangleData1435.coefficient112_345,
    output := OriginalRow227TriangleData1444.coefficient113_345, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_347, Icur := OriginalRow227TriangleData1435.coefficient112_346,
    output := OriginalRow227TriangleData1444.coefficient113_346, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_348, Icur := OriginalRow227TriangleData1435.coefficient112_347,
    output := OriginalRow227TriangleData1444.coefficient113_347, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_349, Icur := OriginalRow227TriangleData1435.coefficient112_348,
    output := OriginalRow227TriangleData1444.coefficient113_348, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_350, Icur := OriginalRow227TriangleData1435.coefficient112_349,
    output := OriginalRow227TriangleData1444.coefficient113_349, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_351, Icur := OriginalRow227TriangleData1435.coefficient112_350,
    output := OriginalRow227TriangleData1444.coefficient113_350, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_352, Icur := OriginalRow227TriangleData1435.coefficient112_351,
    output := OriginalRow227TriangleData1444.coefficient113_351, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_353, Icur := OriginalRow227TriangleData1435.coefficient112_352,
    output := OriginalRow227TriangleData1444.coefficient113_352, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_354, Icur := OriginalRow227TriangleData1435.coefficient112_353,
    output := OriginalRow227TriangleData1444.coefficient113_353, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_355, Icur := OriginalRow227TriangleData1435.coefficient112_354,
    output := OriginalRow227TriangleData1444.coefficient113_354, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_356, Icur := OriginalRow227TriangleData1435.coefficient112_355,
    output := OriginalRow227TriangleData1444.coefficient113_355, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_357, Icur := OriginalRow227TriangleData1435.coefficient112_356,
    output := OriginalRow227TriangleData1444.coefficient113_356, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_358, Icur := OriginalRow227TriangleData1435.coefficient112_357,
    output := OriginalRow227TriangleData1444.coefficient113_357, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_359, Icur := OriginalRow227TriangleData1435.coefficient112_358,
    output := OriginalRow227TriangleData1444.coefficient113_358, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_360, Icur := OriginalRow227TriangleData1435.coefficient112_359,
    output := OriginalRow227TriangleData1444.coefficient113_359, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_361, Icur := OriginalRow227TriangleData1435.coefficient112_360,
    output := OriginalRow227TriangleData1444.coefficient113_360, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_362, Icur := OriginalRow227TriangleData1435.coefficient112_361,
    output := OriginalRow227TriangleData1444.coefficient113_361, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_363, Icur := OriginalRow227TriangleData1435.coefficient112_362,
    output := OriginalRow227TriangleData1444.coefficient113_362, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_364, Icur := OriginalRow227TriangleData1435.coefficient112_363,
    output := OriginalRow227TriangleData1444.coefficient113_363, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_365, Icur := OriginalRow227TriangleData1435.coefficient112_364,
    output := OriginalRow227TriangleData1444.coefficient113_364, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1435.coefficient112_366, Icur := OriginalRow227TriangleData1435.coefficient112_365,
    output := OriginalRow227TriangleData1444.coefficient113_365, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1436.coefficient112_367, Icur := OriginalRow227TriangleData1435.coefficient112_366,
    output := OriginalRow227TriangleData1444.coefficient113_366, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1436.coefficient112_368, Icur := OriginalRow227TriangleData1436.coefficient112_367,
    output := OriginalRow227TriangleData1444.coefficient113_367, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1428

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1428.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
