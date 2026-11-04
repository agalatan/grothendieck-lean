import Grothe.UpperChaos.OriginalRow227TriangleData2045
import Grothe.UpperChaos.OriginalRow227TriangleData2048
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2032
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_278, Icur := OriginalRow227TriangleData2045.coefficient213_277,
    output := OriginalRow227TriangleData2048.coefficient214_277, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_279, Icur := OriginalRow227TriangleData2045.coefficient213_278,
    output := OriginalRow227TriangleData2048.coefficient214_278, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_280, Icur := OriginalRow227TriangleData2045.coefficient213_279,
    output := OriginalRow227TriangleData2048.coefficient214_279, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_281, Icur := OriginalRow227TriangleData2045.coefficient213_280,
    output := OriginalRow227TriangleData2048.coefficient214_280, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_282, Icur := OriginalRow227TriangleData2045.coefficient213_281,
    output := OriginalRow227TriangleData2048.coefficient214_281, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_283, Icur := OriginalRow227TriangleData2045.coefficient213_282,
    output := OriginalRow227TriangleData2048.coefficient214_282, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_284, Icur := OriginalRow227TriangleData2045.coefficient213_283,
    output := OriginalRow227TriangleData2048.coefficient214_283, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_285, Icur := OriginalRow227TriangleData2045.coefficient213_284,
    output := OriginalRow227TriangleData2048.coefficient214_284, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_286, Icur := OriginalRow227TriangleData2045.coefficient213_285,
    output := OriginalRow227TriangleData2048.coefficient214_285, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_287, Icur := OriginalRow227TriangleData2045.coefficient213_286,
    output := OriginalRow227TriangleData2048.coefficient214_286, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2045.coefficient213_288, Icur := OriginalRow227TriangleData2045.coefficient213_287,
    output := OriginalRow227TriangleData2048.coefficient214_287, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2032

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2032.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
