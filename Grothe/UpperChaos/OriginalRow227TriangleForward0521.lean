import Grothe.UpperChaos.OriginalRow227TriangleData0523
import Grothe.UpperChaos.OriginalRow227TriangleData0524
import Grothe.UpperChaos.OriginalRow227TriangleData0537
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0521
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_259, Icur := OriginalRow227TriangleData0523.coefficient34_258,
    output := OriginalRow227TriangleData0537.coefficient35_258, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_260, Icur := OriginalRow227TriangleData0523.coefficient34_259,
    output := OriginalRow227TriangleData0537.coefficient35_259, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_261, Icur := OriginalRow227TriangleData0523.coefficient34_260,
    output := OriginalRow227TriangleData0537.coefficient35_260, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_262, Icur := OriginalRow227TriangleData0523.coefficient34_261,
    output := OriginalRow227TriangleData0537.coefficient35_261, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_263, Icur := OriginalRow227TriangleData0523.coefficient34_262,
    output := OriginalRow227TriangleData0537.coefficient35_262, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_264, Icur := OriginalRow227TriangleData0523.coefficient34_263,
    output := OriginalRow227TriangleData0537.coefficient35_263, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_265, Icur := OriginalRow227TriangleData0523.coefficient34_264,
    output := OriginalRow227TriangleData0537.coefficient35_264, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_266, Icur := OriginalRow227TriangleData0523.coefficient34_265,
    output := OriginalRow227TriangleData0537.coefficient35_265, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_267, Icur := OriginalRow227TriangleData0523.coefficient34_266,
    output := OriginalRow227TriangleData0537.coefficient35_266, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_268, Icur := OriginalRow227TriangleData0523.coefficient34_267,
    output := OriginalRow227TriangleData0537.coefficient35_267, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_269, Icur := OriginalRow227TriangleData0523.coefficient34_268,
    output := OriginalRow227TriangleData0537.coefficient35_268, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_270, Icur := OriginalRow227TriangleData0523.coefficient34_269,
    output := OriginalRow227TriangleData0537.coefficient35_269, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_271, Icur := OriginalRow227TriangleData0523.coefficient34_270,
    output := OriginalRow227TriangleData0537.coefficient35_270, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_272, Icur := OriginalRow227TriangleData0523.coefficient34_271,
    output := OriginalRow227TriangleData0537.coefficient35_271, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_273, Icur := OriginalRow227TriangleData0523.coefficient34_272,
    output := OriginalRow227TriangleData0537.coefficient35_272, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_274, Icur := OriginalRow227TriangleData0523.coefficient34_273,
    output := OriginalRow227TriangleData0537.coefficient35_273, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_275, Icur := OriginalRow227TriangleData0523.coefficient34_274,
    output := OriginalRow227TriangleData0537.coefficient35_274, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_276, Icur := OriginalRow227TriangleData0523.coefficient34_275,
    output := OriginalRow227TriangleData0537.coefficient35_275, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_277, Icur := OriginalRow227TriangleData0523.coefficient34_276,
    output := OriginalRow227TriangleData0537.coefficient35_276, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_278, Icur := OriginalRow227TriangleData0523.coefficient34_277,
    output := OriginalRow227TriangleData0537.coefficient35_277, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_279, Icur := OriginalRow227TriangleData0523.coefficient34_278,
    output := OriginalRow227TriangleData0537.coefficient35_278, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_280, Icur := OriginalRow227TriangleData0523.coefficient34_279,
    output := OriginalRow227TriangleData0537.coefficient35_279, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_281, Icur := OriginalRow227TriangleData0523.coefficient34_280,
    output := OriginalRow227TriangleData0537.coefficient35_280, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_282, Icur := OriginalRow227TriangleData0523.coefficient34_281,
    output := OriginalRow227TriangleData0537.coefficient35_281, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_283, Icur := OriginalRow227TriangleData0523.coefficient34_282,
    output := OriginalRow227TriangleData0537.coefficient35_282, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_284, Icur := OriginalRow227TriangleData0523.coefficient34_283,
    output := OriginalRow227TriangleData0537.coefficient35_283, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_285, Icur := OriginalRow227TriangleData0523.coefficient34_284,
    output := OriginalRow227TriangleData0537.coefficient35_284, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_286, Icur := OriginalRow227TriangleData0523.coefficient34_285,
    output := OriginalRow227TriangleData0537.coefficient35_285, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_287, Icur := OriginalRow227TriangleData0523.coefficient34_286,
    output := OriginalRow227TriangleData0537.coefficient35_286, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0523.coefficient34_288, Icur := OriginalRow227TriangleData0523.coefficient34_287,
    output := OriginalRow227TriangleData0537.coefficient35_287, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0524.coefficient34_289, Icur := OriginalRow227TriangleData0523.coefficient34_288,
    output := OriginalRow227TriangleData0537.coefficient35_288, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0524.coefficient34_290, Icur := OriginalRow227TriangleData0524.coefficient34_289,
    output := OriginalRow227TriangleData0537.coefficient35_289, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0521

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0521.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
