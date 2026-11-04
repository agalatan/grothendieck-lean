import Grothe.UpperChaos.OriginalRow227TriangleData1453
import Grothe.UpperChaos.OriginalRow227TriangleData1454
import Grothe.UpperChaos.OriginalRow227TriangleData1462
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1446
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_339, Icur := OriginalRow227TriangleData1453.coefficient114_338,
    output := OriginalRow227TriangleData1462.coefficient115_338, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_340, Icur := OriginalRow227TriangleData1453.coefficient114_339,
    output := OriginalRow227TriangleData1462.coefficient115_339, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_341, Icur := OriginalRow227TriangleData1453.coefficient114_340,
    output := OriginalRow227TriangleData1462.coefficient115_340, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_342, Icur := OriginalRow227TriangleData1453.coefficient114_341,
    output := OriginalRow227TriangleData1462.coefficient115_341, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_343, Icur := OriginalRow227TriangleData1453.coefficient114_342,
    output := OriginalRow227TriangleData1462.coefficient115_342, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_344, Icur := OriginalRow227TriangleData1453.coefficient114_343,
    output := OriginalRow227TriangleData1462.coefficient115_343, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_345, Icur := OriginalRow227TriangleData1453.coefficient114_344,
    output := OriginalRow227TriangleData1462.coefficient115_344, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_346, Icur := OriginalRow227TriangleData1453.coefficient114_345,
    output := OriginalRow227TriangleData1462.coefficient115_345, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_347, Icur := OriginalRow227TriangleData1453.coefficient114_346,
    output := OriginalRow227TriangleData1462.coefficient115_346, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_348, Icur := OriginalRow227TriangleData1453.coefficient114_347,
    output := OriginalRow227TriangleData1462.coefficient115_347, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_349, Icur := OriginalRow227TriangleData1453.coefficient114_348,
    output := OriginalRow227TriangleData1462.coefficient115_348, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_350, Icur := OriginalRow227TriangleData1453.coefficient114_349,
    output := OriginalRow227TriangleData1462.coefficient115_349, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_351, Icur := OriginalRow227TriangleData1453.coefficient114_350,
    output := OriginalRow227TriangleData1462.coefficient115_350, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_352, Icur := OriginalRow227TriangleData1453.coefficient114_351,
    output := OriginalRow227TriangleData1462.coefficient115_351, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_353, Icur := OriginalRow227TriangleData1453.coefficient114_352,
    output := OriginalRow227TriangleData1462.coefficient115_352, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_354, Icur := OriginalRow227TriangleData1453.coefficient114_353,
    output := OriginalRow227TriangleData1462.coefficient115_353, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_355, Icur := OriginalRow227TriangleData1453.coefficient114_354,
    output := OriginalRow227TriangleData1462.coefficient115_354, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_356, Icur := OriginalRow227TriangleData1453.coefficient114_355,
    output := OriginalRow227TriangleData1462.coefficient115_355, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_357, Icur := OriginalRow227TriangleData1453.coefficient114_356,
    output := OriginalRow227TriangleData1462.coefficient115_356, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_358, Icur := OriginalRow227TriangleData1453.coefficient114_357,
    output := OriginalRow227TriangleData1462.coefficient115_357, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_359, Icur := OriginalRow227TriangleData1453.coefficient114_358,
    output := OriginalRow227TriangleData1462.coefficient115_358, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_360, Icur := OriginalRow227TriangleData1453.coefficient114_359,
    output := OriginalRow227TriangleData1462.coefficient115_359, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_361, Icur := OriginalRow227TriangleData1453.coefficient114_360,
    output := OriginalRow227TriangleData1462.coefficient115_360, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_362, Icur := OriginalRow227TriangleData1453.coefficient114_361,
    output := OriginalRow227TriangleData1462.coefficient115_361, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_363, Icur := OriginalRow227TriangleData1453.coefficient114_362,
    output := OriginalRow227TriangleData1462.coefficient115_362, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_364, Icur := OriginalRow227TriangleData1453.coefficient114_363,
    output := OriginalRow227TriangleData1462.coefficient115_363, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_365, Icur := OriginalRow227TriangleData1453.coefficient114_364,
    output := OriginalRow227TriangleData1462.coefficient115_364, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_366, Icur := OriginalRow227TriangleData1453.coefficient114_365,
    output := OriginalRow227TriangleData1462.coefficient115_365, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_367, Icur := OriginalRow227TriangleData1453.coefficient114_366,
    output := OriginalRow227TriangleData1462.coefficient115_366, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_368, Icur := OriginalRow227TriangleData1453.coefficient114_367,
    output := OriginalRow227TriangleData1462.coefficient115_367, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_369, Icur := OriginalRow227TriangleData1453.coefficient114_368,
    output := OriginalRow227TriangleData1462.coefficient115_368, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1454.coefficient114_370, Icur := OriginalRow227TriangleData1454.coefficient114_369,
    output := OriginalRow227TriangleData1462.coefficient115_369, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1446

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1446.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
