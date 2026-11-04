import Grothe.UpperChaos.OriginalRow227TriangleData1471
import Grothe.UpperChaos.OriginalRow227TriangleData1472
import Grothe.UpperChaos.OriginalRow227TriangleData1480
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1464
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_341, Icur := OriginalRow227TriangleData1471.coefficient116_340,
    output := OriginalRow227TriangleData1480.coefficient117_340, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_342, Icur := OriginalRow227TriangleData1471.coefficient116_341,
    output := OriginalRow227TriangleData1480.coefficient117_341, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_343, Icur := OriginalRow227TriangleData1471.coefficient116_342,
    output := OriginalRow227TriangleData1480.coefficient117_342, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_344, Icur := OriginalRow227TriangleData1471.coefficient116_343,
    output := OriginalRow227TriangleData1480.coefficient117_343, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_345, Icur := OriginalRow227TriangleData1471.coefficient116_344,
    output := OriginalRow227TriangleData1480.coefficient117_344, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_346, Icur := OriginalRow227TriangleData1471.coefficient116_345,
    output := OriginalRow227TriangleData1480.coefficient117_345, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_347, Icur := OriginalRow227TriangleData1471.coefficient116_346,
    output := OriginalRow227TriangleData1480.coefficient117_346, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_348, Icur := OriginalRow227TriangleData1471.coefficient116_347,
    output := OriginalRow227TriangleData1480.coefficient117_347, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_349, Icur := OriginalRow227TriangleData1471.coefficient116_348,
    output := OriginalRow227TriangleData1480.coefficient117_348, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_350, Icur := OriginalRow227TriangleData1471.coefficient116_349,
    output := OriginalRow227TriangleData1480.coefficient117_349, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_351, Icur := OriginalRow227TriangleData1471.coefficient116_350,
    output := OriginalRow227TriangleData1480.coefficient117_350, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_352, Icur := OriginalRow227TriangleData1471.coefficient116_351,
    output := OriginalRow227TriangleData1480.coefficient117_351, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_353, Icur := OriginalRow227TriangleData1471.coefficient116_352,
    output := OriginalRow227TriangleData1480.coefficient117_352, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_354, Icur := OriginalRow227TriangleData1471.coefficient116_353,
    output := OriginalRow227TriangleData1480.coefficient117_353, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_355, Icur := OriginalRow227TriangleData1471.coefficient116_354,
    output := OriginalRow227TriangleData1480.coefficient117_354, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_356, Icur := OriginalRow227TriangleData1471.coefficient116_355,
    output := OriginalRow227TriangleData1480.coefficient117_355, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_357, Icur := OriginalRow227TriangleData1471.coefficient116_356,
    output := OriginalRow227TriangleData1480.coefficient117_356, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_358, Icur := OriginalRow227TriangleData1471.coefficient116_357,
    output := OriginalRow227TriangleData1480.coefficient117_357, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_359, Icur := OriginalRow227TriangleData1471.coefficient116_358,
    output := OriginalRow227TriangleData1480.coefficient117_358, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_360, Icur := OriginalRow227TriangleData1471.coefficient116_359,
    output := OriginalRow227TriangleData1480.coefficient117_359, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_361, Icur := OriginalRow227TriangleData1471.coefficient116_360,
    output := OriginalRow227TriangleData1480.coefficient117_360, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_362, Icur := OriginalRow227TriangleData1471.coefficient116_361,
    output := OriginalRow227TriangleData1480.coefficient117_361, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_363, Icur := OriginalRow227TriangleData1471.coefficient116_362,
    output := OriginalRow227TriangleData1480.coefficient117_362, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_364, Icur := OriginalRow227TriangleData1471.coefficient116_363,
    output := OriginalRow227TriangleData1480.coefficient117_363, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_365, Icur := OriginalRow227TriangleData1471.coefficient116_364,
    output := OriginalRow227TriangleData1480.coefficient117_364, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_366, Icur := OriginalRow227TriangleData1471.coefficient116_365,
    output := OriginalRow227TriangleData1480.coefficient117_365, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_367, Icur := OriginalRow227TriangleData1471.coefficient116_366,
    output := OriginalRow227TriangleData1480.coefficient117_366, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_368, Icur := OriginalRow227TriangleData1471.coefficient116_367,
    output := OriginalRow227TriangleData1480.coefficient117_367, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_369, Icur := OriginalRow227TriangleData1471.coefficient116_368,
    output := OriginalRow227TriangleData1480.coefficient117_368, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_370, Icur := OriginalRow227TriangleData1471.coefficient116_369,
    output := OriginalRow227TriangleData1480.coefficient117_369, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_371, Icur := OriginalRow227TriangleData1471.coefficient116_370,
    output := OriginalRow227TriangleData1480.coefficient117_370, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_372, Icur := OriginalRow227TriangleData1472.coefficient116_371,
    output := OriginalRow227TriangleData1480.coefficient117_371, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1464

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1464.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
