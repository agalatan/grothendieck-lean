import Grothe.UpperChaos.OriginalRow227TriangleData1910
import Grothe.UpperChaos.OriginalRow227TriangleData1911
import Grothe.UpperChaos.OriginalRow227TriangleData1915
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1899
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_276, Icur := OriginalRow227TriangleData1910.coefficient179_275,
    output := OriginalRow227TriangleData1915.coefficient180_275, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_277, Icur := OriginalRow227TriangleData1910.coefficient179_276,
    output := OriginalRow227TriangleData1915.coefficient180_276, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_278, Icur := OriginalRow227TriangleData1910.coefficient179_277,
    output := OriginalRow227TriangleData1915.coefficient180_277, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_279, Icur := OriginalRow227TriangleData1910.coefficient179_278,
    output := OriginalRow227TriangleData1915.coefficient180_278, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_280, Icur := OriginalRow227TriangleData1910.coefficient179_279,
    output := OriginalRow227TriangleData1915.coefficient180_279, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_281, Icur := OriginalRow227TriangleData1910.coefficient179_280,
    output := OriginalRow227TriangleData1915.coefficient180_280, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_282, Icur := OriginalRow227TriangleData1910.coefficient179_281,
    output := OriginalRow227TriangleData1915.coefficient180_281, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_283, Icur := OriginalRow227TriangleData1910.coefficient179_282,
    output := OriginalRow227TriangleData1915.coefficient180_282, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_284, Icur := OriginalRow227TriangleData1910.coefficient179_283,
    output := OriginalRow227TriangleData1915.coefficient180_283, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_285, Icur := OriginalRow227TriangleData1910.coefficient179_284,
    output := OriginalRow227TriangleData1915.coefficient180_284, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_286, Icur := OriginalRow227TriangleData1910.coefficient179_285,
    output := OriginalRow227TriangleData1915.coefficient180_285, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_287, Icur := OriginalRow227TriangleData1910.coefficient179_286,
    output := OriginalRow227TriangleData1915.coefficient180_286, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_288, Icur := OriginalRow227TriangleData1910.coefficient179_287,
    output := OriginalRow227TriangleData1915.coefficient180_287, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_289, Icur := OriginalRow227TriangleData1910.coefficient179_288,
    output := OriginalRow227TriangleData1915.coefficient180_288, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_290, Icur := OriginalRow227TriangleData1910.coefficient179_289,
    output := OriginalRow227TriangleData1915.coefficient180_289, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_291, Icur := OriginalRow227TriangleData1910.coefficient179_290,
    output := OriginalRow227TriangleData1915.coefficient180_290, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_292, Icur := OriginalRow227TriangleData1910.coefficient179_291,
    output := OriginalRow227TriangleData1915.coefficient180_291, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_293, Icur := OriginalRow227TriangleData1910.coefficient179_292,
    output := OriginalRow227TriangleData1915.coefficient180_292, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_294, Icur := OriginalRow227TriangleData1910.coefficient179_293,
    output := OriginalRow227TriangleData1915.coefficient180_293, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_295, Icur := OriginalRow227TriangleData1910.coefficient179_294,
    output := OriginalRow227TriangleData1915.coefficient180_294, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_296, Icur := OriginalRow227TriangleData1910.coefficient179_295,
    output := OriginalRow227TriangleData1915.coefficient180_295, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_297, Icur := OriginalRow227TriangleData1910.coefficient179_296,
    output := OriginalRow227TriangleData1915.coefficient180_296, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_298, Icur := OriginalRow227TriangleData1910.coefficient179_297,
    output := OriginalRow227TriangleData1915.coefficient180_297, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_299, Icur := OriginalRow227TriangleData1910.coefficient179_298,
    output := OriginalRow227TriangleData1915.coefficient180_298, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_300, Icur := OriginalRow227TriangleData1910.coefficient179_299,
    output := OriginalRow227TriangleData1915.coefficient180_299, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_301, Icur := OriginalRow227TriangleData1910.coefficient179_300,
    output := OriginalRow227TriangleData1915.coefficient180_300, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_302, Icur := OriginalRow227TriangleData1910.coefficient179_301,
    output := OriginalRow227TriangleData1915.coefficient180_301, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_303, Icur := OriginalRow227TriangleData1910.coefficient179_302,
    output := OriginalRow227TriangleData1915.coefficient180_302, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_304, Icur := OriginalRow227TriangleData1910.coefficient179_303,
    output := OriginalRow227TriangleData1915.coefficient180_303, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_305, Icur := OriginalRow227TriangleData1910.coefficient179_304,
    output := OriginalRow227TriangleData1915.coefficient180_304, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_306, Icur := OriginalRow227TriangleData1910.coefficient179_305,
    output := OriginalRow227TriangleData1915.coefficient180_305, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1911.coefficient179_307, Icur := OriginalRow227TriangleData1911.coefficient179_306,
    output := OriginalRow227TriangleData1915.coefficient180_306, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1899

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1899.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
