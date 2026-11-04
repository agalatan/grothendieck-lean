import Grothe.UpperChaos.OriginalRow227TriangleData0042
import Grothe.UpperChaos.OriginalRow227TriangleData0043
import Grothe.UpperChaos.OriginalRow227TriangleData0058
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0042
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_323, Icur := OriginalRow227TriangleData0042.coefficient2_322,
    output := OriginalRow227TriangleData0058.coefficient3_322, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_324, Icur := OriginalRow227TriangleData0042.coefficient2_323,
    output := OriginalRow227TriangleData0058.coefficient3_323, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_325, Icur := OriginalRow227TriangleData0042.coefficient2_324,
    output := OriginalRow227TriangleData0058.coefficient3_324, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_326, Icur := OriginalRow227TriangleData0042.coefficient2_325,
    output := OriginalRow227TriangleData0058.coefficient3_325, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_327, Icur := OriginalRow227TriangleData0042.coefficient2_326,
    output := OriginalRow227TriangleData0058.coefficient3_326, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_328, Icur := OriginalRow227TriangleData0042.coefficient2_327,
    output := OriginalRow227TriangleData0058.coefficient3_327, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_329, Icur := OriginalRow227TriangleData0042.coefficient2_328,
    output := OriginalRow227TriangleData0058.coefficient3_328, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_330, Icur := OriginalRow227TriangleData0042.coefficient2_329,
    output := OriginalRow227TriangleData0058.coefficient3_329, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_331, Icur := OriginalRow227TriangleData0042.coefficient2_330,
    output := OriginalRow227TriangleData0058.coefficient3_330, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_332, Icur := OriginalRow227TriangleData0042.coefficient2_331,
    output := OriginalRow227TriangleData0058.coefficient3_331, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_333, Icur := OriginalRow227TriangleData0042.coefficient2_332,
    output := OriginalRow227TriangleData0058.coefficient3_332, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_334, Icur := OriginalRow227TriangleData0042.coefficient2_333,
    output := OriginalRow227TriangleData0058.coefficient3_333, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_335, Icur := OriginalRow227TriangleData0042.coefficient2_334,
    output := OriginalRow227TriangleData0058.coefficient3_334, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_336, Icur := OriginalRow227TriangleData0042.coefficient2_335,
    output := OriginalRow227TriangleData0058.coefficient3_335, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_337, Icur := OriginalRow227TriangleData0042.coefficient2_336,
    output := OriginalRow227TriangleData0058.coefficient3_336, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_338, Icur := OriginalRow227TriangleData0042.coefficient2_337,
    output := OriginalRow227TriangleData0058.coefficient3_337, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_339, Icur := OriginalRow227TriangleData0042.coefficient2_338,
    output := OriginalRow227TriangleData0058.coefficient3_338, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_340, Icur := OriginalRow227TriangleData0042.coefficient2_339,
    output := OriginalRow227TriangleData0058.coefficient3_339, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_341, Icur := OriginalRow227TriangleData0042.coefficient2_340,
    output := OriginalRow227TriangleData0058.coefficient3_340, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_342, Icur := OriginalRow227TriangleData0042.coefficient2_341,
    output := OriginalRow227TriangleData0058.coefficient3_341, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_343, Icur := OriginalRow227TriangleData0042.coefficient2_342,
    output := OriginalRow227TriangleData0058.coefficient3_342, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_344, Icur := OriginalRow227TriangleData0042.coefficient2_343,
    output := OriginalRow227TriangleData0058.coefficient3_343, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_345, Icur := OriginalRow227TriangleData0042.coefficient2_344,
    output := OriginalRow227TriangleData0058.coefficient3_344, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_346, Icur := OriginalRow227TriangleData0042.coefficient2_345,
    output := OriginalRow227TriangleData0058.coefficient3_345, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_347, Icur := OriginalRow227TriangleData0042.coefficient2_346,
    output := OriginalRow227TriangleData0058.coefficient3_346, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_348, Icur := OriginalRow227TriangleData0042.coefficient2_347,
    output := OriginalRow227TriangleData0058.coefficient3_347, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_349, Icur := OriginalRow227TriangleData0042.coefficient2_348,
    output := OriginalRow227TriangleData0058.coefficient3_348, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_350, Icur := OriginalRow227TriangleData0042.coefficient2_349,
    output := OriginalRow227TriangleData0058.coefficient3_349, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_351, Icur := OriginalRow227TriangleData0042.coefficient2_350,
    output := OriginalRow227TriangleData0058.coefficient3_350, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0042.coefficient2_352, Icur := OriginalRow227TriangleData0042.coefficient2_351,
    output := OriginalRow227TriangleData0058.coefficient3_351, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0043.coefficient2_353, Icur := OriginalRow227TriangleData0042.coefficient2_352,
    output := OriginalRow227TriangleData0058.coefficient3_352, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0043.coefficient2_354, Icur := OriginalRow227TriangleData0043.coefficient2_353,
    output := OriginalRow227TriangleData0058.coefficient3_353, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0042

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0042.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
