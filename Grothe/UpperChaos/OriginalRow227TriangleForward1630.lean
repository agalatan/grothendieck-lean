import Grothe.UpperChaos.OriginalRow227TriangleData1638
import Grothe.UpperChaos.OriginalRow227TriangleData1639
import Grothe.UpperChaos.OriginalRow227TriangleData1646
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1630
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_329, Icur := OriginalRow227TriangleData1638.coefficient136_328,
    output := OriginalRow227TriangleData1646.coefficient137_328, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_330, Icur := OriginalRow227TriangleData1638.coefficient136_329,
    output := OriginalRow227TriangleData1646.coefficient137_329, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_331, Icur := OriginalRow227TriangleData1638.coefficient136_330,
    output := OriginalRow227TriangleData1646.coefficient137_330, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_332, Icur := OriginalRow227TriangleData1638.coefficient136_331,
    output := OriginalRow227TriangleData1646.coefficient137_331, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_333, Icur := OriginalRow227TriangleData1638.coefficient136_332,
    output := OriginalRow227TriangleData1646.coefficient137_332, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_334, Icur := OriginalRow227TriangleData1638.coefficient136_333,
    output := OriginalRow227TriangleData1646.coefficient137_333, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_335, Icur := OriginalRow227TriangleData1638.coefficient136_334,
    output := OriginalRow227TriangleData1646.coefficient137_334, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_336, Icur := OriginalRow227TriangleData1638.coefficient136_335,
    output := OriginalRow227TriangleData1646.coefficient137_335, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_337, Icur := OriginalRow227TriangleData1638.coefficient136_336,
    output := OriginalRow227TriangleData1646.coefficient137_336, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_338, Icur := OriginalRow227TriangleData1638.coefficient136_337,
    output := OriginalRow227TriangleData1646.coefficient137_337, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_339, Icur := OriginalRow227TriangleData1638.coefficient136_338,
    output := OriginalRow227TriangleData1646.coefficient137_338, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_340, Icur := OriginalRow227TriangleData1638.coefficient136_339,
    output := OriginalRow227TriangleData1646.coefficient137_339, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_341, Icur := OriginalRow227TriangleData1638.coefficient136_340,
    output := OriginalRow227TriangleData1646.coefficient137_340, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_342, Icur := OriginalRow227TriangleData1638.coefficient136_341,
    output := OriginalRow227TriangleData1646.coefficient137_341, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_343, Icur := OriginalRow227TriangleData1638.coefficient136_342,
    output := OriginalRow227TriangleData1646.coefficient137_342, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_344, Icur := OriginalRow227TriangleData1638.coefficient136_343,
    output := OriginalRow227TriangleData1646.coefficient137_343, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_345, Icur := OriginalRow227TriangleData1638.coefficient136_344,
    output := OriginalRow227TriangleData1646.coefficient137_344, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_346, Icur := OriginalRow227TriangleData1638.coefficient136_345,
    output := OriginalRow227TriangleData1646.coefficient137_345, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_347, Icur := OriginalRow227TriangleData1638.coefficient136_346,
    output := OriginalRow227TriangleData1646.coefficient137_346, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_348, Icur := OriginalRow227TriangleData1638.coefficient136_347,
    output := OriginalRow227TriangleData1646.coefficient137_347, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_349, Icur := OriginalRow227TriangleData1638.coefficient136_348,
    output := OriginalRow227TriangleData1646.coefficient137_348, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_350, Icur := OriginalRow227TriangleData1638.coefficient136_349,
    output := OriginalRow227TriangleData1646.coefficient137_349, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_351, Icur := OriginalRow227TriangleData1638.coefficient136_350,
    output := OriginalRow227TriangleData1646.coefficient137_350, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_352, Icur := OriginalRow227TriangleData1638.coefficient136_351,
    output := OriginalRow227TriangleData1646.coefficient137_351, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_353, Icur := OriginalRow227TriangleData1638.coefficient136_352,
    output := OriginalRow227TriangleData1646.coefficient137_352, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_354, Icur := OriginalRow227TriangleData1638.coefficient136_353,
    output := OriginalRow227TriangleData1646.coefficient137_353, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_355, Icur := OriginalRow227TriangleData1638.coefficient136_354,
    output := OriginalRow227TriangleData1646.coefficient137_354, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_356, Icur := OriginalRow227TriangleData1638.coefficient136_355,
    output := OriginalRow227TriangleData1646.coefficient137_355, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_357, Icur := OriginalRow227TriangleData1638.coefficient136_356,
    output := OriginalRow227TriangleData1646.coefficient137_356, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1638.coefficient136_358, Icur := OriginalRow227TriangleData1638.coefficient136_357,
    output := OriginalRow227TriangleData1646.coefficient137_357, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1639.coefficient136_359, Icur := OriginalRow227TriangleData1638.coefficient136_358,
    output := OriginalRow227TriangleData1646.coefficient137_358, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1639.coefficient136_360, Icur := OriginalRow227TriangleData1639.coefficient136_359,
    output := OriginalRow227TriangleData1646.coefficient137_359, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1630

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1630.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
