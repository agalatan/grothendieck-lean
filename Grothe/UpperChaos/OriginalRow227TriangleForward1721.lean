import Grothe.UpperChaos.OriginalRow227TriangleData1730
import Grothe.UpperChaos.OriginalRow227TriangleData1731
import Grothe.UpperChaos.OriginalRow227TriangleData1737
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1721
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_246, Icur := OriginalRow227TriangleData1730.coefficient149_245,
    output := OriginalRow227TriangleData1737.coefficient150_245, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_247, Icur := OriginalRow227TriangleData1730.coefficient149_246,
    output := OriginalRow227TriangleData1737.coefficient150_246, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_248, Icur := OriginalRow227TriangleData1730.coefficient149_247,
    output := OriginalRow227TriangleData1737.coefficient150_247, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_249, Icur := OriginalRow227TriangleData1730.coefficient149_248,
    output := OriginalRow227TriangleData1737.coefficient150_248, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_250, Icur := OriginalRow227TriangleData1730.coefficient149_249,
    output := OriginalRow227TriangleData1737.coefficient150_249, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_251, Icur := OriginalRow227TriangleData1730.coefficient149_250,
    output := OriginalRow227TriangleData1737.coefficient150_250, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_252, Icur := OriginalRow227TriangleData1730.coefficient149_251,
    output := OriginalRow227TriangleData1737.coefficient150_251, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_253, Icur := OriginalRow227TriangleData1730.coefficient149_252,
    output := OriginalRow227TriangleData1737.coefficient150_252, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_254, Icur := OriginalRow227TriangleData1730.coefficient149_253,
    output := OriginalRow227TriangleData1737.coefficient150_253, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_255, Icur := OriginalRow227TriangleData1730.coefficient149_254,
    output := OriginalRow227TriangleData1737.coefficient150_254, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_256, Icur := OriginalRow227TriangleData1730.coefficient149_255,
    output := OriginalRow227TriangleData1737.coefficient150_255, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_257, Icur := OriginalRow227TriangleData1730.coefficient149_256,
    output := OriginalRow227TriangleData1737.coefficient150_256, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_258, Icur := OriginalRow227TriangleData1730.coefficient149_257,
    output := OriginalRow227TriangleData1737.coefficient150_257, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_259, Icur := OriginalRow227TriangleData1730.coefficient149_258,
    output := OriginalRow227TriangleData1737.coefficient150_258, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_260, Icur := OriginalRow227TriangleData1730.coefficient149_259,
    output := OriginalRow227TriangleData1737.coefficient150_259, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_261, Icur := OriginalRow227TriangleData1730.coefficient149_260,
    output := OriginalRow227TriangleData1737.coefficient150_260, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_262, Icur := OriginalRow227TriangleData1730.coefficient149_261,
    output := OriginalRow227TriangleData1737.coefficient150_261, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_263, Icur := OriginalRow227TriangleData1730.coefficient149_262,
    output := OriginalRow227TriangleData1737.coefficient150_262, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_264, Icur := OriginalRow227TriangleData1730.coefficient149_263,
    output := OriginalRow227TriangleData1737.coefficient150_263, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_265, Icur := OriginalRow227TriangleData1730.coefficient149_264,
    output := OriginalRow227TriangleData1737.coefficient150_264, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_266, Icur := OriginalRow227TriangleData1730.coefficient149_265,
    output := OriginalRow227TriangleData1737.coefficient150_265, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_267, Icur := OriginalRow227TriangleData1730.coefficient149_266,
    output := OriginalRow227TriangleData1737.coefficient150_266, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_268, Icur := OriginalRow227TriangleData1730.coefficient149_267,
    output := OriginalRow227TriangleData1737.coefficient150_267, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_269, Icur := OriginalRow227TriangleData1730.coefficient149_268,
    output := OriginalRow227TriangleData1737.coefficient150_268, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_270, Icur := OriginalRow227TriangleData1730.coefficient149_269,
    output := OriginalRow227TriangleData1737.coefficient150_269, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_271, Icur := OriginalRow227TriangleData1730.coefficient149_270,
    output := OriginalRow227TriangleData1737.coefficient150_270, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_272, Icur := OriginalRow227TriangleData1730.coefficient149_271,
    output := OriginalRow227TriangleData1737.coefficient150_271, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_273, Icur := OriginalRow227TriangleData1730.coefficient149_272,
    output := OriginalRow227TriangleData1737.coefficient150_272, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_274, Icur := OriginalRow227TriangleData1730.coefficient149_273,
    output := OriginalRow227TriangleData1737.coefficient150_273, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1730.coefficient149_275, Icur := OriginalRow227TriangleData1730.coefficient149_274,
    output := OriginalRow227TriangleData1737.coefficient150_274, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1731.coefficient149_276, Icur := OriginalRow227TriangleData1730.coefficient149_275,
    output := OriginalRow227TriangleData1737.coefficient150_275, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1731.coefficient149_277, Icur := OriginalRow227TriangleData1731.coefficient149_276,
    output := OriginalRow227TriangleData1737.coefficient150_276, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1721

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1721.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
