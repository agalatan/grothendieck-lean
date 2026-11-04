import Grothe.UpperChaos.OriginalRow227TriangleData1772
import Grothe.UpperChaos.OriginalRow227TriangleData1773
import Grothe.UpperChaos.OriginalRow227TriangleData1779
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1763
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_252, Icur := OriginalRow227TriangleData1772.coefficient155_251,
    output := OriginalRow227TriangleData1779.coefficient156_251, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_253, Icur := OriginalRow227TriangleData1772.coefficient155_252,
    output := OriginalRow227TriangleData1779.coefficient156_252, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_254, Icur := OriginalRow227TriangleData1772.coefficient155_253,
    output := OriginalRow227TriangleData1779.coefficient156_253, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_255, Icur := OriginalRow227TriangleData1772.coefficient155_254,
    output := OriginalRow227TriangleData1779.coefficient156_254, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_256, Icur := OriginalRow227TriangleData1772.coefficient155_255,
    output := OriginalRow227TriangleData1779.coefficient156_255, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_257, Icur := OriginalRow227TriangleData1772.coefficient155_256,
    output := OriginalRow227TriangleData1779.coefficient156_256, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_258, Icur := OriginalRow227TriangleData1772.coefficient155_257,
    output := OriginalRow227TriangleData1779.coefficient156_257, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_259, Icur := OriginalRow227TriangleData1772.coefficient155_258,
    output := OriginalRow227TriangleData1779.coefficient156_258, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_260, Icur := OriginalRow227TriangleData1772.coefficient155_259,
    output := OriginalRow227TriangleData1779.coefficient156_259, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_261, Icur := OriginalRow227TriangleData1772.coefficient155_260,
    output := OriginalRow227TriangleData1779.coefficient156_260, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_262, Icur := OriginalRow227TriangleData1772.coefficient155_261,
    output := OriginalRow227TriangleData1779.coefficient156_261, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_263, Icur := OriginalRow227TriangleData1772.coefficient155_262,
    output := OriginalRow227TriangleData1779.coefficient156_262, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_264, Icur := OriginalRow227TriangleData1772.coefficient155_263,
    output := OriginalRow227TriangleData1779.coefficient156_263, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_265, Icur := OriginalRow227TriangleData1772.coefficient155_264,
    output := OriginalRow227TriangleData1779.coefficient156_264, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_266, Icur := OriginalRow227TriangleData1772.coefficient155_265,
    output := OriginalRow227TriangleData1779.coefficient156_265, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_267, Icur := OriginalRow227TriangleData1772.coefficient155_266,
    output := OriginalRow227TriangleData1779.coefficient156_266, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_268, Icur := OriginalRow227TriangleData1772.coefficient155_267,
    output := OriginalRow227TriangleData1779.coefficient156_267, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_269, Icur := OriginalRow227TriangleData1772.coefficient155_268,
    output := OriginalRow227TriangleData1779.coefficient156_268, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_270, Icur := OriginalRow227TriangleData1772.coefficient155_269,
    output := OriginalRow227TriangleData1779.coefficient156_269, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_271, Icur := OriginalRow227TriangleData1772.coefficient155_270,
    output := OriginalRow227TriangleData1779.coefficient156_270, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_272, Icur := OriginalRow227TriangleData1772.coefficient155_271,
    output := OriginalRow227TriangleData1779.coefficient156_271, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_273, Icur := OriginalRow227TriangleData1772.coefficient155_272,
    output := OriginalRow227TriangleData1779.coefficient156_272, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_274, Icur := OriginalRow227TriangleData1772.coefficient155_273,
    output := OriginalRow227TriangleData1779.coefficient156_273, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_275, Icur := OriginalRow227TriangleData1772.coefficient155_274,
    output := OriginalRow227TriangleData1779.coefficient156_274, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_276, Icur := OriginalRow227TriangleData1772.coefficient155_275,
    output := OriginalRow227TriangleData1779.coefficient156_275, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_277, Icur := OriginalRow227TriangleData1772.coefficient155_276,
    output := OriginalRow227TriangleData1779.coefficient156_276, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_278, Icur := OriginalRow227TriangleData1772.coefficient155_277,
    output := OriginalRow227TriangleData1779.coefficient156_277, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_279, Icur := OriginalRow227TriangleData1772.coefficient155_278,
    output := OriginalRow227TriangleData1779.coefficient156_278, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_280, Icur := OriginalRow227TriangleData1772.coefficient155_279,
    output := OriginalRow227TriangleData1779.coefficient156_279, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_281, Icur := OriginalRow227TriangleData1772.coefficient155_280,
    output := OriginalRow227TriangleData1779.coefficient156_280, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_282, Icur := OriginalRow227TriangleData1772.coefficient155_281,
    output := OriginalRow227TriangleData1779.coefficient156_281, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_283, Icur := OriginalRow227TriangleData1773.coefficient155_282,
    output := OriginalRow227TriangleData1779.coefficient156_282, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1763

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1763.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
