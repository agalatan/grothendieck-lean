import Grothe.UpperChaos.OriginalRow227TriangleData1815
import Grothe.UpperChaos.OriginalRow227TriangleData1816
import Grothe.UpperChaos.OriginalRow227TriangleData1821
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1805
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_259, Icur := OriginalRow227TriangleData1815.coefficient162_258,
    output := OriginalRow227TriangleData1821.coefficient163_258, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_260, Icur := OriginalRow227TriangleData1815.coefficient162_259,
    output := OriginalRow227TriangleData1821.coefficient163_259, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_261, Icur := OriginalRow227TriangleData1815.coefficient162_260,
    output := OriginalRow227TriangleData1821.coefficient163_260, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_262, Icur := OriginalRow227TriangleData1815.coefficient162_261,
    output := OriginalRow227TriangleData1821.coefficient163_261, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_263, Icur := OriginalRow227TriangleData1815.coefficient162_262,
    output := OriginalRow227TriangleData1821.coefficient163_262, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_264, Icur := OriginalRow227TriangleData1815.coefficient162_263,
    output := OriginalRow227TriangleData1821.coefficient163_263, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_265, Icur := OriginalRow227TriangleData1815.coefficient162_264,
    output := OriginalRow227TriangleData1821.coefficient163_264, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_266, Icur := OriginalRow227TriangleData1815.coefficient162_265,
    output := OriginalRow227TriangleData1821.coefficient163_265, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_267, Icur := OriginalRow227TriangleData1815.coefficient162_266,
    output := OriginalRow227TriangleData1821.coefficient163_266, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_268, Icur := OriginalRow227TriangleData1815.coefficient162_267,
    output := OriginalRow227TriangleData1821.coefficient163_267, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_269, Icur := OriginalRow227TriangleData1815.coefficient162_268,
    output := OriginalRow227TriangleData1821.coefficient163_268, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_270, Icur := OriginalRow227TriangleData1815.coefficient162_269,
    output := OriginalRow227TriangleData1821.coefficient163_269, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_271, Icur := OriginalRow227TriangleData1815.coefficient162_270,
    output := OriginalRow227TriangleData1821.coefficient163_270, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_272, Icur := OriginalRow227TriangleData1815.coefficient162_271,
    output := OriginalRow227TriangleData1821.coefficient163_271, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_273, Icur := OriginalRow227TriangleData1815.coefficient162_272,
    output := OriginalRow227TriangleData1821.coefficient163_272, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_274, Icur := OriginalRow227TriangleData1815.coefficient162_273,
    output := OriginalRow227TriangleData1821.coefficient163_273, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_275, Icur := OriginalRow227TriangleData1815.coefficient162_274,
    output := OriginalRow227TriangleData1821.coefficient163_274, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_276, Icur := OriginalRow227TriangleData1815.coefficient162_275,
    output := OriginalRow227TriangleData1821.coefficient163_275, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_277, Icur := OriginalRow227TriangleData1815.coefficient162_276,
    output := OriginalRow227TriangleData1821.coefficient163_276, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_278, Icur := OriginalRow227TriangleData1815.coefficient162_277,
    output := OriginalRow227TriangleData1821.coefficient163_277, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_279, Icur := OriginalRow227TriangleData1815.coefficient162_278,
    output := OriginalRow227TriangleData1821.coefficient163_278, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_280, Icur := OriginalRow227TriangleData1815.coefficient162_279,
    output := OriginalRow227TriangleData1821.coefficient163_279, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_281, Icur := OriginalRow227TriangleData1815.coefficient162_280,
    output := OriginalRow227TriangleData1821.coefficient163_280, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_282, Icur := OriginalRow227TriangleData1815.coefficient162_281,
    output := OriginalRow227TriangleData1821.coefficient163_281, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_283, Icur := OriginalRow227TriangleData1815.coefficient162_282,
    output := OriginalRow227TriangleData1821.coefficient163_282, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_284, Icur := OriginalRow227TriangleData1815.coefficient162_283,
    output := OriginalRow227TriangleData1821.coefficient163_283, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_285, Icur := OriginalRow227TriangleData1815.coefficient162_284,
    output := OriginalRow227TriangleData1821.coefficient163_284, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_286, Icur := OriginalRow227TriangleData1815.coefficient162_285,
    output := OriginalRow227TriangleData1821.coefficient163_285, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_287, Icur := OriginalRow227TriangleData1815.coefficient162_286,
    output := OriginalRow227TriangleData1821.coefficient163_286, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1815.coefficient162_288, Icur := OriginalRow227TriangleData1815.coefficient162_287,
    output := OriginalRow227TriangleData1821.coefficient163_287, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_289, Icur := OriginalRow227TriangleData1815.coefficient162_288,
    output := OriginalRow227TriangleData1821.coefficient163_288, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1816.coefficient162_290, Icur := OriginalRow227TriangleData1816.coefficient162_289,
    output := OriginalRow227TriangleData1821.coefficient163_289, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1805

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1805.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
