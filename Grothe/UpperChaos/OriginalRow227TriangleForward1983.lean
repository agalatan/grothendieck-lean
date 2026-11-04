import Grothe.UpperChaos.OriginalRow227TriangleData1995
import Grothe.UpperChaos.OriginalRow227TriangleData1999
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1983
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_295, Icur := OriginalRow227TriangleData1995.coefficient198_294,
    output := OriginalRow227TriangleData1999.coefficient199_294, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_296, Icur := OriginalRow227TriangleData1995.coefficient198_295,
    output := OriginalRow227TriangleData1999.coefficient199_295, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_297, Icur := OriginalRow227TriangleData1995.coefficient198_296,
    output := OriginalRow227TriangleData1999.coefficient199_296, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_298, Icur := OriginalRow227TriangleData1995.coefficient198_297,
    output := OriginalRow227TriangleData1999.coefficient199_297, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_299, Icur := OriginalRow227TriangleData1995.coefficient198_298,
    output := OriginalRow227TriangleData1999.coefficient199_298, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_300, Icur := OriginalRow227TriangleData1995.coefficient198_299,
    output := OriginalRow227TriangleData1999.coefficient199_299, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_301, Icur := OriginalRow227TriangleData1995.coefficient198_300,
    output := OriginalRow227TriangleData1999.coefficient199_300, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_302, Icur := OriginalRow227TriangleData1995.coefficient198_301,
    output := OriginalRow227TriangleData1999.coefficient199_301, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1995.coefficient198_303, Icur := OriginalRow227TriangleData1995.coefficient198_302,
    output := OriginalRow227TriangleData1999.coefficient199_302, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1983

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1983.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
