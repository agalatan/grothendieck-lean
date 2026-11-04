import Grothe.UpperChaos.OriginalRow227TriangleData1268
import Grothe.UpperChaos.OriginalRow227TriangleData1269
import Grothe.UpperChaos.OriginalRow227TriangleData1278
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1262
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_288, Icur := OriginalRow227TriangleData1268.coefficient95_287,
    output := OriginalRow227TriangleData1278.coefficient96_287, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_289, Icur := OriginalRow227TriangleData1268.coefficient95_288,
    output := OriginalRow227TriangleData1278.coefficient96_288, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_290, Icur := OriginalRow227TriangleData1268.coefficient95_289,
    output := OriginalRow227TriangleData1278.coefficient96_289, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_291, Icur := OriginalRow227TriangleData1268.coefficient95_290,
    output := OriginalRow227TriangleData1278.coefficient96_290, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_292, Icur := OriginalRow227TriangleData1268.coefficient95_291,
    output := OriginalRow227TriangleData1278.coefficient96_291, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_293, Icur := OriginalRow227TriangleData1268.coefficient95_292,
    output := OriginalRow227TriangleData1278.coefficient96_292, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_294, Icur := OriginalRow227TriangleData1268.coefficient95_293,
    output := OriginalRow227TriangleData1278.coefficient96_293, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_295, Icur := OriginalRow227TriangleData1268.coefficient95_294,
    output := OriginalRow227TriangleData1278.coefficient96_294, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_296, Icur := OriginalRow227TriangleData1268.coefficient95_295,
    output := OriginalRow227TriangleData1278.coefficient96_295, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_297, Icur := OriginalRow227TriangleData1268.coefficient95_296,
    output := OriginalRow227TriangleData1278.coefficient96_296, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_298, Icur := OriginalRow227TriangleData1268.coefficient95_297,
    output := OriginalRow227TriangleData1278.coefficient96_297, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_299, Icur := OriginalRow227TriangleData1268.coefficient95_298,
    output := OriginalRow227TriangleData1278.coefficient96_298, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_300, Icur := OriginalRow227TriangleData1268.coefficient95_299,
    output := OriginalRow227TriangleData1278.coefficient96_299, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_301, Icur := OriginalRow227TriangleData1268.coefficient95_300,
    output := OriginalRow227TriangleData1278.coefficient96_300, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_302, Icur := OriginalRow227TriangleData1268.coefficient95_301,
    output := OriginalRow227TriangleData1278.coefficient96_301, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_303, Icur := OriginalRow227TriangleData1268.coefficient95_302,
    output := OriginalRow227TriangleData1278.coefficient96_302, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_304, Icur := OriginalRow227TriangleData1268.coefficient95_303,
    output := OriginalRow227TriangleData1278.coefficient96_303, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_305, Icur := OriginalRow227TriangleData1268.coefficient95_304,
    output := OriginalRow227TriangleData1278.coefficient96_304, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_306, Icur := OriginalRow227TriangleData1268.coefficient95_305,
    output := OriginalRow227TriangleData1278.coefficient96_305, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_307, Icur := OriginalRow227TriangleData1268.coefficient95_306,
    output := OriginalRow227TriangleData1278.coefficient96_306, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_308, Icur := OriginalRow227TriangleData1268.coefficient95_307,
    output := OriginalRow227TriangleData1278.coefficient96_307, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_309, Icur := OriginalRow227TriangleData1268.coefficient95_308,
    output := OriginalRow227TriangleData1278.coefficient96_308, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_310, Icur := OriginalRow227TriangleData1268.coefficient95_309,
    output := OriginalRow227TriangleData1278.coefficient96_309, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_311, Icur := OriginalRow227TriangleData1268.coefficient95_310,
    output := OriginalRow227TriangleData1278.coefficient96_310, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_312, Icur := OriginalRow227TriangleData1268.coefficient95_311,
    output := OriginalRow227TriangleData1278.coefficient96_311, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_313, Icur := OriginalRow227TriangleData1268.coefficient95_312,
    output := OriginalRow227TriangleData1278.coefficient96_312, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_314, Icur := OriginalRow227TriangleData1268.coefficient95_313,
    output := OriginalRow227TriangleData1278.coefficient96_313, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_315, Icur := OriginalRow227TriangleData1268.coefficient95_314,
    output := OriginalRow227TriangleData1278.coefficient96_314, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_316, Icur := OriginalRow227TriangleData1268.coefficient95_315,
    output := OriginalRow227TriangleData1278.coefficient96_315, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1268.coefficient95_317, Icur := OriginalRow227TriangleData1268.coefficient95_316,
    output := OriginalRow227TriangleData1278.coefficient96_316, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1269.coefficient95_318, Icur := OriginalRow227TriangleData1268.coefficient95_317,
    output := OriginalRow227TriangleData1278.coefficient96_317, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1269.coefficient95_319, Icur := OriginalRow227TriangleData1269.coefficient95_318,
    output := OriginalRow227TriangleData1278.coefficient96_318, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1262

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1262.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
