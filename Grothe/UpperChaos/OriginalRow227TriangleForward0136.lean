import Grothe.UpperChaos.OriginalRow227TriangleData0136
import Grothe.UpperChaos.OriginalRow227TriangleData0137
import Grothe.UpperChaos.OriginalRow227TriangleData0152
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0136
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_265, Icur := OriginalRow227TriangleData0136.coefficient8_264,
    output := OriginalRow227TriangleData0152.coefficient9_264, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_266, Icur := OriginalRow227TriangleData0136.coefficient8_265,
    output := OriginalRow227TriangleData0152.coefficient9_265, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_267, Icur := OriginalRow227TriangleData0136.coefficient8_266,
    output := OriginalRow227TriangleData0152.coefficient9_266, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_268, Icur := OriginalRow227TriangleData0136.coefficient8_267,
    output := OriginalRow227TriangleData0152.coefficient9_267, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_269, Icur := OriginalRow227TriangleData0136.coefficient8_268,
    output := OriginalRow227TriangleData0152.coefficient9_268, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_270, Icur := OriginalRow227TriangleData0136.coefficient8_269,
    output := OriginalRow227TriangleData0152.coefficient9_269, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_271, Icur := OriginalRow227TriangleData0136.coefficient8_270,
    output := OriginalRow227TriangleData0152.coefficient9_270, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_272, Icur := OriginalRow227TriangleData0136.coefficient8_271,
    output := OriginalRow227TriangleData0152.coefficient9_271, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_273, Icur := OriginalRow227TriangleData0136.coefficient8_272,
    output := OriginalRow227TriangleData0152.coefficient9_272, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_274, Icur := OriginalRow227TriangleData0136.coefficient8_273,
    output := OriginalRow227TriangleData0152.coefficient9_273, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_275, Icur := OriginalRow227TriangleData0136.coefficient8_274,
    output := OriginalRow227TriangleData0152.coefficient9_274, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_276, Icur := OriginalRow227TriangleData0136.coefficient8_275,
    output := OriginalRow227TriangleData0152.coefficient9_275, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_277, Icur := OriginalRow227TriangleData0136.coefficient8_276,
    output := OriginalRow227TriangleData0152.coefficient9_276, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_278, Icur := OriginalRow227TriangleData0136.coefficient8_277,
    output := OriginalRow227TriangleData0152.coefficient9_277, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_279, Icur := OriginalRow227TriangleData0136.coefficient8_278,
    output := OriginalRow227TriangleData0152.coefficient9_278, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_280, Icur := OriginalRow227TriangleData0136.coefficient8_279,
    output := OriginalRow227TriangleData0152.coefficient9_279, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_281, Icur := OriginalRow227TriangleData0136.coefficient8_280,
    output := OriginalRow227TriangleData0152.coefficient9_280, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_282, Icur := OriginalRow227TriangleData0136.coefficient8_281,
    output := OriginalRow227TriangleData0152.coefficient9_281, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_283, Icur := OriginalRow227TriangleData0136.coefficient8_282,
    output := OriginalRow227TriangleData0152.coefficient9_282, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_284, Icur := OriginalRow227TriangleData0136.coefficient8_283,
    output := OriginalRow227TriangleData0152.coefficient9_283, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_285, Icur := OriginalRow227TriangleData0136.coefficient8_284,
    output := OriginalRow227TriangleData0152.coefficient9_284, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_286, Icur := OriginalRow227TriangleData0136.coefficient8_285,
    output := OriginalRow227TriangleData0152.coefficient9_285, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_287, Icur := OriginalRow227TriangleData0136.coefficient8_286,
    output := OriginalRow227TriangleData0152.coefficient9_286, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_288, Icur := OriginalRow227TriangleData0136.coefficient8_287,
    output := OriginalRow227TriangleData0152.coefficient9_287, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_289, Icur := OriginalRow227TriangleData0136.coefficient8_288,
    output := OriginalRow227TriangleData0152.coefficient9_288, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_290, Icur := OriginalRow227TriangleData0136.coefficient8_289,
    output := OriginalRow227TriangleData0152.coefficient9_289, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_291, Icur := OriginalRow227TriangleData0136.coefficient8_290,
    output := OriginalRow227TriangleData0152.coefficient9_290, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_292, Icur := OriginalRow227TriangleData0136.coefficient8_291,
    output := OriginalRow227TriangleData0152.coefficient9_291, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_293, Icur := OriginalRow227TriangleData0136.coefficient8_292,
    output := OriginalRow227TriangleData0152.coefficient9_292, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_294, Icur := OriginalRow227TriangleData0136.coefficient8_293,
    output := OriginalRow227TriangleData0152.coefficient9_293, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_295, Icur := OriginalRow227TriangleData0136.coefficient8_294,
    output := OriginalRow227TriangleData0152.coefficient9_294, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_296, Icur := OriginalRow227TriangleData0137.coefficient8_295,
    output := OriginalRow227TriangleData0152.coefficient9_295, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0136

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0136.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
