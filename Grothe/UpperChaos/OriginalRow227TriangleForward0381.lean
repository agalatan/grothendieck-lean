import Grothe.UpperChaos.OriginalRow227TriangleData0382
import Grothe.UpperChaos.OriginalRow227TriangleData0383
import Grothe.UpperChaos.OriginalRow227TriangleData0397
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0381
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_345, Icur := OriginalRow227TriangleData0382.coefficient24_344,
    output := OriginalRow227TriangleData0397.coefficient25_344, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_346, Icur := OriginalRow227TriangleData0382.coefficient24_345,
    output := OriginalRow227TriangleData0397.coefficient25_345, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_347, Icur := OriginalRow227TriangleData0382.coefficient24_346,
    output := OriginalRow227TriangleData0397.coefficient25_346, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_348, Icur := OriginalRow227TriangleData0382.coefficient24_347,
    output := OriginalRow227TriangleData0397.coefficient25_347, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_349, Icur := OriginalRow227TriangleData0382.coefficient24_348,
    output := OriginalRow227TriangleData0397.coefficient25_348, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_350, Icur := OriginalRow227TriangleData0382.coefficient24_349,
    output := OriginalRow227TriangleData0397.coefficient25_349, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_351, Icur := OriginalRow227TriangleData0382.coefficient24_350,
    output := OriginalRow227TriangleData0397.coefficient25_350, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_352, Icur := OriginalRow227TriangleData0382.coefficient24_351,
    output := OriginalRow227TriangleData0397.coefficient25_351, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_353, Icur := OriginalRow227TriangleData0382.coefficient24_352,
    output := OriginalRow227TriangleData0397.coefficient25_352, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_354, Icur := OriginalRow227TriangleData0382.coefficient24_353,
    output := OriginalRow227TriangleData0397.coefficient25_353, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_355, Icur := OriginalRow227TriangleData0382.coefficient24_354,
    output := OriginalRow227TriangleData0397.coefficient25_354, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_356, Icur := OriginalRow227TriangleData0382.coefficient24_355,
    output := OriginalRow227TriangleData0397.coefficient25_355, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_357, Icur := OriginalRow227TriangleData0382.coefficient24_356,
    output := OriginalRow227TriangleData0397.coefficient25_356, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_358, Icur := OriginalRow227TriangleData0382.coefficient24_357,
    output := OriginalRow227TriangleData0397.coefficient25_357, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_359, Icur := OriginalRow227TriangleData0382.coefficient24_358,
    output := OriginalRow227TriangleData0397.coefficient25_358, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_360, Icur := OriginalRow227TriangleData0382.coefficient24_359,
    output := OriginalRow227TriangleData0397.coefficient25_359, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_361, Icur := OriginalRow227TriangleData0382.coefficient24_360,
    output := OriginalRow227TriangleData0397.coefficient25_360, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_362, Icur := OriginalRow227TriangleData0382.coefficient24_361,
    output := OriginalRow227TriangleData0397.coefficient25_361, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_363, Icur := OriginalRow227TriangleData0382.coefficient24_362,
    output := OriginalRow227TriangleData0397.coefficient25_362, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_364, Icur := OriginalRow227TriangleData0382.coefficient24_363,
    output := OriginalRow227TriangleData0397.coefficient25_363, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_365, Icur := OriginalRow227TriangleData0382.coefficient24_364,
    output := OriginalRow227TriangleData0397.coefficient25_364, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_366, Icur := OriginalRow227TriangleData0382.coefficient24_365,
    output := OriginalRow227TriangleData0397.coefficient25_365, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_367, Icur := OriginalRow227TriangleData0382.coefficient24_366,
    output := OriginalRow227TriangleData0397.coefficient25_366, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_368, Icur := OriginalRow227TriangleData0382.coefficient24_367,
    output := OriginalRow227TriangleData0397.coefficient25_367, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_369, Icur := OriginalRow227TriangleData0382.coefficient24_368,
    output := OriginalRow227TriangleData0397.coefficient25_368, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_370, Icur := OriginalRow227TriangleData0382.coefficient24_369,
    output := OriginalRow227TriangleData0397.coefficient25_369, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_371, Icur := OriginalRow227TriangleData0382.coefficient24_370,
    output := OriginalRow227TriangleData0397.coefficient25_370, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_372, Icur := OriginalRow227TriangleData0382.coefficient24_371,
    output := OriginalRow227TriangleData0397.coefficient25_371, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_373, Icur := OriginalRow227TriangleData0382.coefficient24_372,
    output := OriginalRow227TriangleData0397.coefficient25_372, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0382.coefficient24_374, Icur := OriginalRow227TriangleData0382.coefficient24_373,
    output := OriginalRow227TriangleData0397.coefficient25_373, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_375, Icur := OriginalRow227TriangleData0382.coefficient24_374,
    output := OriginalRow227TriangleData0397.coefficient25_374, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0383.coefficient24_376, Icur := OriginalRow227TriangleData0383.coefficient24_375,
    output := OriginalRow227TriangleData0397.coefficient25_375, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0381

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0381.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
