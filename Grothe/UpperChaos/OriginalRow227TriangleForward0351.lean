import Grothe.UpperChaos.OriginalRow227TriangleData0352
import Grothe.UpperChaos.OriginalRow227TriangleData0353
import Grothe.UpperChaos.OriginalRow227TriangleData0367
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0351
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_343, Icur := OriginalRow227TriangleData0352.coefficient22_342,
    output := OriginalRow227TriangleData0367.coefficient23_342, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_344, Icur := OriginalRow227TriangleData0352.coefficient22_343,
    output := OriginalRow227TriangleData0367.coefficient23_343, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_345, Icur := OriginalRow227TriangleData0352.coefficient22_344,
    output := OriginalRow227TriangleData0367.coefficient23_344, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_346, Icur := OriginalRow227TriangleData0352.coefficient22_345,
    output := OriginalRow227TriangleData0367.coefficient23_345, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_347, Icur := OriginalRow227TriangleData0352.coefficient22_346,
    output := OriginalRow227TriangleData0367.coefficient23_346, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_348, Icur := OriginalRow227TriangleData0352.coefficient22_347,
    output := OriginalRow227TriangleData0367.coefficient23_347, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_349, Icur := OriginalRow227TriangleData0352.coefficient22_348,
    output := OriginalRow227TriangleData0367.coefficient23_348, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_350, Icur := OriginalRow227TriangleData0352.coefficient22_349,
    output := OriginalRow227TriangleData0367.coefficient23_349, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_351, Icur := OriginalRow227TriangleData0352.coefficient22_350,
    output := OriginalRow227TriangleData0367.coefficient23_350, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_352, Icur := OriginalRow227TriangleData0352.coefficient22_351,
    output := OriginalRow227TriangleData0367.coefficient23_351, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_353, Icur := OriginalRow227TriangleData0352.coefficient22_352,
    output := OriginalRow227TriangleData0367.coefficient23_352, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_354, Icur := OriginalRow227TriangleData0352.coefficient22_353,
    output := OriginalRow227TriangleData0367.coefficient23_353, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_355, Icur := OriginalRow227TriangleData0352.coefficient22_354,
    output := OriginalRow227TriangleData0367.coefficient23_354, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_356, Icur := OriginalRow227TriangleData0352.coefficient22_355,
    output := OriginalRow227TriangleData0367.coefficient23_355, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_357, Icur := OriginalRow227TriangleData0352.coefficient22_356,
    output := OriginalRow227TriangleData0367.coefficient23_356, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_358, Icur := OriginalRow227TriangleData0352.coefficient22_357,
    output := OriginalRow227TriangleData0367.coefficient23_357, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_359, Icur := OriginalRow227TriangleData0352.coefficient22_358,
    output := OriginalRow227TriangleData0367.coefficient23_358, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_360, Icur := OriginalRow227TriangleData0352.coefficient22_359,
    output := OriginalRow227TriangleData0367.coefficient23_359, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_361, Icur := OriginalRow227TriangleData0352.coefficient22_360,
    output := OriginalRow227TriangleData0367.coefficient23_360, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_362, Icur := OriginalRow227TriangleData0352.coefficient22_361,
    output := OriginalRow227TriangleData0367.coefficient23_361, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_363, Icur := OriginalRow227TriangleData0352.coefficient22_362,
    output := OriginalRow227TriangleData0367.coefficient23_362, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_364, Icur := OriginalRow227TriangleData0352.coefficient22_363,
    output := OriginalRow227TriangleData0367.coefficient23_363, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_365, Icur := OriginalRow227TriangleData0352.coefficient22_364,
    output := OriginalRow227TriangleData0367.coefficient23_364, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_366, Icur := OriginalRow227TriangleData0352.coefficient22_365,
    output := OriginalRow227TriangleData0367.coefficient23_365, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_367, Icur := OriginalRow227TriangleData0352.coefficient22_366,
    output := OriginalRow227TriangleData0367.coefficient23_366, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_368, Icur := OriginalRow227TriangleData0352.coefficient22_367,
    output := OriginalRow227TriangleData0367.coefficient23_367, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_369, Icur := OriginalRow227TriangleData0352.coefficient22_368,
    output := OriginalRow227TriangleData0367.coefficient23_368, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_370, Icur := OriginalRow227TriangleData0352.coefficient22_369,
    output := OriginalRow227TriangleData0367.coefficient23_369, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_371, Icur := OriginalRow227TriangleData0352.coefficient22_370,
    output := OriginalRow227TriangleData0367.coefficient23_370, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_372, Icur := OriginalRow227TriangleData0352.coefficient22_371,
    output := OriginalRow227TriangleData0367.coefficient23_371, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0353.coefficient22_373, Icur := OriginalRow227TriangleData0352.coefficient22_372,
    output := OriginalRow227TriangleData0367.coefficient23_372, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0353.coefficient22_374, Icur := OriginalRow227TriangleData0353.coefficient22_373,
    output := OriginalRow227TriangleData0367.coefficient23_373, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0351

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0351.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
