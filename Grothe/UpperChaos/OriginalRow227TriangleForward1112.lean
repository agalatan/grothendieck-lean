import Grothe.UpperChaos.OriginalRow227TriangleData1117
import Grothe.UpperChaos.OriginalRow227TriangleData1118
import Grothe.UpperChaos.OriginalRow227TriangleData1128
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1112
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_274, Icur := OriginalRow227TriangleData1117.coefficient81_273,
    output := OriginalRow227TriangleData1128.coefficient82_273, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_275, Icur := OriginalRow227TriangleData1117.coefficient81_274,
    output := OriginalRow227TriangleData1128.coefficient82_274, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_276, Icur := OriginalRow227TriangleData1117.coefficient81_275,
    output := OriginalRow227TriangleData1128.coefficient82_275, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_277, Icur := OriginalRow227TriangleData1117.coefficient81_276,
    output := OriginalRow227TriangleData1128.coefficient82_276, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_278, Icur := OriginalRow227TriangleData1117.coefficient81_277,
    output := OriginalRow227TriangleData1128.coefficient82_277, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_279, Icur := OriginalRow227TriangleData1117.coefficient81_278,
    output := OriginalRow227TriangleData1128.coefficient82_278, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_280, Icur := OriginalRow227TriangleData1117.coefficient81_279,
    output := OriginalRow227TriangleData1128.coefficient82_279, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_281, Icur := OriginalRow227TriangleData1117.coefficient81_280,
    output := OriginalRow227TriangleData1128.coefficient82_280, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_282, Icur := OriginalRow227TriangleData1117.coefficient81_281,
    output := OriginalRow227TriangleData1128.coefficient82_281, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_283, Icur := OriginalRow227TriangleData1117.coefficient81_282,
    output := OriginalRow227TriangleData1128.coefficient82_282, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_284, Icur := OriginalRow227TriangleData1117.coefficient81_283,
    output := OriginalRow227TriangleData1128.coefficient82_283, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_285, Icur := OriginalRow227TriangleData1117.coefficient81_284,
    output := OriginalRow227TriangleData1128.coefficient82_284, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_286, Icur := OriginalRow227TriangleData1117.coefficient81_285,
    output := OriginalRow227TriangleData1128.coefficient82_285, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_287, Icur := OriginalRow227TriangleData1117.coefficient81_286,
    output := OriginalRow227TriangleData1128.coefficient82_286, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_288, Icur := OriginalRow227TriangleData1117.coefficient81_287,
    output := OriginalRow227TriangleData1128.coefficient82_287, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_289, Icur := OriginalRow227TriangleData1117.coefficient81_288,
    output := OriginalRow227TriangleData1128.coefficient82_288, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_290, Icur := OriginalRow227TriangleData1117.coefficient81_289,
    output := OriginalRow227TriangleData1128.coefficient82_289, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_291, Icur := OriginalRow227TriangleData1117.coefficient81_290,
    output := OriginalRow227TriangleData1128.coefficient82_290, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_292, Icur := OriginalRow227TriangleData1117.coefficient81_291,
    output := OriginalRow227TriangleData1128.coefficient82_291, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_293, Icur := OriginalRow227TriangleData1117.coefficient81_292,
    output := OriginalRow227TriangleData1128.coefficient82_292, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_294, Icur := OriginalRow227TriangleData1117.coefficient81_293,
    output := OriginalRow227TriangleData1128.coefficient82_293, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_295, Icur := OriginalRow227TriangleData1117.coefficient81_294,
    output := OriginalRow227TriangleData1128.coefficient82_294, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_296, Icur := OriginalRow227TriangleData1117.coefficient81_295,
    output := OriginalRow227TriangleData1128.coefficient82_295, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_297, Icur := OriginalRow227TriangleData1117.coefficient81_296,
    output := OriginalRow227TriangleData1128.coefficient82_296, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_298, Icur := OriginalRow227TriangleData1117.coefficient81_297,
    output := OriginalRow227TriangleData1128.coefficient82_297, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_299, Icur := OriginalRow227TriangleData1117.coefficient81_298,
    output := OriginalRow227TriangleData1128.coefficient82_298, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_300, Icur := OriginalRow227TriangleData1117.coefficient81_299,
    output := OriginalRow227TriangleData1128.coefficient82_299, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_301, Icur := OriginalRow227TriangleData1117.coefficient81_300,
    output := OriginalRow227TriangleData1128.coefficient82_300, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_302, Icur := OriginalRow227TriangleData1117.coefficient81_301,
    output := OriginalRow227TriangleData1128.coefficient82_301, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1117.coefficient81_303, Icur := OriginalRow227TriangleData1117.coefficient81_302,
    output := OriginalRow227TriangleData1128.coefficient82_302, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1118.coefficient81_304, Icur := OriginalRow227TriangleData1117.coefficient81_303,
    output := OriginalRow227TriangleData1128.coefficient82_303, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root82,
    Inext := OriginalRow227TriangleData1118.coefficient81_305, Icur := OriginalRow227TriangleData1118.coefficient81_304,
    output := OriginalRow227TriangleData1128.coefficient82_304, hC := OriginalRow227TriangleRoots02.root82_pos, hAC := OriginalRow227TriangleRoots02.product82_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1112

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1112.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
