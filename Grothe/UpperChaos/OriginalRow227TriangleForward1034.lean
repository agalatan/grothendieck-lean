import Grothe.UpperChaos.OriginalRow227TriangleData1038
import Grothe.UpperChaos.OriginalRow227TriangleData1039
import Grothe.UpperChaos.OriginalRow227TriangleData1050
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1034
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_267, Icur := OriginalRow227TriangleData1038.coefficient74_266,
    output := OriginalRow227TriangleData1050.coefficient75_266, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_268, Icur := OriginalRow227TriangleData1038.coefficient74_267,
    output := OriginalRow227TriangleData1050.coefficient75_267, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_269, Icur := OriginalRow227TriangleData1038.coefficient74_268,
    output := OriginalRow227TriangleData1050.coefficient75_268, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_270, Icur := OriginalRow227TriangleData1038.coefficient74_269,
    output := OriginalRow227TriangleData1050.coefficient75_269, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_271, Icur := OriginalRow227TriangleData1038.coefficient74_270,
    output := OriginalRow227TriangleData1050.coefficient75_270, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_272, Icur := OriginalRow227TriangleData1038.coefficient74_271,
    output := OriginalRow227TriangleData1050.coefficient75_271, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_273, Icur := OriginalRow227TriangleData1038.coefficient74_272,
    output := OriginalRow227TriangleData1050.coefficient75_272, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_274, Icur := OriginalRow227TriangleData1038.coefficient74_273,
    output := OriginalRow227TriangleData1050.coefficient75_273, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_275, Icur := OriginalRow227TriangleData1038.coefficient74_274,
    output := OriginalRow227TriangleData1050.coefficient75_274, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_276, Icur := OriginalRow227TriangleData1038.coefficient74_275,
    output := OriginalRow227TriangleData1050.coefficient75_275, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_277, Icur := OriginalRow227TriangleData1038.coefficient74_276,
    output := OriginalRow227TriangleData1050.coefficient75_276, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_278, Icur := OriginalRow227TriangleData1038.coefficient74_277,
    output := OriginalRow227TriangleData1050.coefficient75_277, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_279, Icur := OriginalRow227TriangleData1038.coefficient74_278,
    output := OriginalRow227TriangleData1050.coefficient75_278, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_280, Icur := OriginalRow227TriangleData1038.coefficient74_279,
    output := OriginalRow227TriangleData1050.coefficient75_279, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_281, Icur := OriginalRow227TriangleData1038.coefficient74_280,
    output := OriginalRow227TriangleData1050.coefficient75_280, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_282, Icur := OriginalRow227TriangleData1038.coefficient74_281,
    output := OriginalRow227TriangleData1050.coefficient75_281, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_283, Icur := OriginalRow227TriangleData1038.coefficient74_282,
    output := OriginalRow227TriangleData1050.coefficient75_282, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_284, Icur := OriginalRow227TriangleData1038.coefficient74_283,
    output := OriginalRow227TriangleData1050.coefficient75_283, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_285, Icur := OriginalRow227TriangleData1038.coefficient74_284,
    output := OriginalRow227TriangleData1050.coefficient75_284, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_286, Icur := OriginalRow227TriangleData1038.coefficient74_285,
    output := OriginalRow227TriangleData1050.coefficient75_285, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_287, Icur := OriginalRow227TriangleData1038.coefficient74_286,
    output := OriginalRow227TriangleData1050.coefficient75_286, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_288, Icur := OriginalRow227TriangleData1038.coefficient74_287,
    output := OriginalRow227TriangleData1050.coefficient75_287, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_289, Icur := OriginalRow227TriangleData1038.coefficient74_288,
    output := OriginalRow227TriangleData1050.coefficient75_288, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_290, Icur := OriginalRow227TriangleData1038.coefficient74_289,
    output := OriginalRow227TriangleData1050.coefficient75_289, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_291, Icur := OriginalRow227TriangleData1038.coefficient74_290,
    output := OriginalRow227TriangleData1050.coefficient75_290, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_292, Icur := OriginalRow227TriangleData1038.coefficient74_291,
    output := OriginalRow227TriangleData1050.coefficient75_291, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_293, Icur := OriginalRow227TriangleData1038.coefficient74_292,
    output := OriginalRow227TriangleData1050.coefficient75_292, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_294, Icur := OriginalRow227TriangleData1038.coefficient74_293,
    output := OriginalRow227TriangleData1050.coefficient75_293, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_295, Icur := OriginalRow227TriangleData1038.coefficient74_294,
    output := OriginalRow227TriangleData1050.coefficient75_294, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1038.coefficient74_296, Icur := OriginalRow227TriangleData1038.coefficient74_295,
    output := OriginalRow227TriangleData1050.coefficient75_295, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_297, Icur := OriginalRow227TriangleData1038.coefficient74_296,
    output := OriginalRow227TriangleData1050.coefficient75_296, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_298, Icur := OriginalRow227TriangleData1039.coefficient74_297,
    output := OriginalRow227TriangleData1050.coefficient75_297, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1034

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1034.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
