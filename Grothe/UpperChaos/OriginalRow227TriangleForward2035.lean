import Grothe.UpperChaos.OriginalRow227TriangleData2048
import Grothe.UpperChaos.OriginalRow227TriangleData2051
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2035
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_279, Icur := OriginalRow227TriangleData2048.coefficient214_278,
    output := OriginalRow227TriangleData2051.coefficient215_278, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_280, Icur := OriginalRow227TriangleData2048.coefficient214_279,
    output := OriginalRow227TriangleData2051.coefficient215_279, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_281, Icur := OriginalRow227TriangleData2048.coefficient214_280,
    output := OriginalRow227TriangleData2051.coefficient215_280, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_282, Icur := OriginalRow227TriangleData2048.coefficient214_281,
    output := OriginalRow227TriangleData2051.coefficient215_281, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_283, Icur := OriginalRow227TriangleData2048.coefficient214_282,
    output := OriginalRow227TriangleData2051.coefficient215_282, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_284, Icur := OriginalRow227TriangleData2048.coefficient214_283,
    output := OriginalRow227TriangleData2051.coefficient215_283, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_285, Icur := OriginalRow227TriangleData2048.coefficient214_284,
    output := OriginalRow227TriangleData2051.coefficient215_284, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_286, Icur := OriginalRow227TriangleData2048.coefficient214_285,
    output := OriginalRow227TriangleData2051.coefficient215_285, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_287, Icur := OriginalRow227TriangleData2048.coefficient214_286,
    output := OriginalRow227TriangleData2051.coefficient215_286, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2035

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2035.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
