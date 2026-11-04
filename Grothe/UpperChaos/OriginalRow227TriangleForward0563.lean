import Grothe.UpperChaos.OriginalRow227TriangleData0565
import Grothe.UpperChaos.OriginalRow227TriangleData0566
import Grothe.UpperChaos.OriginalRow227TriangleData0579
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0563
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_262, Icur := OriginalRow227TriangleData0565.coefficient37_261,
    output := OriginalRow227TriangleData0579.coefficient38_261, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_263, Icur := OriginalRow227TriangleData0565.coefficient37_262,
    output := OriginalRow227TriangleData0579.coefficient38_262, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_264, Icur := OriginalRow227TriangleData0565.coefficient37_263,
    output := OriginalRow227TriangleData0579.coefficient38_263, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_265, Icur := OriginalRow227TriangleData0565.coefficient37_264,
    output := OriginalRow227TriangleData0579.coefficient38_264, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_266, Icur := OriginalRow227TriangleData0565.coefficient37_265,
    output := OriginalRow227TriangleData0579.coefficient38_265, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_267, Icur := OriginalRow227TriangleData0565.coefficient37_266,
    output := OriginalRow227TriangleData0579.coefficient38_266, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_268, Icur := OriginalRow227TriangleData0565.coefficient37_267,
    output := OriginalRow227TriangleData0579.coefficient38_267, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_269, Icur := OriginalRow227TriangleData0565.coefficient37_268,
    output := OriginalRow227TriangleData0579.coefficient38_268, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_270, Icur := OriginalRow227TriangleData0565.coefficient37_269,
    output := OriginalRow227TriangleData0579.coefficient38_269, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_271, Icur := OriginalRow227TriangleData0565.coefficient37_270,
    output := OriginalRow227TriangleData0579.coefficient38_270, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_272, Icur := OriginalRow227TriangleData0565.coefficient37_271,
    output := OriginalRow227TriangleData0579.coefficient38_271, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_273, Icur := OriginalRow227TriangleData0565.coefficient37_272,
    output := OriginalRow227TriangleData0579.coefficient38_272, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_274, Icur := OriginalRow227TriangleData0565.coefficient37_273,
    output := OriginalRow227TriangleData0579.coefficient38_273, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_275, Icur := OriginalRow227TriangleData0565.coefficient37_274,
    output := OriginalRow227TriangleData0579.coefficient38_274, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_276, Icur := OriginalRow227TriangleData0565.coefficient37_275,
    output := OriginalRow227TriangleData0579.coefficient38_275, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_277, Icur := OriginalRow227TriangleData0565.coefficient37_276,
    output := OriginalRow227TriangleData0579.coefficient38_276, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_278, Icur := OriginalRow227TriangleData0565.coefficient37_277,
    output := OriginalRow227TriangleData0579.coefficient38_277, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_279, Icur := OriginalRow227TriangleData0565.coefficient37_278,
    output := OriginalRow227TriangleData0579.coefficient38_278, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_280, Icur := OriginalRow227TriangleData0565.coefficient37_279,
    output := OriginalRow227TriangleData0579.coefficient38_279, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_281, Icur := OriginalRow227TriangleData0565.coefficient37_280,
    output := OriginalRow227TriangleData0579.coefficient38_280, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_282, Icur := OriginalRow227TriangleData0565.coefficient37_281,
    output := OriginalRow227TriangleData0579.coefficient38_281, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_283, Icur := OriginalRow227TriangleData0565.coefficient37_282,
    output := OriginalRow227TriangleData0579.coefficient38_282, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_284, Icur := OriginalRow227TriangleData0565.coefficient37_283,
    output := OriginalRow227TriangleData0579.coefficient38_283, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_285, Icur := OriginalRow227TriangleData0565.coefficient37_284,
    output := OriginalRow227TriangleData0579.coefficient38_284, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_286, Icur := OriginalRow227TriangleData0565.coefficient37_285,
    output := OriginalRow227TriangleData0579.coefficient38_285, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_287, Icur := OriginalRow227TriangleData0565.coefficient37_286,
    output := OriginalRow227TriangleData0579.coefficient38_286, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_288, Icur := OriginalRow227TriangleData0565.coefficient37_287,
    output := OriginalRow227TriangleData0579.coefficient38_287, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_289, Icur := OriginalRow227TriangleData0565.coefficient37_288,
    output := OriginalRow227TriangleData0579.coefficient38_288, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_290, Icur := OriginalRow227TriangleData0565.coefficient37_289,
    output := OriginalRow227TriangleData0579.coefficient38_289, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0565.coefficient37_291, Icur := OriginalRow227TriangleData0565.coefficient37_290,
    output := OriginalRow227TriangleData0579.coefficient38_290, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0566.coefficient37_292, Icur := OriginalRow227TriangleData0565.coefficient37_291,
    output := OriginalRow227TriangleData0579.coefficient38_291, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0566.coefficient37_293, Icur := OriginalRow227TriangleData0566.coefficient37_292,
    output := OriginalRow227TriangleData0579.coefficient38_292, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0563

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0563.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
