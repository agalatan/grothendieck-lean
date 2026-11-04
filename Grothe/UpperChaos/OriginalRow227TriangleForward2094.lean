import Grothe.UpperChaos.OriginalRow227TriangleData2109
import Grothe.UpperChaos.OriginalRow227TriangleData2110
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2094
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root250,
    Inext := OriginalRow227TriangleData2109.coefficient249_250, Icur := OriginalRow227TriangleData2109.coefficient249_249,
    output := OriginalRow227TriangleData2110.coefficient250_249, hC := OriginalRow227TriangleRoots07.root250_pos, hAC := OriginalRow227TriangleRoots07.product250_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root250,
    Inext := OriginalRow227TriangleData2109.coefficient249_251, Icur := OriginalRow227TriangleData2109.coefficient249_250,
    output := OriginalRow227TriangleData2110.coefficient250_250, hC := OriginalRow227TriangleRoots07.root250_pos, hAC := OriginalRow227TriangleRoots07.product250_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root250,
    Inext := OriginalRow227TriangleData2109.coefficient249_252, Icur := OriginalRow227TriangleData2109.coefficient249_251,
    output := OriginalRow227TriangleData2110.coefficient250_251, hC := OriginalRow227TriangleRoots07.root250_pos, hAC := OriginalRow227TriangleRoots07.product250_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2094

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2094.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
