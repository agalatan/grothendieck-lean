import Grothe.UpperChaos.OriginalRow227TriangleData0321
import Grothe.UpperChaos.OriginalRow227TriangleData0322
import Grothe.UpperChaos.OriginalRow227TriangleData0336
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0320
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_309, Icur := OriginalRow227TriangleData0321.coefficient20_308,
    output := OriginalRow227TriangleData0336.coefficient21_308, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_310, Icur := OriginalRow227TriangleData0321.coefficient20_309,
    output := OriginalRow227TriangleData0336.coefficient21_309, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_311, Icur := OriginalRow227TriangleData0321.coefficient20_310,
    output := OriginalRow227TriangleData0336.coefficient21_310, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_312, Icur := OriginalRow227TriangleData0321.coefficient20_311,
    output := OriginalRow227TriangleData0336.coefficient21_311, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_313, Icur := OriginalRow227TriangleData0321.coefficient20_312,
    output := OriginalRow227TriangleData0336.coefficient21_312, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_314, Icur := OriginalRow227TriangleData0321.coefficient20_313,
    output := OriginalRow227TriangleData0336.coefficient21_313, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_315, Icur := OriginalRow227TriangleData0321.coefficient20_314,
    output := OriginalRow227TriangleData0336.coefficient21_314, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_316, Icur := OriginalRow227TriangleData0321.coefficient20_315,
    output := OriginalRow227TriangleData0336.coefficient21_315, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_317, Icur := OriginalRow227TriangleData0321.coefficient20_316,
    output := OriginalRow227TriangleData0336.coefficient21_316, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_318, Icur := OriginalRow227TriangleData0321.coefficient20_317,
    output := OriginalRow227TriangleData0336.coefficient21_317, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_319, Icur := OriginalRow227TriangleData0321.coefficient20_318,
    output := OriginalRow227TriangleData0336.coefficient21_318, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_320, Icur := OriginalRow227TriangleData0321.coefficient20_319,
    output := OriginalRow227TriangleData0336.coefficient21_319, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_321, Icur := OriginalRow227TriangleData0321.coefficient20_320,
    output := OriginalRow227TriangleData0336.coefficient21_320, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_322, Icur := OriginalRow227TriangleData0321.coefficient20_321,
    output := OriginalRow227TriangleData0336.coefficient21_321, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_323, Icur := OriginalRow227TriangleData0321.coefficient20_322,
    output := OriginalRow227TriangleData0336.coefficient21_322, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_324, Icur := OriginalRow227TriangleData0321.coefficient20_323,
    output := OriginalRow227TriangleData0336.coefficient21_323, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_325, Icur := OriginalRow227TriangleData0321.coefficient20_324,
    output := OriginalRow227TriangleData0336.coefficient21_324, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_326, Icur := OriginalRow227TriangleData0321.coefficient20_325,
    output := OriginalRow227TriangleData0336.coefficient21_325, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_327, Icur := OriginalRow227TriangleData0321.coefficient20_326,
    output := OriginalRow227TriangleData0336.coefficient21_326, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_328, Icur := OriginalRow227TriangleData0321.coefficient20_327,
    output := OriginalRow227TriangleData0336.coefficient21_327, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_329, Icur := OriginalRow227TriangleData0321.coefficient20_328,
    output := OriginalRow227TriangleData0336.coefficient21_328, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_330, Icur := OriginalRow227TriangleData0321.coefficient20_329,
    output := OriginalRow227TriangleData0336.coefficient21_329, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_331, Icur := OriginalRow227TriangleData0321.coefficient20_330,
    output := OriginalRow227TriangleData0336.coefficient21_330, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_332, Icur := OriginalRow227TriangleData0321.coefficient20_331,
    output := OriginalRow227TriangleData0336.coefficient21_331, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_333, Icur := OriginalRow227TriangleData0321.coefficient20_332,
    output := OriginalRow227TriangleData0336.coefficient21_332, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_334, Icur := OriginalRow227TriangleData0321.coefficient20_333,
    output := OriginalRow227TriangleData0336.coefficient21_333, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_335, Icur := OriginalRow227TriangleData0321.coefficient20_334,
    output := OriginalRow227TriangleData0336.coefficient21_334, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_336, Icur := OriginalRow227TriangleData0321.coefficient20_335,
    output := OriginalRow227TriangleData0336.coefficient21_335, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_337, Icur := OriginalRow227TriangleData0321.coefficient20_336,
    output := OriginalRow227TriangleData0336.coefficient21_336, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0321.coefficient20_338, Icur := OriginalRow227TriangleData0321.coefficient20_337,
    output := OriginalRow227TriangleData0336.coefficient21_337, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0322.coefficient20_339, Icur := OriginalRow227TriangleData0321.coefficient20_338,
    output := OriginalRow227TriangleData0336.coefficient21_338, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0322.coefficient20_340, Icur := OriginalRow227TriangleData0322.coefficient20_339,
    output := OriginalRow227TriangleData0336.coefficient21_339, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0320

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0320.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
