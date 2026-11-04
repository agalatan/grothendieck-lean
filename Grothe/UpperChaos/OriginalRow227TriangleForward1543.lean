import Grothe.UpperChaos.OriginalRow227TriangleData1551
import Grothe.UpperChaos.OriginalRow227TriangleData1559
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1543
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_350, Icur := OriginalRow227TriangleData1551.coefficient125_349,
    output := OriginalRow227TriangleData1559.coefficient126_349, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_351, Icur := OriginalRow227TriangleData1551.coefficient125_350,
    output := OriginalRow227TriangleData1559.coefficient126_350, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_352, Icur := OriginalRow227TriangleData1551.coefficient125_351,
    output := OriginalRow227TriangleData1559.coefficient126_351, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_353, Icur := OriginalRow227TriangleData1551.coefficient125_352,
    output := OriginalRow227TriangleData1559.coefficient126_352, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_354, Icur := OriginalRow227TriangleData1551.coefficient125_353,
    output := OriginalRow227TriangleData1559.coefficient126_353, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_355, Icur := OriginalRow227TriangleData1551.coefficient125_354,
    output := OriginalRow227TriangleData1559.coefficient126_354, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_356, Icur := OriginalRow227TriangleData1551.coefficient125_355,
    output := OriginalRow227TriangleData1559.coefficient126_355, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_357, Icur := OriginalRow227TriangleData1551.coefficient125_356,
    output := OriginalRow227TriangleData1559.coefficient126_356, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_358, Icur := OriginalRow227TriangleData1551.coefficient125_357,
    output := OriginalRow227TriangleData1559.coefficient126_357, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_359, Icur := OriginalRow227TriangleData1551.coefficient125_358,
    output := OriginalRow227TriangleData1559.coefficient126_358, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_360, Icur := OriginalRow227TriangleData1551.coefficient125_359,
    output := OriginalRow227TriangleData1559.coefficient126_359, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_361, Icur := OriginalRow227TriangleData1551.coefficient125_360,
    output := OriginalRow227TriangleData1559.coefficient126_360, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_362, Icur := OriginalRow227TriangleData1551.coefficient125_361,
    output := OriginalRow227TriangleData1559.coefficient126_361, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_363, Icur := OriginalRow227TriangleData1551.coefficient125_362,
    output := OriginalRow227TriangleData1559.coefficient126_362, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_364, Icur := OriginalRow227TriangleData1551.coefficient125_363,
    output := OriginalRow227TriangleData1559.coefficient126_363, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_365, Icur := OriginalRow227TriangleData1551.coefficient125_364,
    output := OriginalRow227TriangleData1559.coefficient126_364, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_366, Icur := OriginalRow227TriangleData1551.coefficient125_365,
    output := OriginalRow227TriangleData1559.coefficient126_365, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_367, Icur := OriginalRow227TriangleData1551.coefficient125_366,
    output := OriginalRow227TriangleData1559.coefficient126_366, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_368, Icur := OriginalRow227TriangleData1551.coefficient125_367,
    output := OriginalRow227TriangleData1559.coefficient126_367, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_369, Icur := OriginalRow227TriangleData1551.coefficient125_368,
    output := OriginalRow227TriangleData1559.coefficient126_368, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_370, Icur := OriginalRow227TriangleData1551.coefficient125_369,
    output := OriginalRow227TriangleData1559.coefficient126_369, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_371, Icur := OriginalRow227TriangleData1551.coefficient125_370,
    output := OriginalRow227TriangleData1559.coefficient126_370, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_372, Icur := OriginalRow227TriangleData1551.coefficient125_371,
    output := OriginalRow227TriangleData1559.coefficient126_371, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_373, Icur := OriginalRow227TriangleData1551.coefficient125_372,
    output := OriginalRow227TriangleData1559.coefficient126_372, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_374, Icur := OriginalRow227TriangleData1551.coefficient125_373,
    output := OriginalRow227TriangleData1559.coefficient126_373, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_375, Icur := OriginalRow227TriangleData1551.coefficient125_374,
    output := OriginalRow227TriangleData1559.coefficient126_374, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1551.coefficient125_376, Icur := OriginalRow227TriangleData1551.coefficient125_375,
    output := OriginalRow227TriangleData1559.coefficient126_375, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1543

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1543.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
