import Grothe.UpperChaos.OriginalRow227TriangleData0538
import Grothe.UpperChaos.OriginalRow227TriangleData0539
import Grothe.UpperChaos.OriginalRow227TriangleData0552
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0536
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_292, Icur := OriginalRow227TriangleData0538.coefficient35_291,
    output := OriginalRow227TriangleData0552.coefficient36_291, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_293, Icur := OriginalRow227TriangleData0538.coefficient35_292,
    output := OriginalRow227TriangleData0552.coefficient36_292, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_294, Icur := OriginalRow227TriangleData0538.coefficient35_293,
    output := OriginalRow227TriangleData0552.coefficient36_293, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_295, Icur := OriginalRow227TriangleData0538.coefficient35_294,
    output := OriginalRow227TriangleData0552.coefficient36_294, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_296, Icur := OriginalRow227TriangleData0538.coefficient35_295,
    output := OriginalRow227TriangleData0552.coefficient36_295, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_297, Icur := OriginalRow227TriangleData0538.coefficient35_296,
    output := OriginalRow227TriangleData0552.coefficient36_296, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_298, Icur := OriginalRow227TriangleData0538.coefficient35_297,
    output := OriginalRow227TriangleData0552.coefficient36_297, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_299, Icur := OriginalRow227TriangleData0538.coefficient35_298,
    output := OriginalRow227TriangleData0552.coefficient36_298, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_300, Icur := OriginalRow227TriangleData0538.coefficient35_299,
    output := OriginalRow227TriangleData0552.coefficient36_299, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_301, Icur := OriginalRow227TriangleData0538.coefficient35_300,
    output := OriginalRow227TriangleData0552.coefficient36_300, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_302, Icur := OriginalRow227TriangleData0538.coefficient35_301,
    output := OriginalRow227TriangleData0552.coefficient36_301, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_303, Icur := OriginalRow227TriangleData0538.coefficient35_302,
    output := OriginalRow227TriangleData0552.coefficient36_302, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_304, Icur := OriginalRow227TriangleData0538.coefficient35_303,
    output := OriginalRow227TriangleData0552.coefficient36_303, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_305, Icur := OriginalRow227TriangleData0538.coefficient35_304,
    output := OriginalRow227TriangleData0552.coefficient36_304, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_306, Icur := OriginalRow227TriangleData0538.coefficient35_305,
    output := OriginalRow227TriangleData0552.coefficient36_305, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_307, Icur := OriginalRow227TriangleData0538.coefficient35_306,
    output := OriginalRow227TriangleData0552.coefficient36_306, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_308, Icur := OriginalRow227TriangleData0538.coefficient35_307,
    output := OriginalRow227TriangleData0552.coefficient36_307, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_309, Icur := OriginalRow227TriangleData0538.coefficient35_308,
    output := OriginalRow227TriangleData0552.coefficient36_308, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_310, Icur := OriginalRow227TriangleData0538.coefficient35_309,
    output := OriginalRow227TriangleData0552.coefficient36_309, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_311, Icur := OriginalRow227TriangleData0538.coefficient35_310,
    output := OriginalRow227TriangleData0552.coefficient36_310, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_312, Icur := OriginalRow227TriangleData0538.coefficient35_311,
    output := OriginalRow227TriangleData0552.coefficient36_311, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_313, Icur := OriginalRow227TriangleData0538.coefficient35_312,
    output := OriginalRow227TriangleData0552.coefficient36_312, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_314, Icur := OriginalRow227TriangleData0538.coefficient35_313,
    output := OriginalRow227TriangleData0552.coefficient36_313, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_315, Icur := OriginalRow227TriangleData0538.coefficient35_314,
    output := OriginalRow227TriangleData0552.coefficient36_314, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_316, Icur := OriginalRow227TriangleData0538.coefficient35_315,
    output := OriginalRow227TriangleData0552.coefficient36_315, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_317, Icur := OriginalRow227TriangleData0538.coefficient35_316,
    output := OriginalRow227TriangleData0552.coefficient36_316, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_318, Icur := OriginalRow227TriangleData0538.coefficient35_317,
    output := OriginalRow227TriangleData0552.coefficient36_317, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_319, Icur := OriginalRow227TriangleData0538.coefficient35_318,
    output := OriginalRow227TriangleData0552.coefficient36_318, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_320, Icur := OriginalRow227TriangleData0538.coefficient35_319,
    output := OriginalRow227TriangleData0552.coefficient36_319, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_321, Icur := OriginalRow227TriangleData0538.coefficient35_320,
    output := OriginalRow227TriangleData0552.coefficient36_320, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0539.coefficient35_322, Icur := OriginalRow227TriangleData0538.coefficient35_321,
    output := OriginalRow227TriangleData0552.coefficient36_321, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0539.coefficient35_323, Icur := OriginalRow227TriangleData0539.coefficient35_322,
    output := OriginalRow227TriangleData0552.coefficient36_322, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0536

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0536.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
