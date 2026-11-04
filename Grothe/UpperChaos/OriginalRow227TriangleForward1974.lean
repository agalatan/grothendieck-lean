import Grothe.UpperChaos.OriginalRow227TriangleData1986
import Grothe.UpperChaos.OriginalRow227TriangleData1987
import Grothe.UpperChaos.OriginalRow227TriangleData1990
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1974
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_261, Icur := OriginalRow227TriangleData1986.coefficient196_260,
    output := OriginalRow227TriangleData1990.coefficient197_260, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_262, Icur := OriginalRow227TriangleData1986.coefficient196_261,
    output := OriginalRow227TriangleData1990.coefficient197_261, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_263, Icur := OriginalRow227TriangleData1986.coefficient196_262,
    output := OriginalRow227TriangleData1990.coefficient197_262, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_264, Icur := OriginalRow227TriangleData1986.coefficient196_263,
    output := OriginalRow227TriangleData1990.coefficient197_263, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_265, Icur := OriginalRow227TriangleData1986.coefficient196_264,
    output := OriginalRow227TriangleData1990.coefficient197_264, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_266, Icur := OriginalRow227TriangleData1986.coefficient196_265,
    output := OriginalRow227TriangleData1990.coefficient197_265, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_267, Icur := OriginalRow227TriangleData1986.coefficient196_266,
    output := OriginalRow227TriangleData1990.coefficient197_266, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_268, Icur := OriginalRow227TriangleData1986.coefficient196_267,
    output := OriginalRow227TriangleData1990.coefficient197_267, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_269, Icur := OriginalRow227TriangleData1986.coefficient196_268,
    output := OriginalRow227TriangleData1990.coefficient197_268, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_270, Icur := OriginalRow227TriangleData1986.coefficient196_269,
    output := OriginalRow227TriangleData1990.coefficient197_269, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_271, Icur := OriginalRow227TriangleData1986.coefficient196_270,
    output := OriginalRow227TriangleData1990.coefficient197_270, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_272, Icur := OriginalRow227TriangleData1986.coefficient196_271,
    output := OriginalRow227TriangleData1990.coefficient197_271, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_273, Icur := OriginalRow227TriangleData1986.coefficient196_272,
    output := OriginalRow227TriangleData1990.coefficient197_272, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_274, Icur := OriginalRow227TriangleData1986.coefficient196_273,
    output := OriginalRow227TriangleData1990.coefficient197_273, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_275, Icur := OriginalRow227TriangleData1986.coefficient196_274,
    output := OriginalRow227TriangleData1990.coefficient197_274, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_276, Icur := OriginalRow227TriangleData1986.coefficient196_275,
    output := OriginalRow227TriangleData1990.coefficient197_275, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_277, Icur := OriginalRow227TriangleData1986.coefficient196_276,
    output := OriginalRow227TriangleData1990.coefficient197_276, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_278, Icur := OriginalRow227TriangleData1986.coefficient196_277,
    output := OriginalRow227TriangleData1990.coefficient197_277, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_279, Icur := OriginalRow227TriangleData1986.coefficient196_278,
    output := OriginalRow227TriangleData1990.coefficient197_278, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_280, Icur := OriginalRow227TriangleData1986.coefficient196_279,
    output := OriginalRow227TriangleData1990.coefficient197_279, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_281, Icur := OriginalRow227TriangleData1986.coefficient196_280,
    output := OriginalRow227TriangleData1990.coefficient197_280, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_282, Icur := OriginalRow227TriangleData1986.coefficient196_281,
    output := OriginalRow227TriangleData1990.coefficient197_281, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_283, Icur := OriginalRow227TriangleData1986.coefficient196_282,
    output := OriginalRow227TriangleData1990.coefficient197_282, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_284, Icur := OriginalRow227TriangleData1986.coefficient196_283,
    output := OriginalRow227TriangleData1990.coefficient197_283, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_285, Icur := OriginalRow227TriangleData1986.coefficient196_284,
    output := OriginalRow227TriangleData1990.coefficient197_284, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_286, Icur := OriginalRow227TriangleData1986.coefficient196_285,
    output := OriginalRow227TriangleData1990.coefficient197_285, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_287, Icur := OriginalRow227TriangleData1986.coefficient196_286,
    output := OriginalRow227TriangleData1990.coefficient197_286, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_288, Icur := OriginalRow227TriangleData1986.coefficient196_287,
    output := OriginalRow227TriangleData1990.coefficient197_287, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_289, Icur := OriginalRow227TriangleData1986.coefficient196_288,
    output := OriginalRow227TriangleData1990.coefficient197_288, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_290, Icur := OriginalRow227TriangleData1986.coefficient196_289,
    output := OriginalRow227TriangleData1990.coefficient197_289, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_291, Icur := OriginalRow227TriangleData1986.coefficient196_290,
    output := OriginalRow227TriangleData1990.coefficient197_290, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_292, Icur := OriginalRow227TriangleData1987.coefficient196_291,
    output := OriginalRow227TriangleData1990.coefficient197_291, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1974

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1974.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
