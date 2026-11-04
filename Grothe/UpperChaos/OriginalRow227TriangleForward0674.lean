import Grothe.UpperChaos.OriginalRow227TriangleData0677
import Grothe.UpperChaos.OriginalRow227TriangleData0678
import Grothe.UpperChaos.OriginalRow227TriangleData0690
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0674
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_302, Icur := OriginalRow227TriangleData0677.coefficient45_301,
    output := OriginalRow227TriangleData0690.coefficient46_301, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_303, Icur := OriginalRow227TriangleData0677.coefficient45_302,
    output := OriginalRow227TriangleData0690.coefficient46_302, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_304, Icur := OriginalRow227TriangleData0677.coefficient45_303,
    output := OriginalRow227TriangleData0690.coefficient46_303, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_305, Icur := OriginalRow227TriangleData0677.coefficient45_304,
    output := OriginalRow227TriangleData0690.coefficient46_304, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_306, Icur := OriginalRow227TriangleData0677.coefficient45_305,
    output := OriginalRow227TriangleData0690.coefficient46_305, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_307, Icur := OriginalRow227TriangleData0677.coefficient45_306,
    output := OriginalRow227TriangleData0690.coefficient46_306, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_308, Icur := OriginalRow227TriangleData0677.coefficient45_307,
    output := OriginalRow227TriangleData0690.coefficient46_307, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_309, Icur := OriginalRow227TriangleData0677.coefficient45_308,
    output := OriginalRow227TriangleData0690.coefficient46_308, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_310, Icur := OriginalRow227TriangleData0677.coefficient45_309,
    output := OriginalRow227TriangleData0690.coefficient46_309, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_311, Icur := OriginalRow227TriangleData0677.coefficient45_310,
    output := OriginalRow227TriangleData0690.coefficient46_310, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_312, Icur := OriginalRow227TriangleData0677.coefficient45_311,
    output := OriginalRow227TriangleData0690.coefficient46_311, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_313, Icur := OriginalRow227TriangleData0677.coefficient45_312,
    output := OriginalRow227TriangleData0690.coefficient46_312, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_314, Icur := OriginalRow227TriangleData0677.coefficient45_313,
    output := OriginalRow227TriangleData0690.coefficient46_313, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_315, Icur := OriginalRow227TriangleData0677.coefficient45_314,
    output := OriginalRow227TriangleData0690.coefficient46_314, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_316, Icur := OriginalRow227TriangleData0677.coefficient45_315,
    output := OriginalRow227TriangleData0690.coefficient46_315, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_317, Icur := OriginalRow227TriangleData0677.coefficient45_316,
    output := OriginalRow227TriangleData0690.coefficient46_316, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_318, Icur := OriginalRow227TriangleData0677.coefficient45_317,
    output := OriginalRow227TriangleData0690.coefficient46_317, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_319, Icur := OriginalRow227TriangleData0677.coefficient45_318,
    output := OriginalRow227TriangleData0690.coefficient46_318, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_320, Icur := OriginalRow227TriangleData0677.coefficient45_319,
    output := OriginalRow227TriangleData0690.coefficient46_319, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_321, Icur := OriginalRow227TriangleData0677.coefficient45_320,
    output := OriginalRow227TriangleData0690.coefficient46_320, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_322, Icur := OriginalRow227TriangleData0677.coefficient45_321,
    output := OriginalRow227TriangleData0690.coefficient46_321, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_323, Icur := OriginalRow227TriangleData0677.coefficient45_322,
    output := OriginalRow227TriangleData0690.coefficient46_322, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_324, Icur := OriginalRow227TriangleData0677.coefficient45_323,
    output := OriginalRow227TriangleData0690.coefficient46_323, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_325, Icur := OriginalRow227TriangleData0677.coefficient45_324,
    output := OriginalRow227TriangleData0690.coefficient46_324, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_326, Icur := OriginalRow227TriangleData0677.coefficient45_325,
    output := OriginalRow227TriangleData0690.coefficient46_325, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_327, Icur := OriginalRow227TriangleData0677.coefficient45_326,
    output := OriginalRow227TriangleData0690.coefficient46_326, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_328, Icur := OriginalRow227TriangleData0677.coefficient45_327,
    output := OriginalRow227TriangleData0690.coefficient46_327, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_329, Icur := OriginalRow227TriangleData0677.coefficient45_328,
    output := OriginalRow227TriangleData0690.coefficient46_328, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_330, Icur := OriginalRow227TriangleData0677.coefficient45_329,
    output := OriginalRow227TriangleData0690.coefficient46_329, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0677.coefficient45_331, Icur := OriginalRow227TriangleData0677.coefficient45_330,
    output := OriginalRow227TriangleData0690.coefficient46_330, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_332, Icur := OriginalRow227TriangleData0677.coefficient45_331,
    output := OriginalRow227TriangleData0690.coefficient46_331, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0678.coefficient45_333, Icur := OriginalRow227TriangleData0678.coefficient45_332,
    output := OriginalRow227TriangleData0690.coefficient46_332, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0674

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0674.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
