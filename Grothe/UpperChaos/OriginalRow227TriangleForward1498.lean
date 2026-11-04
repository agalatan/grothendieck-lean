import Grothe.UpperChaos.OriginalRow227TriangleData1505
import Grothe.UpperChaos.OriginalRow227TriangleData1506
import Grothe.UpperChaos.OriginalRow227TriangleData1514
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1498
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_281, Icur := OriginalRow227TriangleData1505.coefficient120_280,
    output := OriginalRow227TriangleData1514.coefficient121_280, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_282, Icur := OriginalRow227TriangleData1505.coefficient120_281,
    output := OriginalRow227TriangleData1514.coefficient121_281, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_283, Icur := OriginalRow227TriangleData1505.coefficient120_282,
    output := OriginalRow227TriangleData1514.coefficient121_282, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_284, Icur := OriginalRow227TriangleData1505.coefficient120_283,
    output := OriginalRow227TriangleData1514.coefficient121_283, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_285, Icur := OriginalRow227TriangleData1505.coefficient120_284,
    output := OriginalRow227TriangleData1514.coefficient121_284, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_286, Icur := OriginalRow227TriangleData1505.coefficient120_285,
    output := OriginalRow227TriangleData1514.coefficient121_285, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_287, Icur := OriginalRow227TriangleData1505.coefficient120_286,
    output := OriginalRow227TriangleData1514.coefficient121_286, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_288, Icur := OriginalRow227TriangleData1505.coefficient120_287,
    output := OriginalRow227TriangleData1514.coefficient121_287, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_289, Icur := OriginalRow227TriangleData1505.coefficient120_288,
    output := OriginalRow227TriangleData1514.coefficient121_288, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_290, Icur := OriginalRow227TriangleData1505.coefficient120_289,
    output := OriginalRow227TriangleData1514.coefficient121_289, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_291, Icur := OriginalRow227TriangleData1505.coefficient120_290,
    output := OriginalRow227TriangleData1514.coefficient121_290, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_292, Icur := OriginalRow227TriangleData1505.coefficient120_291,
    output := OriginalRow227TriangleData1514.coefficient121_291, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_293, Icur := OriginalRow227TriangleData1505.coefficient120_292,
    output := OriginalRow227TriangleData1514.coefficient121_292, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_294, Icur := OriginalRow227TriangleData1505.coefficient120_293,
    output := OriginalRow227TriangleData1514.coefficient121_293, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_295, Icur := OriginalRow227TriangleData1505.coefficient120_294,
    output := OriginalRow227TriangleData1514.coefficient121_294, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_296, Icur := OriginalRow227TriangleData1505.coefficient120_295,
    output := OriginalRow227TriangleData1514.coefficient121_295, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_297, Icur := OriginalRow227TriangleData1505.coefficient120_296,
    output := OriginalRow227TriangleData1514.coefficient121_296, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_298, Icur := OriginalRow227TriangleData1505.coefficient120_297,
    output := OriginalRow227TriangleData1514.coefficient121_297, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_299, Icur := OriginalRow227TriangleData1505.coefficient120_298,
    output := OriginalRow227TriangleData1514.coefficient121_298, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_300, Icur := OriginalRow227TriangleData1505.coefficient120_299,
    output := OriginalRow227TriangleData1514.coefficient121_299, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_301, Icur := OriginalRow227TriangleData1505.coefficient120_300,
    output := OriginalRow227TriangleData1514.coefficient121_300, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_302, Icur := OriginalRow227TriangleData1505.coefficient120_301,
    output := OriginalRow227TriangleData1514.coefficient121_301, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_303, Icur := OriginalRow227TriangleData1505.coefficient120_302,
    output := OriginalRow227TriangleData1514.coefficient121_302, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_304, Icur := OriginalRow227TriangleData1505.coefficient120_303,
    output := OriginalRow227TriangleData1514.coefficient121_303, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_305, Icur := OriginalRow227TriangleData1505.coefficient120_304,
    output := OriginalRow227TriangleData1514.coefficient121_304, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_306, Icur := OriginalRow227TriangleData1505.coefficient120_305,
    output := OriginalRow227TriangleData1514.coefficient121_305, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_307, Icur := OriginalRow227TriangleData1505.coefficient120_306,
    output := OriginalRow227TriangleData1514.coefficient121_306, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_308, Icur := OriginalRow227TriangleData1505.coefficient120_307,
    output := OriginalRow227TriangleData1514.coefficient121_307, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_309, Icur := OriginalRow227TriangleData1505.coefficient120_308,
    output := OriginalRow227TriangleData1514.coefficient121_308, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1505.coefficient120_310, Icur := OriginalRow227TriangleData1505.coefficient120_309,
    output := OriginalRow227TriangleData1514.coefficient121_309, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_311, Icur := OriginalRow227TriangleData1505.coefficient120_310,
    output := OriginalRow227TriangleData1514.coefficient121_310, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_312, Icur := OriginalRow227TriangleData1506.coefficient120_311,
    output := OriginalRow227TriangleData1514.coefficient121_311, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1498

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1498.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
