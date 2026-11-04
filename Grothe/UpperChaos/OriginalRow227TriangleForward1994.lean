import Grothe.UpperChaos.OriginalRow227TriangleData2006
import Grothe.UpperChaos.OriginalRow227TriangleData2007
import Grothe.UpperChaos.OriginalRow227TriangleData2010
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1994
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_266, Icur := OriginalRow227TriangleData2006.coefficient201_265,
    output := OriginalRow227TriangleData2010.coefficient202_265, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_267, Icur := OriginalRow227TriangleData2006.coefficient201_266,
    output := OriginalRow227TriangleData2010.coefficient202_266, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_268, Icur := OriginalRow227TriangleData2006.coefficient201_267,
    output := OriginalRow227TriangleData2010.coefficient202_267, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_269, Icur := OriginalRow227TriangleData2006.coefficient201_268,
    output := OriginalRow227TriangleData2010.coefficient202_268, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_270, Icur := OriginalRow227TriangleData2006.coefficient201_269,
    output := OriginalRow227TriangleData2010.coefficient202_269, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_271, Icur := OriginalRow227TriangleData2006.coefficient201_270,
    output := OriginalRow227TriangleData2010.coefficient202_270, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_272, Icur := OriginalRow227TriangleData2006.coefficient201_271,
    output := OriginalRow227TriangleData2010.coefficient202_271, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_273, Icur := OriginalRow227TriangleData2006.coefficient201_272,
    output := OriginalRow227TriangleData2010.coefficient202_272, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_274, Icur := OriginalRow227TriangleData2006.coefficient201_273,
    output := OriginalRow227TriangleData2010.coefficient202_273, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_275, Icur := OriginalRow227TriangleData2006.coefficient201_274,
    output := OriginalRow227TriangleData2010.coefficient202_274, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_276, Icur := OriginalRow227TriangleData2006.coefficient201_275,
    output := OriginalRow227TriangleData2010.coefficient202_275, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_277, Icur := OriginalRow227TriangleData2006.coefficient201_276,
    output := OriginalRow227TriangleData2010.coefficient202_276, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_278, Icur := OriginalRow227TriangleData2006.coefficient201_277,
    output := OriginalRow227TriangleData2010.coefficient202_277, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_279, Icur := OriginalRow227TriangleData2006.coefficient201_278,
    output := OriginalRow227TriangleData2010.coefficient202_278, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_280, Icur := OriginalRow227TriangleData2006.coefficient201_279,
    output := OriginalRow227TriangleData2010.coefficient202_279, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_281, Icur := OriginalRow227TriangleData2006.coefficient201_280,
    output := OriginalRow227TriangleData2010.coefficient202_280, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_282, Icur := OriginalRow227TriangleData2006.coefficient201_281,
    output := OriginalRow227TriangleData2010.coefficient202_281, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_283, Icur := OriginalRow227TriangleData2006.coefficient201_282,
    output := OriginalRow227TriangleData2010.coefficient202_282, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_284, Icur := OriginalRow227TriangleData2006.coefficient201_283,
    output := OriginalRow227TriangleData2010.coefficient202_283, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_285, Icur := OriginalRow227TriangleData2006.coefficient201_284,
    output := OriginalRow227TriangleData2010.coefficient202_284, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_286, Icur := OriginalRow227TriangleData2006.coefficient201_285,
    output := OriginalRow227TriangleData2010.coefficient202_285, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_287, Icur := OriginalRow227TriangleData2006.coefficient201_286,
    output := OriginalRow227TriangleData2010.coefficient202_286, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_288, Icur := OriginalRow227TriangleData2006.coefficient201_287,
    output := OriginalRow227TriangleData2010.coefficient202_287, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_289, Icur := OriginalRow227TriangleData2006.coefficient201_288,
    output := OriginalRow227TriangleData2010.coefficient202_288, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_290, Icur := OriginalRow227TriangleData2006.coefficient201_289,
    output := OriginalRow227TriangleData2010.coefficient202_289, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_291, Icur := OriginalRow227TriangleData2006.coefficient201_290,
    output := OriginalRow227TriangleData2010.coefficient202_290, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_292, Icur := OriginalRow227TriangleData2006.coefficient201_291,
    output := OriginalRow227TriangleData2010.coefficient202_291, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_293, Icur := OriginalRow227TriangleData2006.coefficient201_292,
    output := OriginalRow227TriangleData2010.coefficient202_292, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_294, Icur := OriginalRow227TriangleData2006.coefficient201_293,
    output := OriginalRow227TriangleData2010.coefficient202_293, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2006.coefficient201_295, Icur := OriginalRow227TriangleData2006.coefficient201_294,
    output := OriginalRow227TriangleData2010.coefficient202_294, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2007.coefficient201_296, Icur := OriginalRow227TriangleData2006.coefficient201_295,
    output := OriginalRow227TriangleData2010.coefficient202_295, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2007.coefficient201_297, Icur := OriginalRow227TriangleData2007.coefficient201_296,
    output := OriginalRow227TriangleData2010.coefficient202_296, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1994

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1994.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
