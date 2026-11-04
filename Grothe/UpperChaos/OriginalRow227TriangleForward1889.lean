import Grothe.UpperChaos.OriginalRow227TriangleData1900
import Grothe.UpperChaos.OriginalRow227TriangleData1901
import Grothe.UpperChaos.OriginalRow227TriangleData1905
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1889
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_274, Icur := OriginalRow227TriangleData1900.coefficient177_273,
    output := OriginalRow227TriangleData1905.coefficient178_273, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_275, Icur := OriginalRow227TriangleData1900.coefficient177_274,
    output := OriginalRow227TriangleData1905.coefficient178_274, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_276, Icur := OriginalRow227TriangleData1900.coefficient177_275,
    output := OriginalRow227TriangleData1905.coefficient178_275, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_277, Icur := OriginalRow227TriangleData1900.coefficient177_276,
    output := OriginalRow227TriangleData1905.coefficient178_276, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_278, Icur := OriginalRow227TriangleData1900.coefficient177_277,
    output := OriginalRow227TriangleData1905.coefficient178_277, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_279, Icur := OriginalRow227TriangleData1900.coefficient177_278,
    output := OriginalRow227TriangleData1905.coefficient178_278, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_280, Icur := OriginalRow227TriangleData1900.coefficient177_279,
    output := OriginalRow227TriangleData1905.coefficient178_279, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_281, Icur := OriginalRow227TriangleData1900.coefficient177_280,
    output := OriginalRow227TriangleData1905.coefficient178_280, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_282, Icur := OriginalRow227TriangleData1900.coefficient177_281,
    output := OriginalRow227TriangleData1905.coefficient178_281, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_283, Icur := OriginalRow227TriangleData1900.coefficient177_282,
    output := OriginalRow227TriangleData1905.coefficient178_282, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_284, Icur := OriginalRow227TriangleData1900.coefficient177_283,
    output := OriginalRow227TriangleData1905.coefficient178_283, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_285, Icur := OriginalRow227TriangleData1900.coefficient177_284,
    output := OriginalRow227TriangleData1905.coefficient178_284, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_286, Icur := OriginalRow227TriangleData1900.coefficient177_285,
    output := OriginalRow227TriangleData1905.coefficient178_285, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_287, Icur := OriginalRow227TriangleData1900.coefficient177_286,
    output := OriginalRow227TriangleData1905.coefficient178_286, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_288, Icur := OriginalRow227TriangleData1900.coefficient177_287,
    output := OriginalRow227TriangleData1905.coefficient178_287, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_289, Icur := OriginalRow227TriangleData1900.coefficient177_288,
    output := OriginalRow227TriangleData1905.coefficient178_288, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_290, Icur := OriginalRow227TriangleData1900.coefficient177_289,
    output := OriginalRow227TriangleData1905.coefficient178_289, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_291, Icur := OriginalRow227TriangleData1900.coefficient177_290,
    output := OriginalRow227TriangleData1905.coefficient178_290, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_292, Icur := OriginalRow227TriangleData1900.coefficient177_291,
    output := OriginalRow227TriangleData1905.coefficient178_291, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_293, Icur := OriginalRow227TriangleData1900.coefficient177_292,
    output := OriginalRow227TriangleData1905.coefficient178_292, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_294, Icur := OriginalRow227TriangleData1900.coefficient177_293,
    output := OriginalRow227TriangleData1905.coefficient178_293, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_295, Icur := OriginalRow227TriangleData1900.coefficient177_294,
    output := OriginalRow227TriangleData1905.coefficient178_294, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_296, Icur := OriginalRow227TriangleData1900.coefficient177_295,
    output := OriginalRow227TriangleData1905.coefficient178_295, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_297, Icur := OriginalRow227TriangleData1900.coefficient177_296,
    output := OriginalRow227TriangleData1905.coefficient178_296, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_298, Icur := OriginalRow227TriangleData1900.coefficient177_297,
    output := OriginalRow227TriangleData1905.coefficient178_297, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_299, Icur := OriginalRow227TriangleData1900.coefficient177_298,
    output := OriginalRow227TriangleData1905.coefficient178_298, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_300, Icur := OriginalRow227TriangleData1900.coefficient177_299,
    output := OriginalRow227TriangleData1905.coefficient178_299, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_301, Icur := OriginalRow227TriangleData1900.coefficient177_300,
    output := OriginalRow227TriangleData1905.coefficient178_300, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_302, Icur := OriginalRow227TriangleData1900.coefficient177_301,
    output := OriginalRow227TriangleData1905.coefficient178_301, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1900.coefficient177_303, Icur := OriginalRow227TriangleData1900.coefficient177_302,
    output := OriginalRow227TriangleData1905.coefficient178_302, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_304, Icur := OriginalRow227TriangleData1900.coefficient177_303,
    output := OriginalRow227TriangleData1905.coefficient178_303, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_305, Icur := OriginalRow227TriangleData1901.coefficient177_304,
    output := OriginalRow227TriangleData1905.coefficient178_304, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1889

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1889.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
