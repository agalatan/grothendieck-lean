import Grothe.UpperChaos.OriginalRow227TriangleData0455
import Grothe.UpperChaos.OriginalRow227TriangleData0456
import Grothe.UpperChaos.OriginalRow227TriangleData0469
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0453
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_318, Icur := OriginalRow227TriangleData0455.coefficient29_317,
    output := OriginalRow227TriangleData0469.coefficient30_317, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_319, Icur := OriginalRow227TriangleData0455.coefficient29_318,
    output := OriginalRow227TriangleData0469.coefficient30_318, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_320, Icur := OriginalRow227TriangleData0455.coefficient29_319,
    output := OriginalRow227TriangleData0469.coefficient30_319, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_321, Icur := OriginalRow227TriangleData0455.coefficient29_320,
    output := OriginalRow227TriangleData0469.coefficient30_320, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_322, Icur := OriginalRow227TriangleData0455.coefficient29_321,
    output := OriginalRow227TriangleData0469.coefficient30_321, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_323, Icur := OriginalRow227TriangleData0455.coefficient29_322,
    output := OriginalRow227TriangleData0469.coefficient30_322, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_324, Icur := OriginalRow227TriangleData0455.coefficient29_323,
    output := OriginalRow227TriangleData0469.coefficient30_323, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_325, Icur := OriginalRow227TriangleData0455.coefficient29_324,
    output := OriginalRow227TriangleData0469.coefficient30_324, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_326, Icur := OriginalRow227TriangleData0455.coefficient29_325,
    output := OriginalRow227TriangleData0469.coefficient30_325, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_327, Icur := OriginalRow227TriangleData0455.coefficient29_326,
    output := OriginalRow227TriangleData0469.coefficient30_326, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_328, Icur := OriginalRow227TriangleData0455.coefficient29_327,
    output := OriginalRow227TriangleData0469.coefficient30_327, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_329, Icur := OriginalRow227TriangleData0455.coefficient29_328,
    output := OriginalRow227TriangleData0469.coefficient30_328, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_330, Icur := OriginalRow227TriangleData0455.coefficient29_329,
    output := OriginalRow227TriangleData0469.coefficient30_329, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_331, Icur := OriginalRow227TriangleData0455.coefficient29_330,
    output := OriginalRow227TriangleData0469.coefficient30_330, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_332, Icur := OriginalRow227TriangleData0455.coefficient29_331,
    output := OriginalRow227TriangleData0469.coefficient30_331, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_333, Icur := OriginalRow227TriangleData0455.coefficient29_332,
    output := OriginalRow227TriangleData0469.coefficient30_332, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_334, Icur := OriginalRow227TriangleData0455.coefficient29_333,
    output := OriginalRow227TriangleData0469.coefficient30_333, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_335, Icur := OriginalRow227TriangleData0455.coefficient29_334,
    output := OriginalRow227TriangleData0469.coefficient30_334, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_336, Icur := OriginalRow227TriangleData0455.coefficient29_335,
    output := OriginalRow227TriangleData0469.coefficient30_335, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_337, Icur := OriginalRow227TriangleData0455.coefficient29_336,
    output := OriginalRow227TriangleData0469.coefficient30_336, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_338, Icur := OriginalRow227TriangleData0455.coefficient29_337,
    output := OriginalRow227TriangleData0469.coefficient30_337, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_339, Icur := OriginalRow227TriangleData0455.coefficient29_338,
    output := OriginalRow227TriangleData0469.coefficient30_338, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_340, Icur := OriginalRow227TriangleData0455.coefficient29_339,
    output := OriginalRow227TriangleData0469.coefficient30_339, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_341, Icur := OriginalRow227TriangleData0455.coefficient29_340,
    output := OriginalRow227TriangleData0469.coefficient30_340, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_342, Icur := OriginalRow227TriangleData0455.coefficient29_341,
    output := OriginalRow227TriangleData0469.coefficient30_341, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_343, Icur := OriginalRow227TriangleData0455.coefficient29_342,
    output := OriginalRow227TriangleData0469.coefficient30_342, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_344, Icur := OriginalRow227TriangleData0455.coefficient29_343,
    output := OriginalRow227TriangleData0469.coefficient30_343, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_345, Icur := OriginalRow227TriangleData0455.coefficient29_344,
    output := OriginalRow227TriangleData0469.coefficient30_344, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_346, Icur := OriginalRow227TriangleData0455.coefficient29_345,
    output := OriginalRow227TriangleData0469.coefficient30_345, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0455.coefficient29_347, Icur := OriginalRow227TriangleData0455.coefficient29_346,
    output := OriginalRow227TriangleData0469.coefficient30_346, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0456.coefficient29_348, Icur := OriginalRow227TriangleData0455.coefficient29_347,
    output := OriginalRow227TriangleData0469.coefficient30_347, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0456.coefficient29_349, Icur := OriginalRow227TriangleData0456.coefficient29_348,
    output := OriginalRow227TriangleData0469.coefficient30_348, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0453

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0453.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
