import Grothe.UpperChaos.OriginalRow227TriangleData0552
import Grothe.UpperChaos.OriginalRow227TriangleData0553
import Grothe.UpperChaos.OriginalRow227TriangleData0566
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0550
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_293, Icur := OriginalRow227TriangleData0552.coefficient36_292,
    output := OriginalRow227TriangleData0566.coefficient37_292, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_294, Icur := OriginalRow227TriangleData0552.coefficient36_293,
    output := OriginalRow227TriangleData0566.coefficient37_293, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_295, Icur := OriginalRow227TriangleData0552.coefficient36_294,
    output := OriginalRow227TriangleData0566.coefficient37_294, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_296, Icur := OriginalRow227TriangleData0552.coefficient36_295,
    output := OriginalRow227TriangleData0566.coefficient37_295, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_297, Icur := OriginalRow227TriangleData0552.coefficient36_296,
    output := OriginalRow227TriangleData0566.coefficient37_296, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_298, Icur := OriginalRow227TriangleData0552.coefficient36_297,
    output := OriginalRow227TriangleData0566.coefficient37_297, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_299, Icur := OriginalRow227TriangleData0552.coefficient36_298,
    output := OriginalRow227TriangleData0566.coefficient37_298, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_300, Icur := OriginalRow227TriangleData0552.coefficient36_299,
    output := OriginalRow227TriangleData0566.coefficient37_299, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_301, Icur := OriginalRow227TriangleData0552.coefficient36_300,
    output := OriginalRow227TriangleData0566.coefficient37_300, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_302, Icur := OriginalRow227TriangleData0552.coefficient36_301,
    output := OriginalRow227TriangleData0566.coefficient37_301, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_303, Icur := OriginalRow227TriangleData0552.coefficient36_302,
    output := OriginalRow227TriangleData0566.coefficient37_302, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_304, Icur := OriginalRow227TriangleData0552.coefficient36_303,
    output := OriginalRow227TriangleData0566.coefficient37_303, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_305, Icur := OriginalRow227TriangleData0552.coefficient36_304,
    output := OriginalRow227TriangleData0566.coefficient37_304, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_306, Icur := OriginalRow227TriangleData0552.coefficient36_305,
    output := OriginalRow227TriangleData0566.coefficient37_305, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_307, Icur := OriginalRow227TriangleData0552.coefficient36_306,
    output := OriginalRow227TriangleData0566.coefficient37_306, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_308, Icur := OriginalRow227TriangleData0552.coefficient36_307,
    output := OriginalRow227TriangleData0566.coefficient37_307, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_309, Icur := OriginalRow227TriangleData0552.coefficient36_308,
    output := OriginalRow227TriangleData0566.coefficient37_308, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_310, Icur := OriginalRow227TriangleData0552.coefficient36_309,
    output := OriginalRow227TriangleData0566.coefficient37_309, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_311, Icur := OriginalRow227TriangleData0552.coefficient36_310,
    output := OriginalRow227TriangleData0566.coefficient37_310, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_312, Icur := OriginalRow227TriangleData0552.coefficient36_311,
    output := OriginalRow227TriangleData0566.coefficient37_311, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_313, Icur := OriginalRow227TriangleData0552.coefficient36_312,
    output := OriginalRow227TriangleData0566.coefficient37_312, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_314, Icur := OriginalRow227TriangleData0552.coefficient36_313,
    output := OriginalRow227TriangleData0566.coefficient37_313, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_315, Icur := OriginalRow227TriangleData0552.coefficient36_314,
    output := OriginalRow227TriangleData0566.coefficient37_314, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_316, Icur := OriginalRow227TriangleData0552.coefficient36_315,
    output := OriginalRow227TriangleData0566.coefficient37_315, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_317, Icur := OriginalRow227TriangleData0552.coefficient36_316,
    output := OriginalRow227TriangleData0566.coefficient37_316, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_318, Icur := OriginalRow227TriangleData0552.coefficient36_317,
    output := OriginalRow227TriangleData0566.coefficient37_317, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_319, Icur := OriginalRow227TriangleData0552.coefficient36_318,
    output := OriginalRow227TriangleData0566.coefficient37_318, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_320, Icur := OriginalRow227TriangleData0552.coefficient36_319,
    output := OriginalRow227TriangleData0566.coefficient37_319, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_321, Icur := OriginalRow227TriangleData0552.coefficient36_320,
    output := OriginalRow227TriangleData0566.coefficient37_320, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0552.coefficient36_322, Icur := OriginalRow227TriangleData0552.coefficient36_321,
    output := OriginalRow227TriangleData0566.coefficient37_321, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0553.coefficient36_323, Icur := OriginalRow227TriangleData0552.coefficient36_322,
    output := OriginalRow227TriangleData0566.coefficient37_322, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0553.coefficient36_324, Icur := OriginalRow227TriangleData0553.coefficient36_323,
    output := OriginalRow227TriangleData0566.coefficient37_323, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0550

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0550.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
