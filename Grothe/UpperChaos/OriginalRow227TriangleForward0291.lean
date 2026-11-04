import Grothe.UpperChaos.OriginalRow227TriangleData0292
import Grothe.UpperChaos.OriginalRow227TriangleData0293
import Grothe.UpperChaos.OriginalRow227TriangleData0307
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0291
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_339, Icur := OriginalRow227TriangleData0292.coefficient18_338,
    output := OriginalRow227TriangleData0307.coefficient19_338, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_340, Icur := OriginalRow227TriangleData0292.coefficient18_339,
    output := OriginalRow227TriangleData0307.coefficient19_339, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_341, Icur := OriginalRow227TriangleData0292.coefficient18_340,
    output := OriginalRow227TriangleData0307.coefficient19_340, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_342, Icur := OriginalRow227TriangleData0292.coefficient18_341,
    output := OriginalRow227TriangleData0307.coefficient19_341, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_343, Icur := OriginalRow227TriangleData0292.coefficient18_342,
    output := OriginalRow227TriangleData0307.coefficient19_342, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_344, Icur := OriginalRow227TriangleData0292.coefficient18_343,
    output := OriginalRow227TriangleData0307.coefficient19_343, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_345, Icur := OriginalRow227TriangleData0292.coefficient18_344,
    output := OriginalRow227TriangleData0307.coefficient19_344, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_346, Icur := OriginalRow227TriangleData0292.coefficient18_345,
    output := OriginalRow227TriangleData0307.coefficient19_345, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_347, Icur := OriginalRow227TriangleData0292.coefficient18_346,
    output := OriginalRow227TriangleData0307.coefficient19_346, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_348, Icur := OriginalRow227TriangleData0292.coefficient18_347,
    output := OriginalRow227TriangleData0307.coefficient19_347, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_349, Icur := OriginalRow227TriangleData0292.coefficient18_348,
    output := OriginalRow227TriangleData0307.coefficient19_348, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_350, Icur := OriginalRow227TriangleData0292.coefficient18_349,
    output := OriginalRow227TriangleData0307.coefficient19_349, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_351, Icur := OriginalRow227TriangleData0292.coefficient18_350,
    output := OriginalRow227TriangleData0307.coefficient19_350, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_352, Icur := OriginalRow227TriangleData0292.coefficient18_351,
    output := OriginalRow227TriangleData0307.coefficient19_351, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_353, Icur := OriginalRow227TriangleData0292.coefficient18_352,
    output := OriginalRow227TriangleData0307.coefficient19_352, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_354, Icur := OriginalRow227TriangleData0292.coefficient18_353,
    output := OriginalRow227TriangleData0307.coefficient19_353, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_355, Icur := OriginalRow227TriangleData0292.coefficient18_354,
    output := OriginalRow227TriangleData0307.coefficient19_354, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_356, Icur := OriginalRow227TriangleData0292.coefficient18_355,
    output := OriginalRow227TriangleData0307.coefficient19_355, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_357, Icur := OriginalRow227TriangleData0292.coefficient18_356,
    output := OriginalRow227TriangleData0307.coefficient19_356, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_358, Icur := OriginalRow227TriangleData0292.coefficient18_357,
    output := OriginalRow227TriangleData0307.coefficient19_357, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_359, Icur := OriginalRow227TriangleData0292.coefficient18_358,
    output := OriginalRow227TriangleData0307.coefficient19_358, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_360, Icur := OriginalRow227TriangleData0292.coefficient18_359,
    output := OriginalRow227TriangleData0307.coefficient19_359, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_361, Icur := OriginalRow227TriangleData0292.coefficient18_360,
    output := OriginalRow227TriangleData0307.coefficient19_360, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_362, Icur := OriginalRow227TriangleData0292.coefficient18_361,
    output := OriginalRow227TriangleData0307.coefficient19_361, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_363, Icur := OriginalRow227TriangleData0292.coefficient18_362,
    output := OriginalRow227TriangleData0307.coefficient19_362, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_364, Icur := OriginalRow227TriangleData0292.coefficient18_363,
    output := OriginalRow227TriangleData0307.coefficient19_363, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_365, Icur := OriginalRow227TriangleData0292.coefficient18_364,
    output := OriginalRow227TriangleData0307.coefficient19_364, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_366, Icur := OriginalRow227TriangleData0292.coefficient18_365,
    output := OriginalRow227TriangleData0307.coefficient19_365, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_367, Icur := OriginalRow227TriangleData0292.coefficient18_366,
    output := OriginalRow227TriangleData0307.coefficient19_366, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_368, Icur := OriginalRow227TriangleData0292.coefficient18_367,
    output := OriginalRow227TriangleData0307.coefficient19_367, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0293.coefficient18_369, Icur := OriginalRow227TriangleData0292.coefficient18_368,
    output := OriginalRow227TriangleData0307.coefficient19_368, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0293.coefficient18_370, Icur := OriginalRow227TriangleData0293.coefficient18_369,
    output := OriginalRow227TriangleData0307.coefficient19_369, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0291

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0291.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
