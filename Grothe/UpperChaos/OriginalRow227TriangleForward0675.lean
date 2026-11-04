import Grothe.UpperChaos.OriginalRow227TriangleData0678
import Grothe.UpperChaos.OriginalRow227TriangleData0679
import Grothe.UpperChaos.OriginalRow227TriangleData0691
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0675
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_334, Icur := OriginalRow227TriangleData0678.coefficient45_333,
    output := OriginalRow227TriangleData0691.coefficient46_333, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_335, Icur := OriginalRow227TriangleData0678.coefficient45_334,
    output := OriginalRow227TriangleData0691.coefficient46_334, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_336, Icur := OriginalRow227TriangleData0678.coefficient45_335,
    output := OriginalRow227TriangleData0691.coefficient46_335, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_337, Icur := OriginalRow227TriangleData0678.coefficient45_336,
    output := OriginalRow227TriangleData0691.coefficient46_336, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_338, Icur := OriginalRow227TriangleData0678.coefficient45_337,
    output := OriginalRow227TriangleData0691.coefficient46_337, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_339, Icur := OriginalRow227TriangleData0678.coefficient45_338,
    output := OriginalRow227TriangleData0691.coefficient46_338, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_340, Icur := OriginalRow227TriangleData0678.coefficient45_339,
    output := OriginalRow227TriangleData0691.coefficient46_339, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_341, Icur := OriginalRow227TriangleData0678.coefficient45_340,
    output := OriginalRow227TriangleData0691.coefficient46_340, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_342, Icur := OriginalRow227TriangleData0678.coefficient45_341,
    output := OriginalRow227TriangleData0691.coefficient46_341, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_343, Icur := OriginalRow227TriangleData0678.coefficient45_342,
    output := OriginalRow227TriangleData0691.coefficient46_342, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_344, Icur := OriginalRow227TriangleData0678.coefficient45_343,
    output := OriginalRow227TriangleData0691.coefficient46_343, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_345, Icur := OriginalRow227TriangleData0678.coefficient45_344,
    output := OriginalRow227TriangleData0691.coefficient46_344, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_346, Icur := OriginalRow227TriangleData0678.coefficient45_345,
    output := OriginalRow227TriangleData0691.coefficient46_345, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_347, Icur := OriginalRow227TriangleData0678.coefficient45_346,
    output := OriginalRow227TriangleData0691.coefficient46_346, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_348, Icur := OriginalRow227TriangleData0678.coefficient45_347,
    output := OriginalRow227TriangleData0691.coefficient46_347, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_349, Icur := OriginalRow227TriangleData0678.coefficient45_348,
    output := OriginalRow227TriangleData0691.coefficient46_348, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_350, Icur := OriginalRow227TriangleData0678.coefficient45_349,
    output := OriginalRow227TriangleData0691.coefficient46_349, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_351, Icur := OriginalRow227TriangleData0678.coefficient45_350,
    output := OriginalRow227TriangleData0691.coefficient46_350, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_352, Icur := OriginalRow227TriangleData0678.coefficient45_351,
    output := OriginalRow227TriangleData0691.coefficient46_351, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_353, Icur := OriginalRow227TriangleData0678.coefficient45_352,
    output := OriginalRow227TriangleData0691.coefficient46_352, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_354, Icur := OriginalRow227TriangleData0678.coefficient45_353,
    output := OriginalRow227TriangleData0691.coefficient46_353, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_355, Icur := OriginalRow227TriangleData0678.coefficient45_354,
    output := OriginalRow227TriangleData0691.coefficient46_354, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_356, Icur := OriginalRow227TriangleData0678.coefficient45_355,
    output := OriginalRow227TriangleData0691.coefficient46_355, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_357, Icur := OriginalRow227TriangleData0678.coefficient45_356,
    output := OriginalRow227TriangleData0691.coefficient46_356, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_358, Icur := OriginalRow227TriangleData0678.coefficient45_357,
    output := OriginalRow227TriangleData0691.coefficient46_357, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_359, Icur := OriginalRow227TriangleData0678.coefficient45_358,
    output := OriginalRow227TriangleData0691.coefficient46_358, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_360, Icur := OriginalRow227TriangleData0678.coefficient45_359,
    output := OriginalRow227TriangleData0691.coefficient46_359, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_361, Icur := OriginalRow227TriangleData0678.coefficient45_360,
    output := OriginalRow227TriangleData0691.coefficient46_360, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_362, Icur := OriginalRow227TriangleData0678.coefficient45_361,
    output := OriginalRow227TriangleData0691.coefficient46_361, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_363, Icur := OriginalRow227TriangleData0678.coefficient45_362,
    output := OriginalRow227TriangleData0691.coefficient46_362, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0679.coefficient45_364, Icur := OriginalRow227TriangleData0678.coefficient45_363,
    output := OriginalRow227TriangleData0691.coefficient46_363, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0679.coefficient45_365, Icur := OriginalRow227TriangleData0679.coefficient45_364,
    output := OriginalRow227TriangleData0691.coefficient46_364, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0675

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0675.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
