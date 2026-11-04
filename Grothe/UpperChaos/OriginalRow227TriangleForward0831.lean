import Grothe.UpperChaos.OriginalRow227TriangleData0834
import Grothe.UpperChaos.OriginalRow227TriangleData0835
import Grothe.UpperChaos.OriginalRow227TriangleData0847
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0831
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_346, Icur := OriginalRow227TriangleData0834.coefficient57_345,
    output := OriginalRow227TriangleData0847.coefficient58_345, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_347, Icur := OriginalRow227TriangleData0834.coefficient57_346,
    output := OriginalRow227TriangleData0847.coefficient58_346, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_348, Icur := OriginalRow227TriangleData0834.coefficient57_347,
    output := OriginalRow227TriangleData0847.coefficient58_347, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_349, Icur := OriginalRow227TriangleData0834.coefficient57_348,
    output := OriginalRow227TriangleData0847.coefficient58_348, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_350, Icur := OriginalRow227TriangleData0834.coefficient57_349,
    output := OriginalRow227TriangleData0847.coefficient58_349, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_351, Icur := OriginalRow227TriangleData0834.coefficient57_350,
    output := OriginalRow227TriangleData0847.coefficient58_350, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_352, Icur := OriginalRow227TriangleData0834.coefficient57_351,
    output := OriginalRow227TriangleData0847.coefficient58_351, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_353, Icur := OriginalRow227TriangleData0834.coefficient57_352,
    output := OriginalRow227TriangleData0847.coefficient58_352, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_354, Icur := OriginalRow227TriangleData0834.coefficient57_353,
    output := OriginalRow227TriangleData0847.coefficient58_353, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_355, Icur := OriginalRow227TriangleData0834.coefficient57_354,
    output := OriginalRow227TriangleData0847.coefficient58_354, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_356, Icur := OriginalRow227TriangleData0834.coefficient57_355,
    output := OriginalRow227TriangleData0847.coefficient58_355, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_357, Icur := OriginalRow227TriangleData0834.coefficient57_356,
    output := OriginalRow227TriangleData0847.coefficient58_356, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_358, Icur := OriginalRow227TriangleData0834.coefficient57_357,
    output := OriginalRow227TriangleData0847.coefficient58_357, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_359, Icur := OriginalRow227TriangleData0834.coefficient57_358,
    output := OriginalRow227TriangleData0847.coefficient58_358, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_360, Icur := OriginalRow227TriangleData0834.coefficient57_359,
    output := OriginalRow227TriangleData0847.coefficient58_359, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_361, Icur := OriginalRow227TriangleData0834.coefficient57_360,
    output := OriginalRow227TriangleData0847.coefficient58_360, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_362, Icur := OriginalRow227TriangleData0834.coefficient57_361,
    output := OriginalRow227TriangleData0847.coefficient58_361, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_363, Icur := OriginalRow227TriangleData0834.coefficient57_362,
    output := OriginalRow227TriangleData0847.coefficient58_362, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_364, Icur := OriginalRow227TriangleData0834.coefficient57_363,
    output := OriginalRow227TriangleData0847.coefficient58_363, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_365, Icur := OriginalRow227TriangleData0834.coefficient57_364,
    output := OriginalRow227TriangleData0847.coefficient58_364, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_366, Icur := OriginalRow227TriangleData0834.coefficient57_365,
    output := OriginalRow227TriangleData0847.coefficient58_365, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_367, Icur := OriginalRow227TriangleData0834.coefficient57_366,
    output := OriginalRow227TriangleData0847.coefficient58_366, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_368, Icur := OriginalRow227TriangleData0834.coefficient57_367,
    output := OriginalRow227TriangleData0847.coefficient58_367, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_369, Icur := OriginalRow227TriangleData0834.coefficient57_368,
    output := OriginalRow227TriangleData0847.coefficient58_368, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_370, Icur := OriginalRow227TriangleData0834.coefficient57_369,
    output := OriginalRow227TriangleData0847.coefficient58_369, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_371, Icur := OriginalRow227TriangleData0834.coefficient57_370,
    output := OriginalRow227TriangleData0847.coefficient58_370, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_372, Icur := OriginalRow227TriangleData0834.coefficient57_371,
    output := OriginalRow227TriangleData0847.coefficient58_371, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_373, Icur := OriginalRow227TriangleData0834.coefficient57_372,
    output := OriginalRow227TriangleData0847.coefficient58_372, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_374, Icur := OriginalRow227TriangleData0834.coefficient57_373,
    output := OriginalRow227TriangleData0847.coefficient58_373, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0834.coefficient57_375, Icur := OriginalRow227TriangleData0834.coefficient57_374,
    output := OriginalRow227TriangleData0847.coefficient58_374, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_376, Icur := OriginalRow227TriangleData0834.coefficient57_375,
    output := OriginalRow227TriangleData0847.coefficient58_375, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_377, Icur := OriginalRow227TriangleData0835.coefficient57_376,
    output := OriginalRow227TriangleData0847.coefficient58_376, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0831

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0831.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
