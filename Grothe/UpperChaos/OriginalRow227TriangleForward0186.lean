import Grothe.UpperChaos.OriginalRow227TriangleData0186
import Grothe.UpperChaos.OriginalRow227TriangleData0187
import Grothe.UpperChaos.OriginalRow227TriangleData0202
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0186
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_332, Icur := OriginalRow227TriangleData0186.coefficient11_331,
    output := OriginalRow227TriangleData0202.coefficient12_331, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_333, Icur := OriginalRow227TriangleData0186.coefficient11_332,
    output := OriginalRow227TriangleData0202.coefficient12_332, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_334, Icur := OriginalRow227TriangleData0186.coefficient11_333,
    output := OriginalRow227TriangleData0202.coefficient12_333, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_335, Icur := OriginalRow227TriangleData0186.coefficient11_334,
    output := OriginalRow227TriangleData0202.coefficient12_334, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_336, Icur := OriginalRow227TriangleData0186.coefficient11_335,
    output := OriginalRow227TriangleData0202.coefficient12_335, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_337, Icur := OriginalRow227TriangleData0186.coefficient11_336,
    output := OriginalRow227TriangleData0202.coefficient12_336, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_338, Icur := OriginalRow227TriangleData0186.coefficient11_337,
    output := OriginalRow227TriangleData0202.coefficient12_337, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_339, Icur := OriginalRow227TriangleData0186.coefficient11_338,
    output := OriginalRow227TriangleData0202.coefficient12_338, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_340, Icur := OriginalRow227TriangleData0186.coefficient11_339,
    output := OriginalRow227TriangleData0202.coefficient12_339, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_341, Icur := OriginalRow227TriangleData0186.coefficient11_340,
    output := OriginalRow227TriangleData0202.coefficient12_340, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_342, Icur := OriginalRow227TriangleData0186.coefficient11_341,
    output := OriginalRow227TriangleData0202.coefficient12_341, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_343, Icur := OriginalRow227TriangleData0186.coefficient11_342,
    output := OriginalRow227TriangleData0202.coefficient12_342, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_344, Icur := OriginalRow227TriangleData0186.coefficient11_343,
    output := OriginalRow227TriangleData0202.coefficient12_343, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_345, Icur := OriginalRow227TriangleData0186.coefficient11_344,
    output := OriginalRow227TriangleData0202.coefficient12_344, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_346, Icur := OriginalRow227TriangleData0186.coefficient11_345,
    output := OriginalRow227TriangleData0202.coefficient12_345, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_347, Icur := OriginalRow227TriangleData0186.coefficient11_346,
    output := OriginalRow227TriangleData0202.coefficient12_346, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_348, Icur := OriginalRow227TriangleData0186.coefficient11_347,
    output := OriginalRow227TriangleData0202.coefficient12_347, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_349, Icur := OriginalRow227TriangleData0186.coefficient11_348,
    output := OriginalRow227TriangleData0202.coefficient12_348, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_350, Icur := OriginalRow227TriangleData0186.coefficient11_349,
    output := OriginalRow227TriangleData0202.coefficient12_349, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_351, Icur := OriginalRow227TriangleData0186.coefficient11_350,
    output := OriginalRow227TriangleData0202.coefficient12_350, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_352, Icur := OriginalRow227TriangleData0186.coefficient11_351,
    output := OriginalRow227TriangleData0202.coefficient12_351, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_353, Icur := OriginalRow227TriangleData0186.coefficient11_352,
    output := OriginalRow227TriangleData0202.coefficient12_352, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_354, Icur := OriginalRow227TriangleData0186.coefficient11_353,
    output := OriginalRow227TriangleData0202.coefficient12_353, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_355, Icur := OriginalRow227TriangleData0186.coefficient11_354,
    output := OriginalRow227TriangleData0202.coefficient12_354, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_356, Icur := OriginalRow227TriangleData0186.coefficient11_355,
    output := OriginalRow227TriangleData0202.coefficient12_355, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_357, Icur := OriginalRow227TriangleData0186.coefficient11_356,
    output := OriginalRow227TriangleData0202.coefficient12_356, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_358, Icur := OriginalRow227TriangleData0186.coefficient11_357,
    output := OriginalRow227TriangleData0202.coefficient12_357, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_359, Icur := OriginalRow227TriangleData0186.coefficient11_358,
    output := OriginalRow227TriangleData0202.coefficient12_358, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_360, Icur := OriginalRow227TriangleData0186.coefficient11_359,
    output := OriginalRow227TriangleData0202.coefficient12_359, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0186.coefficient11_361, Icur := OriginalRow227TriangleData0186.coefficient11_360,
    output := OriginalRow227TriangleData0202.coefficient12_360, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0187.coefficient11_362, Icur := OriginalRow227TriangleData0186.coefficient11_361,
    output := OriginalRow227TriangleData0202.coefficient12_361, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0187.coefficient11_363, Icur := OriginalRow227TriangleData0187.coefficient11_362,
    output := OriginalRow227TriangleData0202.coefficient12_362, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0186

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0186.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
