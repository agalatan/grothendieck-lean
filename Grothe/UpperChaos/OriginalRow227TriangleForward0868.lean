import Grothe.UpperChaos.OriginalRow227TriangleData0872
import Grothe.UpperChaos.OriginalRow227TriangleData0873
import Grothe.UpperChaos.OriginalRow227TriangleData0884
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0868
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_317, Icur := OriginalRow227TriangleData0872.coefficient60_316,
    output := OriginalRow227TriangleData0884.coefficient61_316, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_318, Icur := OriginalRow227TriangleData0872.coefficient60_317,
    output := OriginalRow227TriangleData0884.coefficient61_317, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_319, Icur := OriginalRow227TriangleData0872.coefficient60_318,
    output := OriginalRow227TriangleData0884.coefficient61_318, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_320, Icur := OriginalRow227TriangleData0872.coefficient60_319,
    output := OriginalRow227TriangleData0884.coefficient61_319, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_321, Icur := OriginalRow227TriangleData0872.coefficient60_320,
    output := OriginalRow227TriangleData0884.coefficient61_320, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_322, Icur := OriginalRow227TriangleData0872.coefficient60_321,
    output := OriginalRow227TriangleData0884.coefficient61_321, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_323, Icur := OriginalRow227TriangleData0872.coefficient60_322,
    output := OriginalRow227TriangleData0884.coefficient61_322, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_324, Icur := OriginalRow227TriangleData0872.coefficient60_323,
    output := OriginalRow227TriangleData0884.coefficient61_323, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_325, Icur := OriginalRow227TriangleData0872.coefficient60_324,
    output := OriginalRow227TriangleData0884.coefficient61_324, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_326, Icur := OriginalRow227TriangleData0872.coefficient60_325,
    output := OriginalRow227TriangleData0884.coefficient61_325, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_327, Icur := OriginalRow227TriangleData0872.coefficient60_326,
    output := OriginalRow227TriangleData0884.coefficient61_326, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_328, Icur := OriginalRow227TriangleData0872.coefficient60_327,
    output := OriginalRow227TriangleData0884.coefficient61_327, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_329, Icur := OriginalRow227TriangleData0872.coefficient60_328,
    output := OriginalRow227TriangleData0884.coefficient61_328, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_330, Icur := OriginalRow227TriangleData0872.coefficient60_329,
    output := OriginalRow227TriangleData0884.coefficient61_329, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_331, Icur := OriginalRow227TriangleData0872.coefficient60_330,
    output := OriginalRow227TriangleData0884.coefficient61_330, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_332, Icur := OriginalRow227TriangleData0872.coefficient60_331,
    output := OriginalRow227TriangleData0884.coefficient61_331, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_333, Icur := OriginalRow227TriangleData0872.coefficient60_332,
    output := OriginalRow227TriangleData0884.coefficient61_332, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_334, Icur := OriginalRow227TriangleData0872.coefficient60_333,
    output := OriginalRow227TriangleData0884.coefficient61_333, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_335, Icur := OriginalRow227TriangleData0872.coefficient60_334,
    output := OriginalRow227TriangleData0884.coefficient61_334, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_336, Icur := OriginalRow227TriangleData0872.coefficient60_335,
    output := OriginalRow227TriangleData0884.coefficient61_335, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_337, Icur := OriginalRow227TriangleData0872.coefficient60_336,
    output := OriginalRow227TriangleData0884.coefficient61_336, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_338, Icur := OriginalRow227TriangleData0872.coefficient60_337,
    output := OriginalRow227TriangleData0884.coefficient61_337, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_339, Icur := OriginalRow227TriangleData0872.coefficient60_338,
    output := OriginalRow227TriangleData0884.coefficient61_338, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_340, Icur := OriginalRow227TriangleData0872.coefficient60_339,
    output := OriginalRow227TriangleData0884.coefficient61_339, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_341, Icur := OriginalRow227TriangleData0872.coefficient60_340,
    output := OriginalRow227TriangleData0884.coefficient61_340, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_342, Icur := OriginalRow227TriangleData0872.coefficient60_341,
    output := OriginalRow227TriangleData0884.coefficient61_341, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_343, Icur := OriginalRow227TriangleData0872.coefficient60_342,
    output := OriginalRow227TriangleData0884.coefficient61_342, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_344, Icur := OriginalRow227TriangleData0872.coefficient60_343,
    output := OriginalRow227TriangleData0884.coefficient61_343, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_345, Icur := OriginalRow227TriangleData0872.coefficient60_344,
    output := OriginalRow227TriangleData0884.coefficient61_344, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0872.coefficient60_346, Icur := OriginalRow227TriangleData0872.coefficient60_345,
    output := OriginalRow227TriangleData0884.coefficient61_345, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0873.coefficient60_347, Icur := OriginalRow227TriangleData0872.coefficient60_346,
    output := OriginalRow227TriangleData0884.coefficient61_346, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0873.coefficient60_348, Icur := OriginalRow227TriangleData0873.coefficient60_347,
    output := OriginalRow227TriangleData0884.coefficient61_347, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0868

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0868.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
