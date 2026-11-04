import Grothe.UpperChaos.OriginalRow227TriangleData1971
import Grothe.UpperChaos.OriginalRow227TriangleData1975
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1959
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_289, Icur := OriginalRow227TriangleData1971.coefficient192_288,
    output := OriginalRow227TriangleData1975.coefficient193_288, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_290, Icur := OriginalRow227TriangleData1971.coefficient192_289,
    output := OriginalRow227TriangleData1975.coefficient193_289, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_291, Icur := OriginalRow227TriangleData1971.coefficient192_290,
    output := OriginalRow227TriangleData1975.coefficient193_290, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_292, Icur := OriginalRow227TriangleData1971.coefficient192_291,
    output := OriginalRow227TriangleData1975.coefficient193_291, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_293, Icur := OriginalRow227TriangleData1971.coefficient192_292,
    output := OriginalRow227TriangleData1975.coefficient193_292, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_294, Icur := OriginalRow227TriangleData1971.coefficient192_293,
    output := OriginalRow227TriangleData1975.coefficient193_293, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_295, Icur := OriginalRow227TriangleData1971.coefficient192_294,
    output := OriginalRow227TriangleData1975.coefficient193_294, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_296, Icur := OriginalRow227TriangleData1971.coefficient192_295,
    output := OriginalRow227TriangleData1975.coefficient193_295, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_297, Icur := OriginalRow227TriangleData1971.coefficient192_296,
    output := OriginalRow227TriangleData1975.coefficient193_296, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_298, Icur := OriginalRow227TriangleData1971.coefficient192_297,
    output := OriginalRow227TriangleData1975.coefficient193_297, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_299, Icur := OriginalRow227TriangleData1971.coefficient192_298,
    output := OriginalRow227TriangleData1975.coefficient193_298, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_300, Icur := OriginalRow227TriangleData1971.coefficient192_299,
    output := OriginalRow227TriangleData1975.coefficient193_299, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_301, Icur := OriginalRow227TriangleData1971.coefficient192_300,
    output := OriginalRow227TriangleData1975.coefficient193_300, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_302, Icur := OriginalRow227TriangleData1971.coefficient192_301,
    output := OriginalRow227TriangleData1975.coefficient193_301, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_303, Icur := OriginalRow227TriangleData1971.coefficient192_302,
    output := OriginalRow227TriangleData1975.coefficient193_302, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_304, Icur := OriginalRow227TriangleData1971.coefficient192_303,
    output := OriginalRow227TriangleData1975.coefficient193_303, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_305, Icur := OriginalRow227TriangleData1971.coefficient192_304,
    output := OriginalRow227TriangleData1975.coefficient193_304, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_306, Icur := OriginalRow227TriangleData1971.coefficient192_305,
    output := OriginalRow227TriangleData1975.coefficient193_305, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_307, Icur := OriginalRow227TriangleData1971.coefficient192_306,
    output := OriginalRow227TriangleData1975.coefficient193_306, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_308, Icur := OriginalRow227TriangleData1971.coefficient192_307,
    output := OriginalRow227TriangleData1975.coefficient193_307, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1971.coefficient192_309, Icur := OriginalRow227TriangleData1971.coefficient192_308,
    output := OriginalRow227TriangleData1975.coefficient193_308, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1959

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1959.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
