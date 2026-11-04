import Grothe.UpperChaos.OriginalRow227TriangleData1389
import Grothe.UpperChaos.OriginalRow227TriangleData1390
import Grothe.UpperChaos.OriginalRow227TriangleData1399
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1383
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_332, Icur := OriginalRow227TriangleData1389.coefficient107_331,
    output := OriginalRow227TriangleData1399.coefficient108_331, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_333, Icur := OriginalRow227TriangleData1389.coefficient107_332,
    output := OriginalRow227TriangleData1399.coefficient108_332, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_334, Icur := OriginalRow227TriangleData1389.coefficient107_333,
    output := OriginalRow227TriangleData1399.coefficient108_333, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_335, Icur := OriginalRow227TriangleData1389.coefficient107_334,
    output := OriginalRow227TriangleData1399.coefficient108_334, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_336, Icur := OriginalRow227TriangleData1389.coefficient107_335,
    output := OriginalRow227TriangleData1399.coefficient108_335, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_337, Icur := OriginalRow227TriangleData1389.coefficient107_336,
    output := OriginalRow227TriangleData1399.coefficient108_336, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_338, Icur := OriginalRow227TriangleData1389.coefficient107_337,
    output := OriginalRow227TriangleData1399.coefficient108_337, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_339, Icur := OriginalRow227TriangleData1389.coefficient107_338,
    output := OriginalRow227TriangleData1399.coefficient108_338, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_340, Icur := OriginalRow227TriangleData1389.coefficient107_339,
    output := OriginalRow227TriangleData1399.coefficient108_339, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_341, Icur := OriginalRow227TriangleData1389.coefficient107_340,
    output := OriginalRow227TriangleData1399.coefficient108_340, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_342, Icur := OriginalRow227TriangleData1389.coefficient107_341,
    output := OriginalRow227TriangleData1399.coefficient108_341, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_343, Icur := OriginalRow227TriangleData1389.coefficient107_342,
    output := OriginalRow227TriangleData1399.coefficient108_342, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_344, Icur := OriginalRow227TriangleData1389.coefficient107_343,
    output := OriginalRow227TriangleData1399.coefficient108_343, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_345, Icur := OriginalRow227TriangleData1389.coefficient107_344,
    output := OriginalRow227TriangleData1399.coefficient108_344, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_346, Icur := OriginalRow227TriangleData1389.coefficient107_345,
    output := OriginalRow227TriangleData1399.coefficient108_345, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_347, Icur := OriginalRow227TriangleData1389.coefficient107_346,
    output := OriginalRow227TriangleData1399.coefficient108_346, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_348, Icur := OriginalRow227TriangleData1389.coefficient107_347,
    output := OriginalRow227TriangleData1399.coefficient108_347, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_349, Icur := OriginalRow227TriangleData1389.coefficient107_348,
    output := OriginalRow227TriangleData1399.coefficient108_348, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_350, Icur := OriginalRow227TriangleData1389.coefficient107_349,
    output := OriginalRow227TriangleData1399.coefficient108_349, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_351, Icur := OriginalRow227TriangleData1389.coefficient107_350,
    output := OriginalRow227TriangleData1399.coefficient108_350, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_352, Icur := OriginalRow227TriangleData1389.coefficient107_351,
    output := OriginalRow227TriangleData1399.coefficient108_351, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_353, Icur := OriginalRow227TriangleData1389.coefficient107_352,
    output := OriginalRow227TriangleData1399.coefficient108_352, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_354, Icur := OriginalRow227TriangleData1389.coefficient107_353,
    output := OriginalRow227TriangleData1399.coefficient108_353, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_355, Icur := OriginalRow227TriangleData1389.coefficient107_354,
    output := OriginalRow227TriangleData1399.coefficient108_354, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_356, Icur := OriginalRow227TriangleData1389.coefficient107_355,
    output := OriginalRow227TriangleData1399.coefficient108_355, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_357, Icur := OriginalRow227TriangleData1389.coefficient107_356,
    output := OriginalRow227TriangleData1399.coefficient108_356, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_358, Icur := OriginalRow227TriangleData1389.coefficient107_357,
    output := OriginalRow227TriangleData1399.coefficient108_357, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_359, Icur := OriginalRow227TriangleData1389.coefficient107_358,
    output := OriginalRow227TriangleData1399.coefficient108_358, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_360, Icur := OriginalRow227TriangleData1389.coefficient107_359,
    output := OriginalRow227TriangleData1399.coefficient108_359, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1389.coefficient107_361, Icur := OriginalRow227TriangleData1389.coefficient107_360,
    output := OriginalRow227TriangleData1399.coefficient108_360, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1390.coefficient107_362, Icur := OriginalRow227TriangleData1389.coefficient107_361,
    output := OriginalRow227TriangleData1399.coefficient108_361, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1390.coefficient107_363, Icur := OriginalRow227TriangleData1390.coefficient107_362,
    output := OriginalRow227TriangleData1399.coefficient108_362, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1383

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1383.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
