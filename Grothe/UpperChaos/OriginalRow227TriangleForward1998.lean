import Grothe.UpperChaos.OriginalRow227TriangleData2010
import Grothe.UpperChaos.OriginalRow227TriangleData2011
import Grothe.UpperChaos.OriginalRow227TriangleData2014
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1998
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_267, Icur := OriginalRow227TriangleData2010.coefficient202_266,
    output := OriginalRow227TriangleData2014.coefficient203_266, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_268, Icur := OriginalRow227TriangleData2010.coefficient202_267,
    output := OriginalRow227TriangleData2014.coefficient203_267, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_269, Icur := OriginalRow227TriangleData2010.coefficient202_268,
    output := OriginalRow227TriangleData2014.coefficient203_268, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_270, Icur := OriginalRow227TriangleData2010.coefficient202_269,
    output := OriginalRow227TriangleData2014.coefficient203_269, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_271, Icur := OriginalRow227TriangleData2010.coefficient202_270,
    output := OriginalRow227TriangleData2014.coefficient203_270, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_272, Icur := OriginalRow227TriangleData2010.coefficient202_271,
    output := OriginalRow227TriangleData2014.coefficient203_271, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_273, Icur := OriginalRow227TriangleData2010.coefficient202_272,
    output := OriginalRow227TriangleData2014.coefficient203_272, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_274, Icur := OriginalRow227TriangleData2010.coefficient202_273,
    output := OriginalRow227TriangleData2014.coefficient203_273, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_275, Icur := OriginalRow227TriangleData2010.coefficient202_274,
    output := OriginalRow227TriangleData2014.coefficient203_274, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_276, Icur := OriginalRow227TriangleData2010.coefficient202_275,
    output := OriginalRow227TriangleData2014.coefficient203_275, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_277, Icur := OriginalRow227TriangleData2010.coefficient202_276,
    output := OriginalRow227TriangleData2014.coefficient203_276, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_278, Icur := OriginalRow227TriangleData2010.coefficient202_277,
    output := OriginalRow227TriangleData2014.coefficient203_277, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_279, Icur := OriginalRow227TriangleData2010.coefficient202_278,
    output := OriginalRow227TriangleData2014.coefficient203_278, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_280, Icur := OriginalRow227TriangleData2010.coefficient202_279,
    output := OriginalRow227TriangleData2014.coefficient203_279, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_281, Icur := OriginalRow227TriangleData2010.coefficient202_280,
    output := OriginalRow227TriangleData2014.coefficient203_280, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_282, Icur := OriginalRow227TriangleData2010.coefficient202_281,
    output := OriginalRow227TriangleData2014.coefficient203_281, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_283, Icur := OriginalRow227TriangleData2010.coefficient202_282,
    output := OriginalRow227TriangleData2014.coefficient203_282, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_284, Icur := OriginalRow227TriangleData2010.coefficient202_283,
    output := OriginalRow227TriangleData2014.coefficient203_283, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_285, Icur := OriginalRow227TriangleData2010.coefficient202_284,
    output := OriginalRow227TriangleData2014.coefficient203_284, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_286, Icur := OriginalRow227TriangleData2010.coefficient202_285,
    output := OriginalRow227TriangleData2014.coefficient203_285, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_287, Icur := OriginalRow227TriangleData2010.coefficient202_286,
    output := OriginalRow227TriangleData2014.coefficient203_286, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_288, Icur := OriginalRow227TriangleData2010.coefficient202_287,
    output := OriginalRow227TriangleData2014.coefficient203_287, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_289, Icur := OriginalRow227TriangleData2010.coefficient202_288,
    output := OriginalRow227TriangleData2014.coefficient203_288, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_290, Icur := OriginalRow227TriangleData2010.coefficient202_289,
    output := OriginalRow227TriangleData2014.coefficient203_289, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_291, Icur := OriginalRow227TriangleData2010.coefficient202_290,
    output := OriginalRow227TriangleData2014.coefficient203_290, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_292, Icur := OriginalRow227TriangleData2010.coefficient202_291,
    output := OriginalRow227TriangleData2014.coefficient203_291, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_293, Icur := OriginalRow227TriangleData2010.coefficient202_292,
    output := OriginalRow227TriangleData2014.coefficient203_292, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_294, Icur := OriginalRow227TriangleData2010.coefficient202_293,
    output := OriginalRow227TriangleData2014.coefficient203_293, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_295, Icur := OriginalRow227TriangleData2010.coefficient202_294,
    output := OriginalRow227TriangleData2014.coefficient203_294, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_296, Icur := OriginalRow227TriangleData2010.coefficient202_295,
    output := OriginalRow227TriangleData2014.coefficient203_295, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2011.coefficient202_297, Icur := OriginalRow227TriangleData2010.coefficient202_296,
    output := OriginalRow227TriangleData2014.coefficient203_296, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2011.coefficient202_298, Icur := OriginalRow227TriangleData2011.coefficient202_297,
    output := OriginalRow227TriangleData2014.coefficient203_297, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1998

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1998.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
