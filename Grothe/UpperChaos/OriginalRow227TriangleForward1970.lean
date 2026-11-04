import Grothe.UpperChaos.OriginalRow227TriangleData1982
import Grothe.UpperChaos.OriginalRow227TriangleData1983
import Grothe.UpperChaos.OriginalRow227TriangleData1986
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1970
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_260, Icur := OriginalRow227TriangleData1982.coefficient195_259,
    output := OriginalRow227TriangleData1986.coefficient196_259, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_261, Icur := OriginalRow227TriangleData1982.coefficient195_260,
    output := OriginalRow227TriangleData1986.coefficient196_260, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_262, Icur := OriginalRow227TriangleData1982.coefficient195_261,
    output := OriginalRow227TriangleData1986.coefficient196_261, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_263, Icur := OriginalRow227TriangleData1982.coefficient195_262,
    output := OriginalRow227TriangleData1986.coefficient196_262, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_264, Icur := OriginalRow227TriangleData1982.coefficient195_263,
    output := OriginalRow227TriangleData1986.coefficient196_263, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_265, Icur := OriginalRow227TriangleData1982.coefficient195_264,
    output := OriginalRow227TriangleData1986.coefficient196_264, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_266, Icur := OriginalRow227TriangleData1982.coefficient195_265,
    output := OriginalRow227TriangleData1986.coefficient196_265, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_267, Icur := OriginalRow227TriangleData1982.coefficient195_266,
    output := OriginalRow227TriangleData1986.coefficient196_266, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_268, Icur := OriginalRow227TriangleData1982.coefficient195_267,
    output := OriginalRow227TriangleData1986.coefficient196_267, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_269, Icur := OriginalRow227TriangleData1982.coefficient195_268,
    output := OriginalRow227TriangleData1986.coefficient196_268, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_270, Icur := OriginalRow227TriangleData1982.coefficient195_269,
    output := OriginalRow227TriangleData1986.coefficient196_269, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_271, Icur := OriginalRow227TriangleData1982.coefficient195_270,
    output := OriginalRow227TriangleData1986.coefficient196_270, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_272, Icur := OriginalRow227TriangleData1982.coefficient195_271,
    output := OriginalRow227TriangleData1986.coefficient196_271, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_273, Icur := OriginalRow227TriangleData1982.coefficient195_272,
    output := OriginalRow227TriangleData1986.coefficient196_272, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_274, Icur := OriginalRow227TriangleData1982.coefficient195_273,
    output := OriginalRow227TriangleData1986.coefficient196_273, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_275, Icur := OriginalRow227TriangleData1982.coefficient195_274,
    output := OriginalRow227TriangleData1986.coefficient196_274, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_276, Icur := OriginalRow227TriangleData1982.coefficient195_275,
    output := OriginalRow227TriangleData1986.coefficient196_275, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_277, Icur := OriginalRow227TriangleData1982.coefficient195_276,
    output := OriginalRow227TriangleData1986.coefficient196_276, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_278, Icur := OriginalRow227TriangleData1982.coefficient195_277,
    output := OriginalRow227TriangleData1986.coefficient196_277, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_279, Icur := OriginalRow227TriangleData1982.coefficient195_278,
    output := OriginalRow227TriangleData1986.coefficient196_278, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_280, Icur := OriginalRow227TriangleData1982.coefficient195_279,
    output := OriginalRow227TriangleData1986.coefficient196_279, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_281, Icur := OriginalRow227TriangleData1982.coefficient195_280,
    output := OriginalRow227TriangleData1986.coefficient196_280, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_282, Icur := OriginalRow227TriangleData1982.coefficient195_281,
    output := OriginalRow227TriangleData1986.coefficient196_281, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_283, Icur := OriginalRow227TriangleData1982.coefficient195_282,
    output := OriginalRow227TriangleData1986.coefficient196_282, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_284, Icur := OriginalRow227TriangleData1982.coefficient195_283,
    output := OriginalRow227TriangleData1986.coefficient196_283, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_285, Icur := OriginalRow227TriangleData1982.coefficient195_284,
    output := OriginalRow227TriangleData1986.coefficient196_284, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_286, Icur := OriginalRow227TriangleData1982.coefficient195_285,
    output := OriginalRow227TriangleData1986.coefficient196_285, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_287, Icur := OriginalRow227TriangleData1982.coefficient195_286,
    output := OriginalRow227TriangleData1986.coefficient196_286, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_288, Icur := OriginalRow227TriangleData1982.coefficient195_287,
    output := OriginalRow227TriangleData1986.coefficient196_287, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_289, Icur := OriginalRow227TriangleData1982.coefficient195_288,
    output := OriginalRow227TriangleData1986.coefficient196_288, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_290, Icur := OriginalRow227TriangleData1982.coefficient195_289,
    output := OriginalRow227TriangleData1986.coefficient196_289, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_291, Icur := OriginalRow227TriangleData1983.coefficient195_290,
    output := OriginalRow227TriangleData1986.coefficient196_290, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1970

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1970.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
