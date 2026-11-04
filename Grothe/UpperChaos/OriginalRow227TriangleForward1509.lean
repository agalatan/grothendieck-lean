import Grothe.UpperChaos.OriginalRow227TriangleData1516
import Grothe.UpperChaos.OriginalRow227TriangleData1517
import Grothe.UpperChaos.OriginalRow227TriangleData1525
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1509
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_346, Icur := OriginalRow227TriangleData1516.coefficient121_345,
    output := OriginalRow227TriangleData1525.coefficient122_345, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_347, Icur := OriginalRow227TriangleData1516.coefficient121_346,
    output := OriginalRow227TriangleData1525.coefficient122_346, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_348, Icur := OriginalRow227TriangleData1516.coefficient121_347,
    output := OriginalRow227TriangleData1525.coefficient122_347, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_349, Icur := OriginalRow227TriangleData1516.coefficient121_348,
    output := OriginalRow227TriangleData1525.coefficient122_348, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_350, Icur := OriginalRow227TriangleData1516.coefficient121_349,
    output := OriginalRow227TriangleData1525.coefficient122_349, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_351, Icur := OriginalRow227TriangleData1516.coefficient121_350,
    output := OriginalRow227TriangleData1525.coefficient122_350, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_352, Icur := OriginalRow227TriangleData1516.coefficient121_351,
    output := OriginalRow227TriangleData1525.coefficient122_351, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_353, Icur := OriginalRow227TriangleData1516.coefficient121_352,
    output := OriginalRow227TriangleData1525.coefficient122_352, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_354, Icur := OriginalRow227TriangleData1516.coefficient121_353,
    output := OriginalRow227TriangleData1525.coefficient122_353, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_355, Icur := OriginalRow227TriangleData1516.coefficient121_354,
    output := OriginalRow227TriangleData1525.coefficient122_354, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_356, Icur := OriginalRow227TriangleData1516.coefficient121_355,
    output := OriginalRow227TriangleData1525.coefficient122_355, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_357, Icur := OriginalRow227TriangleData1516.coefficient121_356,
    output := OriginalRow227TriangleData1525.coefficient122_356, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_358, Icur := OriginalRow227TriangleData1516.coefficient121_357,
    output := OriginalRow227TriangleData1525.coefficient122_357, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_359, Icur := OriginalRow227TriangleData1516.coefficient121_358,
    output := OriginalRow227TriangleData1525.coefficient122_358, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_360, Icur := OriginalRow227TriangleData1516.coefficient121_359,
    output := OriginalRow227TriangleData1525.coefficient122_359, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_361, Icur := OriginalRow227TriangleData1516.coefficient121_360,
    output := OriginalRow227TriangleData1525.coefficient122_360, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_362, Icur := OriginalRow227TriangleData1516.coefficient121_361,
    output := OriginalRow227TriangleData1525.coefficient122_361, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_363, Icur := OriginalRow227TriangleData1516.coefficient121_362,
    output := OriginalRow227TriangleData1525.coefficient122_362, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_364, Icur := OriginalRow227TriangleData1516.coefficient121_363,
    output := OriginalRow227TriangleData1525.coefficient122_363, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_365, Icur := OriginalRow227TriangleData1516.coefficient121_364,
    output := OriginalRow227TriangleData1525.coefficient122_364, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_366, Icur := OriginalRow227TriangleData1516.coefficient121_365,
    output := OriginalRow227TriangleData1525.coefficient122_365, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_367, Icur := OriginalRow227TriangleData1516.coefficient121_366,
    output := OriginalRow227TriangleData1525.coefficient122_366, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_368, Icur := OriginalRow227TriangleData1516.coefficient121_367,
    output := OriginalRow227TriangleData1525.coefficient122_367, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_369, Icur := OriginalRow227TriangleData1516.coefficient121_368,
    output := OriginalRow227TriangleData1525.coefficient122_368, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_370, Icur := OriginalRow227TriangleData1516.coefficient121_369,
    output := OriginalRow227TriangleData1525.coefficient122_369, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_371, Icur := OriginalRow227TriangleData1516.coefficient121_370,
    output := OriginalRow227TriangleData1525.coefficient122_370, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_372, Icur := OriginalRow227TriangleData1516.coefficient121_371,
    output := OriginalRow227TriangleData1525.coefficient122_371, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_373, Icur := OriginalRow227TriangleData1516.coefficient121_372,
    output := OriginalRow227TriangleData1525.coefficient122_372, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_374, Icur := OriginalRow227TriangleData1516.coefficient121_373,
    output := OriginalRow227TriangleData1525.coefficient122_373, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1516.coefficient121_375, Icur := OriginalRow227TriangleData1516.coefficient121_374,
    output := OriginalRow227TriangleData1525.coefficient122_374, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1517.coefficient121_376, Icur := OriginalRow227TriangleData1516.coefficient121_375,
    output := OriginalRow227TriangleData1525.coefficient122_375, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1517.coefficient121_377, Icur := OriginalRow227TriangleData1517.coefficient121_376,
    output := OriginalRow227TriangleData1525.coefficient122_376, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1509

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1509.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
