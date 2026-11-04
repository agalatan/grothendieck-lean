import Grothe.UpperChaos.OriginalRow227TriangleData2027
import Grothe.UpperChaos.OriginalRow227TriangleData2030
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2014
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_272, Icur := OriginalRow227TriangleData2027.coefficient207_271,
    output := OriginalRow227TriangleData2030.coefficient208_271, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_273, Icur := OriginalRow227TriangleData2027.coefficient207_272,
    output := OriginalRow227TriangleData2030.coefficient208_272, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_274, Icur := OriginalRow227TriangleData2027.coefficient207_273,
    output := OriginalRow227TriangleData2030.coefficient208_273, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_275, Icur := OriginalRow227TriangleData2027.coefficient207_274,
    output := OriginalRow227TriangleData2030.coefficient208_274, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_276, Icur := OriginalRow227TriangleData2027.coefficient207_275,
    output := OriginalRow227TriangleData2030.coefficient208_275, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_277, Icur := OriginalRow227TriangleData2027.coefficient207_276,
    output := OriginalRow227TriangleData2030.coefficient208_276, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_278, Icur := OriginalRow227TriangleData2027.coefficient207_277,
    output := OriginalRow227TriangleData2030.coefficient208_277, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_279, Icur := OriginalRow227TriangleData2027.coefficient207_278,
    output := OriginalRow227TriangleData2030.coefficient208_278, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_280, Icur := OriginalRow227TriangleData2027.coefficient207_279,
    output := OriginalRow227TriangleData2030.coefficient208_279, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_281, Icur := OriginalRow227TriangleData2027.coefficient207_280,
    output := OriginalRow227TriangleData2030.coefficient208_280, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_282, Icur := OriginalRow227TriangleData2027.coefficient207_281,
    output := OriginalRow227TriangleData2030.coefficient208_281, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_283, Icur := OriginalRow227TriangleData2027.coefficient207_282,
    output := OriginalRow227TriangleData2030.coefficient208_282, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_284, Icur := OriginalRow227TriangleData2027.coefficient207_283,
    output := OriginalRow227TriangleData2030.coefficient208_283, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_285, Icur := OriginalRow227TriangleData2027.coefficient207_284,
    output := OriginalRow227TriangleData2030.coefficient208_284, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_286, Icur := OriginalRow227TriangleData2027.coefficient207_285,
    output := OriginalRow227TriangleData2030.coefficient208_285, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_287, Icur := OriginalRow227TriangleData2027.coefficient207_286,
    output := OriginalRow227TriangleData2030.coefficient208_286, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_288, Icur := OriginalRow227TriangleData2027.coefficient207_287,
    output := OriginalRow227TriangleData2030.coefficient208_287, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_289, Icur := OriginalRow227TriangleData2027.coefficient207_288,
    output := OriginalRow227TriangleData2030.coefficient208_288, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_290, Icur := OriginalRow227TriangleData2027.coefficient207_289,
    output := OriginalRow227TriangleData2030.coefficient208_289, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_291, Icur := OriginalRow227TriangleData2027.coefficient207_290,
    output := OriginalRow227TriangleData2030.coefficient208_290, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_292, Icur := OriginalRow227TriangleData2027.coefficient207_291,
    output := OriginalRow227TriangleData2030.coefficient208_291, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_293, Icur := OriginalRow227TriangleData2027.coefficient207_292,
    output := OriginalRow227TriangleData2030.coefficient208_292, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root208,
    Inext := OriginalRow227TriangleData2027.coefficient207_294, Icur := OriginalRow227TriangleData2027.coefficient207_293,
    output := OriginalRow227TriangleData2030.coefficient208_293, hC := OriginalRow227TriangleRoots06.root208_pos, hAC := OriginalRow227TriangleRoots06.product208_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2014

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2014.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
