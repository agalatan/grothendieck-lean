import Grothe.UpperChaos.OriginalRow227TriangleData0882
import Grothe.UpperChaos.OriginalRow227TriangleData0883
import Grothe.UpperChaos.OriginalRow227TriangleData0894
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0878
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_254, Icur := OriginalRow227TriangleData0882.coefficient61_253,
    output := OriginalRow227TriangleData0894.coefficient62_253, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_255, Icur := OriginalRow227TriangleData0882.coefficient61_254,
    output := OriginalRow227TriangleData0894.coefficient62_254, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_256, Icur := OriginalRow227TriangleData0882.coefficient61_255,
    output := OriginalRow227TriangleData0894.coefficient62_255, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_257, Icur := OriginalRow227TriangleData0882.coefficient61_256,
    output := OriginalRow227TriangleData0894.coefficient62_256, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_258, Icur := OriginalRow227TriangleData0882.coefficient61_257,
    output := OriginalRow227TriangleData0894.coefficient62_257, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_259, Icur := OriginalRow227TriangleData0882.coefficient61_258,
    output := OriginalRow227TriangleData0894.coefficient62_258, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_260, Icur := OriginalRow227TriangleData0882.coefficient61_259,
    output := OriginalRow227TriangleData0894.coefficient62_259, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_261, Icur := OriginalRow227TriangleData0882.coefficient61_260,
    output := OriginalRow227TriangleData0894.coefficient62_260, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_262, Icur := OriginalRow227TriangleData0882.coefficient61_261,
    output := OriginalRow227TriangleData0894.coefficient62_261, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_263, Icur := OriginalRow227TriangleData0882.coefficient61_262,
    output := OriginalRow227TriangleData0894.coefficient62_262, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_264, Icur := OriginalRow227TriangleData0882.coefficient61_263,
    output := OriginalRow227TriangleData0894.coefficient62_263, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_265, Icur := OriginalRow227TriangleData0882.coefficient61_264,
    output := OriginalRow227TriangleData0894.coefficient62_264, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_266, Icur := OriginalRow227TriangleData0882.coefficient61_265,
    output := OriginalRow227TriangleData0894.coefficient62_265, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_267, Icur := OriginalRow227TriangleData0882.coefficient61_266,
    output := OriginalRow227TriangleData0894.coefficient62_266, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_268, Icur := OriginalRow227TriangleData0882.coefficient61_267,
    output := OriginalRow227TriangleData0894.coefficient62_267, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_269, Icur := OriginalRow227TriangleData0882.coefficient61_268,
    output := OriginalRow227TriangleData0894.coefficient62_268, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_270, Icur := OriginalRow227TriangleData0882.coefficient61_269,
    output := OriginalRow227TriangleData0894.coefficient62_269, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_271, Icur := OriginalRow227TriangleData0882.coefficient61_270,
    output := OriginalRow227TriangleData0894.coefficient62_270, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_272, Icur := OriginalRow227TriangleData0882.coefficient61_271,
    output := OriginalRow227TriangleData0894.coefficient62_271, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_273, Icur := OriginalRow227TriangleData0882.coefficient61_272,
    output := OriginalRow227TriangleData0894.coefficient62_272, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_274, Icur := OriginalRow227TriangleData0882.coefficient61_273,
    output := OriginalRow227TriangleData0894.coefficient62_273, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_275, Icur := OriginalRow227TriangleData0882.coefficient61_274,
    output := OriginalRow227TriangleData0894.coefficient62_274, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_276, Icur := OriginalRow227TriangleData0882.coefficient61_275,
    output := OriginalRow227TriangleData0894.coefficient62_275, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_277, Icur := OriginalRow227TriangleData0882.coefficient61_276,
    output := OriginalRow227TriangleData0894.coefficient62_276, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_278, Icur := OriginalRow227TriangleData0882.coefficient61_277,
    output := OriginalRow227TriangleData0894.coefficient62_277, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_279, Icur := OriginalRow227TriangleData0882.coefficient61_278,
    output := OriginalRow227TriangleData0894.coefficient62_278, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_280, Icur := OriginalRow227TriangleData0882.coefficient61_279,
    output := OriginalRow227TriangleData0894.coefficient62_279, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_281, Icur := OriginalRow227TriangleData0882.coefficient61_280,
    output := OriginalRow227TriangleData0894.coefficient62_280, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_282, Icur := OriginalRow227TriangleData0882.coefficient61_281,
    output := OriginalRow227TriangleData0894.coefficient62_281, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_283, Icur := OriginalRow227TriangleData0882.coefficient61_282,
    output := OriginalRow227TriangleData0894.coefficient62_282, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0883.coefficient61_284, Icur := OriginalRow227TriangleData0882.coefficient61_283,
    output := OriginalRow227TriangleData0894.coefficient62_283, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0883.coefficient61_285, Icur := OriginalRow227TriangleData0883.coefficient61_284,
    output := OriginalRow227TriangleData0894.coefficient62_284, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0878

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0878.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
