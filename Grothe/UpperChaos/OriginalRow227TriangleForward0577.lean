import Grothe.UpperChaos.OriginalRow227TriangleData0579
import Grothe.UpperChaos.OriginalRow227TriangleData0580
import Grothe.UpperChaos.OriginalRow227TriangleData0593
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0577
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_263, Icur := OriginalRow227TriangleData0579.coefficient38_262,
    output := OriginalRow227TriangleData0593.coefficient39_262, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_264, Icur := OriginalRow227TriangleData0579.coefficient38_263,
    output := OriginalRow227TriangleData0593.coefficient39_263, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_265, Icur := OriginalRow227TriangleData0579.coefficient38_264,
    output := OriginalRow227TriangleData0593.coefficient39_264, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_266, Icur := OriginalRow227TriangleData0579.coefficient38_265,
    output := OriginalRow227TriangleData0593.coefficient39_265, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_267, Icur := OriginalRow227TriangleData0579.coefficient38_266,
    output := OriginalRow227TriangleData0593.coefficient39_266, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_268, Icur := OriginalRow227TriangleData0579.coefficient38_267,
    output := OriginalRow227TriangleData0593.coefficient39_267, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_269, Icur := OriginalRow227TriangleData0579.coefficient38_268,
    output := OriginalRow227TriangleData0593.coefficient39_268, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_270, Icur := OriginalRow227TriangleData0579.coefficient38_269,
    output := OriginalRow227TriangleData0593.coefficient39_269, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_271, Icur := OriginalRow227TriangleData0579.coefficient38_270,
    output := OriginalRow227TriangleData0593.coefficient39_270, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_272, Icur := OriginalRow227TriangleData0579.coefficient38_271,
    output := OriginalRow227TriangleData0593.coefficient39_271, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_273, Icur := OriginalRow227TriangleData0579.coefficient38_272,
    output := OriginalRow227TriangleData0593.coefficient39_272, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_274, Icur := OriginalRow227TriangleData0579.coefficient38_273,
    output := OriginalRow227TriangleData0593.coefficient39_273, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_275, Icur := OriginalRow227TriangleData0579.coefficient38_274,
    output := OriginalRow227TriangleData0593.coefficient39_274, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_276, Icur := OriginalRow227TriangleData0579.coefficient38_275,
    output := OriginalRow227TriangleData0593.coefficient39_275, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_277, Icur := OriginalRow227TriangleData0579.coefficient38_276,
    output := OriginalRow227TriangleData0593.coefficient39_276, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_278, Icur := OriginalRow227TriangleData0579.coefficient38_277,
    output := OriginalRow227TriangleData0593.coefficient39_277, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_279, Icur := OriginalRow227TriangleData0579.coefficient38_278,
    output := OriginalRow227TriangleData0593.coefficient39_278, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_280, Icur := OriginalRow227TriangleData0579.coefficient38_279,
    output := OriginalRow227TriangleData0593.coefficient39_279, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_281, Icur := OriginalRow227TriangleData0579.coefficient38_280,
    output := OriginalRow227TriangleData0593.coefficient39_280, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_282, Icur := OriginalRow227TriangleData0579.coefficient38_281,
    output := OriginalRow227TriangleData0593.coefficient39_281, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_283, Icur := OriginalRow227TriangleData0579.coefficient38_282,
    output := OriginalRow227TriangleData0593.coefficient39_282, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_284, Icur := OriginalRow227TriangleData0579.coefficient38_283,
    output := OriginalRow227TriangleData0593.coefficient39_283, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_285, Icur := OriginalRow227TriangleData0579.coefficient38_284,
    output := OriginalRow227TriangleData0593.coefficient39_284, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_286, Icur := OriginalRow227TriangleData0579.coefficient38_285,
    output := OriginalRow227TriangleData0593.coefficient39_285, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_287, Icur := OriginalRow227TriangleData0579.coefficient38_286,
    output := OriginalRow227TriangleData0593.coefficient39_286, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_288, Icur := OriginalRow227TriangleData0579.coefficient38_287,
    output := OriginalRow227TriangleData0593.coefficient39_287, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_289, Icur := OriginalRow227TriangleData0579.coefficient38_288,
    output := OriginalRow227TriangleData0593.coefficient39_288, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_290, Icur := OriginalRow227TriangleData0579.coefficient38_289,
    output := OriginalRow227TriangleData0593.coefficient39_289, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_291, Icur := OriginalRow227TriangleData0579.coefficient38_290,
    output := OriginalRow227TriangleData0593.coefficient39_290, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0579.coefficient38_292, Icur := OriginalRow227TriangleData0579.coefficient38_291,
    output := OriginalRow227TriangleData0593.coefficient39_291, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0580.coefficient38_293, Icur := OriginalRow227TriangleData0579.coefficient38_292,
    output := OriginalRow227TriangleData0593.coefficient39_292, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0580.coefficient38_294, Icur := OriginalRow227TriangleData0580.coefficient38_293,
    output := OriginalRow227TriangleData0593.coefficient39_293, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0577

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0577.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
