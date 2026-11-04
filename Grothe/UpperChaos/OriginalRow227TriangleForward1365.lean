import Grothe.UpperChaos.OriginalRow227TriangleData1371
import Grothe.UpperChaos.OriginalRow227TriangleData1381
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1365
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1371.coefficient105_394, Icur := OriginalRow227TriangleData1371.coefficient105_393,
    output := OriginalRow227TriangleData1381.coefficient106_393, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1371.coefficient105_395, Icur := OriginalRow227TriangleData1371.coefficient105_394,
    output := OriginalRow227TriangleData1381.coefficient106_394, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1371.coefficient105_396, Icur := OriginalRow227TriangleData1371.coefficient105_395,
    output := OriginalRow227TriangleData1381.coefficient106_395, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1365

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1365.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
