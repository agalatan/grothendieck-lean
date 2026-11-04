import Grothe.UpperChaos.OriginalRow227TriangleData1417
import Grothe.UpperChaos.OriginalRow227TriangleData1418
import Grothe.UpperChaos.OriginalRow227TriangleData1426
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1410
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_335, Icur := OriginalRow227TriangleData1417.coefficient110_334,
    output := OriginalRow227TriangleData1426.coefficient111_334, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_336, Icur := OriginalRow227TriangleData1417.coefficient110_335,
    output := OriginalRow227TriangleData1426.coefficient111_335, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_337, Icur := OriginalRow227TriangleData1417.coefficient110_336,
    output := OriginalRow227TriangleData1426.coefficient111_336, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_338, Icur := OriginalRow227TriangleData1417.coefficient110_337,
    output := OriginalRow227TriangleData1426.coefficient111_337, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_339, Icur := OriginalRow227TriangleData1417.coefficient110_338,
    output := OriginalRow227TriangleData1426.coefficient111_338, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_340, Icur := OriginalRow227TriangleData1417.coefficient110_339,
    output := OriginalRow227TriangleData1426.coefficient111_339, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_341, Icur := OriginalRow227TriangleData1417.coefficient110_340,
    output := OriginalRow227TriangleData1426.coefficient111_340, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_342, Icur := OriginalRow227TriangleData1417.coefficient110_341,
    output := OriginalRow227TriangleData1426.coefficient111_341, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_343, Icur := OriginalRow227TriangleData1417.coefficient110_342,
    output := OriginalRow227TriangleData1426.coefficient111_342, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_344, Icur := OriginalRow227TriangleData1417.coefficient110_343,
    output := OriginalRow227TriangleData1426.coefficient111_343, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_345, Icur := OriginalRow227TriangleData1417.coefficient110_344,
    output := OriginalRow227TriangleData1426.coefficient111_344, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_346, Icur := OriginalRow227TriangleData1417.coefficient110_345,
    output := OriginalRow227TriangleData1426.coefficient111_345, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_347, Icur := OriginalRow227TriangleData1417.coefficient110_346,
    output := OriginalRow227TriangleData1426.coefficient111_346, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_348, Icur := OriginalRow227TriangleData1417.coefficient110_347,
    output := OriginalRow227TriangleData1426.coefficient111_347, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_349, Icur := OriginalRow227TriangleData1417.coefficient110_348,
    output := OriginalRow227TriangleData1426.coefficient111_348, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_350, Icur := OriginalRow227TriangleData1417.coefficient110_349,
    output := OriginalRow227TriangleData1426.coefficient111_349, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_351, Icur := OriginalRow227TriangleData1417.coefficient110_350,
    output := OriginalRow227TriangleData1426.coefficient111_350, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_352, Icur := OriginalRow227TriangleData1417.coefficient110_351,
    output := OriginalRow227TriangleData1426.coefficient111_351, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_353, Icur := OriginalRow227TriangleData1417.coefficient110_352,
    output := OriginalRow227TriangleData1426.coefficient111_352, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_354, Icur := OriginalRow227TriangleData1417.coefficient110_353,
    output := OriginalRow227TriangleData1426.coefficient111_353, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_355, Icur := OriginalRow227TriangleData1417.coefficient110_354,
    output := OriginalRow227TriangleData1426.coefficient111_354, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_356, Icur := OriginalRow227TriangleData1417.coefficient110_355,
    output := OriginalRow227TriangleData1426.coefficient111_355, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_357, Icur := OriginalRow227TriangleData1417.coefficient110_356,
    output := OriginalRow227TriangleData1426.coefficient111_356, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_358, Icur := OriginalRow227TriangleData1417.coefficient110_357,
    output := OriginalRow227TriangleData1426.coefficient111_357, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_359, Icur := OriginalRow227TriangleData1417.coefficient110_358,
    output := OriginalRow227TriangleData1426.coefficient111_358, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_360, Icur := OriginalRow227TriangleData1417.coefficient110_359,
    output := OriginalRow227TriangleData1426.coefficient111_359, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_361, Icur := OriginalRow227TriangleData1417.coefficient110_360,
    output := OriginalRow227TriangleData1426.coefficient111_360, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_362, Icur := OriginalRow227TriangleData1417.coefficient110_361,
    output := OriginalRow227TriangleData1426.coefficient111_361, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_363, Icur := OriginalRow227TriangleData1417.coefficient110_362,
    output := OriginalRow227TriangleData1426.coefficient111_362, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1417.coefficient110_364, Icur := OriginalRow227TriangleData1417.coefficient110_363,
    output := OriginalRow227TriangleData1426.coefficient111_363, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1418.coefficient110_365, Icur := OriginalRow227TriangleData1417.coefficient110_364,
    output := OriginalRow227TriangleData1426.coefficient111_364, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1418.coefficient110_366, Icur := OriginalRow227TriangleData1418.coefficient110_365,
    output := OriginalRow227TriangleData1426.coefficient111_365, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1410

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1410.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
