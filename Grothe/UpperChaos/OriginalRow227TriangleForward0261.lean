import Grothe.UpperChaos.OriginalRow227TriangleData0262
import Grothe.UpperChaos.OriginalRow227TriangleData0263
import Grothe.UpperChaos.OriginalRow227TriangleData0277
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0261
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_337, Icur := OriginalRow227TriangleData0262.coefficient16_336,
    output := OriginalRow227TriangleData0277.coefficient17_336, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_338, Icur := OriginalRow227TriangleData0262.coefficient16_337,
    output := OriginalRow227TriangleData0277.coefficient17_337, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_339, Icur := OriginalRow227TriangleData0262.coefficient16_338,
    output := OriginalRow227TriangleData0277.coefficient17_338, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_340, Icur := OriginalRow227TriangleData0262.coefficient16_339,
    output := OriginalRow227TriangleData0277.coefficient17_339, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_341, Icur := OriginalRow227TriangleData0262.coefficient16_340,
    output := OriginalRow227TriangleData0277.coefficient17_340, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_342, Icur := OriginalRow227TriangleData0262.coefficient16_341,
    output := OriginalRow227TriangleData0277.coefficient17_341, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_343, Icur := OriginalRow227TriangleData0262.coefficient16_342,
    output := OriginalRow227TriangleData0277.coefficient17_342, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_344, Icur := OriginalRow227TriangleData0262.coefficient16_343,
    output := OriginalRow227TriangleData0277.coefficient17_343, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_345, Icur := OriginalRow227TriangleData0262.coefficient16_344,
    output := OriginalRow227TriangleData0277.coefficient17_344, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_346, Icur := OriginalRow227TriangleData0262.coefficient16_345,
    output := OriginalRow227TriangleData0277.coefficient17_345, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_347, Icur := OriginalRow227TriangleData0262.coefficient16_346,
    output := OriginalRow227TriangleData0277.coefficient17_346, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_348, Icur := OriginalRow227TriangleData0262.coefficient16_347,
    output := OriginalRow227TriangleData0277.coefficient17_347, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_349, Icur := OriginalRow227TriangleData0262.coefficient16_348,
    output := OriginalRow227TriangleData0277.coefficient17_348, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_350, Icur := OriginalRow227TriangleData0262.coefficient16_349,
    output := OriginalRow227TriangleData0277.coefficient17_349, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_351, Icur := OriginalRow227TriangleData0262.coefficient16_350,
    output := OriginalRow227TriangleData0277.coefficient17_350, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_352, Icur := OriginalRow227TriangleData0262.coefficient16_351,
    output := OriginalRow227TriangleData0277.coefficient17_351, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_353, Icur := OriginalRow227TriangleData0262.coefficient16_352,
    output := OriginalRow227TriangleData0277.coefficient17_352, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_354, Icur := OriginalRow227TriangleData0262.coefficient16_353,
    output := OriginalRow227TriangleData0277.coefficient17_353, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_355, Icur := OriginalRow227TriangleData0262.coefficient16_354,
    output := OriginalRow227TriangleData0277.coefficient17_354, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_356, Icur := OriginalRow227TriangleData0262.coefficient16_355,
    output := OriginalRow227TriangleData0277.coefficient17_355, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_357, Icur := OriginalRow227TriangleData0262.coefficient16_356,
    output := OriginalRow227TriangleData0277.coefficient17_356, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_358, Icur := OriginalRow227TriangleData0262.coefficient16_357,
    output := OriginalRow227TriangleData0277.coefficient17_357, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_359, Icur := OriginalRow227TriangleData0262.coefficient16_358,
    output := OriginalRow227TriangleData0277.coefficient17_358, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_360, Icur := OriginalRow227TriangleData0262.coefficient16_359,
    output := OriginalRow227TriangleData0277.coefficient17_359, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_361, Icur := OriginalRow227TriangleData0262.coefficient16_360,
    output := OriginalRow227TriangleData0277.coefficient17_360, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_362, Icur := OriginalRow227TriangleData0262.coefficient16_361,
    output := OriginalRow227TriangleData0277.coefficient17_361, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_363, Icur := OriginalRow227TriangleData0262.coefficient16_362,
    output := OriginalRow227TriangleData0277.coefficient17_362, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_364, Icur := OriginalRow227TriangleData0262.coefficient16_363,
    output := OriginalRow227TriangleData0277.coefficient17_363, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_365, Icur := OriginalRow227TriangleData0262.coefficient16_364,
    output := OriginalRow227TriangleData0277.coefficient17_364, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0262.coefficient16_366, Icur := OriginalRow227TriangleData0262.coefficient16_365,
    output := OriginalRow227TriangleData0277.coefficient17_365, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0263.coefficient16_367, Icur := OriginalRow227TriangleData0262.coefficient16_366,
    output := OriginalRow227TriangleData0277.coefficient17_366, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0263.coefficient16_368, Icur := OriginalRow227TriangleData0263.coefficient16_367,
    output := OriginalRow227TriangleData0277.coefficient17_367, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0261

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0261.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
