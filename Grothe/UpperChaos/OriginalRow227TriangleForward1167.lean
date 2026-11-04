import Grothe.UpperChaos.OriginalRow227TriangleData1172
import Grothe.UpperChaos.OriginalRow227TriangleData1173
import Grothe.UpperChaos.OriginalRow227TriangleData1183
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1167
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_279, Icur := OriginalRow227TriangleData1172.coefficient86_278,
    output := OriginalRow227TriangleData1183.coefficient87_278, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_280, Icur := OriginalRow227TriangleData1172.coefficient86_279,
    output := OriginalRow227TriangleData1183.coefficient87_279, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_281, Icur := OriginalRow227TriangleData1172.coefficient86_280,
    output := OriginalRow227TriangleData1183.coefficient87_280, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_282, Icur := OriginalRow227TriangleData1172.coefficient86_281,
    output := OriginalRow227TriangleData1183.coefficient87_281, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_283, Icur := OriginalRow227TriangleData1172.coefficient86_282,
    output := OriginalRow227TriangleData1183.coefficient87_282, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_284, Icur := OriginalRow227TriangleData1172.coefficient86_283,
    output := OriginalRow227TriangleData1183.coefficient87_283, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_285, Icur := OriginalRow227TriangleData1172.coefficient86_284,
    output := OriginalRow227TriangleData1183.coefficient87_284, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_286, Icur := OriginalRow227TriangleData1172.coefficient86_285,
    output := OriginalRow227TriangleData1183.coefficient87_285, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_287, Icur := OriginalRow227TriangleData1172.coefficient86_286,
    output := OriginalRow227TriangleData1183.coefficient87_286, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_288, Icur := OriginalRow227TriangleData1172.coefficient86_287,
    output := OriginalRow227TriangleData1183.coefficient87_287, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_289, Icur := OriginalRow227TriangleData1172.coefficient86_288,
    output := OriginalRow227TriangleData1183.coefficient87_288, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_290, Icur := OriginalRow227TriangleData1172.coefficient86_289,
    output := OriginalRow227TriangleData1183.coefficient87_289, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_291, Icur := OriginalRow227TriangleData1172.coefficient86_290,
    output := OriginalRow227TriangleData1183.coefficient87_290, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_292, Icur := OriginalRow227TriangleData1172.coefficient86_291,
    output := OriginalRow227TriangleData1183.coefficient87_291, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_293, Icur := OriginalRow227TriangleData1172.coefficient86_292,
    output := OriginalRow227TriangleData1183.coefficient87_292, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_294, Icur := OriginalRow227TriangleData1172.coefficient86_293,
    output := OriginalRow227TriangleData1183.coefficient87_293, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_295, Icur := OriginalRow227TriangleData1172.coefficient86_294,
    output := OriginalRow227TriangleData1183.coefficient87_294, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_296, Icur := OriginalRow227TriangleData1172.coefficient86_295,
    output := OriginalRow227TriangleData1183.coefficient87_295, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_297, Icur := OriginalRow227TriangleData1172.coefficient86_296,
    output := OriginalRow227TriangleData1183.coefficient87_296, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_298, Icur := OriginalRow227TriangleData1172.coefficient86_297,
    output := OriginalRow227TriangleData1183.coefficient87_297, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_299, Icur := OriginalRow227TriangleData1172.coefficient86_298,
    output := OriginalRow227TriangleData1183.coefficient87_298, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_300, Icur := OriginalRow227TriangleData1172.coefficient86_299,
    output := OriginalRow227TriangleData1183.coefficient87_299, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_301, Icur := OriginalRow227TriangleData1172.coefficient86_300,
    output := OriginalRow227TriangleData1183.coefficient87_300, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_302, Icur := OriginalRow227TriangleData1172.coefficient86_301,
    output := OriginalRow227TriangleData1183.coefficient87_301, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_303, Icur := OriginalRow227TriangleData1172.coefficient86_302,
    output := OriginalRow227TriangleData1183.coefficient87_302, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_304, Icur := OriginalRow227TriangleData1172.coefficient86_303,
    output := OriginalRow227TriangleData1183.coefficient87_303, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_305, Icur := OriginalRow227TriangleData1172.coefficient86_304,
    output := OriginalRow227TriangleData1183.coefficient87_304, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_306, Icur := OriginalRow227TriangleData1172.coefficient86_305,
    output := OriginalRow227TriangleData1183.coefficient87_305, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_307, Icur := OriginalRow227TriangleData1172.coefficient86_306,
    output := OriginalRow227TriangleData1183.coefficient87_306, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1172.coefficient86_308, Icur := OriginalRow227TriangleData1172.coefficient86_307,
    output := OriginalRow227TriangleData1183.coefficient87_307, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_309, Icur := OriginalRow227TriangleData1172.coefficient86_308,
    output := OriginalRow227TriangleData1183.coefficient87_308, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_310, Icur := OriginalRow227TriangleData1173.coefficient86_309,
    output := OriginalRow227TriangleData1183.coefficient87_309, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1167

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1167.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
