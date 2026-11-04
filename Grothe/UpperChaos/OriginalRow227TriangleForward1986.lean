import Grothe.UpperChaos.OriginalRow227TriangleData1998
import Grothe.UpperChaos.OriginalRow227TriangleData1999
import Grothe.UpperChaos.OriginalRow227TriangleData2002
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1986
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_264, Icur := OriginalRow227TriangleData1998.coefficient199_263,
    output := OriginalRow227TriangleData2002.coefficient200_263, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_265, Icur := OriginalRow227TriangleData1998.coefficient199_264,
    output := OriginalRow227TriangleData2002.coefficient200_264, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_266, Icur := OriginalRow227TriangleData1998.coefficient199_265,
    output := OriginalRow227TriangleData2002.coefficient200_265, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_267, Icur := OriginalRow227TriangleData1998.coefficient199_266,
    output := OriginalRow227TriangleData2002.coefficient200_266, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_268, Icur := OriginalRow227TriangleData1998.coefficient199_267,
    output := OriginalRow227TriangleData2002.coefficient200_267, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_269, Icur := OriginalRow227TriangleData1998.coefficient199_268,
    output := OriginalRow227TriangleData2002.coefficient200_268, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_270, Icur := OriginalRow227TriangleData1998.coefficient199_269,
    output := OriginalRow227TriangleData2002.coefficient200_269, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_271, Icur := OriginalRow227TriangleData1998.coefficient199_270,
    output := OriginalRow227TriangleData2002.coefficient200_270, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_272, Icur := OriginalRow227TriangleData1998.coefficient199_271,
    output := OriginalRow227TriangleData2002.coefficient200_271, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_273, Icur := OriginalRow227TriangleData1998.coefficient199_272,
    output := OriginalRow227TriangleData2002.coefficient200_272, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_274, Icur := OriginalRow227TriangleData1998.coefficient199_273,
    output := OriginalRow227TriangleData2002.coefficient200_273, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_275, Icur := OriginalRow227TriangleData1998.coefficient199_274,
    output := OriginalRow227TriangleData2002.coefficient200_274, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_276, Icur := OriginalRow227TriangleData1998.coefficient199_275,
    output := OriginalRow227TriangleData2002.coefficient200_275, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_277, Icur := OriginalRow227TriangleData1998.coefficient199_276,
    output := OriginalRow227TriangleData2002.coefficient200_276, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_278, Icur := OriginalRow227TriangleData1998.coefficient199_277,
    output := OriginalRow227TriangleData2002.coefficient200_277, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_279, Icur := OriginalRow227TriangleData1998.coefficient199_278,
    output := OriginalRow227TriangleData2002.coefficient200_278, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_280, Icur := OriginalRow227TriangleData1998.coefficient199_279,
    output := OriginalRow227TriangleData2002.coefficient200_279, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_281, Icur := OriginalRow227TriangleData1998.coefficient199_280,
    output := OriginalRow227TriangleData2002.coefficient200_280, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_282, Icur := OriginalRow227TriangleData1998.coefficient199_281,
    output := OriginalRow227TriangleData2002.coefficient200_281, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_283, Icur := OriginalRow227TriangleData1998.coefficient199_282,
    output := OriginalRow227TriangleData2002.coefficient200_282, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_284, Icur := OriginalRow227TriangleData1998.coefficient199_283,
    output := OriginalRow227TriangleData2002.coefficient200_283, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_285, Icur := OriginalRow227TriangleData1998.coefficient199_284,
    output := OriginalRow227TriangleData2002.coefficient200_284, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_286, Icur := OriginalRow227TriangleData1998.coefficient199_285,
    output := OriginalRow227TriangleData2002.coefficient200_285, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_287, Icur := OriginalRow227TriangleData1998.coefficient199_286,
    output := OriginalRow227TriangleData2002.coefficient200_286, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_288, Icur := OriginalRow227TriangleData1998.coefficient199_287,
    output := OriginalRow227TriangleData2002.coefficient200_287, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_289, Icur := OriginalRow227TriangleData1998.coefficient199_288,
    output := OriginalRow227TriangleData2002.coefficient200_288, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_290, Icur := OriginalRow227TriangleData1998.coefficient199_289,
    output := OriginalRow227TriangleData2002.coefficient200_289, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_291, Icur := OriginalRow227TriangleData1998.coefficient199_290,
    output := OriginalRow227TriangleData2002.coefficient200_290, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_292, Icur := OriginalRow227TriangleData1998.coefficient199_291,
    output := OriginalRow227TriangleData2002.coefficient200_291, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_293, Icur := OriginalRow227TriangleData1998.coefficient199_292,
    output := OriginalRow227TriangleData2002.coefficient200_292, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_294, Icur := OriginalRow227TriangleData1998.coefficient199_293,
    output := OriginalRow227TriangleData2002.coefficient200_293, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_295, Icur := OriginalRow227TriangleData1999.coefficient199_294,
    output := OriginalRow227TriangleData2002.coefficient200_294, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1986

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1986.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
