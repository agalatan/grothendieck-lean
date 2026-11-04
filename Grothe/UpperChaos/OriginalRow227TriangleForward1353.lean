import Grothe.UpperChaos.OriginalRow227TriangleData1359
import Grothe.UpperChaos.OriginalRow227TriangleData1360
import Grothe.UpperChaos.OriginalRow227TriangleData1369
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1353
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_329, Icur := OriginalRow227TriangleData1359.coefficient104_328,
    output := OriginalRow227TriangleData1369.coefficient105_328, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_330, Icur := OriginalRow227TriangleData1359.coefficient104_329,
    output := OriginalRow227TriangleData1369.coefficient105_329, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_331, Icur := OriginalRow227TriangleData1359.coefficient104_330,
    output := OriginalRow227TriangleData1369.coefficient105_330, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_332, Icur := OriginalRow227TriangleData1359.coefficient104_331,
    output := OriginalRow227TriangleData1369.coefficient105_331, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_333, Icur := OriginalRow227TriangleData1359.coefficient104_332,
    output := OriginalRow227TriangleData1369.coefficient105_332, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_334, Icur := OriginalRow227TriangleData1359.coefficient104_333,
    output := OriginalRow227TriangleData1369.coefficient105_333, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_335, Icur := OriginalRow227TriangleData1359.coefficient104_334,
    output := OriginalRow227TriangleData1369.coefficient105_334, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_336, Icur := OriginalRow227TriangleData1359.coefficient104_335,
    output := OriginalRow227TriangleData1369.coefficient105_335, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_337, Icur := OriginalRow227TriangleData1359.coefficient104_336,
    output := OriginalRow227TriangleData1369.coefficient105_336, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_338, Icur := OriginalRow227TriangleData1359.coefficient104_337,
    output := OriginalRow227TriangleData1369.coefficient105_337, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_339, Icur := OriginalRow227TriangleData1359.coefficient104_338,
    output := OriginalRow227TriangleData1369.coefficient105_338, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_340, Icur := OriginalRow227TriangleData1359.coefficient104_339,
    output := OriginalRow227TriangleData1369.coefficient105_339, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_341, Icur := OriginalRow227TriangleData1359.coefficient104_340,
    output := OriginalRow227TriangleData1369.coefficient105_340, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_342, Icur := OriginalRow227TriangleData1359.coefficient104_341,
    output := OriginalRow227TriangleData1369.coefficient105_341, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_343, Icur := OriginalRow227TriangleData1359.coefficient104_342,
    output := OriginalRow227TriangleData1369.coefficient105_342, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_344, Icur := OriginalRow227TriangleData1359.coefficient104_343,
    output := OriginalRow227TriangleData1369.coefficient105_343, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_345, Icur := OriginalRow227TriangleData1359.coefficient104_344,
    output := OriginalRow227TriangleData1369.coefficient105_344, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_346, Icur := OriginalRow227TriangleData1359.coefficient104_345,
    output := OriginalRow227TriangleData1369.coefficient105_345, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_347, Icur := OriginalRow227TriangleData1359.coefficient104_346,
    output := OriginalRow227TriangleData1369.coefficient105_346, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_348, Icur := OriginalRow227TriangleData1359.coefficient104_347,
    output := OriginalRow227TriangleData1369.coefficient105_347, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_349, Icur := OriginalRow227TriangleData1359.coefficient104_348,
    output := OriginalRow227TriangleData1369.coefficient105_348, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_350, Icur := OriginalRow227TriangleData1359.coefficient104_349,
    output := OriginalRow227TriangleData1369.coefficient105_349, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_351, Icur := OriginalRow227TriangleData1359.coefficient104_350,
    output := OriginalRow227TriangleData1369.coefficient105_350, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_352, Icur := OriginalRow227TriangleData1359.coefficient104_351,
    output := OriginalRow227TriangleData1369.coefficient105_351, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_353, Icur := OriginalRow227TriangleData1359.coefficient104_352,
    output := OriginalRow227TriangleData1369.coefficient105_352, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_354, Icur := OriginalRow227TriangleData1359.coefficient104_353,
    output := OriginalRow227TriangleData1369.coefficient105_353, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_355, Icur := OriginalRow227TriangleData1359.coefficient104_354,
    output := OriginalRow227TriangleData1369.coefficient105_354, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_356, Icur := OriginalRow227TriangleData1359.coefficient104_355,
    output := OriginalRow227TriangleData1369.coefficient105_355, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_357, Icur := OriginalRow227TriangleData1359.coefficient104_356,
    output := OriginalRow227TriangleData1369.coefficient105_356, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_358, Icur := OriginalRow227TriangleData1359.coefficient104_357,
    output := OriginalRow227TriangleData1369.coefficient105_357, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1360.coefficient104_359, Icur := OriginalRow227TriangleData1359.coefficient104_358,
    output := OriginalRow227TriangleData1369.coefficient105_358, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1360.coefficient104_360, Icur := OriginalRow227TriangleData1360.coefficient104_359,
    output := OriginalRow227TriangleData1369.coefficient105_359, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1353

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1353.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
