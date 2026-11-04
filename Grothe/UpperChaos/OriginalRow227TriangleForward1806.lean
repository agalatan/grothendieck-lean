import Grothe.UpperChaos.OriginalRow227TriangleData1816
import Grothe.UpperChaos.OriginalRow227TriangleData1817
import Grothe.UpperChaos.OriginalRow227TriangleData1822
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1806
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_291, Icur := OriginalRow227TriangleData1816.coefficient162_290,
    output := OriginalRow227TriangleData1822.coefficient163_290, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_292, Icur := OriginalRow227TriangleData1816.coefficient162_291,
    output := OriginalRow227TriangleData1822.coefficient163_291, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_293, Icur := OriginalRow227TriangleData1816.coefficient162_292,
    output := OriginalRow227TriangleData1822.coefficient163_292, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_294, Icur := OriginalRow227TriangleData1816.coefficient162_293,
    output := OriginalRow227TriangleData1822.coefficient163_293, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_295, Icur := OriginalRow227TriangleData1816.coefficient162_294,
    output := OriginalRow227TriangleData1822.coefficient163_294, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_296, Icur := OriginalRow227TriangleData1816.coefficient162_295,
    output := OriginalRow227TriangleData1822.coefficient163_295, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_297, Icur := OriginalRow227TriangleData1816.coefficient162_296,
    output := OriginalRow227TriangleData1822.coefficient163_296, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_298, Icur := OriginalRow227TriangleData1816.coefficient162_297,
    output := OriginalRow227TriangleData1822.coefficient163_297, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_299, Icur := OriginalRow227TriangleData1816.coefficient162_298,
    output := OriginalRow227TriangleData1822.coefficient163_298, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_300, Icur := OriginalRow227TriangleData1816.coefficient162_299,
    output := OriginalRow227TriangleData1822.coefficient163_299, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_301, Icur := OriginalRow227TriangleData1816.coefficient162_300,
    output := OriginalRow227TriangleData1822.coefficient163_300, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_302, Icur := OriginalRow227TriangleData1816.coefficient162_301,
    output := OriginalRow227TriangleData1822.coefficient163_301, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_303, Icur := OriginalRow227TriangleData1816.coefficient162_302,
    output := OriginalRow227TriangleData1822.coefficient163_302, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_304, Icur := OriginalRow227TriangleData1816.coefficient162_303,
    output := OriginalRow227TriangleData1822.coefficient163_303, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_305, Icur := OriginalRow227TriangleData1816.coefficient162_304,
    output := OriginalRow227TriangleData1822.coefficient163_304, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_306, Icur := OriginalRow227TriangleData1816.coefficient162_305,
    output := OriginalRow227TriangleData1822.coefficient163_305, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_307, Icur := OriginalRow227TriangleData1816.coefficient162_306,
    output := OriginalRow227TriangleData1822.coefficient163_306, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_308, Icur := OriginalRow227TriangleData1816.coefficient162_307,
    output := OriginalRow227TriangleData1822.coefficient163_307, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_309, Icur := OriginalRow227TriangleData1816.coefficient162_308,
    output := OriginalRow227TriangleData1822.coefficient163_308, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_310, Icur := OriginalRow227TriangleData1816.coefficient162_309,
    output := OriginalRow227TriangleData1822.coefficient163_309, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_311, Icur := OriginalRow227TriangleData1816.coefficient162_310,
    output := OriginalRow227TriangleData1822.coefficient163_310, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_312, Icur := OriginalRow227TriangleData1816.coefficient162_311,
    output := OriginalRow227TriangleData1822.coefficient163_311, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_313, Icur := OriginalRow227TriangleData1816.coefficient162_312,
    output := OriginalRow227TriangleData1822.coefficient163_312, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_314, Icur := OriginalRow227TriangleData1816.coefficient162_313,
    output := OriginalRow227TriangleData1822.coefficient163_313, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_315, Icur := OriginalRow227TriangleData1816.coefficient162_314,
    output := OriginalRow227TriangleData1822.coefficient163_314, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_316, Icur := OriginalRow227TriangleData1816.coefficient162_315,
    output := OriginalRow227TriangleData1822.coefficient163_315, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_317, Icur := OriginalRow227TriangleData1816.coefficient162_316,
    output := OriginalRow227TriangleData1822.coefficient163_316, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_318, Icur := OriginalRow227TriangleData1816.coefficient162_317,
    output := OriginalRow227TriangleData1822.coefficient163_317, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_319, Icur := OriginalRow227TriangleData1816.coefficient162_318,
    output := OriginalRow227TriangleData1822.coefficient163_318, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_320, Icur := OriginalRow227TriangleData1816.coefficient162_319,
    output := OriginalRow227TriangleData1822.coefficient163_319, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_321, Icur := OriginalRow227TriangleData1816.coefficient162_320,
    output := OriginalRow227TriangleData1822.coefficient163_320, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_322, Icur := OriginalRow227TriangleData1817.coefficient162_321,
    output := OriginalRow227TriangleData1822.coefficient163_321, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1806

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1806.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
