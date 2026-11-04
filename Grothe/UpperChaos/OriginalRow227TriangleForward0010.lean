import Grothe.UpperChaos.OriginalRow227TriangleData0010
import Grothe.UpperChaos.OriginalRow227TriangleData0011
import Grothe.UpperChaos.OriginalRow227TriangleData0026
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0010
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_321, Icur := OriginalRow227TriangleData0010.coefficient0_320,
    output := OriginalRow227TriangleData0026.coefficient1_320, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_322, Icur := OriginalRow227TriangleData0010.coefficient0_321,
    output := OriginalRow227TriangleData0026.coefficient1_321, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_323, Icur := OriginalRow227TriangleData0010.coefficient0_322,
    output := OriginalRow227TriangleData0026.coefficient1_322, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_324, Icur := OriginalRow227TriangleData0010.coefficient0_323,
    output := OriginalRow227TriangleData0026.coefficient1_323, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_325, Icur := OriginalRow227TriangleData0010.coefficient0_324,
    output := OriginalRow227TriangleData0026.coefficient1_324, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_326, Icur := OriginalRow227TriangleData0010.coefficient0_325,
    output := OriginalRow227TriangleData0026.coefficient1_325, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_327, Icur := OriginalRow227TriangleData0010.coefficient0_326,
    output := OriginalRow227TriangleData0026.coefficient1_326, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_328, Icur := OriginalRow227TriangleData0010.coefficient0_327,
    output := OriginalRow227TriangleData0026.coefficient1_327, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_329, Icur := OriginalRow227TriangleData0010.coefficient0_328,
    output := OriginalRow227TriangleData0026.coefficient1_328, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_330, Icur := OriginalRow227TriangleData0010.coefficient0_329,
    output := OriginalRow227TriangleData0026.coefficient1_329, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_331, Icur := OriginalRow227TriangleData0010.coefficient0_330,
    output := OriginalRow227TriangleData0026.coefficient1_330, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_332, Icur := OriginalRow227TriangleData0010.coefficient0_331,
    output := OriginalRow227TriangleData0026.coefficient1_331, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_333, Icur := OriginalRow227TriangleData0010.coefficient0_332,
    output := OriginalRow227TriangleData0026.coefficient1_332, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_334, Icur := OriginalRow227TriangleData0010.coefficient0_333,
    output := OriginalRow227TriangleData0026.coefficient1_333, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_335, Icur := OriginalRow227TriangleData0010.coefficient0_334,
    output := OriginalRow227TriangleData0026.coefficient1_334, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_336, Icur := OriginalRow227TriangleData0010.coefficient0_335,
    output := OriginalRow227TriangleData0026.coefficient1_335, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_337, Icur := OriginalRow227TriangleData0010.coefficient0_336,
    output := OriginalRow227TriangleData0026.coefficient1_336, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_338, Icur := OriginalRow227TriangleData0010.coefficient0_337,
    output := OriginalRow227TriangleData0026.coefficient1_337, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_339, Icur := OriginalRow227TriangleData0010.coefficient0_338,
    output := OriginalRow227TriangleData0026.coefficient1_338, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_340, Icur := OriginalRow227TriangleData0010.coefficient0_339,
    output := OriginalRow227TriangleData0026.coefficient1_339, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_341, Icur := OriginalRow227TriangleData0010.coefficient0_340,
    output := OriginalRow227TriangleData0026.coefficient1_340, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_342, Icur := OriginalRow227TriangleData0010.coefficient0_341,
    output := OriginalRow227TriangleData0026.coefficient1_341, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_343, Icur := OriginalRow227TriangleData0010.coefficient0_342,
    output := OriginalRow227TriangleData0026.coefficient1_342, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_344, Icur := OriginalRow227TriangleData0010.coefficient0_343,
    output := OriginalRow227TriangleData0026.coefficient1_343, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_345, Icur := OriginalRow227TriangleData0010.coefficient0_344,
    output := OriginalRow227TriangleData0026.coefficient1_344, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_346, Icur := OriginalRow227TriangleData0010.coefficient0_345,
    output := OriginalRow227TriangleData0026.coefficient1_345, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_347, Icur := OriginalRow227TriangleData0010.coefficient0_346,
    output := OriginalRow227TriangleData0026.coefficient1_346, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_348, Icur := OriginalRow227TriangleData0010.coefficient0_347,
    output := OriginalRow227TriangleData0026.coefficient1_347, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_349, Icur := OriginalRow227TriangleData0010.coefficient0_348,
    output := OriginalRow227TriangleData0026.coefficient1_348, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_350, Icur := OriginalRow227TriangleData0010.coefficient0_349,
    output := OriginalRow227TriangleData0026.coefficient1_349, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0010.coefficient0_351, Icur := OriginalRow227TriangleData0010.coefficient0_350,
    output := OriginalRow227TriangleData0026.coefficient1_350, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0011.coefficient0_352, Icur := OriginalRow227TriangleData0010.coefficient0_351,
    output := OriginalRow227TriangleData0026.coefficient1_351, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0010

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0010.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
