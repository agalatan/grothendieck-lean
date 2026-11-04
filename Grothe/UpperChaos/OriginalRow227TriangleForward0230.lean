import Grothe.UpperChaos.OriginalRow227TriangleData0231
import Grothe.UpperChaos.OriginalRow227TriangleData0232
import Grothe.UpperChaos.OriginalRow227TriangleData0246
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0230
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_303, Icur := OriginalRow227TriangleData0231.coefficient14_302,
    output := OriginalRow227TriangleData0246.coefficient15_302, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_304, Icur := OriginalRow227TriangleData0231.coefficient14_303,
    output := OriginalRow227TriangleData0246.coefficient15_303, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_305, Icur := OriginalRow227TriangleData0231.coefficient14_304,
    output := OriginalRow227TriangleData0246.coefficient15_304, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_306, Icur := OriginalRow227TriangleData0231.coefficient14_305,
    output := OriginalRow227TriangleData0246.coefficient15_305, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_307, Icur := OriginalRow227TriangleData0231.coefficient14_306,
    output := OriginalRow227TriangleData0246.coefficient15_306, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_308, Icur := OriginalRow227TriangleData0231.coefficient14_307,
    output := OriginalRow227TriangleData0246.coefficient15_307, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_309, Icur := OriginalRow227TriangleData0231.coefficient14_308,
    output := OriginalRow227TriangleData0246.coefficient15_308, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_310, Icur := OriginalRow227TriangleData0231.coefficient14_309,
    output := OriginalRow227TriangleData0246.coefficient15_309, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_311, Icur := OriginalRow227TriangleData0231.coefficient14_310,
    output := OriginalRow227TriangleData0246.coefficient15_310, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_312, Icur := OriginalRow227TriangleData0231.coefficient14_311,
    output := OriginalRow227TriangleData0246.coefficient15_311, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_313, Icur := OriginalRow227TriangleData0231.coefficient14_312,
    output := OriginalRow227TriangleData0246.coefficient15_312, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_314, Icur := OriginalRow227TriangleData0231.coefficient14_313,
    output := OriginalRow227TriangleData0246.coefficient15_313, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_315, Icur := OriginalRow227TriangleData0231.coefficient14_314,
    output := OriginalRow227TriangleData0246.coefficient15_314, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_316, Icur := OriginalRow227TriangleData0231.coefficient14_315,
    output := OriginalRow227TriangleData0246.coefficient15_315, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_317, Icur := OriginalRow227TriangleData0231.coefficient14_316,
    output := OriginalRow227TriangleData0246.coefficient15_316, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_318, Icur := OriginalRow227TriangleData0231.coefficient14_317,
    output := OriginalRow227TriangleData0246.coefficient15_317, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_319, Icur := OriginalRow227TriangleData0231.coefficient14_318,
    output := OriginalRow227TriangleData0246.coefficient15_318, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_320, Icur := OriginalRow227TriangleData0231.coefficient14_319,
    output := OriginalRow227TriangleData0246.coefficient15_319, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_321, Icur := OriginalRow227TriangleData0231.coefficient14_320,
    output := OriginalRow227TriangleData0246.coefficient15_320, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_322, Icur := OriginalRow227TriangleData0231.coefficient14_321,
    output := OriginalRow227TriangleData0246.coefficient15_321, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_323, Icur := OriginalRow227TriangleData0231.coefficient14_322,
    output := OriginalRow227TriangleData0246.coefficient15_322, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_324, Icur := OriginalRow227TriangleData0231.coefficient14_323,
    output := OriginalRow227TriangleData0246.coefficient15_323, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_325, Icur := OriginalRow227TriangleData0231.coefficient14_324,
    output := OriginalRow227TriangleData0246.coefficient15_324, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_326, Icur := OriginalRow227TriangleData0231.coefficient14_325,
    output := OriginalRow227TriangleData0246.coefficient15_325, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_327, Icur := OriginalRow227TriangleData0231.coefficient14_326,
    output := OriginalRow227TriangleData0246.coefficient15_326, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_328, Icur := OriginalRow227TriangleData0231.coefficient14_327,
    output := OriginalRow227TriangleData0246.coefficient15_327, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_329, Icur := OriginalRow227TriangleData0231.coefficient14_328,
    output := OriginalRow227TriangleData0246.coefficient15_328, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_330, Icur := OriginalRow227TriangleData0231.coefficient14_329,
    output := OriginalRow227TriangleData0246.coefficient15_329, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_331, Icur := OriginalRow227TriangleData0231.coefficient14_330,
    output := OriginalRow227TriangleData0246.coefficient15_330, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0231.coefficient14_332, Icur := OriginalRow227TriangleData0231.coefficient14_331,
    output := OriginalRow227TriangleData0246.coefficient15_331, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0232.coefficient14_333, Icur := OriginalRow227TriangleData0231.coefficient14_332,
    output := OriginalRow227TriangleData0246.coefficient15_332, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0232.coefficient14_334, Icur := OriginalRow227TriangleData0232.coefficient14_333,
    output := OriginalRow227TriangleData0246.coefficient15_333, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0230

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0230.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
