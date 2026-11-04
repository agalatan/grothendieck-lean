import Grothe.UpperChaos.OriginalRow227TriangleData0622
import Grothe.UpperChaos.OriginalRow227TriangleData0623
import Grothe.UpperChaos.OriginalRow227TriangleData0636
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0620
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_298, Icur := OriginalRow227TriangleData0622.coefficient41_297,
    output := OriginalRow227TriangleData0636.coefficient42_297, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_299, Icur := OriginalRow227TriangleData0622.coefficient41_298,
    output := OriginalRow227TriangleData0636.coefficient42_298, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_300, Icur := OriginalRow227TriangleData0622.coefficient41_299,
    output := OriginalRow227TriangleData0636.coefficient42_299, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_301, Icur := OriginalRow227TriangleData0622.coefficient41_300,
    output := OriginalRow227TriangleData0636.coefficient42_300, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_302, Icur := OriginalRow227TriangleData0622.coefficient41_301,
    output := OriginalRow227TriangleData0636.coefficient42_301, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_303, Icur := OriginalRow227TriangleData0622.coefficient41_302,
    output := OriginalRow227TriangleData0636.coefficient42_302, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_304, Icur := OriginalRow227TriangleData0622.coefficient41_303,
    output := OriginalRow227TriangleData0636.coefficient42_303, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_305, Icur := OriginalRow227TriangleData0622.coefficient41_304,
    output := OriginalRow227TriangleData0636.coefficient42_304, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_306, Icur := OriginalRow227TriangleData0622.coefficient41_305,
    output := OriginalRow227TriangleData0636.coefficient42_305, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_307, Icur := OriginalRow227TriangleData0622.coefficient41_306,
    output := OriginalRow227TriangleData0636.coefficient42_306, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_308, Icur := OriginalRow227TriangleData0622.coefficient41_307,
    output := OriginalRow227TriangleData0636.coefficient42_307, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_309, Icur := OriginalRow227TriangleData0622.coefficient41_308,
    output := OriginalRow227TriangleData0636.coefficient42_308, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_310, Icur := OriginalRow227TriangleData0622.coefficient41_309,
    output := OriginalRow227TriangleData0636.coefficient42_309, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_311, Icur := OriginalRow227TriangleData0622.coefficient41_310,
    output := OriginalRow227TriangleData0636.coefficient42_310, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_312, Icur := OriginalRow227TriangleData0622.coefficient41_311,
    output := OriginalRow227TriangleData0636.coefficient42_311, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_313, Icur := OriginalRow227TriangleData0622.coefficient41_312,
    output := OriginalRow227TriangleData0636.coefficient42_312, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_314, Icur := OriginalRow227TriangleData0622.coefficient41_313,
    output := OriginalRow227TriangleData0636.coefficient42_313, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_315, Icur := OriginalRow227TriangleData0622.coefficient41_314,
    output := OriginalRow227TriangleData0636.coefficient42_314, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_316, Icur := OriginalRow227TriangleData0622.coefficient41_315,
    output := OriginalRow227TriangleData0636.coefficient42_315, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_317, Icur := OriginalRow227TriangleData0622.coefficient41_316,
    output := OriginalRow227TriangleData0636.coefficient42_316, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_318, Icur := OriginalRow227TriangleData0622.coefficient41_317,
    output := OriginalRow227TriangleData0636.coefficient42_317, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_319, Icur := OriginalRow227TriangleData0622.coefficient41_318,
    output := OriginalRow227TriangleData0636.coefficient42_318, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_320, Icur := OriginalRow227TriangleData0622.coefficient41_319,
    output := OriginalRow227TriangleData0636.coefficient42_319, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_321, Icur := OriginalRow227TriangleData0622.coefficient41_320,
    output := OriginalRow227TriangleData0636.coefficient42_320, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_322, Icur := OriginalRow227TriangleData0622.coefficient41_321,
    output := OriginalRow227TriangleData0636.coefficient42_321, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_323, Icur := OriginalRow227TriangleData0622.coefficient41_322,
    output := OriginalRow227TriangleData0636.coefficient42_322, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_324, Icur := OriginalRow227TriangleData0622.coefficient41_323,
    output := OriginalRow227TriangleData0636.coefficient42_323, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_325, Icur := OriginalRow227TriangleData0622.coefficient41_324,
    output := OriginalRow227TriangleData0636.coefficient42_324, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_326, Icur := OriginalRow227TriangleData0622.coefficient41_325,
    output := OriginalRow227TriangleData0636.coefficient42_325, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0622.coefficient41_327, Icur := OriginalRow227TriangleData0622.coefficient41_326,
    output := OriginalRow227TriangleData0636.coefficient42_326, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_328, Icur := OriginalRow227TriangleData0622.coefficient41_327,
    output := OriginalRow227TriangleData0636.coefficient42_327, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_329, Icur := OriginalRow227TriangleData0623.coefficient41_328,
    output := OriginalRow227TriangleData0636.coefficient42_328, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0620

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0620.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
