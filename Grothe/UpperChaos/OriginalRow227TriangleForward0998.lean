import Grothe.UpperChaos.OriginalRow227TriangleData1002
import Grothe.UpperChaos.OriginalRow227TriangleData1003
import Grothe.UpperChaos.OriginalRow227TriangleData1014
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0998
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_264, Icur := OriginalRow227TriangleData1002.coefficient71_263,
    output := OriginalRow227TriangleData1014.coefficient72_263, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_265, Icur := OriginalRow227TriangleData1002.coefficient71_264,
    output := OriginalRow227TriangleData1014.coefficient72_264, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_266, Icur := OriginalRow227TriangleData1002.coefficient71_265,
    output := OriginalRow227TriangleData1014.coefficient72_265, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_267, Icur := OriginalRow227TriangleData1002.coefficient71_266,
    output := OriginalRow227TriangleData1014.coefficient72_266, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_268, Icur := OriginalRow227TriangleData1002.coefficient71_267,
    output := OriginalRow227TriangleData1014.coefficient72_267, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_269, Icur := OriginalRow227TriangleData1002.coefficient71_268,
    output := OriginalRow227TriangleData1014.coefficient72_268, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_270, Icur := OriginalRow227TriangleData1002.coefficient71_269,
    output := OriginalRow227TriangleData1014.coefficient72_269, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_271, Icur := OriginalRow227TriangleData1002.coefficient71_270,
    output := OriginalRow227TriangleData1014.coefficient72_270, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_272, Icur := OriginalRow227TriangleData1002.coefficient71_271,
    output := OriginalRow227TriangleData1014.coefficient72_271, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_273, Icur := OriginalRow227TriangleData1002.coefficient71_272,
    output := OriginalRow227TriangleData1014.coefficient72_272, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_274, Icur := OriginalRow227TriangleData1002.coefficient71_273,
    output := OriginalRow227TriangleData1014.coefficient72_273, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_275, Icur := OriginalRow227TriangleData1002.coefficient71_274,
    output := OriginalRow227TriangleData1014.coefficient72_274, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_276, Icur := OriginalRow227TriangleData1002.coefficient71_275,
    output := OriginalRow227TriangleData1014.coefficient72_275, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_277, Icur := OriginalRow227TriangleData1002.coefficient71_276,
    output := OriginalRow227TriangleData1014.coefficient72_276, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_278, Icur := OriginalRow227TriangleData1002.coefficient71_277,
    output := OriginalRow227TriangleData1014.coefficient72_277, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_279, Icur := OriginalRow227TriangleData1002.coefficient71_278,
    output := OriginalRow227TriangleData1014.coefficient72_278, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_280, Icur := OriginalRow227TriangleData1002.coefficient71_279,
    output := OriginalRow227TriangleData1014.coefficient72_279, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_281, Icur := OriginalRow227TriangleData1002.coefficient71_280,
    output := OriginalRow227TriangleData1014.coefficient72_280, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_282, Icur := OriginalRow227TriangleData1002.coefficient71_281,
    output := OriginalRow227TriangleData1014.coefficient72_281, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_283, Icur := OriginalRow227TriangleData1002.coefficient71_282,
    output := OriginalRow227TriangleData1014.coefficient72_282, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_284, Icur := OriginalRow227TriangleData1002.coefficient71_283,
    output := OriginalRow227TriangleData1014.coefficient72_283, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_285, Icur := OriginalRow227TriangleData1002.coefficient71_284,
    output := OriginalRow227TriangleData1014.coefficient72_284, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_286, Icur := OriginalRow227TriangleData1002.coefficient71_285,
    output := OriginalRow227TriangleData1014.coefficient72_285, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_287, Icur := OriginalRow227TriangleData1002.coefficient71_286,
    output := OriginalRow227TriangleData1014.coefficient72_286, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_288, Icur := OriginalRow227TriangleData1002.coefficient71_287,
    output := OriginalRow227TriangleData1014.coefficient72_287, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_289, Icur := OriginalRow227TriangleData1002.coefficient71_288,
    output := OriginalRow227TriangleData1014.coefficient72_288, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_290, Icur := OriginalRow227TriangleData1002.coefficient71_289,
    output := OriginalRow227TriangleData1014.coefficient72_289, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_291, Icur := OriginalRow227TriangleData1002.coefficient71_290,
    output := OriginalRow227TriangleData1014.coefficient72_290, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_292, Icur := OriginalRow227TriangleData1002.coefficient71_291,
    output := OriginalRow227TriangleData1014.coefficient72_291, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1002.coefficient71_293, Icur := OriginalRow227TriangleData1002.coefficient71_292,
    output := OriginalRow227TriangleData1014.coefficient72_292, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1003.coefficient71_294, Icur := OriginalRow227TriangleData1002.coefficient71_293,
    output := OriginalRow227TriangleData1014.coefficient72_293, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1003.coefficient71_295, Icur := OriginalRow227TriangleData1003.coefficient71_294,
    output := OriginalRow227TriangleData1014.coefficient72_294, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0998

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0998.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
