import Grothe.UpperChaos.OriginalRow227TriangleData1828
import Grothe.UpperChaos.OriginalRow227TriangleData1829
import Grothe.UpperChaos.OriginalRow227TriangleData1834
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1818
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_293, Icur := OriginalRow227TriangleData1828.coefficient164_292,
    output := OriginalRow227TriangleData1834.coefficient165_292, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_294, Icur := OriginalRow227TriangleData1828.coefficient164_293,
    output := OriginalRow227TriangleData1834.coefficient165_293, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_295, Icur := OriginalRow227TriangleData1828.coefficient164_294,
    output := OriginalRow227TriangleData1834.coefficient165_294, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_296, Icur := OriginalRow227TriangleData1828.coefficient164_295,
    output := OriginalRow227TriangleData1834.coefficient165_295, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_297, Icur := OriginalRow227TriangleData1828.coefficient164_296,
    output := OriginalRow227TriangleData1834.coefficient165_296, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_298, Icur := OriginalRow227TriangleData1828.coefficient164_297,
    output := OriginalRow227TriangleData1834.coefficient165_297, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_299, Icur := OriginalRow227TriangleData1828.coefficient164_298,
    output := OriginalRow227TriangleData1834.coefficient165_298, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_300, Icur := OriginalRow227TriangleData1828.coefficient164_299,
    output := OriginalRow227TriangleData1834.coefficient165_299, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_301, Icur := OriginalRow227TriangleData1828.coefficient164_300,
    output := OriginalRow227TriangleData1834.coefficient165_300, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_302, Icur := OriginalRow227TriangleData1828.coefficient164_301,
    output := OriginalRow227TriangleData1834.coefficient165_301, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_303, Icur := OriginalRow227TriangleData1828.coefficient164_302,
    output := OriginalRow227TriangleData1834.coefficient165_302, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_304, Icur := OriginalRow227TriangleData1828.coefficient164_303,
    output := OriginalRow227TriangleData1834.coefficient165_303, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_305, Icur := OriginalRow227TriangleData1828.coefficient164_304,
    output := OriginalRow227TriangleData1834.coefficient165_304, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_306, Icur := OriginalRow227TriangleData1828.coefficient164_305,
    output := OriginalRow227TriangleData1834.coefficient165_305, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_307, Icur := OriginalRow227TriangleData1828.coefficient164_306,
    output := OriginalRow227TriangleData1834.coefficient165_306, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_308, Icur := OriginalRow227TriangleData1828.coefficient164_307,
    output := OriginalRow227TriangleData1834.coefficient165_307, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_309, Icur := OriginalRow227TriangleData1828.coefficient164_308,
    output := OriginalRow227TriangleData1834.coefficient165_308, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_310, Icur := OriginalRow227TriangleData1828.coefficient164_309,
    output := OriginalRow227TriangleData1834.coefficient165_309, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_311, Icur := OriginalRow227TriangleData1828.coefficient164_310,
    output := OriginalRow227TriangleData1834.coefficient165_310, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_312, Icur := OriginalRow227TriangleData1828.coefficient164_311,
    output := OriginalRow227TriangleData1834.coefficient165_311, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_313, Icur := OriginalRow227TriangleData1828.coefficient164_312,
    output := OriginalRow227TriangleData1834.coefficient165_312, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_314, Icur := OriginalRow227TriangleData1828.coefficient164_313,
    output := OriginalRow227TriangleData1834.coefficient165_313, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_315, Icur := OriginalRow227TriangleData1828.coefficient164_314,
    output := OriginalRow227TriangleData1834.coefficient165_314, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_316, Icur := OriginalRow227TriangleData1828.coefficient164_315,
    output := OriginalRow227TriangleData1834.coefficient165_315, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_317, Icur := OriginalRow227TriangleData1828.coefficient164_316,
    output := OriginalRow227TriangleData1834.coefficient165_316, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_318, Icur := OriginalRow227TriangleData1828.coefficient164_317,
    output := OriginalRow227TriangleData1834.coefficient165_317, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_319, Icur := OriginalRow227TriangleData1828.coefficient164_318,
    output := OriginalRow227TriangleData1834.coefficient165_318, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_320, Icur := OriginalRow227TriangleData1828.coefficient164_319,
    output := OriginalRow227TriangleData1834.coefficient165_319, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_321, Icur := OriginalRow227TriangleData1828.coefficient164_320,
    output := OriginalRow227TriangleData1834.coefficient165_320, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1828.coefficient164_322, Icur := OriginalRow227TriangleData1828.coefficient164_321,
    output := OriginalRow227TriangleData1834.coefficient165_321, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1829.coefficient164_323, Icur := OriginalRow227TriangleData1828.coefficient164_322,
    output := OriginalRow227TriangleData1834.coefficient165_322, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1829.coefficient164_324, Icur := OriginalRow227TriangleData1829.coefficient164_323,
    output := OriginalRow227TriangleData1834.coefficient165_323, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1818

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1818.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
