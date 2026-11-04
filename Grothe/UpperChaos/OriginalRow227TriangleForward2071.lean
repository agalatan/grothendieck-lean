import Grothe.UpperChaos.OriginalRow227TriangleData2085
import Grothe.UpperChaos.OriginalRow227TriangleData2087
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2071
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_263, Icur := OriginalRow227TriangleData2085.coefficient230_262,
    output := OriginalRow227TriangleData2087.coefficient231_262, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_264, Icur := OriginalRow227TriangleData2085.coefficient230_263,
    output := OriginalRow227TriangleData2087.coefficient231_263, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_265, Icur := OriginalRow227TriangleData2085.coefficient230_264,
    output := OriginalRow227TriangleData2087.coefficient231_264, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_266, Icur := OriginalRow227TriangleData2085.coefficient230_265,
    output := OriginalRow227TriangleData2087.coefficient231_265, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_267, Icur := OriginalRow227TriangleData2085.coefficient230_266,
    output := OriginalRow227TriangleData2087.coefficient231_266, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_268, Icur := OriginalRow227TriangleData2085.coefficient230_267,
    output := OriginalRow227TriangleData2087.coefficient231_267, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_269, Icur := OriginalRow227TriangleData2085.coefficient230_268,
    output := OriginalRow227TriangleData2087.coefficient231_268, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_270, Icur := OriginalRow227TriangleData2085.coefficient230_269,
    output := OriginalRow227TriangleData2087.coefficient231_269, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots07.root231,
    Inext := OriginalRow227TriangleData2085.coefficient230_271, Icur := OriginalRow227TriangleData2085.coefficient230_270,
    output := OriginalRow227TriangleData2087.coefficient231_270, hC := OriginalRow227TriangleRoots07.root231_pos, hAC := OriginalRow227TriangleRoots07.product231_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2071

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2071.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
