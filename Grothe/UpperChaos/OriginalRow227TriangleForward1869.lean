import Grothe.UpperChaos.OriginalRow227TriangleData1880
import Grothe.UpperChaos.OriginalRow227TriangleData1881
import Grothe.UpperChaos.OriginalRow227TriangleData1885
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1869
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_270, Icur := OriginalRow227TriangleData1880.coefficient173_269,
    output := OriginalRow227TriangleData1885.coefficient174_269, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_271, Icur := OriginalRow227TriangleData1880.coefficient173_270,
    output := OriginalRow227TriangleData1885.coefficient174_270, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_272, Icur := OriginalRow227TriangleData1880.coefficient173_271,
    output := OriginalRow227TriangleData1885.coefficient174_271, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_273, Icur := OriginalRow227TriangleData1880.coefficient173_272,
    output := OriginalRow227TriangleData1885.coefficient174_272, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_274, Icur := OriginalRow227TriangleData1880.coefficient173_273,
    output := OriginalRow227TriangleData1885.coefficient174_273, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_275, Icur := OriginalRow227TriangleData1880.coefficient173_274,
    output := OriginalRow227TriangleData1885.coefficient174_274, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_276, Icur := OriginalRow227TriangleData1880.coefficient173_275,
    output := OriginalRow227TriangleData1885.coefficient174_275, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_277, Icur := OriginalRow227TriangleData1880.coefficient173_276,
    output := OriginalRow227TriangleData1885.coefficient174_276, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_278, Icur := OriginalRow227TriangleData1880.coefficient173_277,
    output := OriginalRow227TriangleData1885.coefficient174_277, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_279, Icur := OriginalRow227TriangleData1880.coefficient173_278,
    output := OriginalRow227TriangleData1885.coefficient174_278, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_280, Icur := OriginalRow227TriangleData1880.coefficient173_279,
    output := OriginalRow227TriangleData1885.coefficient174_279, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_281, Icur := OriginalRow227TriangleData1880.coefficient173_280,
    output := OriginalRow227TriangleData1885.coefficient174_280, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_282, Icur := OriginalRow227TriangleData1880.coefficient173_281,
    output := OriginalRow227TriangleData1885.coefficient174_281, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_283, Icur := OriginalRow227TriangleData1880.coefficient173_282,
    output := OriginalRow227TriangleData1885.coefficient174_282, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_284, Icur := OriginalRow227TriangleData1880.coefficient173_283,
    output := OriginalRow227TriangleData1885.coefficient174_283, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_285, Icur := OriginalRow227TriangleData1880.coefficient173_284,
    output := OriginalRow227TriangleData1885.coefficient174_284, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_286, Icur := OriginalRow227TriangleData1880.coefficient173_285,
    output := OriginalRow227TriangleData1885.coefficient174_285, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_287, Icur := OriginalRow227TriangleData1880.coefficient173_286,
    output := OriginalRow227TriangleData1885.coefficient174_286, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_288, Icur := OriginalRow227TriangleData1880.coefficient173_287,
    output := OriginalRow227TriangleData1885.coefficient174_287, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_289, Icur := OriginalRow227TriangleData1880.coefficient173_288,
    output := OriginalRow227TriangleData1885.coefficient174_288, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_290, Icur := OriginalRow227TriangleData1880.coefficient173_289,
    output := OriginalRow227TriangleData1885.coefficient174_289, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_291, Icur := OriginalRow227TriangleData1880.coefficient173_290,
    output := OriginalRow227TriangleData1885.coefficient174_290, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_292, Icur := OriginalRow227TriangleData1880.coefficient173_291,
    output := OriginalRow227TriangleData1885.coefficient174_291, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_293, Icur := OriginalRow227TriangleData1880.coefficient173_292,
    output := OriginalRow227TriangleData1885.coefficient174_292, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_294, Icur := OriginalRow227TriangleData1880.coefficient173_293,
    output := OriginalRow227TriangleData1885.coefficient174_293, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_295, Icur := OriginalRow227TriangleData1880.coefficient173_294,
    output := OriginalRow227TriangleData1885.coefficient174_294, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_296, Icur := OriginalRow227TriangleData1880.coefficient173_295,
    output := OriginalRow227TriangleData1885.coefficient174_295, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_297, Icur := OriginalRow227TriangleData1880.coefficient173_296,
    output := OriginalRow227TriangleData1885.coefficient174_296, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_298, Icur := OriginalRow227TriangleData1880.coefficient173_297,
    output := OriginalRow227TriangleData1885.coefficient174_297, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1880.coefficient173_299, Icur := OriginalRow227TriangleData1880.coefficient173_298,
    output := OriginalRow227TriangleData1885.coefficient174_298, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1881.coefficient173_300, Icur := OriginalRow227TriangleData1880.coefficient173_299,
    output := OriginalRow227TriangleData1885.coefficient174_299, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1881.coefficient173_301, Icur := OriginalRow227TriangleData1881.coefficient173_300,
    output := OriginalRow227TriangleData1885.coefficient174_300, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1869

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1869.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
