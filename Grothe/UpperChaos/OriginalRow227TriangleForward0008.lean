import Grothe.UpperChaos.OriginalRow227TriangleData0008
import Grothe.UpperChaos.OriginalRow227TriangleData0009
import Grothe.UpperChaos.OriginalRow227TriangleData0024
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0008
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_257, Icur := OriginalRow227TriangleData0008.coefficient0_256,
    output := OriginalRow227TriangleData0024.coefficient1_256, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_258, Icur := OriginalRow227TriangleData0008.coefficient0_257,
    output := OriginalRow227TriangleData0024.coefficient1_257, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_259, Icur := OriginalRow227TriangleData0008.coefficient0_258,
    output := OriginalRow227TriangleData0024.coefficient1_258, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_260, Icur := OriginalRow227TriangleData0008.coefficient0_259,
    output := OriginalRow227TriangleData0024.coefficient1_259, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_261, Icur := OriginalRow227TriangleData0008.coefficient0_260,
    output := OriginalRow227TriangleData0024.coefficient1_260, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_262, Icur := OriginalRow227TriangleData0008.coefficient0_261,
    output := OriginalRow227TriangleData0024.coefficient1_261, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_263, Icur := OriginalRow227TriangleData0008.coefficient0_262,
    output := OriginalRow227TriangleData0024.coefficient1_262, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_264, Icur := OriginalRow227TriangleData0008.coefficient0_263,
    output := OriginalRow227TriangleData0024.coefficient1_263, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_265, Icur := OriginalRow227TriangleData0008.coefficient0_264,
    output := OriginalRow227TriangleData0024.coefficient1_264, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_266, Icur := OriginalRow227TriangleData0008.coefficient0_265,
    output := OriginalRow227TriangleData0024.coefficient1_265, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_267, Icur := OriginalRow227TriangleData0008.coefficient0_266,
    output := OriginalRow227TriangleData0024.coefficient1_266, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_268, Icur := OriginalRow227TriangleData0008.coefficient0_267,
    output := OriginalRow227TriangleData0024.coefficient1_267, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_269, Icur := OriginalRow227TriangleData0008.coefficient0_268,
    output := OriginalRow227TriangleData0024.coefficient1_268, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_270, Icur := OriginalRow227TriangleData0008.coefficient0_269,
    output := OriginalRow227TriangleData0024.coefficient1_269, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_271, Icur := OriginalRow227TriangleData0008.coefficient0_270,
    output := OriginalRow227TriangleData0024.coefficient1_270, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_272, Icur := OriginalRow227TriangleData0008.coefficient0_271,
    output := OriginalRow227TriangleData0024.coefficient1_271, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_273, Icur := OriginalRow227TriangleData0008.coefficient0_272,
    output := OriginalRow227TriangleData0024.coefficient1_272, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_274, Icur := OriginalRow227TriangleData0008.coefficient0_273,
    output := OriginalRow227TriangleData0024.coefficient1_273, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_275, Icur := OriginalRow227TriangleData0008.coefficient0_274,
    output := OriginalRow227TriangleData0024.coefficient1_274, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_276, Icur := OriginalRow227TriangleData0008.coefficient0_275,
    output := OriginalRow227TriangleData0024.coefficient1_275, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_277, Icur := OriginalRow227TriangleData0008.coefficient0_276,
    output := OriginalRow227TriangleData0024.coefficient1_276, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_278, Icur := OriginalRow227TriangleData0008.coefficient0_277,
    output := OriginalRow227TriangleData0024.coefficient1_277, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_279, Icur := OriginalRow227TriangleData0008.coefficient0_278,
    output := OriginalRow227TriangleData0024.coefficient1_278, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_280, Icur := OriginalRow227TriangleData0008.coefficient0_279,
    output := OriginalRow227TriangleData0024.coefficient1_279, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_281, Icur := OriginalRow227TriangleData0008.coefficient0_280,
    output := OriginalRow227TriangleData0024.coefficient1_280, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_282, Icur := OriginalRow227TriangleData0008.coefficient0_281,
    output := OriginalRow227TriangleData0024.coefficient1_281, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_283, Icur := OriginalRow227TriangleData0008.coefficient0_282,
    output := OriginalRow227TriangleData0024.coefficient1_282, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_284, Icur := OriginalRow227TriangleData0008.coefficient0_283,
    output := OriginalRow227TriangleData0024.coefficient1_283, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_285, Icur := OriginalRow227TriangleData0008.coefficient0_284,
    output := OriginalRow227TriangleData0024.coefficient1_284, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_286, Icur := OriginalRow227TriangleData0008.coefficient0_285,
    output := OriginalRow227TriangleData0024.coefficient1_285, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0008.coefficient0_287, Icur := OriginalRow227TriangleData0008.coefficient0_286,
    output := OriginalRow227TriangleData0024.coefficient1_286, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0009.coefficient0_288, Icur := OriginalRow227TriangleData0008.coefficient0_287,
    output := OriginalRow227TriangleData0024.coefficient1_287, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0008

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0008.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
