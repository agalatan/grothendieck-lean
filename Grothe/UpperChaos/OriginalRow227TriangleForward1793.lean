import Grothe.UpperChaos.OriginalRow227TriangleData1803
import Grothe.UpperChaos.OriginalRow227TriangleData1804
import Grothe.UpperChaos.OriginalRow227TriangleData1809
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1793
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_257, Icur := OriginalRow227TriangleData1803.coefficient160_256,
    output := OriginalRow227TriangleData1809.coefficient161_256, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_258, Icur := OriginalRow227TriangleData1803.coefficient160_257,
    output := OriginalRow227TriangleData1809.coefficient161_257, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_259, Icur := OriginalRow227TriangleData1803.coefficient160_258,
    output := OriginalRow227TriangleData1809.coefficient161_258, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_260, Icur := OriginalRow227TriangleData1803.coefficient160_259,
    output := OriginalRow227TriangleData1809.coefficient161_259, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_261, Icur := OriginalRow227TriangleData1803.coefficient160_260,
    output := OriginalRow227TriangleData1809.coefficient161_260, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_262, Icur := OriginalRow227TriangleData1803.coefficient160_261,
    output := OriginalRow227TriangleData1809.coefficient161_261, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_263, Icur := OriginalRow227TriangleData1803.coefficient160_262,
    output := OriginalRow227TriangleData1809.coefficient161_262, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_264, Icur := OriginalRow227TriangleData1803.coefficient160_263,
    output := OriginalRow227TriangleData1809.coefficient161_263, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_265, Icur := OriginalRow227TriangleData1803.coefficient160_264,
    output := OriginalRow227TriangleData1809.coefficient161_264, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_266, Icur := OriginalRow227TriangleData1803.coefficient160_265,
    output := OriginalRow227TriangleData1809.coefficient161_265, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_267, Icur := OriginalRow227TriangleData1803.coefficient160_266,
    output := OriginalRow227TriangleData1809.coefficient161_266, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_268, Icur := OriginalRow227TriangleData1803.coefficient160_267,
    output := OriginalRow227TriangleData1809.coefficient161_267, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_269, Icur := OriginalRow227TriangleData1803.coefficient160_268,
    output := OriginalRow227TriangleData1809.coefficient161_268, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_270, Icur := OriginalRow227TriangleData1803.coefficient160_269,
    output := OriginalRow227TriangleData1809.coefficient161_269, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_271, Icur := OriginalRow227TriangleData1803.coefficient160_270,
    output := OriginalRow227TriangleData1809.coefficient161_270, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_272, Icur := OriginalRow227TriangleData1803.coefficient160_271,
    output := OriginalRow227TriangleData1809.coefficient161_271, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_273, Icur := OriginalRow227TriangleData1803.coefficient160_272,
    output := OriginalRow227TriangleData1809.coefficient161_272, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_274, Icur := OriginalRow227TriangleData1803.coefficient160_273,
    output := OriginalRow227TriangleData1809.coefficient161_273, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_275, Icur := OriginalRow227TriangleData1803.coefficient160_274,
    output := OriginalRow227TriangleData1809.coefficient161_274, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_276, Icur := OriginalRow227TriangleData1803.coefficient160_275,
    output := OriginalRow227TriangleData1809.coefficient161_275, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_277, Icur := OriginalRow227TriangleData1803.coefficient160_276,
    output := OriginalRow227TriangleData1809.coefficient161_276, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_278, Icur := OriginalRow227TriangleData1803.coefficient160_277,
    output := OriginalRow227TriangleData1809.coefficient161_277, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_279, Icur := OriginalRow227TriangleData1803.coefficient160_278,
    output := OriginalRow227TriangleData1809.coefficient161_278, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_280, Icur := OriginalRow227TriangleData1803.coefficient160_279,
    output := OriginalRow227TriangleData1809.coefficient161_279, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_281, Icur := OriginalRow227TriangleData1803.coefficient160_280,
    output := OriginalRow227TriangleData1809.coefficient161_280, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_282, Icur := OriginalRow227TriangleData1803.coefficient160_281,
    output := OriginalRow227TriangleData1809.coefficient161_281, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_283, Icur := OriginalRow227TriangleData1803.coefficient160_282,
    output := OriginalRow227TriangleData1809.coefficient161_282, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_284, Icur := OriginalRow227TriangleData1803.coefficient160_283,
    output := OriginalRow227TriangleData1809.coefficient161_283, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_285, Icur := OriginalRow227TriangleData1803.coefficient160_284,
    output := OriginalRow227TriangleData1809.coefficient161_284, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1803.coefficient160_286, Icur := OriginalRow227TriangleData1803.coefficient160_285,
    output := OriginalRow227TriangleData1809.coefficient161_285, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1804.coefficient160_287, Icur := OriginalRow227TriangleData1803.coefficient160_286,
    output := OriginalRow227TriangleData1809.coefficient161_286, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1804.coefficient160_288, Icur := OriginalRow227TriangleData1804.coefficient160_287,
    output := OriginalRow227TriangleData1809.coefficient161_287, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1793

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1793.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
