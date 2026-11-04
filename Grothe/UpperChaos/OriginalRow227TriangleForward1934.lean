import Grothe.UpperChaos.OriginalRow227TriangleData1945
import Grothe.UpperChaos.OriginalRow227TriangleData1946
import Grothe.UpperChaos.OriginalRow227TriangleData1950
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1934
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_283, Icur := OriginalRow227TriangleData1945.coefficient186_282,
    output := OriginalRow227TriangleData1950.coefficient187_282, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_284, Icur := OriginalRow227TriangleData1945.coefficient186_283,
    output := OriginalRow227TriangleData1950.coefficient187_283, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_285, Icur := OriginalRow227TriangleData1945.coefficient186_284,
    output := OriginalRow227TriangleData1950.coefficient187_284, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_286, Icur := OriginalRow227TriangleData1945.coefficient186_285,
    output := OriginalRow227TriangleData1950.coefficient187_285, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_287, Icur := OriginalRow227TriangleData1945.coefficient186_286,
    output := OriginalRow227TriangleData1950.coefficient187_286, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_288, Icur := OriginalRow227TriangleData1945.coefficient186_287,
    output := OriginalRow227TriangleData1950.coefficient187_287, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_289, Icur := OriginalRow227TriangleData1945.coefficient186_288,
    output := OriginalRow227TriangleData1950.coefficient187_288, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_290, Icur := OriginalRow227TriangleData1945.coefficient186_289,
    output := OriginalRow227TriangleData1950.coefficient187_289, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_291, Icur := OriginalRow227TriangleData1945.coefficient186_290,
    output := OriginalRow227TriangleData1950.coefficient187_290, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_292, Icur := OriginalRow227TriangleData1945.coefficient186_291,
    output := OriginalRow227TriangleData1950.coefficient187_291, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_293, Icur := OriginalRow227TriangleData1945.coefficient186_292,
    output := OriginalRow227TriangleData1950.coefficient187_292, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_294, Icur := OriginalRow227TriangleData1945.coefficient186_293,
    output := OriginalRow227TriangleData1950.coefficient187_293, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_295, Icur := OriginalRow227TriangleData1945.coefficient186_294,
    output := OriginalRow227TriangleData1950.coefficient187_294, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_296, Icur := OriginalRow227TriangleData1945.coefficient186_295,
    output := OriginalRow227TriangleData1950.coefficient187_295, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_297, Icur := OriginalRow227TriangleData1945.coefficient186_296,
    output := OriginalRow227TriangleData1950.coefficient187_296, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_298, Icur := OriginalRow227TriangleData1945.coefficient186_297,
    output := OriginalRow227TriangleData1950.coefficient187_297, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_299, Icur := OriginalRow227TriangleData1945.coefficient186_298,
    output := OriginalRow227TriangleData1950.coefficient187_298, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_300, Icur := OriginalRow227TriangleData1945.coefficient186_299,
    output := OriginalRow227TriangleData1950.coefficient187_299, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_301, Icur := OriginalRow227TriangleData1945.coefficient186_300,
    output := OriginalRow227TriangleData1950.coefficient187_300, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_302, Icur := OriginalRow227TriangleData1945.coefficient186_301,
    output := OriginalRow227TriangleData1950.coefficient187_301, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_303, Icur := OriginalRow227TriangleData1945.coefficient186_302,
    output := OriginalRow227TriangleData1950.coefficient187_302, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_304, Icur := OriginalRow227TriangleData1945.coefficient186_303,
    output := OriginalRow227TriangleData1950.coefficient187_303, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_305, Icur := OriginalRow227TriangleData1945.coefficient186_304,
    output := OriginalRow227TriangleData1950.coefficient187_304, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_306, Icur := OriginalRow227TriangleData1945.coefficient186_305,
    output := OriginalRow227TriangleData1950.coefficient187_305, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_307, Icur := OriginalRow227TriangleData1945.coefficient186_306,
    output := OriginalRow227TriangleData1950.coefficient187_306, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_308, Icur := OriginalRow227TriangleData1945.coefficient186_307,
    output := OriginalRow227TriangleData1950.coefficient187_307, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_309, Icur := OriginalRow227TriangleData1945.coefficient186_308,
    output := OriginalRow227TriangleData1950.coefficient187_308, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_310, Icur := OriginalRow227TriangleData1945.coefficient186_309,
    output := OriginalRow227TriangleData1950.coefficient187_309, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_311, Icur := OriginalRow227TriangleData1945.coefficient186_310,
    output := OriginalRow227TriangleData1950.coefficient187_310, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1945.coefficient186_312, Icur := OriginalRow227TriangleData1945.coefficient186_311,
    output := OriginalRow227TriangleData1950.coefficient187_311, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1946.coefficient186_313, Icur := OriginalRow227TriangleData1945.coefficient186_312,
    output := OriginalRow227TriangleData1950.coefficient187_312, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root187,
    Inext := OriginalRow227TriangleData1946.coefficient186_314, Icur := OriginalRow227TriangleData1946.coefficient186_313,
    output := OriginalRow227TriangleData1950.coefficient187_313, hC := OriginalRow227TriangleRoots05.root187_pos, hAC := OriginalRow227TriangleRoots05.product187_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1934

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1934.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
