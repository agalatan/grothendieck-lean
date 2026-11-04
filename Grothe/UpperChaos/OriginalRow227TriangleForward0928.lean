import Grothe.UpperChaos.OriginalRow227TriangleData0932
import Grothe.UpperChaos.OriginalRow227TriangleData0933
import Grothe.UpperChaos.OriginalRow227TriangleData0944
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0928
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_322, Icur := OriginalRow227TriangleData0932.coefficient65_321,
    output := OriginalRow227TriangleData0944.coefficient66_321, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_323, Icur := OriginalRow227TriangleData0932.coefficient65_322,
    output := OriginalRow227TriangleData0944.coefficient66_322, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_324, Icur := OriginalRow227TriangleData0932.coefficient65_323,
    output := OriginalRow227TriangleData0944.coefficient66_323, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_325, Icur := OriginalRow227TriangleData0932.coefficient65_324,
    output := OriginalRow227TriangleData0944.coefficient66_324, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_326, Icur := OriginalRow227TriangleData0932.coefficient65_325,
    output := OriginalRow227TriangleData0944.coefficient66_325, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_327, Icur := OriginalRow227TriangleData0932.coefficient65_326,
    output := OriginalRow227TriangleData0944.coefficient66_326, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_328, Icur := OriginalRow227TriangleData0932.coefficient65_327,
    output := OriginalRow227TriangleData0944.coefficient66_327, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_329, Icur := OriginalRow227TriangleData0932.coefficient65_328,
    output := OriginalRow227TriangleData0944.coefficient66_328, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_330, Icur := OriginalRow227TriangleData0932.coefficient65_329,
    output := OriginalRow227TriangleData0944.coefficient66_329, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_331, Icur := OriginalRow227TriangleData0932.coefficient65_330,
    output := OriginalRow227TriangleData0944.coefficient66_330, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_332, Icur := OriginalRow227TriangleData0932.coefficient65_331,
    output := OriginalRow227TriangleData0944.coefficient66_331, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_333, Icur := OriginalRow227TriangleData0932.coefficient65_332,
    output := OriginalRow227TriangleData0944.coefficient66_332, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_334, Icur := OriginalRow227TriangleData0932.coefficient65_333,
    output := OriginalRow227TriangleData0944.coefficient66_333, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_335, Icur := OriginalRow227TriangleData0932.coefficient65_334,
    output := OriginalRow227TriangleData0944.coefficient66_334, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_336, Icur := OriginalRow227TriangleData0932.coefficient65_335,
    output := OriginalRow227TriangleData0944.coefficient66_335, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_337, Icur := OriginalRow227TriangleData0932.coefficient65_336,
    output := OriginalRow227TriangleData0944.coefficient66_336, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_338, Icur := OriginalRow227TriangleData0932.coefficient65_337,
    output := OriginalRow227TriangleData0944.coefficient66_337, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_339, Icur := OriginalRow227TriangleData0932.coefficient65_338,
    output := OriginalRow227TriangleData0944.coefficient66_338, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_340, Icur := OriginalRow227TriangleData0932.coefficient65_339,
    output := OriginalRow227TriangleData0944.coefficient66_339, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_341, Icur := OriginalRow227TriangleData0932.coefficient65_340,
    output := OriginalRow227TriangleData0944.coefficient66_340, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_342, Icur := OriginalRow227TriangleData0932.coefficient65_341,
    output := OriginalRow227TriangleData0944.coefficient66_341, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_343, Icur := OriginalRow227TriangleData0932.coefficient65_342,
    output := OriginalRow227TriangleData0944.coefficient66_342, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_344, Icur := OriginalRow227TriangleData0932.coefficient65_343,
    output := OriginalRow227TriangleData0944.coefficient66_343, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_345, Icur := OriginalRow227TriangleData0932.coefficient65_344,
    output := OriginalRow227TriangleData0944.coefficient66_344, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_346, Icur := OriginalRow227TriangleData0932.coefficient65_345,
    output := OriginalRow227TriangleData0944.coefficient66_345, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_347, Icur := OriginalRow227TriangleData0932.coefficient65_346,
    output := OriginalRow227TriangleData0944.coefficient66_346, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_348, Icur := OriginalRow227TriangleData0932.coefficient65_347,
    output := OriginalRow227TriangleData0944.coefficient66_347, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_349, Icur := OriginalRow227TriangleData0932.coefficient65_348,
    output := OriginalRow227TriangleData0944.coefficient66_348, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_350, Icur := OriginalRow227TriangleData0932.coefficient65_349,
    output := OriginalRow227TriangleData0944.coefficient66_349, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_351, Icur := OriginalRow227TriangleData0932.coefficient65_350,
    output := OriginalRow227TriangleData0944.coefficient66_350, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_352, Icur := OriginalRow227TriangleData0932.coefficient65_351,
    output := OriginalRow227TriangleData0944.coefficient66_351, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_353, Icur := OriginalRow227TriangleData0933.coefficient65_352,
    output := OriginalRow227TriangleData0944.coefficient66_352, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0928

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0928.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
