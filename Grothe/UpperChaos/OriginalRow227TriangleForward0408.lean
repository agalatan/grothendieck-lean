import Grothe.UpperChaos.OriginalRow227TriangleData0409
import Grothe.UpperChaos.OriginalRow227TriangleData0410
import Grothe.UpperChaos.OriginalRow227TriangleData0424
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0408
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_251, Icur := OriginalRow227TriangleData0409.coefficient26_250,
    output := OriginalRow227TriangleData0424.coefficient27_250, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_252, Icur := OriginalRow227TriangleData0409.coefficient26_251,
    output := OriginalRow227TriangleData0424.coefficient27_251, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_253, Icur := OriginalRow227TriangleData0409.coefficient26_252,
    output := OriginalRow227TriangleData0424.coefficient27_252, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_254, Icur := OriginalRow227TriangleData0409.coefficient26_253,
    output := OriginalRow227TriangleData0424.coefficient27_253, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_255, Icur := OriginalRow227TriangleData0409.coefficient26_254,
    output := OriginalRow227TriangleData0424.coefficient27_254, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_256, Icur := OriginalRow227TriangleData0409.coefficient26_255,
    output := OriginalRow227TriangleData0424.coefficient27_255, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_257, Icur := OriginalRow227TriangleData0409.coefficient26_256,
    output := OriginalRow227TriangleData0424.coefficient27_256, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_258, Icur := OriginalRow227TriangleData0409.coefficient26_257,
    output := OriginalRow227TriangleData0424.coefficient27_257, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_259, Icur := OriginalRow227TriangleData0409.coefficient26_258,
    output := OriginalRow227TriangleData0424.coefficient27_258, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_260, Icur := OriginalRow227TriangleData0409.coefficient26_259,
    output := OriginalRow227TriangleData0424.coefficient27_259, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_261, Icur := OriginalRow227TriangleData0409.coefficient26_260,
    output := OriginalRow227TriangleData0424.coefficient27_260, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_262, Icur := OriginalRow227TriangleData0409.coefficient26_261,
    output := OriginalRow227TriangleData0424.coefficient27_261, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_263, Icur := OriginalRow227TriangleData0409.coefficient26_262,
    output := OriginalRow227TriangleData0424.coefficient27_262, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_264, Icur := OriginalRow227TriangleData0409.coefficient26_263,
    output := OriginalRow227TriangleData0424.coefficient27_263, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_265, Icur := OriginalRow227TriangleData0409.coefficient26_264,
    output := OriginalRow227TriangleData0424.coefficient27_264, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_266, Icur := OriginalRow227TriangleData0409.coefficient26_265,
    output := OriginalRow227TriangleData0424.coefficient27_265, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_267, Icur := OriginalRow227TriangleData0409.coefficient26_266,
    output := OriginalRow227TriangleData0424.coefficient27_266, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_268, Icur := OriginalRow227TriangleData0409.coefficient26_267,
    output := OriginalRow227TriangleData0424.coefficient27_267, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_269, Icur := OriginalRow227TriangleData0409.coefficient26_268,
    output := OriginalRow227TriangleData0424.coefficient27_268, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_270, Icur := OriginalRow227TriangleData0409.coefficient26_269,
    output := OriginalRow227TriangleData0424.coefficient27_269, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_271, Icur := OriginalRow227TriangleData0409.coefficient26_270,
    output := OriginalRow227TriangleData0424.coefficient27_270, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_272, Icur := OriginalRow227TriangleData0409.coefficient26_271,
    output := OriginalRow227TriangleData0424.coefficient27_271, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_273, Icur := OriginalRow227TriangleData0409.coefficient26_272,
    output := OriginalRow227TriangleData0424.coefficient27_272, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_274, Icur := OriginalRow227TriangleData0409.coefficient26_273,
    output := OriginalRow227TriangleData0424.coefficient27_273, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_275, Icur := OriginalRow227TriangleData0409.coefficient26_274,
    output := OriginalRow227TriangleData0424.coefficient27_274, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_276, Icur := OriginalRow227TriangleData0409.coefficient26_275,
    output := OriginalRow227TriangleData0424.coefficient27_275, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_277, Icur := OriginalRow227TriangleData0409.coefficient26_276,
    output := OriginalRow227TriangleData0424.coefficient27_276, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_278, Icur := OriginalRow227TriangleData0409.coefficient26_277,
    output := OriginalRow227TriangleData0424.coefficient27_277, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_279, Icur := OriginalRow227TriangleData0409.coefficient26_278,
    output := OriginalRow227TriangleData0424.coefficient27_278, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_280, Icur := OriginalRow227TriangleData0409.coefficient26_279,
    output := OriginalRow227TriangleData0424.coefficient27_279, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0410.coefficient26_281, Icur := OriginalRow227TriangleData0409.coefficient26_280,
    output := OriginalRow227TriangleData0424.coefficient27_280, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0410.coefficient26_282, Icur := OriginalRow227TriangleData0410.coefficient26_281,
    output := OriginalRow227TriangleData0424.coefficient27_281, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0408

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0408.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
