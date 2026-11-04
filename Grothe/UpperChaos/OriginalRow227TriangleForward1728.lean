import Grothe.UpperChaos.OriginalRow227TriangleData1737
import Grothe.UpperChaos.OriginalRow227TriangleData1738
import Grothe.UpperChaos.OriginalRow227TriangleData1744
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1728
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_247, Icur := OriginalRow227TriangleData1737.coefficient150_246,
    output := OriginalRow227TriangleData1744.coefficient151_246, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_248, Icur := OriginalRow227TriangleData1737.coefficient150_247,
    output := OriginalRow227TriangleData1744.coefficient151_247, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_249, Icur := OriginalRow227TriangleData1737.coefficient150_248,
    output := OriginalRow227TriangleData1744.coefficient151_248, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_250, Icur := OriginalRow227TriangleData1737.coefficient150_249,
    output := OriginalRow227TriangleData1744.coefficient151_249, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_251, Icur := OriginalRow227TriangleData1737.coefficient150_250,
    output := OriginalRow227TriangleData1744.coefficient151_250, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_252, Icur := OriginalRow227TriangleData1737.coefficient150_251,
    output := OriginalRow227TriangleData1744.coefficient151_251, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_253, Icur := OriginalRow227TriangleData1737.coefficient150_252,
    output := OriginalRow227TriangleData1744.coefficient151_252, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_254, Icur := OriginalRow227TriangleData1737.coefficient150_253,
    output := OriginalRow227TriangleData1744.coefficient151_253, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_255, Icur := OriginalRow227TriangleData1737.coefficient150_254,
    output := OriginalRow227TriangleData1744.coefficient151_254, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_256, Icur := OriginalRow227TriangleData1737.coefficient150_255,
    output := OriginalRow227TriangleData1744.coefficient151_255, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_257, Icur := OriginalRow227TriangleData1737.coefficient150_256,
    output := OriginalRow227TriangleData1744.coefficient151_256, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_258, Icur := OriginalRow227TriangleData1737.coefficient150_257,
    output := OriginalRow227TriangleData1744.coefficient151_257, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_259, Icur := OriginalRow227TriangleData1737.coefficient150_258,
    output := OriginalRow227TriangleData1744.coefficient151_258, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_260, Icur := OriginalRow227TriangleData1737.coefficient150_259,
    output := OriginalRow227TriangleData1744.coefficient151_259, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_261, Icur := OriginalRow227TriangleData1737.coefficient150_260,
    output := OriginalRow227TriangleData1744.coefficient151_260, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_262, Icur := OriginalRow227TriangleData1737.coefficient150_261,
    output := OriginalRow227TriangleData1744.coefficient151_261, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_263, Icur := OriginalRow227TriangleData1737.coefficient150_262,
    output := OriginalRow227TriangleData1744.coefficient151_262, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_264, Icur := OriginalRow227TriangleData1737.coefficient150_263,
    output := OriginalRow227TriangleData1744.coefficient151_263, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_265, Icur := OriginalRow227TriangleData1737.coefficient150_264,
    output := OriginalRow227TriangleData1744.coefficient151_264, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_266, Icur := OriginalRow227TriangleData1737.coefficient150_265,
    output := OriginalRow227TriangleData1744.coefficient151_265, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_267, Icur := OriginalRow227TriangleData1737.coefficient150_266,
    output := OriginalRow227TriangleData1744.coefficient151_266, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_268, Icur := OriginalRow227TriangleData1737.coefficient150_267,
    output := OriginalRow227TriangleData1744.coefficient151_267, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_269, Icur := OriginalRow227TriangleData1737.coefficient150_268,
    output := OriginalRow227TriangleData1744.coefficient151_268, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_270, Icur := OriginalRow227TriangleData1737.coefficient150_269,
    output := OriginalRow227TriangleData1744.coefficient151_269, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_271, Icur := OriginalRow227TriangleData1737.coefficient150_270,
    output := OriginalRow227TriangleData1744.coefficient151_270, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_272, Icur := OriginalRow227TriangleData1737.coefficient150_271,
    output := OriginalRow227TriangleData1744.coefficient151_271, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_273, Icur := OriginalRow227TriangleData1737.coefficient150_272,
    output := OriginalRow227TriangleData1744.coefficient151_272, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_274, Icur := OriginalRow227TriangleData1737.coefficient150_273,
    output := OriginalRow227TriangleData1744.coefficient151_273, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_275, Icur := OriginalRow227TriangleData1737.coefficient150_274,
    output := OriginalRow227TriangleData1744.coefficient151_274, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1737.coefficient150_276, Icur := OriginalRow227TriangleData1737.coefficient150_275,
    output := OriginalRow227TriangleData1744.coefficient151_275, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1738.coefficient150_277, Icur := OriginalRow227TriangleData1737.coefficient150_276,
    output := OriginalRow227TriangleData1744.coefficient151_276, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root151,
    Inext := OriginalRow227TriangleData1738.coefficient150_278, Icur := OriginalRow227TriangleData1738.coefficient150_277,
    output := OriginalRow227TriangleData1744.coefficient151_277, hC := OriginalRow227TriangleRoots04.root151_pos, hAC := OriginalRow227TriangleRoots04.product151_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1728

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1728.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
