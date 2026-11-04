import Grothe.UpperChaos.OriginalRow227TriangleData1987
import Grothe.UpperChaos.OriginalRow227TriangleData1991
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1975
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_293, Icur := OriginalRow227TriangleData1987.coefficient196_292,
    output := OriginalRow227TriangleData1991.coefficient197_292, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_294, Icur := OriginalRow227TriangleData1987.coefficient196_293,
    output := OriginalRow227TriangleData1991.coefficient197_293, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_295, Icur := OriginalRow227TriangleData1987.coefficient196_294,
    output := OriginalRow227TriangleData1991.coefficient197_294, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_296, Icur := OriginalRow227TriangleData1987.coefficient196_295,
    output := OriginalRow227TriangleData1991.coefficient197_295, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_297, Icur := OriginalRow227TriangleData1987.coefficient196_296,
    output := OriginalRow227TriangleData1991.coefficient197_296, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_298, Icur := OriginalRow227TriangleData1987.coefficient196_297,
    output := OriginalRow227TriangleData1991.coefficient197_297, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_299, Icur := OriginalRow227TriangleData1987.coefficient196_298,
    output := OriginalRow227TriangleData1991.coefficient197_298, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_300, Icur := OriginalRow227TriangleData1987.coefficient196_299,
    output := OriginalRow227TriangleData1991.coefficient197_299, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_301, Icur := OriginalRow227TriangleData1987.coefficient196_300,
    output := OriginalRow227TriangleData1991.coefficient197_300, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_302, Icur := OriginalRow227TriangleData1987.coefficient196_301,
    output := OriginalRow227TriangleData1991.coefficient197_301, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_303, Icur := OriginalRow227TriangleData1987.coefficient196_302,
    output := OriginalRow227TriangleData1991.coefficient197_302, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_304, Icur := OriginalRow227TriangleData1987.coefficient196_303,
    output := OriginalRow227TriangleData1991.coefficient197_303, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1987.coefficient196_305, Icur := OriginalRow227TriangleData1987.coefficient196_304,
    output := OriginalRow227TriangleData1991.coefficient197_304, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1975

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1975.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
