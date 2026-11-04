import Grothe.UpperChaos.OriginalRow227TriangleData2007
import Grothe.UpperChaos.OriginalRow227TriangleData2011
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1995
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2007.coefficient201_298, Icur := OriginalRow227TriangleData2007.coefficient201_297,
    output := OriginalRow227TriangleData2011.coefficient202_297, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2007.coefficient201_299, Icur := OriginalRow227TriangleData2007.coefficient201_298,
    output := OriginalRow227TriangleData2011.coefficient202_298, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root202,
    Inext := OriginalRow227TriangleData2007.coefficient201_300, Icur := OriginalRow227TriangleData2007.coefficient201_299,
    output := OriginalRow227TriangleData2011.coefficient202_299, hC := OriginalRow227TriangleRoots06.root202_pos, hAC := OriginalRow227TriangleRoots06.product202_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1995

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1995.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
