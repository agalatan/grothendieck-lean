import Grothe.UpperChaos.OriginalRow227TriangleData2091
import Grothe.UpperChaos.OriginalRow227TriangleData2093
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2077
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root234,
    Inext := OriginalRow227TriangleData2091.coefficient233_266, Icur := OriginalRow227TriangleData2091.coefficient233_265,
    output := OriginalRow227TriangleData2093.coefficient234_265, hC := OriginalRow227TriangleRoots07.root234_pos, hAC := OriginalRow227TriangleRoots07.product234_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots07.root234,
    Inext := OriginalRow227TriangleData2091.coefficient233_267, Icur := OriginalRow227TriangleData2091.coefficient233_266,
    output := OriginalRow227TriangleData2093.coefficient234_266, hC := OriginalRow227TriangleRoots07.root234_pos, hAC := OriginalRow227TriangleRoots07.product234_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots07.root234,
    Inext := OriginalRow227TriangleData2091.coefficient233_268, Icur := OriginalRow227TriangleData2091.coefficient233_267,
    output := OriginalRow227TriangleData2093.coefficient234_267, hC := OriginalRow227TriangleRoots07.root234_pos, hAC := OriginalRow227TriangleRoots07.product234_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2077

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2077.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
