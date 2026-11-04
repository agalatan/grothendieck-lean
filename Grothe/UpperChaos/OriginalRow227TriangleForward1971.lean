import Grothe.UpperChaos.OriginalRow227TriangleData1983
import Grothe.UpperChaos.OriginalRow227TriangleData1987
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1971
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_292, Icur := OriginalRow227TriangleData1983.coefficient195_291,
    output := OriginalRow227TriangleData1987.coefficient196_291, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_293, Icur := OriginalRow227TriangleData1983.coefficient195_292,
    output := OriginalRow227TriangleData1987.coefficient196_292, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_294, Icur := OriginalRow227TriangleData1983.coefficient195_293,
    output := OriginalRow227TriangleData1987.coefficient196_293, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_295, Icur := OriginalRow227TriangleData1983.coefficient195_294,
    output := OriginalRow227TriangleData1987.coefficient196_294, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_296, Icur := OriginalRow227TriangleData1983.coefficient195_295,
    output := OriginalRow227TriangleData1987.coefficient196_295, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_297, Icur := OriginalRow227TriangleData1983.coefficient195_296,
    output := OriginalRow227TriangleData1987.coefficient196_296, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_298, Icur := OriginalRow227TriangleData1983.coefficient195_297,
    output := OriginalRow227TriangleData1987.coefficient196_297, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_299, Icur := OriginalRow227TriangleData1983.coefficient195_298,
    output := OriginalRow227TriangleData1987.coefficient196_298, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_300, Icur := OriginalRow227TriangleData1983.coefficient195_299,
    output := OriginalRow227TriangleData1987.coefficient196_299, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_301, Icur := OriginalRow227TriangleData1983.coefficient195_300,
    output := OriginalRow227TriangleData1987.coefficient196_300, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_302, Icur := OriginalRow227TriangleData1983.coefficient195_301,
    output := OriginalRow227TriangleData1987.coefficient196_301, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_303, Icur := OriginalRow227TriangleData1983.coefficient195_302,
    output := OriginalRow227TriangleData1987.coefficient196_302, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_304, Icur := OriginalRow227TriangleData1983.coefficient195_303,
    output := OriginalRow227TriangleData1987.coefficient196_303, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_305, Icur := OriginalRow227TriangleData1983.coefficient195_304,
    output := OriginalRow227TriangleData1987.coefficient196_304, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1983.coefficient195_306, Icur := OriginalRow227TriangleData1983.coefficient195_305,
    output := OriginalRow227TriangleData1987.coefficient196_305, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1971

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1971.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
