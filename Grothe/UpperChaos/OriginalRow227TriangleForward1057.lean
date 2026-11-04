import Grothe.UpperChaos.OriginalRow227TriangleData1062
import Grothe.UpperChaos.OriginalRow227TriangleData1063
import Grothe.UpperChaos.OriginalRow227TriangleData1073
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1057
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_269, Icur := OriginalRow227TriangleData1062.coefficient76_268,
    output := OriginalRow227TriangleData1073.coefficient77_268, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_270, Icur := OriginalRow227TriangleData1062.coefficient76_269,
    output := OriginalRow227TriangleData1073.coefficient77_269, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_271, Icur := OriginalRow227TriangleData1062.coefficient76_270,
    output := OriginalRow227TriangleData1073.coefficient77_270, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_272, Icur := OriginalRow227TriangleData1062.coefficient76_271,
    output := OriginalRow227TriangleData1073.coefficient77_271, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_273, Icur := OriginalRow227TriangleData1062.coefficient76_272,
    output := OriginalRow227TriangleData1073.coefficient77_272, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_274, Icur := OriginalRow227TriangleData1062.coefficient76_273,
    output := OriginalRow227TriangleData1073.coefficient77_273, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_275, Icur := OriginalRow227TriangleData1062.coefficient76_274,
    output := OriginalRow227TriangleData1073.coefficient77_274, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_276, Icur := OriginalRow227TriangleData1062.coefficient76_275,
    output := OriginalRow227TriangleData1073.coefficient77_275, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_277, Icur := OriginalRow227TriangleData1062.coefficient76_276,
    output := OriginalRow227TriangleData1073.coefficient77_276, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_278, Icur := OriginalRow227TriangleData1062.coefficient76_277,
    output := OriginalRow227TriangleData1073.coefficient77_277, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_279, Icur := OriginalRow227TriangleData1062.coefficient76_278,
    output := OriginalRow227TriangleData1073.coefficient77_278, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_280, Icur := OriginalRow227TriangleData1062.coefficient76_279,
    output := OriginalRow227TriangleData1073.coefficient77_279, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_281, Icur := OriginalRow227TriangleData1062.coefficient76_280,
    output := OriginalRow227TriangleData1073.coefficient77_280, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_282, Icur := OriginalRow227TriangleData1062.coefficient76_281,
    output := OriginalRow227TriangleData1073.coefficient77_281, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_283, Icur := OriginalRow227TriangleData1062.coefficient76_282,
    output := OriginalRow227TriangleData1073.coefficient77_282, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_284, Icur := OriginalRow227TriangleData1062.coefficient76_283,
    output := OriginalRow227TriangleData1073.coefficient77_283, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_285, Icur := OriginalRow227TriangleData1062.coefficient76_284,
    output := OriginalRow227TriangleData1073.coefficient77_284, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_286, Icur := OriginalRow227TriangleData1062.coefficient76_285,
    output := OriginalRow227TriangleData1073.coefficient77_285, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_287, Icur := OriginalRow227TriangleData1062.coefficient76_286,
    output := OriginalRow227TriangleData1073.coefficient77_286, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_288, Icur := OriginalRow227TriangleData1062.coefficient76_287,
    output := OriginalRow227TriangleData1073.coefficient77_287, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_289, Icur := OriginalRow227TriangleData1062.coefficient76_288,
    output := OriginalRow227TriangleData1073.coefficient77_288, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_290, Icur := OriginalRow227TriangleData1062.coefficient76_289,
    output := OriginalRow227TriangleData1073.coefficient77_289, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_291, Icur := OriginalRow227TriangleData1062.coefficient76_290,
    output := OriginalRow227TriangleData1073.coefficient77_290, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_292, Icur := OriginalRow227TriangleData1062.coefficient76_291,
    output := OriginalRow227TriangleData1073.coefficient77_291, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_293, Icur := OriginalRow227TriangleData1062.coefficient76_292,
    output := OriginalRow227TriangleData1073.coefficient77_292, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_294, Icur := OriginalRow227TriangleData1062.coefficient76_293,
    output := OriginalRow227TriangleData1073.coefficient77_293, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_295, Icur := OriginalRow227TriangleData1062.coefficient76_294,
    output := OriginalRow227TriangleData1073.coefficient77_294, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_296, Icur := OriginalRow227TriangleData1062.coefficient76_295,
    output := OriginalRow227TriangleData1073.coefficient77_295, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_297, Icur := OriginalRow227TriangleData1062.coefficient76_296,
    output := OriginalRow227TriangleData1073.coefficient77_296, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1062.coefficient76_298, Icur := OriginalRow227TriangleData1062.coefficient76_297,
    output := OriginalRow227TriangleData1073.coefficient77_297, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1063.coefficient76_299, Icur := OriginalRow227TriangleData1062.coefficient76_298,
    output := OriginalRow227TriangleData1073.coefficient77_298, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1063.coefficient76_300, Icur := OriginalRow227TriangleData1063.coefficient76_299,
    output := OriginalRow227TriangleData1073.coefficient77_299, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1057

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1057.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
