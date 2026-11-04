import Grothe.UpperChaos.OriginalRow227TriangleData0427
import Grothe.UpperChaos.OriginalRow227TriangleData0428
import Grothe.UpperChaos.OriginalRow227TriangleData0442
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0426
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_348, Icur := OriginalRow227TriangleData0427.coefficient27_347,
    output := OriginalRow227TriangleData0442.coefficient28_347, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_349, Icur := OriginalRow227TriangleData0427.coefficient27_348,
    output := OriginalRow227TriangleData0442.coefficient28_348, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_350, Icur := OriginalRow227TriangleData0427.coefficient27_349,
    output := OriginalRow227TriangleData0442.coefficient28_349, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_351, Icur := OriginalRow227TriangleData0427.coefficient27_350,
    output := OriginalRow227TriangleData0442.coefficient28_350, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_352, Icur := OriginalRow227TriangleData0427.coefficient27_351,
    output := OriginalRow227TriangleData0442.coefficient28_351, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_353, Icur := OriginalRow227TriangleData0427.coefficient27_352,
    output := OriginalRow227TriangleData0442.coefficient28_352, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_354, Icur := OriginalRow227TriangleData0427.coefficient27_353,
    output := OriginalRow227TriangleData0442.coefficient28_353, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_355, Icur := OriginalRow227TriangleData0427.coefficient27_354,
    output := OriginalRow227TriangleData0442.coefficient28_354, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_356, Icur := OriginalRow227TriangleData0427.coefficient27_355,
    output := OriginalRow227TriangleData0442.coefficient28_355, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_357, Icur := OriginalRow227TriangleData0427.coefficient27_356,
    output := OriginalRow227TriangleData0442.coefficient28_356, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_358, Icur := OriginalRow227TriangleData0427.coefficient27_357,
    output := OriginalRow227TriangleData0442.coefficient28_357, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_359, Icur := OriginalRow227TriangleData0427.coefficient27_358,
    output := OriginalRow227TriangleData0442.coefficient28_358, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_360, Icur := OriginalRow227TriangleData0427.coefficient27_359,
    output := OriginalRow227TriangleData0442.coefficient28_359, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_361, Icur := OriginalRow227TriangleData0427.coefficient27_360,
    output := OriginalRow227TriangleData0442.coefficient28_360, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_362, Icur := OriginalRow227TriangleData0427.coefficient27_361,
    output := OriginalRow227TriangleData0442.coefficient28_361, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_363, Icur := OriginalRow227TriangleData0427.coefficient27_362,
    output := OriginalRow227TriangleData0442.coefficient28_362, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_364, Icur := OriginalRow227TriangleData0427.coefficient27_363,
    output := OriginalRow227TriangleData0442.coefficient28_363, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_365, Icur := OriginalRow227TriangleData0427.coefficient27_364,
    output := OriginalRow227TriangleData0442.coefficient28_364, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_366, Icur := OriginalRow227TriangleData0427.coefficient27_365,
    output := OriginalRow227TriangleData0442.coefficient28_365, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_367, Icur := OriginalRow227TriangleData0427.coefficient27_366,
    output := OriginalRow227TriangleData0442.coefficient28_366, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_368, Icur := OriginalRow227TriangleData0427.coefficient27_367,
    output := OriginalRow227TriangleData0442.coefficient28_367, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_369, Icur := OriginalRow227TriangleData0427.coefficient27_368,
    output := OriginalRow227TriangleData0442.coefficient28_368, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_370, Icur := OriginalRow227TriangleData0427.coefficient27_369,
    output := OriginalRow227TriangleData0442.coefficient28_369, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_371, Icur := OriginalRow227TriangleData0427.coefficient27_370,
    output := OriginalRow227TriangleData0442.coefficient28_370, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_372, Icur := OriginalRow227TriangleData0427.coefficient27_371,
    output := OriginalRow227TriangleData0442.coefficient28_371, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_373, Icur := OriginalRow227TriangleData0427.coefficient27_372,
    output := OriginalRow227TriangleData0442.coefficient28_372, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_374, Icur := OriginalRow227TriangleData0427.coefficient27_373,
    output := OriginalRow227TriangleData0442.coefficient28_373, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_375, Icur := OriginalRow227TriangleData0427.coefficient27_374,
    output := OriginalRow227TriangleData0442.coefficient28_374, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_376, Icur := OriginalRow227TriangleData0427.coefficient27_375,
    output := OriginalRow227TriangleData0442.coefficient28_375, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_377, Icur := OriginalRow227TriangleData0427.coefficient27_376,
    output := OriginalRow227TriangleData0442.coefficient28_376, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0428.coefficient27_378, Icur := OriginalRow227TriangleData0427.coefficient27_377,
    output := OriginalRow227TriangleData0442.coefficient28_377, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0428.coefficient27_379, Icur := OriginalRow227TriangleData0428.coefficient27_378,
    output := OriginalRow227TriangleData0442.coefficient28_378, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0426

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0426.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
