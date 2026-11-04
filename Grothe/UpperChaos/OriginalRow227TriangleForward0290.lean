import Grothe.UpperChaos.OriginalRow227TriangleData0291
import Grothe.UpperChaos.OriginalRow227TriangleData0292
import Grothe.UpperChaos.OriginalRow227TriangleData0306
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0290
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_307, Icur := OriginalRow227TriangleData0291.coefficient18_306,
    output := OriginalRow227TriangleData0306.coefficient19_306, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_308, Icur := OriginalRow227TriangleData0291.coefficient18_307,
    output := OriginalRow227TriangleData0306.coefficient19_307, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_309, Icur := OriginalRow227TriangleData0291.coefficient18_308,
    output := OriginalRow227TriangleData0306.coefficient19_308, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_310, Icur := OriginalRow227TriangleData0291.coefficient18_309,
    output := OriginalRow227TriangleData0306.coefficient19_309, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_311, Icur := OriginalRow227TriangleData0291.coefficient18_310,
    output := OriginalRow227TriangleData0306.coefficient19_310, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_312, Icur := OriginalRow227TriangleData0291.coefficient18_311,
    output := OriginalRow227TriangleData0306.coefficient19_311, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_313, Icur := OriginalRow227TriangleData0291.coefficient18_312,
    output := OriginalRow227TriangleData0306.coefficient19_312, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_314, Icur := OriginalRow227TriangleData0291.coefficient18_313,
    output := OriginalRow227TriangleData0306.coefficient19_313, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_315, Icur := OriginalRow227TriangleData0291.coefficient18_314,
    output := OriginalRow227TriangleData0306.coefficient19_314, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_316, Icur := OriginalRow227TriangleData0291.coefficient18_315,
    output := OriginalRow227TriangleData0306.coefficient19_315, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_317, Icur := OriginalRow227TriangleData0291.coefficient18_316,
    output := OriginalRow227TriangleData0306.coefficient19_316, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_318, Icur := OriginalRow227TriangleData0291.coefficient18_317,
    output := OriginalRow227TriangleData0306.coefficient19_317, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_319, Icur := OriginalRow227TriangleData0291.coefficient18_318,
    output := OriginalRow227TriangleData0306.coefficient19_318, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_320, Icur := OriginalRow227TriangleData0291.coefficient18_319,
    output := OriginalRow227TriangleData0306.coefficient19_319, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_321, Icur := OriginalRow227TriangleData0291.coefficient18_320,
    output := OriginalRow227TriangleData0306.coefficient19_320, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_322, Icur := OriginalRow227TriangleData0291.coefficient18_321,
    output := OriginalRow227TriangleData0306.coefficient19_321, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_323, Icur := OriginalRow227TriangleData0291.coefficient18_322,
    output := OriginalRow227TriangleData0306.coefficient19_322, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_324, Icur := OriginalRow227TriangleData0291.coefficient18_323,
    output := OriginalRow227TriangleData0306.coefficient19_323, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_325, Icur := OriginalRow227TriangleData0291.coefficient18_324,
    output := OriginalRow227TriangleData0306.coefficient19_324, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_326, Icur := OriginalRow227TriangleData0291.coefficient18_325,
    output := OriginalRow227TriangleData0306.coefficient19_325, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_327, Icur := OriginalRow227TriangleData0291.coefficient18_326,
    output := OriginalRow227TriangleData0306.coefficient19_326, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_328, Icur := OriginalRow227TriangleData0291.coefficient18_327,
    output := OriginalRow227TriangleData0306.coefficient19_327, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_329, Icur := OriginalRow227TriangleData0291.coefficient18_328,
    output := OriginalRow227TriangleData0306.coefficient19_328, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_330, Icur := OriginalRow227TriangleData0291.coefficient18_329,
    output := OriginalRow227TriangleData0306.coefficient19_329, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_331, Icur := OriginalRow227TriangleData0291.coefficient18_330,
    output := OriginalRow227TriangleData0306.coefficient19_330, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_332, Icur := OriginalRow227TriangleData0291.coefficient18_331,
    output := OriginalRow227TriangleData0306.coefficient19_331, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_333, Icur := OriginalRow227TriangleData0291.coefficient18_332,
    output := OriginalRow227TriangleData0306.coefficient19_332, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_334, Icur := OriginalRow227TriangleData0291.coefficient18_333,
    output := OriginalRow227TriangleData0306.coefficient19_333, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_335, Icur := OriginalRow227TriangleData0291.coefficient18_334,
    output := OriginalRow227TriangleData0306.coefficient19_334, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0291.coefficient18_336, Icur := OriginalRow227TriangleData0291.coefficient18_335,
    output := OriginalRow227TriangleData0306.coefficient19_335, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_337, Icur := OriginalRow227TriangleData0291.coefficient18_336,
    output := OriginalRow227TriangleData0306.coefficient19_336, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0292.coefficient18_338, Icur := OriginalRow227TriangleData0292.coefficient18_337,
    output := OriginalRow227TriangleData0306.coefficient19_337, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0290

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0290.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
