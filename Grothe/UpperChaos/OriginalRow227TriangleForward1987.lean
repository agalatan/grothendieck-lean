import Grothe.UpperChaos.OriginalRow227TriangleData1999
import Grothe.UpperChaos.OriginalRow227TriangleData2003
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1987
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_296, Icur := OriginalRow227TriangleData1999.coefficient199_295,
    output := OriginalRow227TriangleData2003.coefficient200_295, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_297, Icur := OriginalRow227TriangleData1999.coefficient199_296,
    output := OriginalRow227TriangleData2003.coefficient200_296, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_298, Icur := OriginalRow227TriangleData1999.coefficient199_297,
    output := OriginalRow227TriangleData2003.coefficient200_297, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_299, Icur := OriginalRow227TriangleData1999.coefficient199_298,
    output := OriginalRow227TriangleData2003.coefficient200_298, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_300, Icur := OriginalRow227TriangleData1999.coefficient199_299,
    output := OriginalRow227TriangleData2003.coefficient200_299, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_301, Icur := OriginalRow227TriangleData1999.coefficient199_300,
    output := OriginalRow227TriangleData2003.coefficient200_300, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1999.coefficient199_302, Icur := OriginalRow227TriangleData1999.coefficient199_301,
    output := OriginalRow227TriangleData2003.coefficient200_301, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1987

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1987.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
