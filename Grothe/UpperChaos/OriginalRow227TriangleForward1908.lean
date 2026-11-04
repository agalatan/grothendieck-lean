import Grothe.UpperChaos.OriginalRow227TriangleData1919
import Grothe.UpperChaos.OriginalRow227TriangleData1920
import Grothe.UpperChaos.OriginalRow227TriangleData1924
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1908
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_246, Icur := OriginalRow227TriangleData1919.coefficient181_245,
    output := OriginalRow227TriangleData1924.coefficient182_245, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_247, Icur := OriginalRow227TriangleData1919.coefficient181_246,
    output := OriginalRow227TriangleData1924.coefficient182_246, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_248, Icur := OriginalRow227TriangleData1919.coefficient181_247,
    output := OriginalRow227TriangleData1924.coefficient182_247, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_249, Icur := OriginalRow227TriangleData1919.coefficient181_248,
    output := OriginalRow227TriangleData1924.coefficient182_248, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_250, Icur := OriginalRow227TriangleData1919.coefficient181_249,
    output := OriginalRow227TriangleData1924.coefficient182_249, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_251, Icur := OriginalRow227TriangleData1919.coefficient181_250,
    output := OriginalRow227TriangleData1924.coefficient182_250, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_252, Icur := OriginalRow227TriangleData1919.coefficient181_251,
    output := OriginalRow227TriangleData1924.coefficient182_251, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_253, Icur := OriginalRow227TriangleData1919.coefficient181_252,
    output := OriginalRow227TriangleData1924.coefficient182_252, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_254, Icur := OriginalRow227TriangleData1919.coefficient181_253,
    output := OriginalRow227TriangleData1924.coefficient182_253, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_255, Icur := OriginalRow227TriangleData1919.coefficient181_254,
    output := OriginalRow227TriangleData1924.coefficient182_254, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_256, Icur := OriginalRow227TriangleData1919.coefficient181_255,
    output := OriginalRow227TriangleData1924.coefficient182_255, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_257, Icur := OriginalRow227TriangleData1919.coefficient181_256,
    output := OriginalRow227TriangleData1924.coefficient182_256, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_258, Icur := OriginalRow227TriangleData1919.coefficient181_257,
    output := OriginalRow227TriangleData1924.coefficient182_257, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_259, Icur := OriginalRow227TriangleData1919.coefficient181_258,
    output := OriginalRow227TriangleData1924.coefficient182_258, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_260, Icur := OriginalRow227TriangleData1919.coefficient181_259,
    output := OriginalRow227TriangleData1924.coefficient182_259, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_261, Icur := OriginalRow227TriangleData1919.coefficient181_260,
    output := OriginalRow227TriangleData1924.coefficient182_260, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_262, Icur := OriginalRow227TriangleData1919.coefficient181_261,
    output := OriginalRow227TriangleData1924.coefficient182_261, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_263, Icur := OriginalRow227TriangleData1919.coefficient181_262,
    output := OriginalRow227TriangleData1924.coefficient182_262, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_264, Icur := OriginalRow227TriangleData1919.coefficient181_263,
    output := OriginalRow227TriangleData1924.coefficient182_263, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_265, Icur := OriginalRow227TriangleData1919.coefficient181_264,
    output := OriginalRow227TriangleData1924.coefficient182_264, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_266, Icur := OriginalRow227TriangleData1919.coefficient181_265,
    output := OriginalRow227TriangleData1924.coefficient182_265, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_267, Icur := OriginalRow227TriangleData1919.coefficient181_266,
    output := OriginalRow227TriangleData1924.coefficient182_266, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_268, Icur := OriginalRow227TriangleData1919.coefficient181_267,
    output := OriginalRow227TriangleData1924.coefficient182_267, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_269, Icur := OriginalRow227TriangleData1919.coefficient181_268,
    output := OriginalRow227TriangleData1924.coefficient182_268, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_270, Icur := OriginalRow227TriangleData1919.coefficient181_269,
    output := OriginalRow227TriangleData1924.coefficient182_269, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_271, Icur := OriginalRow227TriangleData1919.coefficient181_270,
    output := OriginalRow227TriangleData1924.coefficient182_270, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_272, Icur := OriginalRow227TriangleData1919.coefficient181_271,
    output := OriginalRow227TriangleData1924.coefficient182_271, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_273, Icur := OriginalRow227TriangleData1919.coefficient181_272,
    output := OriginalRow227TriangleData1924.coefficient182_272, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_274, Icur := OriginalRow227TriangleData1919.coefficient181_273,
    output := OriginalRow227TriangleData1924.coefficient182_273, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1919.coefficient181_275, Icur := OriginalRow227TriangleData1919.coefficient181_274,
    output := OriginalRow227TriangleData1924.coefficient182_274, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_276, Icur := OriginalRow227TriangleData1919.coefficient181_275,
    output := OriginalRow227TriangleData1924.coefficient182_275, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root182,
    Inext := OriginalRow227TriangleData1920.coefficient181_277, Icur := OriginalRow227TriangleData1920.coefficient181_276,
    output := OriginalRow227TriangleData1924.coefficient182_276, hC := OriginalRow227TriangleRoots05.root182_pos, hAC := OriginalRow227TriangleRoots05.product182_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1908

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1908.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
