import Grothe.UpperChaos.OriginalRow227TriangleData2110
import Grothe.UpperChaos.OriginalRow227TriangleData2111
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2095
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root251,
    Inext := OriginalRow227TriangleData2110.coefficient250_251, Icur := OriginalRow227TriangleData2110.coefficient250_250,
    output := OriginalRow227TriangleData2111.coefficient251_250, hC := OriginalRow227TriangleRoots07.root251_pos, hAC := OriginalRow227TriangleRoots07.product251_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2095

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2095.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
