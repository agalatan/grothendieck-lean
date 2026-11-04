import Grothe.UpperChaos.OriginalRow227TriangleData1926
import Grothe.UpperChaos.OriginalRow227TriangleData1931
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1915
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_311, Icur := OriginalRow227TriangleData1926.coefficient182_310,
    output := OriginalRow227TriangleData1931.coefficient183_310, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_312, Icur := OriginalRow227TriangleData1926.coefficient182_311,
    output := OriginalRow227TriangleData1931.coefficient183_311, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_313, Icur := OriginalRow227TriangleData1926.coefficient182_312,
    output := OriginalRow227TriangleData1931.coefficient183_312, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_314, Icur := OriginalRow227TriangleData1926.coefficient182_313,
    output := OriginalRow227TriangleData1931.coefficient183_313, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_315, Icur := OriginalRow227TriangleData1926.coefficient182_314,
    output := OriginalRow227TriangleData1931.coefficient183_314, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_316, Icur := OriginalRow227TriangleData1926.coefficient182_315,
    output := OriginalRow227TriangleData1931.coefficient183_315, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_317, Icur := OriginalRow227TriangleData1926.coefficient182_316,
    output := OriginalRow227TriangleData1931.coefficient183_316, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_318, Icur := OriginalRow227TriangleData1926.coefficient182_317,
    output := OriginalRow227TriangleData1931.coefficient183_317, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1926.coefficient182_319, Icur := OriginalRow227TriangleData1926.coefficient182_318,
    output := OriginalRow227TriangleData1931.coefficient183_318, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1915

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1915.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
