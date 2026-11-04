import Grothe.UpperChaos.OriginalRow227TriangleData0000
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBase
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

theorem checked : (integerInterval 1).subset OriginalRow227TriangleData0000.coefficient0_0 = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleBase

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleBase.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
