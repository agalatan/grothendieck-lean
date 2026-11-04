import Grothe.UpperChaos.OriginalRow227TriangleData1717
import Grothe.UpperChaos.OriginalRow227TriangleData1718
import Grothe.UpperChaos.OriginalRow227TriangleData1724
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1708
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_276, Icur := OriginalRow227TriangleData1717.coefficient147_275,
    output := OriginalRow227TriangleData1724.coefficient148_275, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_277, Icur := OriginalRow227TriangleData1717.coefficient147_276,
    output := OriginalRow227TriangleData1724.coefficient148_276, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_278, Icur := OriginalRow227TriangleData1717.coefficient147_277,
    output := OriginalRow227TriangleData1724.coefficient148_277, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_279, Icur := OriginalRow227TriangleData1717.coefficient147_278,
    output := OriginalRow227TriangleData1724.coefficient148_278, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_280, Icur := OriginalRow227TriangleData1717.coefficient147_279,
    output := OriginalRow227TriangleData1724.coefficient148_279, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_281, Icur := OriginalRow227TriangleData1717.coefficient147_280,
    output := OriginalRow227TriangleData1724.coefficient148_280, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_282, Icur := OriginalRow227TriangleData1717.coefficient147_281,
    output := OriginalRow227TriangleData1724.coefficient148_281, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_283, Icur := OriginalRow227TriangleData1717.coefficient147_282,
    output := OriginalRow227TriangleData1724.coefficient148_282, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_284, Icur := OriginalRow227TriangleData1717.coefficient147_283,
    output := OriginalRow227TriangleData1724.coefficient148_283, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_285, Icur := OriginalRow227TriangleData1717.coefficient147_284,
    output := OriginalRow227TriangleData1724.coefficient148_284, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_286, Icur := OriginalRow227TriangleData1717.coefficient147_285,
    output := OriginalRow227TriangleData1724.coefficient148_285, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_287, Icur := OriginalRow227TriangleData1717.coefficient147_286,
    output := OriginalRow227TriangleData1724.coefficient148_286, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_288, Icur := OriginalRow227TriangleData1717.coefficient147_287,
    output := OriginalRow227TriangleData1724.coefficient148_287, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_289, Icur := OriginalRow227TriangleData1717.coefficient147_288,
    output := OriginalRow227TriangleData1724.coefficient148_288, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_290, Icur := OriginalRow227TriangleData1717.coefficient147_289,
    output := OriginalRow227TriangleData1724.coefficient148_289, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_291, Icur := OriginalRow227TriangleData1717.coefficient147_290,
    output := OriginalRow227TriangleData1724.coefficient148_290, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_292, Icur := OriginalRow227TriangleData1717.coefficient147_291,
    output := OriginalRow227TriangleData1724.coefficient148_291, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_293, Icur := OriginalRow227TriangleData1717.coefficient147_292,
    output := OriginalRow227TriangleData1724.coefficient148_292, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_294, Icur := OriginalRow227TriangleData1717.coefficient147_293,
    output := OriginalRow227TriangleData1724.coefficient148_293, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_295, Icur := OriginalRow227TriangleData1717.coefficient147_294,
    output := OriginalRow227TriangleData1724.coefficient148_294, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_296, Icur := OriginalRow227TriangleData1717.coefficient147_295,
    output := OriginalRow227TriangleData1724.coefficient148_295, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_297, Icur := OriginalRow227TriangleData1717.coefficient147_296,
    output := OriginalRow227TriangleData1724.coefficient148_296, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_298, Icur := OriginalRow227TriangleData1717.coefficient147_297,
    output := OriginalRow227TriangleData1724.coefficient148_297, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_299, Icur := OriginalRow227TriangleData1717.coefficient147_298,
    output := OriginalRow227TriangleData1724.coefficient148_298, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_300, Icur := OriginalRow227TriangleData1717.coefficient147_299,
    output := OriginalRow227TriangleData1724.coefficient148_299, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_301, Icur := OriginalRow227TriangleData1717.coefficient147_300,
    output := OriginalRow227TriangleData1724.coefficient148_300, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_302, Icur := OriginalRow227TriangleData1717.coefficient147_301,
    output := OriginalRow227TriangleData1724.coefficient148_301, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_303, Icur := OriginalRow227TriangleData1717.coefficient147_302,
    output := OriginalRow227TriangleData1724.coefficient148_302, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_304, Icur := OriginalRow227TriangleData1717.coefficient147_303,
    output := OriginalRow227TriangleData1724.coefficient148_303, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1717.coefficient147_305, Icur := OriginalRow227TriangleData1717.coefficient147_304,
    output := OriginalRow227TriangleData1724.coefficient148_304, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1718.coefficient147_306, Icur := OriginalRow227TriangleData1717.coefficient147_305,
    output := OriginalRow227TriangleData1724.coefficient148_305, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1718.coefficient147_307, Icur := OriginalRow227TriangleData1718.coefficient147_306,
    output := OriginalRow227TriangleData1724.coefficient148_306, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1708

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1708.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
