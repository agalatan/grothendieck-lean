import Grothe.UpperChaos.OriginalRow227TriangleData1084
import Grothe.UpperChaos.OriginalRow227TriangleData1085
import Grothe.UpperChaos.OriginalRow227TriangleData1095
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1079
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_271, Icur := OriginalRow227TriangleData1084.coefficient78_270,
    output := OriginalRow227TriangleData1095.coefficient79_270, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_272, Icur := OriginalRow227TriangleData1084.coefficient78_271,
    output := OriginalRow227TriangleData1095.coefficient79_271, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_273, Icur := OriginalRow227TriangleData1084.coefficient78_272,
    output := OriginalRow227TriangleData1095.coefficient79_272, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_274, Icur := OriginalRow227TriangleData1084.coefficient78_273,
    output := OriginalRow227TriangleData1095.coefficient79_273, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_275, Icur := OriginalRow227TriangleData1084.coefficient78_274,
    output := OriginalRow227TriangleData1095.coefficient79_274, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_276, Icur := OriginalRow227TriangleData1084.coefficient78_275,
    output := OriginalRow227TriangleData1095.coefficient79_275, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_277, Icur := OriginalRow227TriangleData1084.coefficient78_276,
    output := OriginalRow227TriangleData1095.coefficient79_276, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_278, Icur := OriginalRow227TriangleData1084.coefficient78_277,
    output := OriginalRow227TriangleData1095.coefficient79_277, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_279, Icur := OriginalRow227TriangleData1084.coefficient78_278,
    output := OriginalRow227TriangleData1095.coefficient79_278, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_280, Icur := OriginalRow227TriangleData1084.coefficient78_279,
    output := OriginalRow227TriangleData1095.coefficient79_279, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_281, Icur := OriginalRow227TriangleData1084.coefficient78_280,
    output := OriginalRow227TriangleData1095.coefficient79_280, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_282, Icur := OriginalRow227TriangleData1084.coefficient78_281,
    output := OriginalRow227TriangleData1095.coefficient79_281, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_283, Icur := OriginalRow227TriangleData1084.coefficient78_282,
    output := OriginalRow227TriangleData1095.coefficient79_282, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_284, Icur := OriginalRow227TriangleData1084.coefficient78_283,
    output := OriginalRow227TriangleData1095.coefficient79_283, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_285, Icur := OriginalRow227TriangleData1084.coefficient78_284,
    output := OriginalRow227TriangleData1095.coefficient79_284, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_286, Icur := OriginalRow227TriangleData1084.coefficient78_285,
    output := OriginalRow227TriangleData1095.coefficient79_285, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_287, Icur := OriginalRow227TriangleData1084.coefficient78_286,
    output := OriginalRow227TriangleData1095.coefficient79_286, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_288, Icur := OriginalRow227TriangleData1084.coefficient78_287,
    output := OriginalRow227TriangleData1095.coefficient79_287, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_289, Icur := OriginalRow227TriangleData1084.coefficient78_288,
    output := OriginalRow227TriangleData1095.coefficient79_288, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_290, Icur := OriginalRow227TriangleData1084.coefficient78_289,
    output := OriginalRow227TriangleData1095.coefficient79_289, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_291, Icur := OriginalRow227TriangleData1084.coefficient78_290,
    output := OriginalRow227TriangleData1095.coefficient79_290, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_292, Icur := OriginalRow227TriangleData1084.coefficient78_291,
    output := OriginalRow227TriangleData1095.coefficient79_291, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_293, Icur := OriginalRow227TriangleData1084.coefficient78_292,
    output := OriginalRow227TriangleData1095.coefficient79_292, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_294, Icur := OriginalRow227TriangleData1084.coefficient78_293,
    output := OriginalRow227TriangleData1095.coefficient79_293, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_295, Icur := OriginalRow227TriangleData1084.coefficient78_294,
    output := OriginalRow227TriangleData1095.coefficient79_294, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_296, Icur := OriginalRow227TriangleData1084.coefficient78_295,
    output := OriginalRow227TriangleData1095.coefficient79_295, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_297, Icur := OriginalRow227TriangleData1084.coefficient78_296,
    output := OriginalRow227TriangleData1095.coefficient79_296, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_298, Icur := OriginalRow227TriangleData1084.coefficient78_297,
    output := OriginalRow227TriangleData1095.coefficient79_297, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_299, Icur := OriginalRow227TriangleData1084.coefficient78_298,
    output := OriginalRow227TriangleData1095.coefficient79_298, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1084.coefficient78_300, Icur := OriginalRow227TriangleData1084.coefficient78_299,
    output := OriginalRow227TriangleData1095.coefficient79_299, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1085.coefficient78_301, Icur := OriginalRow227TriangleData1084.coefficient78_300,
    output := OriginalRow227TriangleData1095.coefficient79_300, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1085.coefficient78_302, Icur := OriginalRow227TriangleData1085.coefficient78_301,
    output := OriginalRow227TriangleData1095.coefficient79_301, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1079

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1079.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
