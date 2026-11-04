import Grothe.UpperChaos.OriginalRow227TriangleData0072
import Grothe.UpperChaos.OriginalRow227TriangleData0073
import Grothe.UpperChaos.OriginalRow227TriangleData0088
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0072
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_261, Icur := OriginalRow227TriangleData0072.coefficient4_260,
    output := OriginalRow227TriangleData0088.coefficient5_260, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_262, Icur := OriginalRow227TriangleData0072.coefficient4_261,
    output := OriginalRow227TriangleData0088.coefficient5_261, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_263, Icur := OriginalRow227TriangleData0072.coefficient4_262,
    output := OriginalRow227TriangleData0088.coefficient5_262, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_264, Icur := OriginalRow227TriangleData0072.coefficient4_263,
    output := OriginalRow227TriangleData0088.coefficient5_263, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_265, Icur := OriginalRow227TriangleData0072.coefficient4_264,
    output := OriginalRow227TriangleData0088.coefficient5_264, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_266, Icur := OriginalRow227TriangleData0072.coefficient4_265,
    output := OriginalRow227TriangleData0088.coefficient5_265, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_267, Icur := OriginalRow227TriangleData0072.coefficient4_266,
    output := OriginalRow227TriangleData0088.coefficient5_266, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_268, Icur := OriginalRow227TriangleData0072.coefficient4_267,
    output := OriginalRow227TriangleData0088.coefficient5_267, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_269, Icur := OriginalRow227TriangleData0072.coefficient4_268,
    output := OriginalRow227TriangleData0088.coefficient5_268, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_270, Icur := OriginalRow227TriangleData0072.coefficient4_269,
    output := OriginalRow227TriangleData0088.coefficient5_269, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_271, Icur := OriginalRow227TriangleData0072.coefficient4_270,
    output := OriginalRow227TriangleData0088.coefficient5_270, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_272, Icur := OriginalRow227TriangleData0072.coefficient4_271,
    output := OriginalRow227TriangleData0088.coefficient5_271, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_273, Icur := OriginalRow227TriangleData0072.coefficient4_272,
    output := OriginalRow227TriangleData0088.coefficient5_272, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_274, Icur := OriginalRow227TriangleData0072.coefficient4_273,
    output := OriginalRow227TriangleData0088.coefficient5_273, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_275, Icur := OriginalRow227TriangleData0072.coefficient4_274,
    output := OriginalRow227TriangleData0088.coefficient5_274, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_276, Icur := OriginalRow227TriangleData0072.coefficient4_275,
    output := OriginalRow227TriangleData0088.coefficient5_275, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_277, Icur := OriginalRow227TriangleData0072.coefficient4_276,
    output := OriginalRow227TriangleData0088.coefficient5_276, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_278, Icur := OriginalRow227TriangleData0072.coefficient4_277,
    output := OriginalRow227TriangleData0088.coefficient5_277, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_279, Icur := OriginalRow227TriangleData0072.coefficient4_278,
    output := OriginalRow227TriangleData0088.coefficient5_278, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_280, Icur := OriginalRow227TriangleData0072.coefficient4_279,
    output := OriginalRow227TriangleData0088.coefficient5_279, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_281, Icur := OriginalRow227TriangleData0072.coefficient4_280,
    output := OriginalRow227TriangleData0088.coefficient5_280, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_282, Icur := OriginalRow227TriangleData0072.coefficient4_281,
    output := OriginalRow227TriangleData0088.coefficient5_281, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_283, Icur := OriginalRow227TriangleData0072.coefficient4_282,
    output := OriginalRow227TriangleData0088.coefficient5_282, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_284, Icur := OriginalRow227TriangleData0072.coefficient4_283,
    output := OriginalRow227TriangleData0088.coefficient5_283, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_285, Icur := OriginalRow227TriangleData0072.coefficient4_284,
    output := OriginalRow227TriangleData0088.coefficient5_284, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_286, Icur := OriginalRow227TriangleData0072.coefficient4_285,
    output := OriginalRow227TriangleData0088.coefficient5_285, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_287, Icur := OriginalRow227TriangleData0072.coefficient4_286,
    output := OriginalRow227TriangleData0088.coefficient5_286, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_288, Icur := OriginalRow227TriangleData0072.coefficient4_287,
    output := OriginalRow227TriangleData0088.coefficient5_287, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_289, Icur := OriginalRow227TriangleData0072.coefficient4_288,
    output := OriginalRow227TriangleData0088.coefficient5_288, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0072.coefficient4_290, Icur := OriginalRow227TriangleData0072.coefficient4_289,
    output := OriginalRow227TriangleData0088.coefficient5_289, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_291, Icur := OriginalRow227TriangleData0072.coefficient4_290,
    output := OriginalRow227TriangleData0088.coefficient5_290, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_292, Icur := OriginalRow227TriangleData0073.coefficient4_291,
    output := OriginalRow227TriangleData0088.coefficient5_291, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0072

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0072.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
