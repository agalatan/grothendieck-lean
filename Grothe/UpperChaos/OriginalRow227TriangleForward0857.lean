import Grothe.UpperChaos.OriginalRow227TriangleData0860
import Grothe.UpperChaos.OriginalRow227TriangleData0861
import Grothe.UpperChaos.OriginalRow227TriangleData0873
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0857
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_348, Icur := OriginalRow227TriangleData0860.coefficient59_347,
    output := OriginalRow227TriangleData0873.coefficient60_347, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_349, Icur := OriginalRow227TriangleData0860.coefficient59_348,
    output := OriginalRow227TriangleData0873.coefficient60_348, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_350, Icur := OriginalRow227TriangleData0860.coefficient59_349,
    output := OriginalRow227TriangleData0873.coefficient60_349, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_351, Icur := OriginalRow227TriangleData0860.coefficient59_350,
    output := OriginalRow227TriangleData0873.coefficient60_350, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_352, Icur := OriginalRow227TriangleData0860.coefficient59_351,
    output := OriginalRow227TriangleData0873.coefficient60_351, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_353, Icur := OriginalRow227TriangleData0860.coefficient59_352,
    output := OriginalRow227TriangleData0873.coefficient60_352, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_354, Icur := OriginalRow227TriangleData0860.coefficient59_353,
    output := OriginalRow227TriangleData0873.coefficient60_353, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_355, Icur := OriginalRow227TriangleData0860.coefficient59_354,
    output := OriginalRow227TriangleData0873.coefficient60_354, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_356, Icur := OriginalRow227TriangleData0860.coefficient59_355,
    output := OriginalRow227TriangleData0873.coefficient60_355, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_357, Icur := OriginalRow227TriangleData0860.coefficient59_356,
    output := OriginalRow227TriangleData0873.coefficient60_356, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_358, Icur := OriginalRow227TriangleData0860.coefficient59_357,
    output := OriginalRow227TriangleData0873.coefficient60_357, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_359, Icur := OriginalRow227TriangleData0860.coefficient59_358,
    output := OriginalRow227TriangleData0873.coefficient60_358, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_360, Icur := OriginalRow227TriangleData0860.coefficient59_359,
    output := OriginalRow227TriangleData0873.coefficient60_359, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_361, Icur := OriginalRow227TriangleData0860.coefficient59_360,
    output := OriginalRow227TriangleData0873.coefficient60_360, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_362, Icur := OriginalRow227TriangleData0860.coefficient59_361,
    output := OriginalRow227TriangleData0873.coefficient60_361, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_363, Icur := OriginalRow227TriangleData0860.coefficient59_362,
    output := OriginalRow227TriangleData0873.coefficient60_362, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_364, Icur := OriginalRow227TriangleData0860.coefficient59_363,
    output := OriginalRow227TriangleData0873.coefficient60_363, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_365, Icur := OriginalRow227TriangleData0860.coefficient59_364,
    output := OriginalRow227TriangleData0873.coefficient60_364, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_366, Icur := OriginalRow227TriangleData0860.coefficient59_365,
    output := OriginalRow227TriangleData0873.coefficient60_365, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_367, Icur := OriginalRow227TriangleData0860.coefficient59_366,
    output := OriginalRow227TriangleData0873.coefficient60_366, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_368, Icur := OriginalRow227TriangleData0860.coefficient59_367,
    output := OriginalRow227TriangleData0873.coefficient60_367, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_369, Icur := OriginalRow227TriangleData0860.coefficient59_368,
    output := OriginalRow227TriangleData0873.coefficient60_368, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_370, Icur := OriginalRow227TriangleData0860.coefficient59_369,
    output := OriginalRow227TriangleData0873.coefficient60_369, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_371, Icur := OriginalRow227TriangleData0860.coefficient59_370,
    output := OriginalRow227TriangleData0873.coefficient60_370, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_372, Icur := OriginalRow227TriangleData0860.coefficient59_371,
    output := OriginalRow227TriangleData0873.coefficient60_371, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_373, Icur := OriginalRow227TriangleData0860.coefficient59_372,
    output := OriginalRow227TriangleData0873.coefficient60_372, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_374, Icur := OriginalRow227TriangleData0860.coefficient59_373,
    output := OriginalRow227TriangleData0873.coefficient60_373, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_375, Icur := OriginalRow227TriangleData0860.coefficient59_374,
    output := OriginalRow227TriangleData0873.coefficient60_374, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_376, Icur := OriginalRow227TriangleData0860.coefficient59_375,
    output := OriginalRow227TriangleData0873.coefficient60_375, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0860.coefficient59_377, Icur := OriginalRow227TriangleData0860.coefficient59_376,
    output := OriginalRow227TriangleData0873.coefficient60_376, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0861.coefficient59_378, Icur := OriginalRow227TriangleData0860.coefficient59_377,
    output := OriginalRow227TriangleData0873.coefficient60_377, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0861.coefficient59_379, Icur := OriginalRow227TriangleData0861.coefficient59_378,
    output := OriginalRow227TriangleData0873.coefficient60_378, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0857

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0857.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
