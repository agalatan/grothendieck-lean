import Grothe.UpperChaos.OriginalRow227TriangleData0857
import Grothe.UpperChaos.OriginalRow227TriangleData0858
import Grothe.UpperChaos.OriginalRow227TriangleData0870
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0854
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_252, Icur := OriginalRow227TriangleData0857.coefficient59_251,
    output := OriginalRow227TriangleData0870.coefficient60_251, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_253, Icur := OriginalRow227TriangleData0857.coefficient59_252,
    output := OriginalRow227TriangleData0870.coefficient60_252, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_254, Icur := OriginalRow227TriangleData0857.coefficient59_253,
    output := OriginalRow227TriangleData0870.coefficient60_253, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_255, Icur := OriginalRow227TriangleData0857.coefficient59_254,
    output := OriginalRow227TriangleData0870.coefficient60_254, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_256, Icur := OriginalRow227TriangleData0857.coefficient59_255,
    output := OriginalRow227TriangleData0870.coefficient60_255, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_257, Icur := OriginalRow227TriangleData0857.coefficient59_256,
    output := OriginalRow227TriangleData0870.coefficient60_256, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_258, Icur := OriginalRow227TriangleData0857.coefficient59_257,
    output := OriginalRow227TriangleData0870.coefficient60_257, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_259, Icur := OriginalRow227TriangleData0857.coefficient59_258,
    output := OriginalRow227TriangleData0870.coefficient60_258, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_260, Icur := OriginalRow227TriangleData0857.coefficient59_259,
    output := OriginalRow227TriangleData0870.coefficient60_259, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_261, Icur := OriginalRow227TriangleData0857.coefficient59_260,
    output := OriginalRow227TriangleData0870.coefficient60_260, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_262, Icur := OriginalRow227TriangleData0857.coefficient59_261,
    output := OriginalRow227TriangleData0870.coefficient60_261, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_263, Icur := OriginalRow227TriangleData0857.coefficient59_262,
    output := OriginalRow227TriangleData0870.coefficient60_262, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_264, Icur := OriginalRow227TriangleData0857.coefficient59_263,
    output := OriginalRow227TriangleData0870.coefficient60_263, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_265, Icur := OriginalRow227TriangleData0857.coefficient59_264,
    output := OriginalRow227TriangleData0870.coefficient60_264, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_266, Icur := OriginalRow227TriangleData0857.coefficient59_265,
    output := OriginalRow227TriangleData0870.coefficient60_265, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_267, Icur := OriginalRow227TriangleData0857.coefficient59_266,
    output := OriginalRow227TriangleData0870.coefficient60_266, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_268, Icur := OriginalRow227TriangleData0857.coefficient59_267,
    output := OriginalRow227TriangleData0870.coefficient60_267, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_269, Icur := OriginalRow227TriangleData0857.coefficient59_268,
    output := OriginalRow227TriangleData0870.coefficient60_268, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_270, Icur := OriginalRow227TriangleData0857.coefficient59_269,
    output := OriginalRow227TriangleData0870.coefficient60_269, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_271, Icur := OriginalRow227TriangleData0857.coefficient59_270,
    output := OriginalRow227TriangleData0870.coefficient60_270, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_272, Icur := OriginalRow227TriangleData0857.coefficient59_271,
    output := OriginalRow227TriangleData0870.coefficient60_271, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_273, Icur := OriginalRow227TriangleData0857.coefficient59_272,
    output := OriginalRow227TriangleData0870.coefficient60_272, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_274, Icur := OriginalRow227TriangleData0857.coefficient59_273,
    output := OriginalRow227TriangleData0870.coefficient60_273, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_275, Icur := OriginalRow227TriangleData0857.coefficient59_274,
    output := OriginalRow227TriangleData0870.coefficient60_274, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_276, Icur := OriginalRow227TriangleData0857.coefficient59_275,
    output := OriginalRow227TriangleData0870.coefficient60_275, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_277, Icur := OriginalRow227TriangleData0857.coefficient59_276,
    output := OriginalRow227TriangleData0870.coefficient60_276, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_278, Icur := OriginalRow227TriangleData0857.coefficient59_277,
    output := OriginalRow227TriangleData0870.coefficient60_277, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_279, Icur := OriginalRow227TriangleData0857.coefficient59_278,
    output := OriginalRow227TriangleData0870.coefficient60_278, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_280, Icur := OriginalRow227TriangleData0857.coefficient59_279,
    output := OriginalRow227TriangleData0870.coefficient60_279, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0857.coefficient59_281, Icur := OriginalRow227TriangleData0857.coefficient59_280,
    output := OriginalRow227TriangleData0870.coefficient60_280, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_282, Icur := OriginalRow227TriangleData0857.coefficient59_281,
    output := OriginalRow227TriangleData0870.coefficient60_281, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_283, Icur := OriginalRow227TriangleData0858.coefficient59_282,
    output := OriginalRow227TriangleData0870.coefficient60_282, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0854

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0854.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
