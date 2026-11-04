import Grothe.UpperChaos.OriginalRow227TriangleData0090
import Grothe.UpperChaos.OriginalRow227TriangleData0091
import Grothe.UpperChaos.OriginalRow227TriangleData0106
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0090
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_326, Icur := OriginalRow227TriangleData0090.coefficient5_325,
    output := OriginalRow227TriangleData0106.coefficient6_325, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_327, Icur := OriginalRow227TriangleData0090.coefficient5_326,
    output := OriginalRow227TriangleData0106.coefficient6_326, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_328, Icur := OriginalRow227TriangleData0090.coefficient5_327,
    output := OriginalRow227TriangleData0106.coefficient6_327, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_329, Icur := OriginalRow227TriangleData0090.coefficient5_328,
    output := OriginalRow227TriangleData0106.coefficient6_328, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_330, Icur := OriginalRow227TriangleData0090.coefficient5_329,
    output := OriginalRow227TriangleData0106.coefficient6_329, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_331, Icur := OriginalRow227TriangleData0090.coefficient5_330,
    output := OriginalRow227TriangleData0106.coefficient6_330, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_332, Icur := OriginalRow227TriangleData0090.coefficient5_331,
    output := OriginalRow227TriangleData0106.coefficient6_331, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_333, Icur := OriginalRow227TriangleData0090.coefficient5_332,
    output := OriginalRow227TriangleData0106.coefficient6_332, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_334, Icur := OriginalRow227TriangleData0090.coefficient5_333,
    output := OriginalRow227TriangleData0106.coefficient6_333, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_335, Icur := OriginalRow227TriangleData0090.coefficient5_334,
    output := OriginalRow227TriangleData0106.coefficient6_334, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_336, Icur := OriginalRow227TriangleData0090.coefficient5_335,
    output := OriginalRow227TriangleData0106.coefficient6_335, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_337, Icur := OriginalRow227TriangleData0090.coefficient5_336,
    output := OriginalRow227TriangleData0106.coefficient6_336, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_338, Icur := OriginalRow227TriangleData0090.coefficient5_337,
    output := OriginalRow227TriangleData0106.coefficient6_337, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_339, Icur := OriginalRow227TriangleData0090.coefficient5_338,
    output := OriginalRow227TriangleData0106.coefficient6_338, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_340, Icur := OriginalRow227TriangleData0090.coefficient5_339,
    output := OriginalRow227TriangleData0106.coefficient6_339, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_341, Icur := OriginalRow227TriangleData0090.coefficient5_340,
    output := OriginalRow227TriangleData0106.coefficient6_340, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_342, Icur := OriginalRow227TriangleData0090.coefficient5_341,
    output := OriginalRow227TriangleData0106.coefficient6_341, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_343, Icur := OriginalRow227TriangleData0090.coefficient5_342,
    output := OriginalRow227TriangleData0106.coefficient6_342, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_344, Icur := OriginalRow227TriangleData0090.coefficient5_343,
    output := OriginalRow227TriangleData0106.coefficient6_343, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_345, Icur := OriginalRow227TriangleData0090.coefficient5_344,
    output := OriginalRow227TriangleData0106.coefficient6_344, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_346, Icur := OriginalRow227TriangleData0090.coefficient5_345,
    output := OriginalRow227TriangleData0106.coefficient6_345, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_347, Icur := OriginalRow227TriangleData0090.coefficient5_346,
    output := OriginalRow227TriangleData0106.coefficient6_346, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_348, Icur := OriginalRow227TriangleData0090.coefficient5_347,
    output := OriginalRow227TriangleData0106.coefficient6_347, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_349, Icur := OriginalRow227TriangleData0090.coefficient5_348,
    output := OriginalRow227TriangleData0106.coefficient6_348, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_350, Icur := OriginalRow227TriangleData0090.coefficient5_349,
    output := OriginalRow227TriangleData0106.coefficient6_349, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_351, Icur := OriginalRow227TriangleData0090.coefficient5_350,
    output := OriginalRow227TriangleData0106.coefficient6_350, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_352, Icur := OriginalRow227TriangleData0090.coefficient5_351,
    output := OriginalRow227TriangleData0106.coefficient6_351, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_353, Icur := OriginalRow227TriangleData0090.coefficient5_352,
    output := OriginalRow227TriangleData0106.coefficient6_352, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_354, Icur := OriginalRow227TriangleData0090.coefficient5_353,
    output := OriginalRow227TriangleData0106.coefficient6_353, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0090.coefficient5_355, Icur := OriginalRow227TriangleData0090.coefficient5_354,
    output := OriginalRow227TriangleData0106.coefficient6_354, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_356, Icur := OriginalRow227TriangleData0090.coefficient5_355,
    output := OriginalRow227TriangleData0106.coefficient6_355, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0091.coefficient5_357, Icur := OriginalRow227TriangleData0091.coefficient5_356,
    output := OriginalRow227TriangleData0106.coefficient6_356, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0090

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0090.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
