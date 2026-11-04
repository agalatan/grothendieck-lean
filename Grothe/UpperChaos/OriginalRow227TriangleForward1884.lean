import Grothe.UpperChaos.OriginalRow227TriangleData1895
import Grothe.UpperChaos.OriginalRow227TriangleData1896
import Grothe.UpperChaos.OriginalRow227TriangleData1900
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1884
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_273, Icur := OriginalRow227TriangleData1895.coefficient176_272,
    output := OriginalRow227TriangleData1900.coefficient177_272, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_274, Icur := OriginalRow227TriangleData1895.coefficient176_273,
    output := OriginalRow227TriangleData1900.coefficient177_273, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_275, Icur := OriginalRow227TriangleData1895.coefficient176_274,
    output := OriginalRow227TriangleData1900.coefficient177_274, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_276, Icur := OriginalRow227TriangleData1895.coefficient176_275,
    output := OriginalRow227TriangleData1900.coefficient177_275, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_277, Icur := OriginalRow227TriangleData1895.coefficient176_276,
    output := OriginalRow227TriangleData1900.coefficient177_276, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_278, Icur := OriginalRow227TriangleData1895.coefficient176_277,
    output := OriginalRow227TriangleData1900.coefficient177_277, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_279, Icur := OriginalRow227TriangleData1895.coefficient176_278,
    output := OriginalRow227TriangleData1900.coefficient177_278, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_280, Icur := OriginalRow227TriangleData1895.coefficient176_279,
    output := OriginalRow227TriangleData1900.coefficient177_279, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_281, Icur := OriginalRow227TriangleData1895.coefficient176_280,
    output := OriginalRow227TriangleData1900.coefficient177_280, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_282, Icur := OriginalRow227TriangleData1895.coefficient176_281,
    output := OriginalRow227TriangleData1900.coefficient177_281, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_283, Icur := OriginalRow227TriangleData1895.coefficient176_282,
    output := OriginalRow227TriangleData1900.coefficient177_282, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_284, Icur := OriginalRow227TriangleData1895.coefficient176_283,
    output := OriginalRow227TriangleData1900.coefficient177_283, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_285, Icur := OriginalRow227TriangleData1895.coefficient176_284,
    output := OriginalRow227TriangleData1900.coefficient177_284, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_286, Icur := OriginalRow227TriangleData1895.coefficient176_285,
    output := OriginalRow227TriangleData1900.coefficient177_285, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_287, Icur := OriginalRow227TriangleData1895.coefficient176_286,
    output := OriginalRow227TriangleData1900.coefficient177_286, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_288, Icur := OriginalRow227TriangleData1895.coefficient176_287,
    output := OriginalRow227TriangleData1900.coefficient177_287, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_289, Icur := OriginalRow227TriangleData1895.coefficient176_288,
    output := OriginalRow227TriangleData1900.coefficient177_288, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_290, Icur := OriginalRow227TriangleData1895.coefficient176_289,
    output := OriginalRow227TriangleData1900.coefficient177_289, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_291, Icur := OriginalRow227TriangleData1895.coefficient176_290,
    output := OriginalRow227TriangleData1900.coefficient177_290, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_292, Icur := OriginalRow227TriangleData1895.coefficient176_291,
    output := OriginalRow227TriangleData1900.coefficient177_291, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_293, Icur := OriginalRow227TriangleData1895.coefficient176_292,
    output := OriginalRow227TriangleData1900.coefficient177_292, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_294, Icur := OriginalRow227TriangleData1895.coefficient176_293,
    output := OriginalRow227TriangleData1900.coefficient177_293, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_295, Icur := OriginalRow227TriangleData1895.coefficient176_294,
    output := OriginalRow227TriangleData1900.coefficient177_294, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_296, Icur := OriginalRow227TriangleData1895.coefficient176_295,
    output := OriginalRow227TriangleData1900.coefficient177_295, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_297, Icur := OriginalRow227TriangleData1895.coefficient176_296,
    output := OriginalRow227TriangleData1900.coefficient177_296, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_298, Icur := OriginalRow227TriangleData1895.coefficient176_297,
    output := OriginalRow227TriangleData1900.coefficient177_297, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_299, Icur := OriginalRow227TriangleData1895.coefficient176_298,
    output := OriginalRow227TriangleData1900.coefficient177_298, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_300, Icur := OriginalRow227TriangleData1895.coefficient176_299,
    output := OriginalRow227TriangleData1900.coefficient177_299, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_301, Icur := OriginalRow227TriangleData1895.coefficient176_300,
    output := OriginalRow227TriangleData1900.coefficient177_300, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1895.coefficient176_302, Icur := OriginalRow227TriangleData1895.coefficient176_301,
    output := OriginalRow227TriangleData1900.coefficient177_301, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1896.coefficient176_303, Icur := OriginalRow227TriangleData1895.coefficient176_302,
    output := OriginalRow227TriangleData1900.coefficient177_302, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root177,
    Inext := OriginalRow227TriangleData1896.coefficient176_304, Icur := OriginalRow227TriangleData1896.coefficient176_303,
    output := OriginalRow227TriangleData1900.coefficient177_303, hC := OriginalRow227TriangleRoots05.root177_pos, hAC := OriginalRow227TriangleRoots05.product177_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1884

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1884.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
