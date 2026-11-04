import Grothe.UpperChaos.OriginalRow227TriangleData0364
import Grothe.UpperChaos.OriginalRow227TriangleData0365
import Grothe.UpperChaos.OriginalRow227TriangleData0379
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0363
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_248, Icur := OriginalRow227TriangleData0364.coefficient23_247,
    output := OriginalRow227TriangleData0379.coefficient24_247, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_249, Icur := OriginalRow227TriangleData0364.coefficient23_248,
    output := OriginalRow227TriangleData0379.coefficient24_248, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_250, Icur := OriginalRow227TriangleData0364.coefficient23_249,
    output := OriginalRow227TriangleData0379.coefficient24_249, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_251, Icur := OriginalRow227TriangleData0364.coefficient23_250,
    output := OriginalRow227TriangleData0379.coefficient24_250, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_252, Icur := OriginalRow227TriangleData0364.coefficient23_251,
    output := OriginalRow227TriangleData0379.coefficient24_251, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_253, Icur := OriginalRow227TriangleData0364.coefficient23_252,
    output := OriginalRow227TriangleData0379.coefficient24_252, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_254, Icur := OriginalRow227TriangleData0364.coefficient23_253,
    output := OriginalRow227TriangleData0379.coefficient24_253, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_255, Icur := OriginalRow227TriangleData0364.coefficient23_254,
    output := OriginalRow227TriangleData0379.coefficient24_254, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_256, Icur := OriginalRow227TriangleData0364.coefficient23_255,
    output := OriginalRow227TriangleData0379.coefficient24_255, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_257, Icur := OriginalRow227TriangleData0364.coefficient23_256,
    output := OriginalRow227TriangleData0379.coefficient24_256, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_258, Icur := OriginalRow227TriangleData0364.coefficient23_257,
    output := OriginalRow227TriangleData0379.coefficient24_257, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_259, Icur := OriginalRow227TriangleData0364.coefficient23_258,
    output := OriginalRow227TriangleData0379.coefficient24_258, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_260, Icur := OriginalRow227TriangleData0364.coefficient23_259,
    output := OriginalRow227TriangleData0379.coefficient24_259, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_261, Icur := OriginalRow227TriangleData0364.coefficient23_260,
    output := OriginalRow227TriangleData0379.coefficient24_260, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_262, Icur := OriginalRow227TriangleData0364.coefficient23_261,
    output := OriginalRow227TriangleData0379.coefficient24_261, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_263, Icur := OriginalRow227TriangleData0364.coefficient23_262,
    output := OriginalRow227TriangleData0379.coefficient24_262, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_264, Icur := OriginalRow227TriangleData0364.coefficient23_263,
    output := OriginalRow227TriangleData0379.coefficient24_263, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_265, Icur := OriginalRow227TriangleData0364.coefficient23_264,
    output := OriginalRow227TriangleData0379.coefficient24_264, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_266, Icur := OriginalRow227TriangleData0364.coefficient23_265,
    output := OriginalRow227TriangleData0379.coefficient24_265, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_267, Icur := OriginalRow227TriangleData0364.coefficient23_266,
    output := OriginalRow227TriangleData0379.coefficient24_266, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_268, Icur := OriginalRow227TriangleData0364.coefficient23_267,
    output := OriginalRow227TriangleData0379.coefficient24_267, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_269, Icur := OriginalRow227TriangleData0364.coefficient23_268,
    output := OriginalRow227TriangleData0379.coefficient24_268, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_270, Icur := OriginalRow227TriangleData0364.coefficient23_269,
    output := OriginalRow227TriangleData0379.coefficient24_269, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_271, Icur := OriginalRow227TriangleData0364.coefficient23_270,
    output := OriginalRow227TriangleData0379.coefficient24_270, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_272, Icur := OriginalRow227TriangleData0364.coefficient23_271,
    output := OriginalRow227TriangleData0379.coefficient24_271, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_273, Icur := OriginalRow227TriangleData0364.coefficient23_272,
    output := OriginalRow227TriangleData0379.coefficient24_272, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_274, Icur := OriginalRow227TriangleData0364.coefficient23_273,
    output := OriginalRow227TriangleData0379.coefficient24_273, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_275, Icur := OriginalRow227TriangleData0364.coefficient23_274,
    output := OriginalRow227TriangleData0379.coefficient24_274, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_276, Icur := OriginalRow227TriangleData0364.coefficient23_275,
    output := OriginalRow227TriangleData0379.coefficient24_275, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0364.coefficient23_277, Icur := OriginalRow227TriangleData0364.coefficient23_276,
    output := OriginalRow227TriangleData0379.coefficient24_276, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_278, Icur := OriginalRow227TriangleData0364.coefficient23_277,
    output := OriginalRow227TriangleData0379.coefficient24_277, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_279, Icur := OriginalRow227TriangleData0365.coefficient23_278,
    output := OriginalRow227TriangleData0379.coefficient24_278, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0363

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0363.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
