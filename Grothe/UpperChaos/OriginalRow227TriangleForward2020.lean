import Grothe.UpperChaos.OriginalRow227TriangleData2033
import Grothe.UpperChaos.OriginalRow227TriangleData2036
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2020
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_274, Icur := OriginalRow227TriangleData2033.coefficient209_273,
    output := OriginalRow227TriangleData2036.coefficient210_273, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_275, Icur := OriginalRow227TriangleData2033.coefficient209_274,
    output := OriginalRow227TriangleData2036.coefficient210_274, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_276, Icur := OriginalRow227TriangleData2033.coefficient209_275,
    output := OriginalRow227TriangleData2036.coefficient210_275, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_277, Icur := OriginalRow227TriangleData2033.coefficient209_276,
    output := OriginalRow227TriangleData2036.coefficient210_276, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_278, Icur := OriginalRow227TriangleData2033.coefficient209_277,
    output := OriginalRow227TriangleData2036.coefficient210_277, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_279, Icur := OriginalRow227TriangleData2033.coefficient209_278,
    output := OriginalRow227TriangleData2036.coefficient210_278, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_280, Icur := OriginalRow227TriangleData2033.coefficient209_279,
    output := OriginalRow227TriangleData2036.coefficient210_279, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_281, Icur := OriginalRow227TriangleData2033.coefficient209_280,
    output := OriginalRow227TriangleData2036.coefficient210_280, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_282, Icur := OriginalRow227TriangleData2033.coefficient209_281,
    output := OriginalRow227TriangleData2036.coefficient210_281, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_283, Icur := OriginalRow227TriangleData2033.coefficient209_282,
    output := OriginalRow227TriangleData2036.coefficient210_282, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_284, Icur := OriginalRow227TriangleData2033.coefficient209_283,
    output := OriginalRow227TriangleData2036.coefficient210_283, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_285, Icur := OriginalRow227TriangleData2033.coefficient209_284,
    output := OriginalRow227TriangleData2036.coefficient210_284, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_286, Icur := OriginalRow227TriangleData2033.coefficient209_285,
    output := OriginalRow227TriangleData2036.coefficient210_285, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_287, Icur := OriginalRow227TriangleData2033.coefficient209_286,
    output := OriginalRow227TriangleData2036.coefficient210_286, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_288, Icur := OriginalRow227TriangleData2033.coefficient209_287,
    output := OriginalRow227TriangleData2036.coefficient210_287, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_289, Icur := OriginalRow227TriangleData2033.coefficient209_288,
    output := OriginalRow227TriangleData2036.coefficient210_288, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_290, Icur := OriginalRow227TriangleData2033.coefficient209_289,
    output := OriginalRow227TriangleData2036.coefficient210_289, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_291, Icur := OriginalRow227TriangleData2033.coefficient209_290,
    output := OriginalRow227TriangleData2036.coefficient210_290, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_292, Icur := OriginalRow227TriangleData2033.coefficient209_291,
    output := OriginalRow227TriangleData2036.coefficient210_291, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2020

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2020.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
