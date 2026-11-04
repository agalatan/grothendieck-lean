import Grothe.UpperChaos.OriginalRow227TriangleData2011
import Grothe.UpperChaos.OriginalRow227TriangleData2015
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1999
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2011.coefficient202_299, Icur := OriginalRow227TriangleData2011.coefficient202_298,
    output := OriginalRow227TriangleData2015.coefficient203_298, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1999

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1999.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
