import Grothe.UpperChaos.OriginalRow227TriangleData1991
import Grothe.UpperChaos.OriginalRow227TriangleData1995
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1979
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_294, Icur := OriginalRow227TriangleData1991.coefficient197_293,
    output := OriginalRow227TriangleData1995.coefficient198_293, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_295, Icur := OriginalRow227TriangleData1991.coefficient197_294,
    output := OriginalRow227TriangleData1995.coefficient198_294, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_296, Icur := OriginalRow227TriangleData1991.coefficient197_295,
    output := OriginalRow227TriangleData1995.coefficient198_295, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_297, Icur := OriginalRow227TriangleData1991.coefficient197_296,
    output := OriginalRow227TriangleData1995.coefficient198_296, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_298, Icur := OriginalRow227TriangleData1991.coefficient197_297,
    output := OriginalRow227TriangleData1995.coefficient198_297, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_299, Icur := OriginalRow227TriangleData1991.coefficient197_298,
    output := OriginalRow227TriangleData1995.coefficient198_298, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_300, Icur := OriginalRow227TriangleData1991.coefficient197_299,
    output := OriginalRow227TriangleData1995.coefficient198_299, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_301, Icur := OriginalRow227TriangleData1991.coefficient197_300,
    output := OriginalRow227TriangleData1995.coefficient198_300, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_302, Icur := OriginalRow227TriangleData1991.coefficient197_301,
    output := OriginalRow227TriangleData1995.coefficient198_301, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_303, Icur := OriginalRow227TriangleData1991.coefficient197_302,
    output := OriginalRow227TriangleData1995.coefficient198_302, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots06.root198,
    Inext := OriginalRow227TriangleData1991.coefficient197_304, Icur := OriginalRow227TriangleData1991.coefficient197_303,
    output := OriginalRow227TriangleData1995.coefficient198_303, hC := OriginalRow227TriangleRoots06.root198_pos, hAC := OriginalRow227TriangleRoots06.product198_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1979

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1979.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
