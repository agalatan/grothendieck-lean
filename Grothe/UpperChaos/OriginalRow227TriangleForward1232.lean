import Grothe.UpperChaos.OriginalRow227TriangleData1238
import Grothe.UpperChaos.OriginalRow227TriangleData1239
import Grothe.UpperChaos.OriginalRow227TriangleData1248
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1232
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_285, Icur := OriginalRow227TriangleData1238.coefficient92_284,
    output := OriginalRow227TriangleData1248.coefficient93_284, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_286, Icur := OriginalRow227TriangleData1238.coefficient92_285,
    output := OriginalRow227TriangleData1248.coefficient93_285, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_287, Icur := OriginalRow227TriangleData1238.coefficient92_286,
    output := OriginalRow227TriangleData1248.coefficient93_286, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_288, Icur := OriginalRow227TriangleData1238.coefficient92_287,
    output := OriginalRow227TriangleData1248.coefficient93_287, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_289, Icur := OriginalRow227TriangleData1238.coefficient92_288,
    output := OriginalRow227TriangleData1248.coefficient93_288, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_290, Icur := OriginalRow227TriangleData1238.coefficient92_289,
    output := OriginalRow227TriangleData1248.coefficient93_289, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_291, Icur := OriginalRow227TriangleData1238.coefficient92_290,
    output := OriginalRow227TriangleData1248.coefficient93_290, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_292, Icur := OriginalRow227TriangleData1238.coefficient92_291,
    output := OriginalRow227TriangleData1248.coefficient93_291, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_293, Icur := OriginalRow227TriangleData1238.coefficient92_292,
    output := OriginalRow227TriangleData1248.coefficient93_292, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_294, Icur := OriginalRow227TriangleData1238.coefficient92_293,
    output := OriginalRow227TriangleData1248.coefficient93_293, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_295, Icur := OriginalRow227TriangleData1238.coefficient92_294,
    output := OriginalRow227TriangleData1248.coefficient93_294, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_296, Icur := OriginalRow227TriangleData1238.coefficient92_295,
    output := OriginalRow227TriangleData1248.coefficient93_295, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_297, Icur := OriginalRow227TriangleData1238.coefficient92_296,
    output := OriginalRow227TriangleData1248.coefficient93_296, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_298, Icur := OriginalRow227TriangleData1238.coefficient92_297,
    output := OriginalRow227TriangleData1248.coefficient93_297, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_299, Icur := OriginalRow227TriangleData1238.coefficient92_298,
    output := OriginalRow227TriangleData1248.coefficient93_298, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_300, Icur := OriginalRow227TriangleData1238.coefficient92_299,
    output := OriginalRow227TriangleData1248.coefficient93_299, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_301, Icur := OriginalRow227TriangleData1238.coefficient92_300,
    output := OriginalRow227TriangleData1248.coefficient93_300, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_302, Icur := OriginalRow227TriangleData1238.coefficient92_301,
    output := OriginalRow227TriangleData1248.coefficient93_301, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_303, Icur := OriginalRow227TriangleData1238.coefficient92_302,
    output := OriginalRow227TriangleData1248.coefficient93_302, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_304, Icur := OriginalRow227TriangleData1238.coefficient92_303,
    output := OriginalRow227TriangleData1248.coefficient93_303, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_305, Icur := OriginalRow227TriangleData1238.coefficient92_304,
    output := OriginalRow227TriangleData1248.coefficient93_304, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_306, Icur := OriginalRow227TriangleData1238.coefficient92_305,
    output := OriginalRow227TriangleData1248.coefficient93_305, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_307, Icur := OriginalRow227TriangleData1238.coefficient92_306,
    output := OriginalRow227TriangleData1248.coefficient93_306, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_308, Icur := OriginalRow227TriangleData1238.coefficient92_307,
    output := OriginalRow227TriangleData1248.coefficient93_307, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_309, Icur := OriginalRow227TriangleData1238.coefficient92_308,
    output := OriginalRow227TriangleData1248.coefficient93_308, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_310, Icur := OriginalRow227TriangleData1238.coefficient92_309,
    output := OriginalRow227TriangleData1248.coefficient93_309, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_311, Icur := OriginalRow227TriangleData1238.coefficient92_310,
    output := OriginalRow227TriangleData1248.coefficient93_310, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_312, Icur := OriginalRow227TriangleData1238.coefficient92_311,
    output := OriginalRow227TriangleData1248.coefficient93_311, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_313, Icur := OriginalRow227TriangleData1238.coefficient92_312,
    output := OriginalRow227TriangleData1248.coefficient93_312, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1238.coefficient92_314, Icur := OriginalRow227TriangleData1238.coefficient92_313,
    output := OriginalRow227TriangleData1248.coefficient93_313, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1239.coefficient92_315, Icur := OriginalRow227TriangleData1238.coefficient92_314,
    output := OriginalRow227TriangleData1248.coefficient93_314, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1239.coefficient92_316, Icur := OriginalRow227TriangleData1239.coefficient92_315,
    output := OriginalRow227TriangleData1248.coefficient93_315, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1232

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1232.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
