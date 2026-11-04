import Grothe.UpperChaos.OriginalRow227TriangleData1936
import Grothe.UpperChaos.OriginalRow227TriangleData1941
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1925
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1936.coefficient184_313, Icur := OriginalRow227TriangleData1936.coefficient184_312,
    output := OriginalRow227TriangleData1941.coefficient185_312, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1936.coefficient184_314, Icur := OriginalRow227TriangleData1936.coefficient184_313,
    output := OriginalRow227TriangleData1941.coefficient185_313, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1936.coefficient184_315, Icur := OriginalRow227TriangleData1936.coefficient184_314,
    output := OriginalRow227TriangleData1941.coefficient185_314, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1936.coefficient184_316, Icur := OriginalRow227TriangleData1936.coefficient184_315,
    output := OriginalRow227TriangleData1941.coefficient185_315, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root185,
    Inext := OriginalRow227TriangleData1936.coefficient184_317, Icur := OriginalRow227TriangleData1936.coefficient184_316,
    output := OriginalRow227TriangleData1941.coefficient185_316, hC := OriginalRow227TriangleRoots05.root185_pos, hAC := OriginalRow227TriangleRoots05.product185_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1925

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1925.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
