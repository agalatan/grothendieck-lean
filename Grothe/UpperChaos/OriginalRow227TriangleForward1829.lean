import Grothe.UpperChaos.OriginalRow227TriangleData1839
import Grothe.UpperChaos.OriginalRow227TriangleData1840
import Grothe.UpperChaos.OriginalRow227TriangleData1845
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1829
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_263, Icur := OriginalRow227TriangleData1839.coefficient166_262,
    output := OriginalRow227TriangleData1845.coefficient167_262, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_264, Icur := OriginalRow227TriangleData1839.coefficient166_263,
    output := OriginalRow227TriangleData1845.coefficient167_263, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_265, Icur := OriginalRow227TriangleData1839.coefficient166_264,
    output := OriginalRow227TriangleData1845.coefficient167_264, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_266, Icur := OriginalRow227TriangleData1839.coefficient166_265,
    output := OriginalRow227TriangleData1845.coefficient167_265, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_267, Icur := OriginalRow227TriangleData1839.coefficient166_266,
    output := OriginalRow227TriangleData1845.coefficient167_266, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_268, Icur := OriginalRow227TriangleData1839.coefficient166_267,
    output := OriginalRow227TriangleData1845.coefficient167_267, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_269, Icur := OriginalRow227TriangleData1839.coefficient166_268,
    output := OriginalRow227TriangleData1845.coefficient167_268, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_270, Icur := OriginalRow227TriangleData1839.coefficient166_269,
    output := OriginalRow227TriangleData1845.coefficient167_269, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_271, Icur := OriginalRow227TriangleData1839.coefficient166_270,
    output := OriginalRow227TriangleData1845.coefficient167_270, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_272, Icur := OriginalRow227TriangleData1839.coefficient166_271,
    output := OriginalRow227TriangleData1845.coefficient167_271, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_273, Icur := OriginalRow227TriangleData1839.coefficient166_272,
    output := OriginalRow227TriangleData1845.coefficient167_272, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_274, Icur := OriginalRow227TriangleData1839.coefficient166_273,
    output := OriginalRow227TriangleData1845.coefficient167_273, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_275, Icur := OriginalRow227TriangleData1839.coefficient166_274,
    output := OriginalRow227TriangleData1845.coefficient167_274, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_276, Icur := OriginalRow227TriangleData1839.coefficient166_275,
    output := OriginalRow227TriangleData1845.coefficient167_275, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_277, Icur := OriginalRow227TriangleData1839.coefficient166_276,
    output := OriginalRow227TriangleData1845.coefficient167_276, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_278, Icur := OriginalRow227TriangleData1839.coefficient166_277,
    output := OriginalRow227TriangleData1845.coefficient167_277, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_279, Icur := OriginalRow227TriangleData1839.coefficient166_278,
    output := OriginalRow227TriangleData1845.coefficient167_278, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_280, Icur := OriginalRow227TriangleData1839.coefficient166_279,
    output := OriginalRow227TriangleData1845.coefficient167_279, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_281, Icur := OriginalRow227TriangleData1839.coefficient166_280,
    output := OriginalRow227TriangleData1845.coefficient167_280, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_282, Icur := OriginalRow227TriangleData1839.coefficient166_281,
    output := OriginalRow227TriangleData1845.coefficient167_281, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_283, Icur := OriginalRow227TriangleData1839.coefficient166_282,
    output := OriginalRow227TriangleData1845.coefficient167_282, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_284, Icur := OriginalRow227TriangleData1839.coefficient166_283,
    output := OriginalRow227TriangleData1845.coefficient167_283, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_285, Icur := OriginalRow227TriangleData1839.coefficient166_284,
    output := OriginalRow227TriangleData1845.coefficient167_284, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_286, Icur := OriginalRow227TriangleData1839.coefficient166_285,
    output := OriginalRow227TriangleData1845.coefficient167_285, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_287, Icur := OriginalRow227TriangleData1839.coefficient166_286,
    output := OriginalRow227TriangleData1845.coefficient167_286, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_288, Icur := OriginalRow227TriangleData1839.coefficient166_287,
    output := OriginalRow227TriangleData1845.coefficient167_287, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_289, Icur := OriginalRow227TriangleData1839.coefficient166_288,
    output := OriginalRow227TriangleData1845.coefficient167_288, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_290, Icur := OriginalRow227TriangleData1839.coefficient166_289,
    output := OriginalRow227TriangleData1845.coefficient167_289, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_291, Icur := OriginalRow227TriangleData1839.coefficient166_290,
    output := OriginalRow227TriangleData1845.coefficient167_290, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_292, Icur := OriginalRow227TriangleData1839.coefficient166_291,
    output := OriginalRow227TriangleData1845.coefficient167_291, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1840.coefficient166_293, Icur := OriginalRow227TriangleData1839.coefficient166_292,
    output := OriginalRow227TriangleData1845.coefficient167_292, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1840.coefficient166_294, Icur := OriginalRow227TriangleData1840.coefficient166_293,
    output := OriginalRow227TriangleData1845.coefficient167_293, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1829

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1829.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
