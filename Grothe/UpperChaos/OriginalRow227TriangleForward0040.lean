import Grothe.UpperChaos.OriginalRow227TriangleData0040
import Grothe.UpperChaos.OriginalRow227TriangleData0041
import Grothe.UpperChaos.OriginalRow227TriangleData0056
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0040
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_259, Icur := OriginalRow227TriangleData0040.coefficient2_258,
    output := OriginalRow227TriangleData0056.coefficient3_258, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_260, Icur := OriginalRow227TriangleData0040.coefficient2_259,
    output := OriginalRow227TriangleData0056.coefficient3_259, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_261, Icur := OriginalRow227TriangleData0040.coefficient2_260,
    output := OriginalRow227TriangleData0056.coefficient3_260, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_262, Icur := OriginalRow227TriangleData0040.coefficient2_261,
    output := OriginalRow227TriangleData0056.coefficient3_261, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_263, Icur := OriginalRow227TriangleData0040.coefficient2_262,
    output := OriginalRow227TriangleData0056.coefficient3_262, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_264, Icur := OriginalRow227TriangleData0040.coefficient2_263,
    output := OriginalRow227TriangleData0056.coefficient3_263, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_265, Icur := OriginalRow227TriangleData0040.coefficient2_264,
    output := OriginalRow227TriangleData0056.coefficient3_264, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_266, Icur := OriginalRow227TriangleData0040.coefficient2_265,
    output := OriginalRow227TriangleData0056.coefficient3_265, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_267, Icur := OriginalRow227TriangleData0040.coefficient2_266,
    output := OriginalRow227TriangleData0056.coefficient3_266, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_268, Icur := OriginalRow227TriangleData0040.coefficient2_267,
    output := OriginalRow227TriangleData0056.coefficient3_267, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_269, Icur := OriginalRow227TriangleData0040.coefficient2_268,
    output := OriginalRow227TriangleData0056.coefficient3_268, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_270, Icur := OriginalRow227TriangleData0040.coefficient2_269,
    output := OriginalRow227TriangleData0056.coefficient3_269, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_271, Icur := OriginalRow227TriangleData0040.coefficient2_270,
    output := OriginalRow227TriangleData0056.coefficient3_270, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_272, Icur := OriginalRow227TriangleData0040.coefficient2_271,
    output := OriginalRow227TriangleData0056.coefficient3_271, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_273, Icur := OriginalRow227TriangleData0040.coefficient2_272,
    output := OriginalRow227TriangleData0056.coefficient3_272, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_274, Icur := OriginalRow227TriangleData0040.coefficient2_273,
    output := OriginalRow227TriangleData0056.coefficient3_273, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_275, Icur := OriginalRow227TriangleData0040.coefficient2_274,
    output := OriginalRow227TriangleData0056.coefficient3_274, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_276, Icur := OriginalRow227TriangleData0040.coefficient2_275,
    output := OriginalRow227TriangleData0056.coefficient3_275, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_277, Icur := OriginalRow227TriangleData0040.coefficient2_276,
    output := OriginalRow227TriangleData0056.coefficient3_276, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_278, Icur := OriginalRow227TriangleData0040.coefficient2_277,
    output := OriginalRow227TriangleData0056.coefficient3_277, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_279, Icur := OriginalRow227TriangleData0040.coefficient2_278,
    output := OriginalRow227TriangleData0056.coefficient3_278, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_280, Icur := OriginalRow227TriangleData0040.coefficient2_279,
    output := OriginalRow227TriangleData0056.coefficient3_279, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_281, Icur := OriginalRow227TriangleData0040.coefficient2_280,
    output := OriginalRow227TriangleData0056.coefficient3_280, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_282, Icur := OriginalRow227TriangleData0040.coefficient2_281,
    output := OriginalRow227TriangleData0056.coefficient3_281, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_283, Icur := OriginalRow227TriangleData0040.coefficient2_282,
    output := OriginalRow227TriangleData0056.coefficient3_282, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_284, Icur := OriginalRow227TriangleData0040.coefficient2_283,
    output := OriginalRow227TriangleData0056.coefficient3_283, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_285, Icur := OriginalRow227TriangleData0040.coefficient2_284,
    output := OriginalRow227TriangleData0056.coefficient3_284, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_286, Icur := OriginalRow227TriangleData0040.coefficient2_285,
    output := OriginalRow227TriangleData0056.coefficient3_285, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_287, Icur := OriginalRow227TriangleData0040.coefficient2_286,
    output := OriginalRow227TriangleData0056.coefficient3_286, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0040.coefficient2_288, Icur := OriginalRow227TriangleData0040.coefficient2_287,
    output := OriginalRow227TriangleData0056.coefficient3_287, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0041.coefficient2_289, Icur := OriginalRow227TriangleData0040.coefficient2_288,
    output := OriginalRow227TriangleData0056.coefficient3_288, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0041.coefficient2_290, Icur := OriginalRow227TriangleData0041.coefficient2_289,
    output := OriginalRow227TriangleData0056.coefficient3_289, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0040

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0040.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
