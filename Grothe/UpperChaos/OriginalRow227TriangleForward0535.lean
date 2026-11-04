import Grothe.UpperChaos.OriginalRow227TriangleData0537
import Grothe.UpperChaos.OriginalRow227TriangleData0538
import Grothe.UpperChaos.OriginalRow227TriangleData0551
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0535
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_260, Icur := OriginalRow227TriangleData0537.coefficient35_259,
    output := OriginalRow227TriangleData0551.coefficient36_259, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_261, Icur := OriginalRow227TriangleData0537.coefficient35_260,
    output := OriginalRow227TriangleData0551.coefficient36_260, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_262, Icur := OriginalRow227TriangleData0537.coefficient35_261,
    output := OriginalRow227TriangleData0551.coefficient36_261, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_263, Icur := OriginalRow227TriangleData0537.coefficient35_262,
    output := OriginalRow227TriangleData0551.coefficient36_262, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_264, Icur := OriginalRow227TriangleData0537.coefficient35_263,
    output := OriginalRow227TriangleData0551.coefficient36_263, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_265, Icur := OriginalRow227TriangleData0537.coefficient35_264,
    output := OriginalRow227TriangleData0551.coefficient36_264, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_266, Icur := OriginalRow227TriangleData0537.coefficient35_265,
    output := OriginalRow227TriangleData0551.coefficient36_265, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_267, Icur := OriginalRow227TriangleData0537.coefficient35_266,
    output := OriginalRow227TriangleData0551.coefficient36_266, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_268, Icur := OriginalRow227TriangleData0537.coefficient35_267,
    output := OriginalRow227TriangleData0551.coefficient36_267, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_269, Icur := OriginalRow227TriangleData0537.coefficient35_268,
    output := OriginalRow227TriangleData0551.coefficient36_268, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_270, Icur := OriginalRow227TriangleData0537.coefficient35_269,
    output := OriginalRow227TriangleData0551.coefficient36_269, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_271, Icur := OriginalRow227TriangleData0537.coefficient35_270,
    output := OriginalRow227TriangleData0551.coefficient36_270, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_272, Icur := OriginalRow227TriangleData0537.coefficient35_271,
    output := OriginalRow227TriangleData0551.coefficient36_271, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_273, Icur := OriginalRow227TriangleData0537.coefficient35_272,
    output := OriginalRow227TriangleData0551.coefficient36_272, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_274, Icur := OriginalRow227TriangleData0537.coefficient35_273,
    output := OriginalRow227TriangleData0551.coefficient36_273, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_275, Icur := OriginalRow227TriangleData0537.coefficient35_274,
    output := OriginalRow227TriangleData0551.coefficient36_274, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_276, Icur := OriginalRow227TriangleData0537.coefficient35_275,
    output := OriginalRow227TriangleData0551.coefficient36_275, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_277, Icur := OriginalRow227TriangleData0537.coefficient35_276,
    output := OriginalRow227TriangleData0551.coefficient36_276, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_278, Icur := OriginalRow227TriangleData0537.coefficient35_277,
    output := OriginalRow227TriangleData0551.coefficient36_277, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_279, Icur := OriginalRow227TriangleData0537.coefficient35_278,
    output := OriginalRow227TriangleData0551.coefficient36_278, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_280, Icur := OriginalRow227TriangleData0537.coefficient35_279,
    output := OriginalRow227TriangleData0551.coefficient36_279, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_281, Icur := OriginalRow227TriangleData0537.coefficient35_280,
    output := OriginalRow227TriangleData0551.coefficient36_280, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_282, Icur := OriginalRow227TriangleData0537.coefficient35_281,
    output := OriginalRow227TriangleData0551.coefficient36_281, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_283, Icur := OriginalRow227TriangleData0537.coefficient35_282,
    output := OriginalRow227TriangleData0551.coefficient36_282, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_284, Icur := OriginalRow227TriangleData0537.coefficient35_283,
    output := OriginalRow227TriangleData0551.coefficient36_283, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_285, Icur := OriginalRow227TriangleData0537.coefficient35_284,
    output := OriginalRow227TriangleData0551.coefficient36_284, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_286, Icur := OriginalRow227TriangleData0537.coefficient35_285,
    output := OriginalRow227TriangleData0551.coefficient36_285, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_287, Icur := OriginalRow227TriangleData0537.coefficient35_286,
    output := OriginalRow227TriangleData0551.coefficient36_286, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_288, Icur := OriginalRow227TriangleData0537.coefficient35_287,
    output := OriginalRow227TriangleData0551.coefficient36_287, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_289, Icur := OriginalRow227TriangleData0537.coefficient35_288,
    output := OriginalRow227TriangleData0551.coefficient36_288, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_290, Icur := OriginalRow227TriangleData0537.coefficient35_289,
    output := OriginalRow227TriangleData0551.coefficient36_289, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0538.coefficient35_291, Icur := OriginalRow227TriangleData0538.coefficient35_290,
    output := OriginalRow227TriangleData0551.coefficient36_290, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0535

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0535.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
