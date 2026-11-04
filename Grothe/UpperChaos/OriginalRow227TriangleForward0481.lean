import Grothe.UpperChaos.OriginalRow227TriangleData0483
import Grothe.UpperChaos.OriginalRow227TriangleData0484
import Grothe.UpperChaos.OriginalRow227TriangleData0497
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0481
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_320, Icur := OriginalRow227TriangleData0483.coefficient31_319,
    output := OriginalRow227TriangleData0497.coefficient32_319, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_321, Icur := OriginalRow227TriangleData0483.coefficient31_320,
    output := OriginalRow227TriangleData0497.coefficient32_320, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_322, Icur := OriginalRow227TriangleData0483.coefficient31_321,
    output := OriginalRow227TriangleData0497.coefficient32_321, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_323, Icur := OriginalRow227TriangleData0483.coefficient31_322,
    output := OriginalRow227TriangleData0497.coefficient32_322, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_324, Icur := OriginalRow227TriangleData0483.coefficient31_323,
    output := OriginalRow227TriangleData0497.coefficient32_323, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_325, Icur := OriginalRow227TriangleData0483.coefficient31_324,
    output := OriginalRow227TriangleData0497.coefficient32_324, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_326, Icur := OriginalRow227TriangleData0483.coefficient31_325,
    output := OriginalRow227TriangleData0497.coefficient32_325, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_327, Icur := OriginalRow227TriangleData0483.coefficient31_326,
    output := OriginalRow227TriangleData0497.coefficient32_326, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_328, Icur := OriginalRow227TriangleData0483.coefficient31_327,
    output := OriginalRow227TriangleData0497.coefficient32_327, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_329, Icur := OriginalRow227TriangleData0483.coefficient31_328,
    output := OriginalRow227TriangleData0497.coefficient32_328, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_330, Icur := OriginalRow227TriangleData0483.coefficient31_329,
    output := OriginalRow227TriangleData0497.coefficient32_329, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_331, Icur := OriginalRow227TriangleData0483.coefficient31_330,
    output := OriginalRow227TriangleData0497.coefficient32_330, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_332, Icur := OriginalRow227TriangleData0483.coefficient31_331,
    output := OriginalRow227TriangleData0497.coefficient32_331, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_333, Icur := OriginalRow227TriangleData0483.coefficient31_332,
    output := OriginalRow227TriangleData0497.coefficient32_332, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_334, Icur := OriginalRow227TriangleData0483.coefficient31_333,
    output := OriginalRow227TriangleData0497.coefficient32_333, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_335, Icur := OriginalRow227TriangleData0483.coefficient31_334,
    output := OriginalRow227TriangleData0497.coefficient32_334, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_336, Icur := OriginalRow227TriangleData0483.coefficient31_335,
    output := OriginalRow227TriangleData0497.coefficient32_335, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_337, Icur := OriginalRow227TriangleData0483.coefficient31_336,
    output := OriginalRow227TriangleData0497.coefficient32_336, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_338, Icur := OriginalRow227TriangleData0483.coefficient31_337,
    output := OriginalRow227TriangleData0497.coefficient32_337, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_339, Icur := OriginalRow227TriangleData0483.coefficient31_338,
    output := OriginalRow227TriangleData0497.coefficient32_338, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_340, Icur := OriginalRow227TriangleData0483.coefficient31_339,
    output := OriginalRow227TriangleData0497.coefficient32_339, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_341, Icur := OriginalRow227TriangleData0483.coefficient31_340,
    output := OriginalRow227TriangleData0497.coefficient32_340, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_342, Icur := OriginalRow227TriangleData0483.coefficient31_341,
    output := OriginalRow227TriangleData0497.coefficient32_341, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_343, Icur := OriginalRow227TriangleData0483.coefficient31_342,
    output := OriginalRow227TriangleData0497.coefficient32_342, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_344, Icur := OriginalRow227TriangleData0483.coefficient31_343,
    output := OriginalRow227TriangleData0497.coefficient32_343, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_345, Icur := OriginalRow227TriangleData0483.coefficient31_344,
    output := OriginalRow227TriangleData0497.coefficient32_344, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_346, Icur := OriginalRow227TriangleData0483.coefficient31_345,
    output := OriginalRow227TriangleData0497.coefficient32_345, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_347, Icur := OriginalRow227TriangleData0483.coefficient31_346,
    output := OriginalRow227TriangleData0497.coefficient32_346, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_348, Icur := OriginalRow227TriangleData0483.coefficient31_347,
    output := OriginalRow227TriangleData0497.coefficient32_347, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0483.coefficient31_349, Icur := OriginalRow227TriangleData0483.coefficient31_348,
    output := OriginalRow227TriangleData0497.coefficient32_348, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_350, Icur := OriginalRow227TriangleData0483.coefficient31_349,
    output := OriginalRow227TriangleData0497.coefficient32_349, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0484.coefficient31_351, Icur := OriginalRow227TriangleData0484.coefficient31_350,
    output := OriginalRow227TriangleData0497.coefficient32_350, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0481

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0481.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
