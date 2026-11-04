import Grothe.UpperChaos.OriginalRow227TriangleData1864
import Grothe.UpperChaos.OriginalRow227TriangleData1865
import Grothe.UpperChaos.OriginalRow227TriangleData1870
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1854
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_299, Icur := OriginalRow227TriangleData1864.coefficient170_298,
    output := OriginalRow227TriangleData1870.coefficient171_298, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_300, Icur := OriginalRow227TriangleData1864.coefficient170_299,
    output := OriginalRow227TriangleData1870.coefficient171_299, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_301, Icur := OriginalRow227TriangleData1864.coefficient170_300,
    output := OriginalRow227TriangleData1870.coefficient171_300, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_302, Icur := OriginalRow227TriangleData1864.coefficient170_301,
    output := OriginalRow227TriangleData1870.coefficient171_301, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_303, Icur := OriginalRow227TriangleData1864.coefficient170_302,
    output := OriginalRow227TriangleData1870.coefficient171_302, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_304, Icur := OriginalRow227TriangleData1864.coefficient170_303,
    output := OriginalRow227TriangleData1870.coefficient171_303, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_305, Icur := OriginalRow227TriangleData1864.coefficient170_304,
    output := OriginalRow227TriangleData1870.coefficient171_304, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_306, Icur := OriginalRow227TriangleData1864.coefficient170_305,
    output := OriginalRow227TriangleData1870.coefficient171_305, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_307, Icur := OriginalRow227TriangleData1864.coefficient170_306,
    output := OriginalRow227TriangleData1870.coefficient171_306, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_308, Icur := OriginalRow227TriangleData1864.coefficient170_307,
    output := OriginalRow227TriangleData1870.coefficient171_307, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_309, Icur := OriginalRow227TriangleData1864.coefficient170_308,
    output := OriginalRow227TriangleData1870.coefficient171_308, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_310, Icur := OriginalRow227TriangleData1864.coefficient170_309,
    output := OriginalRow227TriangleData1870.coefficient171_309, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_311, Icur := OriginalRow227TriangleData1864.coefficient170_310,
    output := OriginalRow227TriangleData1870.coefficient171_310, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_312, Icur := OriginalRow227TriangleData1864.coefficient170_311,
    output := OriginalRow227TriangleData1870.coefficient171_311, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_313, Icur := OriginalRow227TriangleData1864.coefficient170_312,
    output := OriginalRow227TriangleData1870.coefficient171_312, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_314, Icur := OriginalRow227TriangleData1864.coefficient170_313,
    output := OriginalRow227TriangleData1870.coefficient171_313, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_315, Icur := OriginalRow227TriangleData1864.coefficient170_314,
    output := OriginalRow227TriangleData1870.coefficient171_314, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_316, Icur := OriginalRow227TriangleData1864.coefficient170_315,
    output := OriginalRow227TriangleData1870.coefficient171_315, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_317, Icur := OriginalRow227TriangleData1864.coefficient170_316,
    output := OriginalRow227TriangleData1870.coefficient171_316, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_318, Icur := OriginalRow227TriangleData1864.coefficient170_317,
    output := OriginalRow227TriangleData1870.coefficient171_317, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_319, Icur := OriginalRow227TriangleData1864.coefficient170_318,
    output := OriginalRow227TriangleData1870.coefficient171_318, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_320, Icur := OriginalRow227TriangleData1864.coefficient170_319,
    output := OriginalRow227TriangleData1870.coefficient171_319, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_321, Icur := OriginalRow227TriangleData1864.coefficient170_320,
    output := OriginalRow227TriangleData1870.coefficient171_320, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_322, Icur := OriginalRow227TriangleData1864.coefficient170_321,
    output := OriginalRow227TriangleData1870.coefficient171_321, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_323, Icur := OriginalRow227TriangleData1864.coefficient170_322,
    output := OriginalRow227TriangleData1870.coefficient171_322, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_324, Icur := OriginalRow227TriangleData1864.coefficient170_323,
    output := OriginalRow227TriangleData1870.coefficient171_323, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_325, Icur := OriginalRow227TriangleData1864.coefficient170_324,
    output := OriginalRow227TriangleData1870.coefficient171_324, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_326, Icur := OriginalRow227TriangleData1864.coefficient170_325,
    output := OriginalRow227TriangleData1870.coefficient171_325, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_327, Icur := OriginalRow227TriangleData1864.coefficient170_326,
    output := OriginalRow227TriangleData1870.coefficient171_326, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1864.coefficient170_328, Icur := OriginalRow227TriangleData1864.coefficient170_327,
    output := OriginalRow227TriangleData1870.coefficient171_327, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1865.coefficient170_329, Icur := OriginalRow227TriangleData1864.coefficient170_328,
    output := OriginalRow227TriangleData1870.coefficient171_328, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1865.coefficient170_330, Icur := OriginalRow227TriangleData1865.coefficient170_329,
    output := OriginalRow227TriangleData1870.coefficient171_329, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1854

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1854.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
