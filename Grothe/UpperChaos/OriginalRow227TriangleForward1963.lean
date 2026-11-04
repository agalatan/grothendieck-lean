import Grothe.UpperChaos.OriginalRow227TriangleData1975
import Grothe.UpperChaos.OriginalRow227TriangleData1979
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1963
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_290, Icur := OriginalRow227TriangleData1975.coefficient193_289,
    output := OriginalRow227TriangleData1979.coefficient194_289, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_291, Icur := OriginalRow227TriangleData1975.coefficient193_290,
    output := OriginalRow227TriangleData1979.coefficient194_290, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_292, Icur := OriginalRow227TriangleData1975.coefficient193_291,
    output := OriginalRow227TriangleData1979.coefficient194_291, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_293, Icur := OriginalRow227TriangleData1975.coefficient193_292,
    output := OriginalRow227TriangleData1979.coefficient194_292, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_294, Icur := OriginalRow227TriangleData1975.coefficient193_293,
    output := OriginalRow227TriangleData1979.coefficient194_293, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_295, Icur := OriginalRow227TriangleData1975.coefficient193_294,
    output := OriginalRow227TriangleData1979.coefficient194_294, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_296, Icur := OriginalRow227TriangleData1975.coefficient193_295,
    output := OriginalRow227TriangleData1979.coefficient194_295, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_297, Icur := OriginalRow227TriangleData1975.coefficient193_296,
    output := OriginalRow227TriangleData1979.coefficient194_296, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_298, Icur := OriginalRow227TriangleData1975.coefficient193_297,
    output := OriginalRow227TriangleData1979.coefficient194_297, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_299, Icur := OriginalRow227TriangleData1975.coefficient193_298,
    output := OriginalRow227TriangleData1979.coefficient194_298, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_300, Icur := OriginalRow227TriangleData1975.coefficient193_299,
    output := OriginalRow227TriangleData1979.coefficient194_299, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_301, Icur := OriginalRow227TriangleData1975.coefficient193_300,
    output := OriginalRow227TriangleData1979.coefficient194_300, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_302, Icur := OriginalRow227TriangleData1975.coefficient193_301,
    output := OriginalRow227TriangleData1979.coefficient194_301, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_303, Icur := OriginalRow227TriangleData1975.coefficient193_302,
    output := OriginalRow227TriangleData1979.coefficient194_302, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_304, Icur := OriginalRow227TriangleData1975.coefficient193_303,
    output := OriginalRow227TriangleData1979.coefficient194_303, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_305, Icur := OriginalRow227TriangleData1975.coefficient193_304,
    output := OriginalRow227TriangleData1979.coefficient194_304, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_306, Icur := OriginalRow227TriangleData1975.coefficient193_305,
    output := OriginalRow227TriangleData1979.coefficient194_305, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_307, Icur := OriginalRow227TriangleData1975.coefficient193_306,
    output := OriginalRow227TriangleData1979.coefficient194_306, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_308, Icur := OriginalRow227TriangleData1975.coefficient193_307,
    output := OriginalRow227TriangleData1979.coefficient194_307, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1963

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1963.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
