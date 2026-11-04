import Grothe.UpperChaos.OriginalRow227TriangleData1128
import Grothe.UpperChaos.OriginalRow227TriangleData1129
import Grothe.UpperChaos.OriginalRow227TriangleData1139
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1123
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_275, Icur := OriginalRow227TriangleData1128.coefficient82_274,
    output := OriginalRow227TriangleData1139.coefficient83_274, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_276, Icur := OriginalRow227TriangleData1128.coefficient82_275,
    output := OriginalRow227TriangleData1139.coefficient83_275, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_277, Icur := OriginalRow227TriangleData1128.coefficient82_276,
    output := OriginalRow227TriangleData1139.coefficient83_276, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_278, Icur := OriginalRow227TriangleData1128.coefficient82_277,
    output := OriginalRow227TriangleData1139.coefficient83_277, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_279, Icur := OriginalRow227TriangleData1128.coefficient82_278,
    output := OriginalRow227TriangleData1139.coefficient83_278, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_280, Icur := OriginalRow227TriangleData1128.coefficient82_279,
    output := OriginalRow227TriangleData1139.coefficient83_279, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_281, Icur := OriginalRow227TriangleData1128.coefficient82_280,
    output := OriginalRow227TriangleData1139.coefficient83_280, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_282, Icur := OriginalRow227TriangleData1128.coefficient82_281,
    output := OriginalRow227TriangleData1139.coefficient83_281, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_283, Icur := OriginalRow227TriangleData1128.coefficient82_282,
    output := OriginalRow227TriangleData1139.coefficient83_282, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_284, Icur := OriginalRow227TriangleData1128.coefficient82_283,
    output := OriginalRow227TriangleData1139.coefficient83_283, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_285, Icur := OriginalRow227TriangleData1128.coefficient82_284,
    output := OriginalRow227TriangleData1139.coefficient83_284, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_286, Icur := OriginalRow227TriangleData1128.coefficient82_285,
    output := OriginalRow227TriangleData1139.coefficient83_285, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_287, Icur := OriginalRow227TriangleData1128.coefficient82_286,
    output := OriginalRow227TriangleData1139.coefficient83_286, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_288, Icur := OriginalRow227TriangleData1128.coefficient82_287,
    output := OriginalRow227TriangleData1139.coefficient83_287, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_289, Icur := OriginalRow227TriangleData1128.coefficient82_288,
    output := OriginalRow227TriangleData1139.coefficient83_288, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_290, Icur := OriginalRow227TriangleData1128.coefficient82_289,
    output := OriginalRow227TriangleData1139.coefficient83_289, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_291, Icur := OriginalRow227TriangleData1128.coefficient82_290,
    output := OriginalRow227TriangleData1139.coefficient83_290, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_292, Icur := OriginalRow227TriangleData1128.coefficient82_291,
    output := OriginalRow227TriangleData1139.coefficient83_291, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_293, Icur := OriginalRow227TriangleData1128.coefficient82_292,
    output := OriginalRow227TriangleData1139.coefficient83_292, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_294, Icur := OriginalRow227TriangleData1128.coefficient82_293,
    output := OriginalRow227TriangleData1139.coefficient83_293, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_295, Icur := OriginalRow227TriangleData1128.coefficient82_294,
    output := OriginalRow227TriangleData1139.coefficient83_294, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_296, Icur := OriginalRow227TriangleData1128.coefficient82_295,
    output := OriginalRow227TriangleData1139.coefficient83_295, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_297, Icur := OriginalRow227TriangleData1128.coefficient82_296,
    output := OriginalRow227TriangleData1139.coefficient83_296, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_298, Icur := OriginalRow227TriangleData1128.coefficient82_297,
    output := OriginalRow227TriangleData1139.coefficient83_297, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_299, Icur := OriginalRow227TriangleData1128.coefficient82_298,
    output := OriginalRow227TriangleData1139.coefficient83_298, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_300, Icur := OriginalRow227TriangleData1128.coefficient82_299,
    output := OriginalRow227TriangleData1139.coefficient83_299, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_301, Icur := OriginalRow227TriangleData1128.coefficient82_300,
    output := OriginalRow227TriangleData1139.coefficient83_300, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_302, Icur := OriginalRow227TriangleData1128.coefficient82_301,
    output := OriginalRow227TriangleData1139.coefficient83_301, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_303, Icur := OriginalRow227TriangleData1128.coefficient82_302,
    output := OriginalRow227TriangleData1139.coefficient83_302, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1128.coefficient82_304, Icur := OriginalRow227TriangleData1128.coefficient82_303,
    output := OriginalRow227TriangleData1139.coefficient83_303, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_305, Icur := OriginalRow227TriangleData1128.coefficient82_304,
    output := OriginalRow227TriangleData1139.coefficient83_304, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_306, Icur := OriginalRow227TriangleData1129.coefficient82_305,
    output := OriginalRow227TriangleData1139.coefficient83_305, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1123

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1123.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
