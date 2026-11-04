import Grothe.UpperChaos.OriginalRow227TriangleData0469
import Grothe.UpperChaos.OriginalRow227TriangleData0470
import Grothe.UpperChaos.OriginalRow227TriangleData0483
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0467
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_319, Icur := OriginalRow227TriangleData0469.coefficient30_318,
    output := OriginalRow227TriangleData0483.coefficient31_318, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_320, Icur := OriginalRow227TriangleData0469.coefficient30_319,
    output := OriginalRow227TriangleData0483.coefficient31_319, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_321, Icur := OriginalRow227TriangleData0469.coefficient30_320,
    output := OriginalRow227TriangleData0483.coefficient31_320, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_322, Icur := OriginalRow227TriangleData0469.coefficient30_321,
    output := OriginalRow227TriangleData0483.coefficient31_321, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_323, Icur := OriginalRow227TriangleData0469.coefficient30_322,
    output := OriginalRow227TriangleData0483.coefficient31_322, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_324, Icur := OriginalRow227TriangleData0469.coefficient30_323,
    output := OriginalRow227TriangleData0483.coefficient31_323, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_325, Icur := OriginalRow227TriangleData0469.coefficient30_324,
    output := OriginalRow227TriangleData0483.coefficient31_324, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_326, Icur := OriginalRow227TriangleData0469.coefficient30_325,
    output := OriginalRow227TriangleData0483.coefficient31_325, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_327, Icur := OriginalRow227TriangleData0469.coefficient30_326,
    output := OriginalRow227TriangleData0483.coefficient31_326, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_328, Icur := OriginalRow227TriangleData0469.coefficient30_327,
    output := OriginalRow227TriangleData0483.coefficient31_327, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_329, Icur := OriginalRow227TriangleData0469.coefficient30_328,
    output := OriginalRow227TriangleData0483.coefficient31_328, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_330, Icur := OriginalRow227TriangleData0469.coefficient30_329,
    output := OriginalRow227TriangleData0483.coefficient31_329, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_331, Icur := OriginalRow227TriangleData0469.coefficient30_330,
    output := OriginalRow227TriangleData0483.coefficient31_330, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_332, Icur := OriginalRow227TriangleData0469.coefficient30_331,
    output := OriginalRow227TriangleData0483.coefficient31_331, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_333, Icur := OriginalRow227TriangleData0469.coefficient30_332,
    output := OriginalRow227TriangleData0483.coefficient31_332, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_334, Icur := OriginalRow227TriangleData0469.coefficient30_333,
    output := OriginalRow227TriangleData0483.coefficient31_333, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_335, Icur := OriginalRow227TriangleData0469.coefficient30_334,
    output := OriginalRow227TriangleData0483.coefficient31_334, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_336, Icur := OriginalRow227TriangleData0469.coefficient30_335,
    output := OriginalRow227TriangleData0483.coefficient31_335, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_337, Icur := OriginalRow227TriangleData0469.coefficient30_336,
    output := OriginalRow227TriangleData0483.coefficient31_336, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_338, Icur := OriginalRow227TriangleData0469.coefficient30_337,
    output := OriginalRow227TriangleData0483.coefficient31_337, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_339, Icur := OriginalRow227TriangleData0469.coefficient30_338,
    output := OriginalRow227TriangleData0483.coefficient31_338, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_340, Icur := OriginalRow227TriangleData0469.coefficient30_339,
    output := OriginalRow227TriangleData0483.coefficient31_339, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_341, Icur := OriginalRow227TriangleData0469.coefficient30_340,
    output := OriginalRow227TriangleData0483.coefficient31_340, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_342, Icur := OriginalRow227TriangleData0469.coefficient30_341,
    output := OriginalRow227TriangleData0483.coefficient31_341, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_343, Icur := OriginalRow227TriangleData0469.coefficient30_342,
    output := OriginalRow227TriangleData0483.coefficient31_342, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_344, Icur := OriginalRow227TriangleData0469.coefficient30_343,
    output := OriginalRow227TriangleData0483.coefficient31_343, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_345, Icur := OriginalRow227TriangleData0469.coefficient30_344,
    output := OriginalRow227TriangleData0483.coefficient31_344, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_346, Icur := OriginalRow227TriangleData0469.coefficient30_345,
    output := OriginalRow227TriangleData0483.coefficient31_345, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_347, Icur := OriginalRow227TriangleData0469.coefficient30_346,
    output := OriginalRow227TriangleData0483.coefficient31_346, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0469.coefficient30_348, Icur := OriginalRow227TriangleData0469.coefficient30_347,
    output := OriginalRow227TriangleData0483.coefficient31_347, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0470.coefficient30_349, Icur := OriginalRow227TriangleData0469.coefficient30_348,
    output := OriginalRow227TriangleData0483.coefficient31_348, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0470.coefficient30_350, Icur := OriginalRow227TriangleData0470.coefficient30_349,
    output := OriginalRow227TriangleData0483.coefficient31_349, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0467

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0467.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
