import Grothe.UpperChaos.OriginalRow227TriangleData1754
import Grothe.UpperChaos.OriginalRow227TriangleData1761
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1745
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1754.coefficient152_345, Icur := OriginalRow227TriangleData1754.coefficient152_344,
    output := OriginalRow227TriangleData1761.coefficient153_344, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1754.coefficient152_346, Icur := OriginalRow227TriangleData1754.coefficient152_345,
    output := OriginalRow227TriangleData1761.coefficient153_345, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1754.coefficient152_347, Icur := OriginalRow227TriangleData1754.coefficient152_346,
    output := OriginalRow227TriangleData1761.coefficient153_346, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1754.coefficient152_348, Icur := OriginalRow227TriangleData1754.coefficient152_347,
    output := OriginalRow227TriangleData1761.coefficient153_347, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1754.coefficient152_349, Icur := OriginalRow227TriangleData1754.coefficient152_348,
    output := OriginalRow227TriangleData1761.coefficient153_348, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1745

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1745.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
