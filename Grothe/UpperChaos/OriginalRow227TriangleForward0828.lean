import Grothe.UpperChaos.OriginalRow227TriangleData0831
import Grothe.UpperChaos.OriginalRow227TriangleData0832
import Grothe.UpperChaos.OriginalRow227TriangleData0844
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0828
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_250, Icur := OriginalRow227TriangleData0831.coefficient57_249,
    output := OriginalRow227TriangleData0844.coefficient58_249, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_251, Icur := OriginalRow227TriangleData0831.coefficient57_250,
    output := OriginalRow227TriangleData0844.coefficient58_250, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_252, Icur := OriginalRow227TriangleData0831.coefficient57_251,
    output := OriginalRow227TriangleData0844.coefficient58_251, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_253, Icur := OriginalRow227TriangleData0831.coefficient57_252,
    output := OriginalRow227TriangleData0844.coefficient58_252, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_254, Icur := OriginalRow227TriangleData0831.coefficient57_253,
    output := OriginalRow227TriangleData0844.coefficient58_253, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_255, Icur := OriginalRow227TriangleData0831.coefficient57_254,
    output := OriginalRow227TriangleData0844.coefficient58_254, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_256, Icur := OriginalRow227TriangleData0831.coefficient57_255,
    output := OriginalRow227TriangleData0844.coefficient58_255, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_257, Icur := OriginalRow227TriangleData0831.coefficient57_256,
    output := OriginalRow227TriangleData0844.coefficient58_256, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_258, Icur := OriginalRow227TriangleData0831.coefficient57_257,
    output := OriginalRow227TriangleData0844.coefficient58_257, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_259, Icur := OriginalRow227TriangleData0831.coefficient57_258,
    output := OriginalRow227TriangleData0844.coefficient58_258, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_260, Icur := OriginalRow227TriangleData0831.coefficient57_259,
    output := OriginalRow227TriangleData0844.coefficient58_259, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_261, Icur := OriginalRow227TriangleData0831.coefficient57_260,
    output := OriginalRow227TriangleData0844.coefficient58_260, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_262, Icur := OriginalRow227TriangleData0831.coefficient57_261,
    output := OriginalRow227TriangleData0844.coefficient58_261, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_263, Icur := OriginalRow227TriangleData0831.coefficient57_262,
    output := OriginalRow227TriangleData0844.coefficient58_262, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_264, Icur := OriginalRow227TriangleData0831.coefficient57_263,
    output := OriginalRow227TriangleData0844.coefficient58_263, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_265, Icur := OriginalRow227TriangleData0831.coefficient57_264,
    output := OriginalRow227TriangleData0844.coefficient58_264, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_266, Icur := OriginalRow227TriangleData0831.coefficient57_265,
    output := OriginalRow227TriangleData0844.coefficient58_265, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_267, Icur := OriginalRow227TriangleData0831.coefficient57_266,
    output := OriginalRow227TriangleData0844.coefficient58_266, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_268, Icur := OriginalRow227TriangleData0831.coefficient57_267,
    output := OriginalRow227TriangleData0844.coefficient58_267, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_269, Icur := OriginalRow227TriangleData0831.coefficient57_268,
    output := OriginalRow227TriangleData0844.coefficient58_268, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_270, Icur := OriginalRow227TriangleData0831.coefficient57_269,
    output := OriginalRow227TriangleData0844.coefficient58_269, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_271, Icur := OriginalRow227TriangleData0831.coefficient57_270,
    output := OriginalRow227TriangleData0844.coefficient58_270, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_272, Icur := OriginalRow227TriangleData0831.coefficient57_271,
    output := OriginalRow227TriangleData0844.coefficient58_271, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_273, Icur := OriginalRow227TriangleData0831.coefficient57_272,
    output := OriginalRow227TriangleData0844.coefficient58_272, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_274, Icur := OriginalRow227TriangleData0831.coefficient57_273,
    output := OriginalRow227TriangleData0844.coefficient58_273, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_275, Icur := OriginalRow227TriangleData0831.coefficient57_274,
    output := OriginalRow227TriangleData0844.coefficient58_274, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_276, Icur := OriginalRow227TriangleData0831.coefficient57_275,
    output := OriginalRow227TriangleData0844.coefficient58_275, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_277, Icur := OriginalRow227TriangleData0831.coefficient57_276,
    output := OriginalRow227TriangleData0844.coefficient58_276, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_278, Icur := OriginalRow227TriangleData0831.coefficient57_277,
    output := OriginalRow227TriangleData0844.coefficient58_277, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0831.coefficient57_279, Icur := OriginalRow227TriangleData0831.coefficient57_278,
    output := OriginalRow227TriangleData0844.coefficient58_278, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_280, Icur := OriginalRow227TriangleData0831.coefficient57_279,
    output := OriginalRow227TriangleData0844.coefficient58_279, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_281, Icur := OriginalRow227TriangleData0832.coefficient57_280,
    output := OriginalRow227TriangleData0844.coefficient58_280, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0828

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0828.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
