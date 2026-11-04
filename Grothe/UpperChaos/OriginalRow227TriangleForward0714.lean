import Grothe.UpperChaos.OriginalRow227TriangleData0717
import Grothe.UpperChaos.OriginalRow227TriangleData0718
import Grothe.UpperChaos.OriginalRow227TriangleData0730
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0714
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_337, Icur := OriginalRow227TriangleData0717.coefficient48_336,
    output := OriginalRow227TriangleData0730.coefficient49_336, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_338, Icur := OriginalRow227TriangleData0717.coefficient48_337,
    output := OriginalRow227TriangleData0730.coefficient49_337, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_339, Icur := OriginalRow227TriangleData0717.coefficient48_338,
    output := OriginalRow227TriangleData0730.coefficient49_338, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_340, Icur := OriginalRow227TriangleData0717.coefficient48_339,
    output := OriginalRow227TriangleData0730.coefficient49_339, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_341, Icur := OriginalRow227TriangleData0717.coefficient48_340,
    output := OriginalRow227TriangleData0730.coefficient49_340, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_342, Icur := OriginalRow227TriangleData0717.coefficient48_341,
    output := OriginalRow227TriangleData0730.coefficient49_341, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_343, Icur := OriginalRow227TriangleData0717.coefficient48_342,
    output := OriginalRow227TriangleData0730.coefficient49_342, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_344, Icur := OriginalRow227TriangleData0717.coefficient48_343,
    output := OriginalRow227TriangleData0730.coefficient49_343, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_345, Icur := OriginalRow227TriangleData0717.coefficient48_344,
    output := OriginalRow227TriangleData0730.coefficient49_344, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_346, Icur := OriginalRow227TriangleData0717.coefficient48_345,
    output := OriginalRow227TriangleData0730.coefficient49_345, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_347, Icur := OriginalRow227TriangleData0717.coefficient48_346,
    output := OriginalRow227TriangleData0730.coefficient49_346, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_348, Icur := OriginalRow227TriangleData0717.coefficient48_347,
    output := OriginalRow227TriangleData0730.coefficient49_347, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_349, Icur := OriginalRow227TriangleData0717.coefficient48_348,
    output := OriginalRow227TriangleData0730.coefficient49_348, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_350, Icur := OriginalRow227TriangleData0717.coefficient48_349,
    output := OriginalRow227TriangleData0730.coefficient49_349, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_351, Icur := OriginalRow227TriangleData0717.coefficient48_350,
    output := OriginalRow227TriangleData0730.coefficient49_350, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_352, Icur := OriginalRow227TriangleData0717.coefficient48_351,
    output := OriginalRow227TriangleData0730.coefficient49_351, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_353, Icur := OriginalRow227TriangleData0717.coefficient48_352,
    output := OriginalRow227TriangleData0730.coefficient49_352, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_354, Icur := OriginalRow227TriangleData0717.coefficient48_353,
    output := OriginalRow227TriangleData0730.coefficient49_353, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_355, Icur := OriginalRow227TriangleData0717.coefficient48_354,
    output := OriginalRow227TriangleData0730.coefficient49_354, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_356, Icur := OriginalRow227TriangleData0717.coefficient48_355,
    output := OriginalRow227TriangleData0730.coefficient49_355, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_357, Icur := OriginalRow227TriangleData0717.coefficient48_356,
    output := OriginalRow227TriangleData0730.coefficient49_356, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_358, Icur := OriginalRow227TriangleData0717.coefficient48_357,
    output := OriginalRow227TriangleData0730.coefficient49_357, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_359, Icur := OriginalRow227TriangleData0717.coefficient48_358,
    output := OriginalRow227TriangleData0730.coefficient49_358, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_360, Icur := OriginalRow227TriangleData0717.coefficient48_359,
    output := OriginalRow227TriangleData0730.coefficient49_359, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_361, Icur := OriginalRow227TriangleData0717.coefficient48_360,
    output := OriginalRow227TriangleData0730.coefficient49_360, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_362, Icur := OriginalRow227TriangleData0717.coefficient48_361,
    output := OriginalRow227TriangleData0730.coefficient49_361, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_363, Icur := OriginalRow227TriangleData0717.coefficient48_362,
    output := OriginalRow227TriangleData0730.coefficient49_362, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_364, Icur := OriginalRow227TriangleData0717.coefficient48_363,
    output := OriginalRow227TriangleData0730.coefficient49_363, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_365, Icur := OriginalRow227TriangleData0717.coefficient48_364,
    output := OriginalRow227TriangleData0730.coefficient49_364, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_366, Icur := OriginalRow227TriangleData0717.coefficient48_365,
    output := OriginalRow227TriangleData0730.coefficient49_365, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_367, Icur := OriginalRow227TriangleData0717.coefficient48_366,
    output := OriginalRow227TriangleData0730.coefficient49_366, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_368, Icur := OriginalRow227TriangleData0718.coefficient48_367,
    output := OriginalRow227TriangleData0730.coefficient49_367, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0714

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0714.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
