import Grothe.UpperChaos.OriginalRow227TriangleData1534
import Grothe.UpperChaos.OriginalRow227TriangleData1535
import Grothe.UpperChaos.OriginalRow227TriangleData1543
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1527
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_348, Icur := OriginalRow227TriangleData1534.coefficient123_347,
    output := OriginalRow227TriangleData1543.coefficient124_347, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_349, Icur := OriginalRow227TriangleData1534.coefficient123_348,
    output := OriginalRow227TriangleData1543.coefficient124_348, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_350, Icur := OriginalRow227TriangleData1534.coefficient123_349,
    output := OriginalRow227TriangleData1543.coefficient124_349, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_351, Icur := OriginalRow227TriangleData1534.coefficient123_350,
    output := OriginalRow227TriangleData1543.coefficient124_350, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_352, Icur := OriginalRow227TriangleData1534.coefficient123_351,
    output := OriginalRow227TriangleData1543.coefficient124_351, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_353, Icur := OriginalRow227TriangleData1534.coefficient123_352,
    output := OriginalRow227TriangleData1543.coefficient124_352, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_354, Icur := OriginalRow227TriangleData1534.coefficient123_353,
    output := OriginalRow227TriangleData1543.coefficient124_353, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_355, Icur := OriginalRow227TriangleData1534.coefficient123_354,
    output := OriginalRow227TriangleData1543.coefficient124_354, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_356, Icur := OriginalRow227TriangleData1534.coefficient123_355,
    output := OriginalRow227TriangleData1543.coefficient124_355, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_357, Icur := OriginalRow227TriangleData1534.coefficient123_356,
    output := OriginalRow227TriangleData1543.coefficient124_356, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_358, Icur := OriginalRow227TriangleData1534.coefficient123_357,
    output := OriginalRow227TriangleData1543.coefficient124_357, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_359, Icur := OriginalRow227TriangleData1534.coefficient123_358,
    output := OriginalRow227TriangleData1543.coefficient124_358, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_360, Icur := OriginalRow227TriangleData1534.coefficient123_359,
    output := OriginalRow227TriangleData1543.coefficient124_359, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_361, Icur := OriginalRow227TriangleData1534.coefficient123_360,
    output := OriginalRow227TriangleData1543.coefficient124_360, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_362, Icur := OriginalRow227TriangleData1534.coefficient123_361,
    output := OriginalRow227TriangleData1543.coefficient124_361, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_363, Icur := OriginalRow227TriangleData1534.coefficient123_362,
    output := OriginalRow227TriangleData1543.coefficient124_362, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_364, Icur := OriginalRow227TriangleData1534.coefficient123_363,
    output := OriginalRow227TriangleData1543.coefficient124_363, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_365, Icur := OriginalRow227TriangleData1534.coefficient123_364,
    output := OriginalRow227TriangleData1543.coefficient124_364, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_366, Icur := OriginalRow227TriangleData1534.coefficient123_365,
    output := OriginalRow227TriangleData1543.coefficient124_365, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_367, Icur := OriginalRow227TriangleData1534.coefficient123_366,
    output := OriginalRow227TriangleData1543.coefficient124_366, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_368, Icur := OriginalRow227TriangleData1534.coefficient123_367,
    output := OriginalRow227TriangleData1543.coefficient124_367, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_369, Icur := OriginalRow227TriangleData1534.coefficient123_368,
    output := OriginalRow227TriangleData1543.coefficient124_368, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_370, Icur := OriginalRow227TriangleData1534.coefficient123_369,
    output := OriginalRow227TriangleData1543.coefficient124_369, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_371, Icur := OriginalRow227TriangleData1534.coefficient123_370,
    output := OriginalRow227TriangleData1543.coefficient124_370, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_372, Icur := OriginalRow227TriangleData1534.coefficient123_371,
    output := OriginalRow227TriangleData1543.coefficient124_371, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_373, Icur := OriginalRow227TriangleData1534.coefficient123_372,
    output := OriginalRow227TriangleData1543.coefficient124_372, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_374, Icur := OriginalRow227TriangleData1534.coefficient123_373,
    output := OriginalRow227TriangleData1543.coefficient124_373, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_375, Icur := OriginalRow227TriangleData1534.coefficient123_374,
    output := OriginalRow227TriangleData1543.coefficient124_374, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_376, Icur := OriginalRow227TriangleData1534.coefficient123_375,
    output := OriginalRow227TriangleData1543.coefficient124_375, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1534.coefficient123_377, Icur := OriginalRow227TriangleData1534.coefficient123_376,
    output := OriginalRow227TriangleData1543.coefficient124_376, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1535.coefficient123_378, Icur := OriginalRow227TriangleData1534.coefficient123_377,
    output := OriginalRow227TriangleData1543.coefficient124_377, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1527

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1527.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
