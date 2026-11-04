import Grothe.UpperChaos.OriginalRow227TriangleData1014
import Grothe.UpperChaos.OriginalRow227TriangleData1015
import Grothe.UpperChaos.OriginalRow227TriangleData1026
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1010
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_265, Icur := OriginalRow227TriangleData1014.coefficient72_264,
    output := OriginalRow227TriangleData1026.coefficient73_264, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_266, Icur := OriginalRow227TriangleData1014.coefficient72_265,
    output := OriginalRow227TriangleData1026.coefficient73_265, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_267, Icur := OriginalRow227TriangleData1014.coefficient72_266,
    output := OriginalRow227TriangleData1026.coefficient73_266, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_268, Icur := OriginalRow227TriangleData1014.coefficient72_267,
    output := OriginalRow227TriangleData1026.coefficient73_267, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_269, Icur := OriginalRow227TriangleData1014.coefficient72_268,
    output := OriginalRow227TriangleData1026.coefficient73_268, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_270, Icur := OriginalRow227TriangleData1014.coefficient72_269,
    output := OriginalRow227TriangleData1026.coefficient73_269, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_271, Icur := OriginalRow227TriangleData1014.coefficient72_270,
    output := OriginalRow227TriangleData1026.coefficient73_270, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_272, Icur := OriginalRow227TriangleData1014.coefficient72_271,
    output := OriginalRow227TriangleData1026.coefficient73_271, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_273, Icur := OriginalRow227TriangleData1014.coefficient72_272,
    output := OriginalRow227TriangleData1026.coefficient73_272, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_274, Icur := OriginalRow227TriangleData1014.coefficient72_273,
    output := OriginalRow227TriangleData1026.coefficient73_273, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_275, Icur := OriginalRow227TriangleData1014.coefficient72_274,
    output := OriginalRow227TriangleData1026.coefficient73_274, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_276, Icur := OriginalRow227TriangleData1014.coefficient72_275,
    output := OriginalRow227TriangleData1026.coefficient73_275, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_277, Icur := OriginalRow227TriangleData1014.coefficient72_276,
    output := OriginalRow227TriangleData1026.coefficient73_276, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_278, Icur := OriginalRow227TriangleData1014.coefficient72_277,
    output := OriginalRow227TriangleData1026.coefficient73_277, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_279, Icur := OriginalRow227TriangleData1014.coefficient72_278,
    output := OriginalRow227TriangleData1026.coefficient73_278, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_280, Icur := OriginalRow227TriangleData1014.coefficient72_279,
    output := OriginalRow227TriangleData1026.coefficient73_279, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_281, Icur := OriginalRow227TriangleData1014.coefficient72_280,
    output := OriginalRow227TriangleData1026.coefficient73_280, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_282, Icur := OriginalRow227TriangleData1014.coefficient72_281,
    output := OriginalRow227TriangleData1026.coefficient73_281, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_283, Icur := OriginalRow227TriangleData1014.coefficient72_282,
    output := OriginalRow227TriangleData1026.coefficient73_282, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_284, Icur := OriginalRow227TriangleData1014.coefficient72_283,
    output := OriginalRow227TriangleData1026.coefficient73_283, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_285, Icur := OriginalRow227TriangleData1014.coefficient72_284,
    output := OriginalRow227TriangleData1026.coefficient73_284, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_286, Icur := OriginalRow227TriangleData1014.coefficient72_285,
    output := OriginalRow227TriangleData1026.coefficient73_285, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_287, Icur := OriginalRow227TriangleData1014.coefficient72_286,
    output := OriginalRow227TriangleData1026.coefficient73_286, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_288, Icur := OriginalRow227TriangleData1014.coefficient72_287,
    output := OriginalRow227TriangleData1026.coefficient73_287, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_289, Icur := OriginalRow227TriangleData1014.coefficient72_288,
    output := OriginalRow227TriangleData1026.coefficient73_288, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_290, Icur := OriginalRow227TriangleData1014.coefficient72_289,
    output := OriginalRow227TriangleData1026.coefficient73_289, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_291, Icur := OriginalRow227TriangleData1014.coefficient72_290,
    output := OriginalRow227TriangleData1026.coefficient73_290, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_292, Icur := OriginalRow227TriangleData1014.coefficient72_291,
    output := OriginalRow227TriangleData1026.coefficient73_291, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_293, Icur := OriginalRow227TriangleData1014.coefficient72_292,
    output := OriginalRow227TriangleData1026.coefficient73_292, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1014.coefficient72_294, Icur := OriginalRow227TriangleData1014.coefficient72_293,
    output := OriginalRow227TriangleData1026.coefficient73_293, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_295, Icur := OriginalRow227TriangleData1014.coefficient72_294,
    output := OriginalRow227TriangleData1026.coefficient73_294, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_296, Icur := OriginalRow227TriangleData1015.coefficient72_295,
    output := OriginalRow227TriangleData1026.coefficient73_295, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1010

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1010.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
