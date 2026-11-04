import Grothe.UpperChaos.OriginalRow227TriangleData0184
import Grothe.UpperChaos.OriginalRow227TriangleData0185
import Grothe.UpperChaos.OriginalRow227TriangleData0200
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0184
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_268, Icur := OriginalRow227TriangleData0184.coefficient11_267,
    output := OriginalRow227TriangleData0200.coefficient12_267, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_269, Icur := OriginalRow227TriangleData0184.coefficient11_268,
    output := OriginalRow227TriangleData0200.coefficient12_268, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_270, Icur := OriginalRow227TriangleData0184.coefficient11_269,
    output := OriginalRow227TriangleData0200.coefficient12_269, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_271, Icur := OriginalRow227TriangleData0184.coefficient11_270,
    output := OriginalRow227TriangleData0200.coefficient12_270, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_272, Icur := OriginalRow227TriangleData0184.coefficient11_271,
    output := OriginalRow227TriangleData0200.coefficient12_271, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_273, Icur := OriginalRow227TriangleData0184.coefficient11_272,
    output := OriginalRow227TriangleData0200.coefficient12_272, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_274, Icur := OriginalRow227TriangleData0184.coefficient11_273,
    output := OriginalRow227TriangleData0200.coefficient12_273, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_275, Icur := OriginalRow227TriangleData0184.coefficient11_274,
    output := OriginalRow227TriangleData0200.coefficient12_274, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_276, Icur := OriginalRow227TriangleData0184.coefficient11_275,
    output := OriginalRow227TriangleData0200.coefficient12_275, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_277, Icur := OriginalRow227TriangleData0184.coefficient11_276,
    output := OriginalRow227TriangleData0200.coefficient12_276, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_278, Icur := OriginalRow227TriangleData0184.coefficient11_277,
    output := OriginalRow227TriangleData0200.coefficient12_277, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_279, Icur := OriginalRow227TriangleData0184.coefficient11_278,
    output := OriginalRow227TriangleData0200.coefficient12_278, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_280, Icur := OriginalRow227TriangleData0184.coefficient11_279,
    output := OriginalRow227TriangleData0200.coefficient12_279, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_281, Icur := OriginalRow227TriangleData0184.coefficient11_280,
    output := OriginalRow227TriangleData0200.coefficient12_280, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_282, Icur := OriginalRow227TriangleData0184.coefficient11_281,
    output := OriginalRow227TriangleData0200.coefficient12_281, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_283, Icur := OriginalRow227TriangleData0184.coefficient11_282,
    output := OriginalRow227TriangleData0200.coefficient12_282, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_284, Icur := OriginalRow227TriangleData0184.coefficient11_283,
    output := OriginalRow227TriangleData0200.coefficient12_283, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_285, Icur := OriginalRow227TriangleData0184.coefficient11_284,
    output := OriginalRow227TriangleData0200.coefficient12_284, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_286, Icur := OriginalRow227TriangleData0184.coefficient11_285,
    output := OriginalRow227TriangleData0200.coefficient12_285, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_287, Icur := OriginalRow227TriangleData0184.coefficient11_286,
    output := OriginalRow227TriangleData0200.coefficient12_286, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_288, Icur := OriginalRow227TriangleData0184.coefficient11_287,
    output := OriginalRow227TriangleData0200.coefficient12_287, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_289, Icur := OriginalRow227TriangleData0184.coefficient11_288,
    output := OriginalRow227TriangleData0200.coefficient12_288, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_290, Icur := OriginalRow227TriangleData0184.coefficient11_289,
    output := OriginalRow227TriangleData0200.coefficient12_289, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_291, Icur := OriginalRow227TriangleData0184.coefficient11_290,
    output := OriginalRow227TriangleData0200.coefficient12_290, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_292, Icur := OriginalRow227TriangleData0184.coefficient11_291,
    output := OriginalRow227TriangleData0200.coefficient12_291, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_293, Icur := OriginalRow227TriangleData0184.coefficient11_292,
    output := OriginalRow227TriangleData0200.coefficient12_292, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_294, Icur := OriginalRow227TriangleData0184.coefficient11_293,
    output := OriginalRow227TriangleData0200.coefficient12_293, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_295, Icur := OriginalRow227TriangleData0184.coefficient11_294,
    output := OriginalRow227TriangleData0200.coefficient12_294, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_296, Icur := OriginalRow227TriangleData0184.coefficient11_295,
    output := OriginalRow227TriangleData0200.coefficient12_295, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0184.coefficient11_297, Icur := OriginalRow227TriangleData0184.coefficient11_296,
    output := OriginalRow227TriangleData0200.coefficient12_296, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0185.coefficient11_298, Icur := OriginalRow227TriangleData0184.coefficient11_297,
    output := OriginalRow227TriangleData0200.coefficient12_297, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0185.coefficient11_299, Icur := OriginalRow227TriangleData0185.coefficient11_298,
    output := OriginalRow227TriangleData0200.coefficient12_298, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0184

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0184.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
