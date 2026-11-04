import Grothe.UpperChaos.OriginalRow227TriangleData1498
import Grothe.UpperChaos.OriginalRow227TriangleData1499
import Grothe.UpperChaos.OriginalRow227TriangleData1507
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1491
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_344, Icur := OriginalRow227TriangleData1498.coefficient119_343,
    output := OriginalRow227TriangleData1507.coefficient120_343, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_345, Icur := OriginalRow227TriangleData1498.coefficient119_344,
    output := OriginalRow227TriangleData1507.coefficient120_344, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_346, Icur := OriginalRow227TriangleData1498.coefficient119_345,
    output := OriginalRow227TriangleData1507.coefficient120_345, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_347, Icur := OriginalRow227TriangleData1498.coefficient119_346,
    output := OriginalRow227TriangleData1507.coefficient120_346, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_348, Icur := OriginalRow227TriangleData1498.coefficient119_347,
    output := OriginalRow227TriangleData1507.coefficient120_347, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_349, Icur := OriginalRow227TriangleData1498.coefficient119_348,
    output := OriginalRow227TriangleData1507.coefficient120_348, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_350, Icur := OriginalRow227TriangleData1498.coefficient119_349,
    output := OriginalRow227TriangleData1507.coefficient120_349, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_351, Icur := OriginalRow227TriangleData1498.coefficient119_350,
    output := OriginalRow227TriangleData1507.coefficient120_350, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_352, Icur := OriginalRow227TriangleData1498.coefficient119_351,
    output := OriginalRow227TriangleData1507.coefficient120_351, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_353, Icur := OriginalRow227TriangleData1498.coefficient119_352,
    output := OriginalRow227TriangleData1507.coefficient120_352, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_354, Icur := OriginalRow227TriangleData1498.coefficient119_353,
    output := OriginalRow227TriangleData1507.coefficient120_353, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_355, Icur := OriginalRow227TriangleData1498.coefficient119_354,
    output := OriginalRow227TriangleData1507.coefficient120_354, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_356, Icur := OriginalRow227TriangleData1498.coefficient119_355,
    output := OriginalRow227TriangleData1507.coefficient120_355, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_357, Icur := OriginalRow227TriangleData1498.coefficient119_356,
    output := OriginalRow227TriangleData1507.coefficient120_356, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_358, Icur := OriginalRow227TriangleData1498.coefficient119_357,
    output := OriginalRow227TriangleData1507.coefficient120_357, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_359, Icur := OriginalRow227TriangleData1498.coefficient119_358,
    output := OriginalRow227TriangleData1507.coefficient120_358, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_360, Icur := OriginalRow227TriangleData1498.coefficient119_359,
    output := OriginalRow227TriangleData1507.coefficient120_359, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_361, Icur := OriginalRow227TriangleData1498.coefficient119_360,
    output := OriginalRow227TriangleData1507.coefficient120_360, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_362, Icur := OriginalRow227TriangleData1498.coefficient119_361,
    output := OriginalRow227TriangleData1507.coefficient120_361, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_363, Icur := OriginalRow227TriangleData1498.coefficient119_362,
    output := OriginalRow227TriangleData1507.coefficient120_362, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_364, Icur := OriginalRow227TriangleData1498.coefficient119_363,
    output := OriginalRow227TriangleData1507.coefficient120_363, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_365, Icur := OriginalRow227TriangleData1498.coefficient119_364,
    output := OriginalRow227TriangleData1507.coefficient120_364, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_366, Icur := OriginalRow227TriangleData1498.coefficient119_365,
    output := OriginalRow227TriangleData1507.coefficient120_365, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_367, Icur := OriginalRow227TriangleData1498.coefficient119_366,
    output := OriginalRow227TriangleData1507.coefficient120_366, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_368, Icur := OriginalRow227TriangleData1498.coefficient119_367,
    output := OriginalRow227TriangleData1507.coefficient120_367, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_369, Icur := OriginalRow227TriangleData1498.coefficient119_368,
    output := OriginalRow227TriangleData1507.coefficient120_368, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_370, Icur := OriginalRow227TriangleData1498.coefficient119_369,
    output := OriginalRow227TriangleData1507.coefficient120_369, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_371, Icur := OriginalRow227TriangleData1498.coefficient119_370,
    output := OriginalRow227TriangleData1507.coefficient120_370, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_372, Icur := OriginalRow227TriangleData1498.coefficient119_371,
    output := OriginalRow227TriangleData1507.coefficient120_371, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1498.coefficient119_373, Icur := OriginalRow227TriangleData1498.coefficient119_372,
    output := OriginalRow227TriangleData1507.coefficient120_372, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_374, Icur := OriginalRow227TriangleData1498.coefficient119_373,
    output := OriginalRow227TriangleData1507.coefficient120_373, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_375, Icur := OriginalRow227TriangleData1499.coefficient119_374,
    output := OriginalRow227TriangleData1507.coefficient120_374, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1491

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1491.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
