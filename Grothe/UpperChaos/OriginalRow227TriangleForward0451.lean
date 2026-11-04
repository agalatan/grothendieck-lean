import Grothe.UpperChaos.OriginalRow227TriangleData0453
import Grothe.UpperChaos.OriginalRow227TriangleData0454
import Grothe.UpperChaos.OriginalRow227TriangleData0467
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0451
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_254, Icur := OriginalRow227TriangleData0453.coefficient29_253,
    output := OriginalRow227TriangleData0467.coefficient30_253, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_255, Icur := OriginalRow227TriangleData0453.coefficient29_254,
    output := OriginalRow227TriangleData0467.coefficient30_254, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_256, Icur := OriginalRow227TriangleData0453.coefficient29_255,
    output := OriginalRow227TriangleData0467.coefficient30_255, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_257, Icur := OriginalRow227TriangleData0453.coefficient29_256,
    output := OriginalRow227TriangleData0467.coefficient30_256, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_258, Icur := OriginalRow227TriangleData0453.coefficient29_257,
    output := OriginalRow227TriangleData0467.coefficient30_257, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_259, Icur := OriginalRow227TriangleData0453.coefficient29_258,
    output := OriginalRow227TriangleData0467.coefficient30_258, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_260, Icur := OriginalRow227TriangleData0453.coefficient29_259,
    output := OriginalRow227TriangleData0467.coefficient30_259, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_261, Icur := OriginalRow227TriangleData0453.coefficient29_260,
    output := OriginalRow227TriangleData0467.coefficient30_260, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_262, Icur := OriginalRow227TriangleData0453.coefficient29_261,
    output := OriginalRow227TriangleData0467.coefficient30_261, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_263, Icur := OriginalRow227TriangleData0453.coefficient29_262,
    output := OriginalRow227TriangleData0467.coefficient30_262, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_264, Icur := OriginalRow227TriangleData0453.coefficient29_263,
    output := OriginalRow227TriangleData0467.coefficient30_263, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_265, Icur := OriginalRow227TriangleData0453.coefficient29_264,
    output := OriginalRow227TriangleData0467.coefficient30_264, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_266, Icur := OriginalRow227TriangleData0453.coefficient29_265,
    output := OriginalRow227TriangleData0467.coefficient30_265, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_267, Icur := OriginalRow227TriangleData0453.coefficient29_266,
    output := OriginalRow227TriangleData0467.coefficient30_266, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_268, Icur := OriginalRow227TriangleData0453.coefficient29_267,
    output := OriginalRow227TriangleData0467.coefficient30_267, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_269, Icur := OriginalRow227TriangleData0453.coefficient29_268,
    output := OriginalRow227TriangleData0467.coefficient30_268, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_270, Icur := OriginalRow227TriangleData0453.coefficient29_269,
    output := OriginalRow227TriangleData0467.coefficient30_269, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_271, Icur := OriginalRow227TriangleData0453.coefficient29_270,
    output := OriginalRow227TriangleData0467.coefficient30_270, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_272, Icur := OriginalRow227TriangleData0453.coefficient29_271,
    output := OriginalRow227TriangleData0467.coefficient30_271, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_273, Icur := OriginalRow227TriangleData0453.coefficient29_272,
    output := OriginalRow227TriangleData0467.coefficient30_272, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_274, Icur := OriginalRow227TriangleData0453.coefficient29_273,
    output := OriginalRow227TriangleData0467.coefficient30_273, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_275, Icur := OriginalRow227TriangleData0453.coefficient29_274,
    output := OriginalRow227TriangleData0467.coefficient30_274, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_276, Icur := OriginalRow227TriangleData0453.coefficient29_275,
    output := OriginalRow227TriangleData0467.coefficient30_275, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_277, Icur := OriginalRow227TriangleData0453.coefficient29_276,
    output := OriginalRow227TriangleData0467.coefficient30_276, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_278, Icur := OriginalRow227TriangleData0453.coefficient29_277,
    output := OriginalRow227TriangleData0467.coefficient30_277, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_279, Icur := OriginalRow227TriangleData0453.coefficient29_278,
    output := OriginalRow227TriangleData0467.coefficient30_278, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_280, Icur := OriginalRow227TriangleData0453.coefficient29_279,
    output := OriginalRow227TriangleData0467.coefficient30_279, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_281, Icur := OriginalRow227TriangleData0453.coefficient29_280,
    output := OriginalRow227TriangleData0467.coefficient30_280, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_282, Icur := OriginalRow227TriangleData0453.coefficient29_281,
    output := OriginalRow227TriangleData0467.coefficient30_281, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0453.coefficient29_283, Icur := OriginalRow227TriangleData0453.coefficient29_282,
    output := OriginalRow227TriangleData0467.coefficient30_282, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0454.coefficient29_284, Icur := OriginalRow227TriangleData0453.coefficient29_283,
    output := OriginalRow227TriangleData0467.coefficient30_283, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0454.coefficient29_285, Icur := OriginalRow227TriangleData0454.coefficient29_284,
    output := OriginalRow227TriangleData0467.coefficient30_284, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0451

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0451.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
