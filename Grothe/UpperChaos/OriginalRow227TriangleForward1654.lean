import Grothe.UpperChaos.OriginalRow227TriangleData1662
import Grothe.UpperChaos.OriginalRow227TriangleData1663
import Grothe.UpperChaos.OriginalRow227TriangleData1670
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1654
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_332, Icur := OriginalRow227TriangleData1662.coefficient139_331,
    output := OriginalRow227TriangleData1670.coefficient140_331, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_333, Icur := OriginalRow227TriangleData1662.coefficient139_332,
    output := OriginalRow227TriangleData1670.coefficient140_332, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_334, Icur := OriginalRow227TriangleData1662.coefficient139_333,
    output := OriginalRow227TriangleData1670.coefficient140_333, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_335, Icur := OriginalRow227TriangleData1662.coefficient139_334,
    output := OriginalRow227TriangleData1670.coefficient140_334, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_336, Icur := OriginalRow227TriangleData1662.coefficient139_335,
    output := OriginalRow227TriangleData1670.coefficient140_335, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_337, Icur := OriginalRow227TriangleData1662.coefficient139_336,
    output := OriginalRow227TriangleData1670.coefficient140_336, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_338, Icur := OriginalRow227TriangleData1662.coefficient139_337,
    output := OriginalRow227TriangleData1670.coefficient140_337, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_339, Icur := OriginalRow227TriangleData1662.coefficient139_338,
    output := OriginalRow227TriangleData1670.coefficient140_338, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_340, Icur := OriginalRow227TriangleData1662.coefficient139_339,
    output := OriginalRow227TriangleData1670.coefficient140_339, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_341, Icur := OriginalRow227TriangleData1662.coefficient139_340,
    output := OriginalRow227TriangleData1670.coefficient140_340, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_342, Icur := OriginalRow227TriangleData1662.coefficient139_341,
    output := OriginalRow227TriangleData1670.coefficient140_341, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_343, Icur := OriginalRow227TriangleData1662.coefficient139_342,
    output := OriginalRow227TriangleData1670.coefficient140_342, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_344, Icur := OriginalRow227TriangleData1662.coefficient139_343,
    output := OriginalRow227TriangleData1670.coefficient140_343, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_345, Icur := OriginalRow227TriangleData1662.coefficient139_344,
    output := OriginalRow227TriangleData1670.coefficient140_344, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_346, Icur := OriginalRow227TriangleData1662.coefficient139_345,
    output := OriginalRow227TriangleData1670.coefficient140_345, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_347, Icur := OriginalRow227TriangleData1662.coefficient139_346,
    output := OriginalRow227TriangleData1670.coefficient140_346, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_348, Icur := OriginalRow227TriangleData1662.coefficient139_347,
    output := OriginalRow227TriangleData1670.coefficient140_347, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_349, Icur := OriginalRow227TriangleData1662.coefficient139_348,
    output := OriginalRow227TriangleData1670.coefficient140_348, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_350, Icur := OriginalRow227TriangleData1662.coefficient139_349,
    output := OriginalRow227TriangleData1670.coefficient140_349, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_351, Icur := OriginalRow227TriangleData1662.coefficient139_350,
    output := OriginalRow227TriangleData1670.coefficient140_350, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_352, Icur := OriginalRow227TriangleData1662.coefficient139_351,
    output := OriginalRow227TriangleData1670.coefficient140_351, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_353, Icur := OriginalRow227TriangleData1662.coefficient139_352,
    output := OriginalRow227TriangleData1670.coefficient140_352, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_354, Icur := OriginalRow227TriangleData1662.coefficient139_353,
    output := OriginalRow227TriangleData1670.coefficient140_353, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_355, Icur := OriginalRow227TriangleData1662.coefficient139_354,
    output := OriginalRow227TriangleData1670.coefficient140_354, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_356, Icur := OriginalRow227TriangleData1662.coefficient139_355,
    output := OriginalRow227TriangleData1670.coefficient140_355, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_357, Icur := OriginalRow227TriangleData1662.coefficient139_356,
    output := OriginalRow227TriangleData1670.coefficient140_356, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_358, Icur := OriginalRow227TriangleData1662.coefficient139_357,
    output := OriginalRow227TriangleData1670.coefficient140_357, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_359, Icur := OriginalRow227TriangleData1662.coefficient139_358,
    output := OriginalRow227TriangleData1670.coefficient140_358, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_360, Icur := OriginalRow227TriangleData1662.coefficient139_359,
    output := OriginalRow227TriangleData1670.coefficient140_359, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1662.coefficient139_361, Icur := OriginalRow227TriangleData1662.coefficient139_360,
    output := OriginalRow227TriangleData1670.coefficient140_360, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots04.root140,
    Inext := OriginalRow227TriangleData1663.coefficient139_362, Icur := OriginalRow227TriangleData1662.coefficient139_361,
    output := OriginalRow227TriangleData1670.coefficient140_361, hC := OriginalRow227TriangleRoots04.root140_pos, hAC := OriginalRow227TriangleRoots04.product140_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1654

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1654.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
