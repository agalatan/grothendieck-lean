import Grothe.UpperChaos.OriginalRow227TriangleData0168
import Grothe.UpperChaos.OriginalRow227TriangleData0169
import Grothe.UpperChaos.OriginalRow227TriangleData0184
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0168
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_267, Icur := OriginalRow227TriangleData0168.coefficient10_266,
    output := OriginalRow227TriangleData0184.coefficient11_266, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_268, Icur := OriginalRow227TriangleData0168.coefficient10_267,
    output := OriginalRow227TriangleData0184.coefficient11_267, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_269, Icur := OriginalRow227TriangleData0168.coefficient10_268,
    output := OriginalRow227TriangleData0184.coefficient11_268, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_270, Icur := OriginalRow227TriangleData0168.coefficient10_269,
    output := OriginalRow227TriangleData0184.coefficient11_269, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_271, Icur := OriginalRow227TriangleData0168.coefficient10_270,
    output := OriginalRow227TriangleData0184.coefficient11_270, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_272, Icur := OriginalRow227TriangleData0168.coefficient10_271,
    output := OriginalRow227TriangleData0184.coefficient11_271, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_273, Icur := OriginalRow227TriangleData0168.coefficient10_272,
    output := OriginalRow227TriangleData0184.coefficient11_272, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_274, Icur := OriginalRow227TriangleData0168.coefficient10_273,
    output := OriginalRow227TriangleData0184.coefficient11_273, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_275, Icur := OriginalRow227TriangleData0168.coefficient10_274,
    output := OriginalRow227TriangleData0184.coefficient11_274, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_276, Icur := OriginalRow227TriangleData0168.coefficient10_275,
    output := OriginalRow227TriangleData0184.coefficient11_275, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_277, Icur := OriginalRow227TriangleData0168.coefficient10_276,
    output := OriginalRow227TriangleData0184.coefficient11_276, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_278, Icur := OriginalRow227TriangleData0168.coefficient10_277,
    output := OriginalRow227TriangleData0184.coefficient11_277, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_279, Icur := OriginalRow227TriangleData0168.coefficient10_278,
    output := OriginalRow227TriangleData0184.coefficient11_278, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_280, Icur := OriginalRow227TriangleData0168.coefficient10_279,
    output := OriginalRow227TriangleData0184.coefficient11_279, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_281, Icur := OriginalRow227TriangleData0168.coefficient10_280,
    output := OriginalRow227TriangleData0184.coefficient11_280, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_282, Icur := OriginalRow227TriangleData0168.coefficient10_281,
    output := OriginalRow227TriangleData0184.coefficient11_281, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_283, Icur := OriginalRow227TriangleData0168.coefficient10_282,
    output := OriginalRow227TriangleData0184.coefficient11_282, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_284, Icur := OriginalRow227TriangleData0168.coefficient10_283,
    output := OriginalRow227TriangleData0184.coefficient11_283, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_285, Icur := OriginalRow227TriangleData0168.coefficient10_284,
    output := OriginalRow227TriangleData0184.coefficient11_284, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_286, Icur := OriginalRow227TriangleData0168.coefficient10_285,
    output := OriginalRow227TriangleData0184.coefficient11_285, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_287, Icur := OriginalRow227TriangleData0168.coefficient10_286,
    output := OriginalRow227TriangleData0184.coefficient11_286, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_288, Icur := OriginalRow227TriangleData0168.coefficient10_287,
    output := OriginalRow227TriangleData0184.coefficient11_287, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_289, Icur := OriginalRow227TriangleData0168.coefficient10_288,
    output := OriginalRow227TriangleData0184.coefficient11_288, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_290, Icur := OriginalRow227TriangleData0168.coefficient10_289,
    output := OriginalRow227TriangleData0184.coefficient11_289, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_291, Icur := OriginalRow227TriangleData0168.coefficient10_290,
    output := OriginalRow227TriangleData0184.coefficient11_290, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_292, Icur := OriginalRow227TriangleData0168.coefficient10_291,
    output := OriginalRow227TriangleData0184.coefficient11_291, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_293, Icur := OriginalRow227TriangleData0168.coefficient10_292,
    output := OriginalRow227TriangleData0184.coefficient11_292, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_294, Icur := OriginalRow227TriangleData0168.coefficient10_293,
    output := OriginalRow227TriangleData0184.coefficient11_293, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_295, Icur := OriginalRow227TriangleData0168.coefficient10_294,
    output := OriginalRow227TriangleData0184.coefficient11_294, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_296, Icur := OriginalRow227TriangleData0168.coefficient10_295,
    output := OriginalRow227TriangleData0184.coefficient11_295, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0169.coefficient10_297, Icur := OriginalRow227TriangleData0168.coefficient10_296,
    output := OriginalRow227TriangleData0184.coefficient11_296, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0169.coefficient10_298, Icur := OriginalRow227TriangleData0169.coefficient10_297,
    output := OriginalRow227TriangleData0184.coefficient11_297, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0168

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0168.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
