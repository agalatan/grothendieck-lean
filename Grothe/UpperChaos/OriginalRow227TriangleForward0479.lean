import Grothe.UpperChaos.OriginalRow227TriangleData0481
import Grothe.UpperChaos.OriginalRow227TriangleData0482
import Grothe.UpperChaos.OriginalRow227TriangleData0495
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0479
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_256, Icur := OriginalRow227TriangleData0481.coefficient31_255,
    output := OriginalRow227TriangleData0495.coefficient32_255, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_257, Icur := OriginalRow227TriangleData0481.coefficient31_256,
    output := OriginalRow227TriangleData0495.coefficient32_256, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_258, Icur := OriginalRow227TriangleData0481.coefficient31_257,
    output := OriginalRow227TriangleData0495.coefficient32_257, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_259, Icur := OriginalRow227TriangleData0481.coefficient31_258,
    output := OriginalRow227TriangleData0495.coefficient32_258, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_260, Icur := OriginalRow227TriangleData0481.coefficient31_259,
    output := OriginalRow227TriangleData0495.coefficient32_259, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_261, Icur := OriginalRow227TriangleData0481.coefficient31_260,
    output := OriginalRow227TriangleData0495.coefficient32_260, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_262, Icur := OriginalRow227TriangleData0481.coefficient31_261,
    output := OriginalRow227TriangleData0495.coefficient32_261, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_263, Icur := OriginalRow227TriangleData0481.coefficient31_262,
    output := OriginalRow227TriangleData0495.coefficient32_262, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_264, Icur := OriginalRow227TriangleData0481.coefficient31_263,
    output := OriginalRow227TriangleData0495.coefficient32_263, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_265, Icur := OriginalRow227TriangleData0481.coefficient31_264,
    output := OriginalRow227TriangleData0495.coefficient32_264, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_266, Icur := OriginalRow227TriangleData0481.coefficient31_265,
    output := OriginalRow227TriangleData0495.coefficient32_265, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_267, Icur := OriginalRow227TriangleData0481.coefficient31_266,
    output := OriginalRow227TriangleData0495.coefficient32_266, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_268, Icur := OriginalRow227TriangleData0481.coefficient31_267,
    output := OriginalRow227TriangleData0495.coefficient32_267, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_269, Icur := OriginalRow227TriangleData0481.coefficient31_268,
    output := OriginalRow227TriangleData0495.coefficient32_268, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_270, Icur := OriginalRow227TriangleData0481.coefficient31_269,
    output := OriginalRow227TriangleData0495.coefficient32_269, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_271, Icur := OriginalRow227TriangleData0481.coefficient31_270,
    output := OriginalRow227TriangleData0495.coefficient32_270, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_272, Icur := OriginalRow227TriangleData0481.coefficient31_271,
    output := OriginalRow227TriangleData0495.coefficient32_271, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_273, Icur := OriginalRow227TriangleData0481.coefficient31_272,
    output := OriginalRow227TriangleData0495.coefficient32_272, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_274, Icur := OriginalRow227TriangleData0481.coefficient31_273,
    output := OriginalRow227TriangleData0495.coefficient32_273, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_275, Icur := OriginalRow227TriangleData0481.coefficient31_274,
    output := OriginalRow227TriangleData0495.coefficient32_274, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_276, Icur := OriginalRow227TriangleData0481.coefficient31_275,
    output := OriginalRow227TriangleData0495.coefficient32_275, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_277, Icur := OriginalRow227TriangleData0481.coefficient31_276,
    output := OriginalRow227TriangleData0495.coefficient32_276, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_278, Icur := OriginalRow227TriangleData0481.coefficient31_277,
    output := OriginalRow227TriangleData0495.coefficient32_277, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_279, Icur := OriginalRow227TriangleData0481.coefficient31_278,
    output := OriginalRow227TriangleData0495.coefficient32_278, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_280, Icur := OriginalRow227TriangleData0481.coefficient31_279,
    output := OriginalRow227TriangleData0495.coefficient32_279, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_281, Icur := OriginalRow227TriangleData0481.coefficient31_280,
    output := OriginalRow227TriangleData0495.coefficient32_280, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_282, Icur := OriginalRow227TriangleData0481.coefficient31_281,
    output := OriginalRow227TriangleData0495.coefficient32_281, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_283, Icur := OriginalRow227TriangleData0481.coefficient31_282,
    output := OriginalRow227TriangleData0495.coefficient32_282, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_284, Icur := OriginalRow227TriangleData0481.coefficient31_283,
    output := OriginalRow227TriangleData0495.coefficient32_283, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_285, Icur := OriginalRow227TriangleData0481.coefficient31_284,
    output := OriginalRow227TriangleData0495.coefficient32_284, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0482.coefficient31_286, Icur := OriginalRow227TriangleData0481.coefficient31_285,
    output := OriginalRow227TriangleData0495.coefficient32_285, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0482.coefficient31_287, Icur := OriginalRow227TriangleData0482.coefficient31_286,
    output := OriginalRow227TriangleData0495.coefficient32_286, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0479

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0479.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
