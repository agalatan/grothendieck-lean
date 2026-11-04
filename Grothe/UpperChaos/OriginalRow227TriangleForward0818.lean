import Grothe.UpperChaos.OriginalRow227TriangleData0821
import Grothe.UpperChaos.OriginalRow227TriangleData0822
import Grothe.UpperChaos.OriginalRow227TriangleData0834
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0818
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_345, Icur := OriginalRow227TriangleData0821.coefficient56_344,
    output := OriginalRow227TriangleData0834.coefficient57_344, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_346, Icur := OriginalRow227TriangleData0821.coefficient56_345,
    output := OriginalRow227TriangleData0834.coefficient57_345, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_347, Icur := OriginalRow227TriangleData0821.coefficient56_346,
    output := OriginalRow227TriangleData0834.coefficient57_346, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_348, Icur := OriginalRow227TriangleData0821.coefficient56_347,
    output := OriginalRow227TriangleData0834.coefficient57_347, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_349, Icur := OriginalRow227TriangleData0821.coefficient56_348,
    output := OriginalRow227TriangleData0834.coefficient57_348, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_350, Icur := OriginalRow227TriangleData0821.coefficient56_349,
    output := OriginalRow227TriangleData0834.coefficient57_349, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_351, Icur := OriginalRow227TriangleData0821.coefficient56_350,
    output := OriginalRow227TriangleData0834.coefficient57_350, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_352, Icur := OriginalRow227TriangleData0821.coefficient56_351,
    output := OriginalRow227TriangleData0834.coefficient57_351, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_353, Icur := OriginalRow227TriangleData0821.coefficient56_352,
    output := OriginalRow227TriangleData0834.coefficient57_352, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_354, Icur := OriginalRow227TriangleData0821.coefficient56_353,
    output := OriginalRow227TriangleData0834.coefficient57_353, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_355, Icur := OriginalRow227TriangleData0821.coefficient56_354,
    output := OriginalRow227TriangleData0834.coefficient57_354, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_356, Icur := OriginalRow227TriangleData0821.coefficient56_355,
    output := OriginalRow227TriangleData0834.coefficient57_355, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_357, Icur := OriginalRow227TriangleData0821.coefficient56_356,
    output := OriginalRow227TriangleData0834.coefficient57_356, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_358, Icur := OriginalRow227TriangleData0821.coefficient56_357,
    output := OriginalRow227TriangleData0834.coefficient57_357, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_359, Icur := OriginalRow227TriangleData0821.coefficient56_358,
    output := OriginalRow227TriangleData0834.coefficient57_358, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_360, Icur := OriginalRow227TriangleData0821.coefficient56_359,
    output := OriginalRow227TriangleData0834.coefficient57_359, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_361, Icur := OriginalRow227TriangleData0821.coefficient56_360,
    output := OriginalRow227TriangleData0834.coefficient57_360, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_362, Icur := OriginalRow227TriangleData0821.coefficient56_361,
    output := OriginalRow227TriangleData0834.coefficient57_361, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_363, Icur := OriginalRow227TriangleData0821.coefficient56_362,
    output := OriginalRow227TriangleData0834.coefficient57_362, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_364, Icur := OriginalRow227TriangleData0821.coefficient56_363,
    output := OriginalRow227TriangleData0834.coefficient57_363, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_365, Icur := OriginalRow227TriangleData0821.coefficient56_364,
    output := OriginalRow227TriangleData0834.coefficient57_364, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_366, Icur := OriginalRow227TriangleData0821.coefficient56_365,
    output := OriginalRow227TriangleData0834.coefficient57_365, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_367, Icur := OriginalRow227TriangleData0821.coefficient56_366,
    output := OriginalRow227TriangleData0834.coefficient57_366, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_368, Icur := OriginalRow227TriangleData0821.coefficient56_367,
    output := OriginalRow227TriangleData0834.coefficient57_367, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_369, Icur := OriginalRow227TriangleData0821.coefficient56_368,
    output := OriginalRow227TriangleData0834.coefficient57_368, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_370, Icur := OriginalRow227TriangleData0821.coefficient56_369,
    output := OriginalRow227TriangleData0834.coefficient57_369, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_371, Icur := OriginalRow227TriangleData0821.coefficient56_370,
    output := OriginalRow227TriangleData0834.coefficient57_370, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_372, Icur := OriginalRow227TriangleData0821.coefficient56_371,
    output := OriginalRow227TriangleData0834.coefficient57_371, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_373, Icur := OriginalRow227TriangleData0821.coefficient56_372,
    output := OriginalRow227TriangleData0834.coefficient57_372, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0821.coefficient56_374, Icur := OriginalRow227TriangleData0821.coefficient56_373,
    output := OriginalRow227TriangleData0834.coefficient57_373, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0822.coefficient56_375, Icur := OriginalRow227TriangleData0821.coefficient56_374,
    output := OriginalRow227TriangleData0834.coefficient57_374, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0822.coefficient56_376, Icur := OriginalRow227TriangleData0822.coefficient56_375,
    output := OriginalRow227TriangleData0834.coefficient57_375, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0818

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0818.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
