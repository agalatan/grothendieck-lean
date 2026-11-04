import Grothe.UpperChaos.OriginalRow227TriangleData2057
import Grothe.UpperChaos.OriginalRow227TriangleData2060
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2044
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2057.coefficient217_282, Icur := OriginalRow227TriangleData2057.coefficient217_281,
    output := OriginalRow227TriangleData2060.coefficient218_281, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2057.coefficient217_283, Icur := OriginalRow227TriangleData2057.coefficient217_282,
    output := OriginalRow227TriangleData2060.coefficient218_282, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2057.coefficient217_284, Icur := OriginalRow227TriangleData2057.coefficient217_283,
    output := OriginalRow227TriangleData2060.coefficient218_283, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2044

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2044.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
