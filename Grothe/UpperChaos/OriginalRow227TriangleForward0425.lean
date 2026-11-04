import Grothe.UpperChaos.OriginalRow227TriangleData0426
import Grothe.UpperChaos.OriginalRow227TriangleData0427
import Grothe.UpperChaos.OriginalRow227TriangleData0441
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0425
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_316, Icur := OriginalRow227TriangleData0426.coefficient27_315,
    output := OriginalRow227TriangleData0441.coefficient28_315, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_317, Icur := OriginalRow227TriangleData0426.coefficient27_316,
    output := OriginalRow227TriangleData0441.coefficient28_316, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_318, Icur := OriginalRow227TriangleData0426.coefficient27_317,
    output := OriginalRow227TriangleData0441.coefficient28_317, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_319, Icur := OriginalRow227TriangleData0426.coefficient27_318,
    output := OriginalRow227TriangleData0441.coefficient28_318, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_320, Icur := OriginalRow227TriangleData0426.coefficient27_319,
    output := OriginalRow227TriangleData0441.coefficient28_319, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_321, Icur := OriginalRow227TriangleData0426.coefficient27_320,
    output := OriginalRow227TriangleData0441.coefficient28_320, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_322, Icur := OriginalRow227TriangleData0426.coefficient27_321,
    output := OriginalRow227TriangleData0441.coefficient28_321, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_323, Icur := OriginalRow227TriangleData0426.coefficient27_322,
    output := OriginalRow227TriangleData0441.coefficient28_322, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_324, Icur := OriginalRow227TriangleData0426.coefficient27_323,
    output := OriginalRow227TriangleData0441.coefficient28_323, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_325, Icur := OriginalRow227TriangleData0426.coefficient27_324,
    output := OriginalRow227TriangleData0441.coefficient28_324, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_326, Icur := OriginalRow227TriangleData0426.coefficient27_325,
    output := OriginalRow227TriangleData0441.coefficient28_325, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_327, Icur := OriginalRow227TriangleData0426.coefficient27_326,
    output := OriginalRow227TriangleData0441.coefficient28_326, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_328, Icur := OriginalRow227TriangleData0426.coefficient27_327,
    output := OriginalRow227TriangleData0441.coefficient28_327, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_329, Icur := OriginalRow227TriangleData0426.coefficient27_328,
    output := OriginalRow227TriangleData0441.coefficient28_328, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_330, Icur := OriginalRow227TriangleData0426.coefficient27_329,
    output := OriginalRow227TriangleData0441.coefficient28_329, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_331, Icur := OriginalRow227TriangleData0426.coefficient27_330,
    output := OriginalRow227TriangleData0441.coefficient28_330, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_332, Icur := OriginalRow227TriangleData0426.coefficient27_331,
    output := OriginalRow227TriangleData0441.coefficient28_331, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_333, Icur := OriginalRow227TriangleData0426.coefficient27_332,
    output := OriginalRow227TriangleData0441.coefficient28_332, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_334, Icur := OriginalRow227TriangleData0426.coefficient27_333,
    output := OriginalRow227TriangleData0441.coefficient28_333, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_335, Icur := OriginalRow227TriangleData0426.coefficient27_334,
    output := OriginalRow227TriangleData0441.coefficient28_334, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_336, Icur := OriginalRow227TriangleData0426.coefficient27_335,
    output := OriginalRow227TriangleData0441.coefficient28_335, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_337, Icur := OriginalRow227TriangleData0426.coefficient27_336,
    output := OriginalRow227TriangleData0441.coefficient28_336, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_338, Icur := OriginalRow227TriangleData0426.coefficient27_337,
    output := OriginalRow227TriangleData0441.coefficient28_337, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_339, Icur := OriginalRow227TriangleData0426.coefficient27_338,
    output := OriginalRow227TriangleData0441.coefficient28_338, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_340, Icur := OriginalRow227TriangleData0426.coefficient27_339,
    output := OriginalRow227TriangleData0441.coefficient28_339, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_341, Icur := OriginalRow227TriangleData0426.coefficient27_340,
    output := OriginalRow227TriangleData0441.coefficient28_340, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_342, Icur := OriginalRow227TriangleData0426.coefficient27_341,
    output := OriginalRow227TriangleData0441.coefficient28_341, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_343, Icur := OriginalRow227TriangleData0426.coefficient27_342,
    output := OriginalRow227TriangleData0441.coefficient28_342, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_344, Icur := OriginalRow227TriangleData0426.coefficient27_343,
    output := OriginalRow227TriangleData0441.coefficient28_343, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_345, Icur := OriginalRow227TriangleData0426.coefficient27_344,
    output := OriginalRow227TriangleData0441.coefficient28_344, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_346, Icur := OriginalRow227TriangleData0426.coefficient27_345,
    output := OriginalRow227TriangleData0441.coefficient28_345, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0427.coefficient27_347, Icur := OriginalRow227TriangleData0427.coefficient27_346,
    output := OriginalRow227TriangleData0441.coefficient28_346, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0425

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0425.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
