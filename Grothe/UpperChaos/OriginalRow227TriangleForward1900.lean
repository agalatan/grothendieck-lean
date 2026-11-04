import Grothe.UpperChaos.OriginalRow227TriangleData1911
import Grothe.UpperChaos.OriginalRow227TriangleData1916
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1900
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_308, Icur := OriginalRow227TriangleData1911.coefficient179_307,
    output := OriginalRow227TriangleData1916.coefficient180_307, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_309, Icur := OriginalRow227TriangleData1911.coefficient179_308,
    output := OriginalRow227TriangleData1916.coefficient180_308, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_310, Icur := OriginalRow227TriangleData1911.coefficient179_309,
    output := OriginalRow227TriangleData1916.coefficient180_309, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_311, Icur := OriginalRow227TriangleData1911.coefficient179_310,
    output := OriginalRow227TriangleData1916.coefficient180_310, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_312, Icur := OriginalRow227TriangleData1911.coefficient179_311,
    output := OriginalRow227TriangleData1916.coefficient180_311, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_313, Icur := OriginalRow227TriangleData1911.coefficient179_312,
    output := OriginalRow227TriangleData1916.coefficient180_312, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_314, Icur := OriginalRow227TriangleData1911.coefficient179_313,
    output := OriginalRow227TriangleData1916.coefficient180_313, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_315, Icur := OriginalRow227TriangleData1911.coefficient179_314,
    output := OriginalRow227TriangleData1916.coefficient180_314, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_316, Icur := OriginalRow227TriangleData1911.coefficient179_315,
    output := OriginalRow227TriangleData1916.coefficient180_315, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_317, Icur := OriginalRow227TriangleData1911.coefficient179_316,
    output := OriginalRow227TriangleData1916.coefficient180_316, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_318, Icur := OriginalRow227TriangleData1911.coefficient179_317,
    output := OriginalRow227TriangleData1916.coefficient180_317, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_319, Icur := OriginalRow227TriangleData1911.coefficient179_318,
    output := OriginalRow227TriangleData1916.coefficient180_318, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_320, Icur := OriginalRow227TriangleData1911.coefficient179_319,
    output := OriginalRow227TriangleData1916.coefficient180_319, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_321, Icur := OriginalRow227TriangleData1911.coefficient179_320,
    output := OriginalRow227TriangleData1916.coefficient180_320, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_322, Icur := OriginalRow227TriangleData1911.coefficient179_321,
    output := OriginalRow227TriangleData1916.coefficient180_321, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1900

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1900.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
