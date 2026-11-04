import Grothe.UpperChaos.OriginalRow227TriangleData1920
import Grothe.UpperChaos.OriginalRow227TriangleData1921
import Grothe.UpperChaos.OriginalRow227TriangleData1925
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1909
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_278, Icur := OriginalRow227TriangleData1920.coefficient181_277,
    output := OriginalRow227TriangleData1925.coefficient182_277, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_279, Icur := OriginalRow227TriangleData1920.coefficient181_278,
    output := OriginalRow227TriangleData1925.coefficient182_278, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_280, Icur := OriginalRow227TriangleData1920.coefficient181_279,
    output := OriginalRow227TriangleData1925.coefficient182_279, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_281, Icur := OriginalRow227TriangleData1920.coefficient181_280,
    output := OriginalRow227TriangleData1925.coefficient182_280, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_282, Icur := OriginalRow227TriangleData1920.coefficient181_281,
    output := OriginalRow227TriangleData1925.coefficient182_281, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_283, Icur := OriginalRow227TriangleData1920.coefficient181_282,
    output := OriginalRow227TriangleData1925.coefficient182_282, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_284, Icur := OriginalRow227TriangleData1920.coefficient181_283,
    output := OriginalRow227TriangleData1925.coefficient182_283, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_285, Icur := OriginalRow227TriangleData1920.coefficient181_284,
    output := OriginalRow227TriangleData1925.coefficient182_284, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_286, Icur := OriginalRow227TriangleData1920.coefficient181_285,
    output := OriginalRow227TriangleData1925.coefficient182_285, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_287, Icur := OriginalRow227TriangleData1920.coefficient181_286,
    output := OriginalRow227TriangleData1925.coefficient182_286, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_288, Icur := OriginalRow227TriangleData1920.coefficient181_287,
    output := OriginalRow227TriangleData1925.coefficient182_287, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_289, Icur := OriginalRow227TriangleData1920.coefficient181_288,
    output := OriginalRow227TriangleData1925.coefficient182_288, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_290, Icur := OriginalRow227TriangleData1920.coefficient181_289,
    output := OriginalRow227TriangleData1925.coefficient182_289, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_291, Icur := OriginalRow227TriangleData1920.coefficient181_290,
    output := OriginalRow227TriangleData1925.coefficient182_290, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_292, Icur := OriginalRow227TriangleData1920.coefficient181_291,
    output := OriginalRow227TriangleData1925.coefficient182_291, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_293, Icur := OriginalRow227TriangleData1920.coefficient181_292,
    output := OriginalRow227TriangleData1925.coefficient182_292, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_294, Icur := OriginalRow227TriangleData1920.coefficient181_293,
    output := OriginalRow227TriangleData1925.coefficient182_293, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_295, Icur := OriginalRow227TriangleData1920.coefficient181_294,
    output := OriginalRow227TriangleData1925.coefficient182_294, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_296, Icur := OriginalRow227TriangleData1920.coefficient181_295,
    output := OriginalRow227TriangleData1925.coefficient182_295, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_297, Icur := OriginalRow227TriangleData1920.coefficient181_296,
    output := OriginalRow227TriangleData1925.coefficient182_296, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_298, Icur := OriginalRow227TriangleData1920.coefficient181_297,
    output := OriginalRow227TriangleData1925.coefficient182_297, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_299, Icur := OriginalRow227TriangleData1920.coefficient181_298,
    output := OriginalRow227TriangleData1925.coefficient182_298, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_300, Icur := OriginalRow227TriangleData1920.coefficient181_299,
    output := OriginalRow227TriangleData1925.coefficient182_299, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_301, Icur := OriginalRow227TriangleData1920.coefficient181_300,
    output := OriginalRow227TriangleData1925.coefficient182_300, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_302, Icur := OriginalRow227TriangleData1920.coefficient181_301,
    output := OriginalRow227TriangleData1925.coefficient182_301, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_303, Icur := OriginalRow227TriangleData1920.coefficient181_302,
    output := OriginalRow227TriangleData1925.coefficient182_302, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_304, Icur := OriginalRow227TriangleData1920.coefficient181_303,
    output := OriginalRow227TriangleData1925.coefficient182_303, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_305, Icur := OriginalRow227TriangleData1920.coefficient181_304,
    output := OriginalRow227TriangleData1925.coefficient182_304, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_306, Icur := OriginalRow227TriangleData1920.coefficient181_305,
    output := OriginalRow227TriangleData1925.coefficient182_305, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_307, Icur := OriginalRow227TriangleData1920.coefficient181_306,
    output := OriginalRow227TriangleData1925.coefficient182_306, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_308, Icur := OriginalRow227TriangleData1920.coefficient181_307,
    output := OriginalRow227TriangleData1925.coefficient182_307, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1921.coefficient181_309, Icur := OriginalRow227TriangleData1921.coefficient181_308,
    output := OriginalRow227TriangleData1925.coefficient182_308, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1909

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1909.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
