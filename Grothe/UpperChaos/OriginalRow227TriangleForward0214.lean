import Grothe.UpperChaos.OriginalRow227TriangleData0215
import Grothe.UpperChaos.OriginalRow227TriangleData0216
import Grothe.UpperChaos.OriginalRow227TriangleData0230
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0214
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_270, Icur := OriginalRow227TriangleData0215.coefficient13_269,
    output := OriginalRow227TriangleData0230.coefficient14_269, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_271, Icur := OriginalRow227TriangleData0215.coefficient13_270,
    output := OriginalRow227TriangleData0230.coefficient14_270, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_272, Icur := OriginalRow227TriangleData0215.coefficient13_271,
    output := OriginalRow227TriangleData0230.coefficient14_271, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_273, Icur := OriginalRow227TriangleData0215.coefficient13_272,
    output := OriginalRow227TriangleData0230.coefficient14_272, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_274, Icur := OriginalRow227TriangleData0215.coefficient13_273,
    output := OriginalRow227TriangleData0230.coefficient14_273, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_275, Icur := OriginalRow227TriangleData0215.coefficient13_274,
    output := OriginalRow227TriangleData0230.coefficient14_274, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_276, Icur := OriginalRow227TriangleData0215.coefficient13_275,
    output := OriginalRow227TriangleData0230.coefficient14_275, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_277, Icur := OriginalRow227TriangleData0215.coefficient13_276,
    output := OriginalRow227TriangleData0230.coefficient14_276, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_278, Icur := OriginalRow227TriangleData0215.coefficient13_277,
    output := OriginalRow227TriangleData0230.coefficient14_277, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_279, Icur := OriginalRow227TriangleData0215.coefficient13_278,
    output := OriginalRow227TriangleData0230.coefficient14_278, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_280, Icur := OriginalRow227TriangleData0215.coefficient13_279,
    output := OriginalRow227TriangleData0230.coefficient14_279, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_281, Icur := OriginalRow227TriangleData0215.coefficient13_280,
    output := OriginalRow227TriangleData0230.coefficient14_280, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_282, Icur := OriginalRow227TriangleData0215.coefficient13_281,
    output := OriginalRow227TriangleData0230.coefficient14_281, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_283, Icur := OriginalRow227TriangleData0215.coefficient13_282,
    output := OriginalRow227TriangleData0230.coefficient14_282, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_284, Icur := OriginalRow227TriangleData0215.coefficient13_283,
    output := OriginalRow227TriangleData0230.coefficient14_283, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_285, Icur := OriginalRow227TriangleData0215.coefficient13_284,
    output := OriginalRow227TriangleData0230.coefficient14_284, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_286, Icur := OriginalRow227TriangleData0215.coefficient13_285,
    output := OriginalRow227TriangleData0230.coefficient14_285, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_287, Icur := OriginalRow227TriangleData0215.coefficient13_286,
    output := OriginalRow227TriangleData0230.coefficient14_286, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_288, Icur := OriginalRow227TriangleData0215.coefficient13_287,
    output := OriginalRow227TriangleData0230.coefficient14_287, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_289, Icur := OriginalRow227TriangleData0215.coefficient13_288,
    output := OriginalRow227TriangleData0230.coefficient14_288, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_290, Icur := OriginalRow227TriangleData0215.coefficient13_289,
    output := OriginalRow227TriangleData0230.coefficient14_289, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_291, Icur := OriginalRow227TriangleData0215.coefficient13_290,
    output := OriginalRow227TriangleData0230.coefficient14_290, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_292, Icur := OriginalRow227TriangleData0215.coefficient13_291,
    output := OriginalRow227TriangleData0230.coefficient14_291, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_293, Icur := OriginalRow227TriangleData0215.coefficient13_292,
    output := OriginalRow227TriangleData0230.coefficient14_292, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_294, Icur := OriginalRow227TriangleData0215.coefficient13_293,
    output := OriginalRow227TriangleData0230.coefficient14_293, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_295, Icur := OriginalRow227TriangleData0215.coefficient13_294,
    output := OriginalRow227TriangleData0230.coefficient14_294, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_296, Icur := OriginalRow227TriangleData0215.coefficient13_295,
    output := OriginalRow227TriangleData0230.coefficient14_295, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_297, Icur := OriginalRow227TriangleData0215.coefficient13_296,
    output := OriginalRow227TriangleData0230.coefficient14_296, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_298, Icur := OriginalRow227TriangleData0215.coefficient13_297,
    output := OriginalRow227TriangleData0230.coefficient14_297, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0215.coefficient13_299, Icur := OriginalRow227TriangleData0215.coefficient13_298,
    output := OriginalRow227TriangleData0230.coefficient14_298, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0216.coefficient13_300, Icur := OriginalRow227TriangleData0215.coefficient13_299,
    output := OriginalRow227TriangleData0230.coefficient14_299, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0216.coefficient13_301, Icur := OriginalRow227TriangleData0216.coefficient13_300,
    output := OriginalRow227TriangleData0230.coefficient14_300, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0214

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0214.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
