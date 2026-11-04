import Grothe.UpperChaos.OriginalRow227TriangleData1921
import Grothe.UpperChaos.OriginalRow227TriangleData1926
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1910
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_310, Icur := OriginalRow227TriangleData1921.coefficient181_309,
    output := OriginalRow227TriangleData1926.coefficient182_309, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_311, Icur := OriginalRow227TriangleData1921.coefficient181_310,
    output := OriginalRow227TriangleData1926.coefficient182_310, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_312, Icur := OriginalRow227TriangleData1921.coefficient181_311,
    output := OriginalRow227TriangleData1926.coefficient182_311, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_313, Icur := OriginalRow227TriangleData1921.coefficient181_312,
    output := OriginalRow227TriangleData1926.coefficient182_312, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_314, Icur := OriginalRow227TriangleData1921.coefficient181_313,
    output := OriginalRow227TriangleData1926.coefficient182_313, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_315, Icur := OriginalRow227TriangleData1921.coefficient181_314,
    output := OriginalRow227TriangleData1926.coefficient182_314, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_316, Icur := OriginalRow227TriangleData1921.coefficient181_315,
    output := OriginalRow227TriangleData1926.coefficient182_315, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_317, Icur := OriginalRow227TriangleData1921.coefficient181_316,
    output := OriginalRow227TriangleData1926.coefficient182_316, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_318, Icur := OriginalRow227TriangleData1921.coefficient181_317,
    output := OriginalRow227TriangleData1926.coefficient182_317, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_319, Icur := OriginalRow227TriangleData1921.coefficient181_318,
    output := OriginalRow227TriangleData1926.coefficient182_318, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_320, Icur := OriginalRow227TriangleData1921.coefficient181_319,
    output := OriginalRow227TriangleData1926.coefficient182_319, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1910

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1910.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
