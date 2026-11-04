import Grothe.UpperChaos.OriginalRow227TriangleData1822
import Grothe.UpperChaos.OriginalRow227TriangleData1823
import Grothe.UpperChaos.OriginalRow227TriangleData1828
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1812
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_292, Icur := OriginalRow227TriangleData1822.coefficient163_291,
    output := OriginalRow227TriangleData1828.coefficient164_291, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_293, Icur := OriginalRow227TriangleData1822.coefficient163_292,
    output := OriginalRow227TriangleData1828.coefficient164_292, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_294, Icur := OriginalRow227TriangleData1822.coefficient163_293,
    output := OriginalRow227TriangleData1828.coefficient164_293, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_295, Icur := OriginalRow227TriangleData1822.coefficient163_294,
    output := OriginalRow227TriangleData1828.coefficient164_294, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_296, Icur := OriginalRow227TriangleData1822.coefficient163_295,
    output := OriginalRow227TriangleData1828.coefficient164_295, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_297, Icur := OriginalRow227TriangleData1822.coefficient163_296,
    output := OriginalRow227TriangleData1828.coefficient164_296, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_298, Icur := OriginalRow227TriangleData1822.coefficient163_297,
    output := OriginalRow227TriangleData1828.coefficient164_297, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_299, Icur := OriginalRow227TriangleData1822.coefficient163_298,
    output := OriginalRow227TriangleData1828.coefficient164_298, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_300, Icur := OriginalRow227TriangleData1822.coefficient163_299,
    output := OriginalRow227TriangleData1828.coefficient164_299, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_301, Icur := OriginalRow227TriangleData1822.coefficient163_300,
    output := OriginalRow227TriangleData1828.coefficient164_300, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_302, Icur := OriginalRow227TriangleData1822.coefficient163_301,
    output := OriginalRow227TriangleData1828.coefficient164_301, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_303, Icur := OriginalRow227TriangleData1822.coefficient163_302,
    output := OriginalRow227TriangleData1828.coefficient164_302, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_304, Icur := OriginalRow227TriangleData1822.coefficient163_303,
    output := OriginalRow227TriangleData1828.coefficient164_303, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_305, Icur := OriginalRow227TriangleData1822.coefficient163_304,
    output := OriginalRow227TriangleData1828.coefficient164_304, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_306, Icur := OriginalRow227TriangleData1822.coefficient163_305,
    output := OriginalRow227TriangleData1828.coefficient164_305, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_307, Icur := OriginalRow227TriangleData1822.coefficient163_306,
    output := OriginalRow227TriangleData1828.coefficient164_306, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_308, Icur := OriginalRow227TriangleData1822.coefficient163_307,
    output := OriginalRow227TriangleData1828.coefficient164_307, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_309, Icur := OriginalRow227TriangleData1822.coefficient163_308,
    output := OriginalRow227TriangleData1828.coefficient164_308, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_310, Icur := OriginalRow227TriangleData1822.coefficient163_309,
    output := OriginalRow227TriangleData1828.coefficient164_309, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_311, Icur := OriginalRow227TriangleData1822.coefficient163_310,
    output := OriginalRow227TriangleData1828.coefficient164_310, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_312, Icur := OriginalRow227TriangleData1822.coefficient163_311,
    output := OriginalRow227TriangleData1828.coefficient164_311, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_313, Icur := OriginalRow227TriangleData1822.coefficient163_312,
    output := OriginalRow227TriangleData1828.coefficient164_312, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_314, Icur := OriginalRow227TriangleData1822.coefficient163_313,
    output := OriginalRow227TriangleData1828.coefficient164_313, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_315, Icur := OriginalRow227TriangleData1822.coefficient163_314,
    output := OriginalRow227TriangleData1828.coefficient164_314, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_316, Icur := OriginalRow227TriangleData1822.coefficient163_315,
    output := OriginalRow227TriangleData1828.coefficient164_315, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_317, Icur := OriginalRow227TriangleData1822.coefficient163_316,
    output := OriginalRow227TriangleData1828.coefficient164_316, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_318, Icur := OriginalRow227TriangleData1822.coefficient163_317,
    output := OriginalRow227TriangleData1828.coefficient164_317, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_319, Icur := OriginalRow227TriangleData1822.coefficient163_318,
    output := OriginalRow227TriangleData1828.coefficient164_318, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_320, Icur := OriginalRow227TriangleData1822.coefficient163_319,
    output := OriginalRow227TriangleData1828.coefficient164_319, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1822.coefficient163_321, Icur := OriginalRow227TriangleData1822.coefficient163_320,
    output := OriginalRow227TriangleData1828.coefficient164_320, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1823.coefficient163_322, Icur := OriginalRow227TriangleData1822.coefficient163_321,
    output := OriginalRow227TriangleData1828.coefficient164_321, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root164,
    Inext := OriginalRow227TriangleData1823.coefficient163_323, Icur := OriginalRow227TriangleData1823.coefficient163_322,
    output := OriginalRow227TriangleData1828.coefficient164_322, hC := OriginalRow227TriangleRoots05.root164_pos, hAC := OriginalRow227TriangleRoots05.product164_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1812

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1812.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
