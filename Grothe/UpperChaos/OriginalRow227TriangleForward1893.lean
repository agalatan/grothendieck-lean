import Grothe.UpperChaos.OriginalRow227TriangleData1904
import Grothe.UpperChaos.OriginalRow227TriangleData1905
import Grothe.UpperChaos.OriginalRow227TriangleData1909
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1893
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_243, Icur := OriginalRow227TriangleData1904.coefficient178_242,
    output := OriginalRow227TriangleData1909.coefficient179_242, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_244, Icur := OriginalRow227TriangleData1904.coefficient178_243,
    output := OriginalRow227TriangleData1909.coefficient179_243, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_245, Icur := OriginalRow227TriangleData1904.coefficient178_244,
    output := OriginalRow227TriangleData1909.coefficient179_244, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_246, Icur := OriginalRow227TriangleData1904.coefficient178_245,
    output := OriginalRow227TriangleData1909.coefficient179_245, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_247, Icur := OriginalRow227TriangleData1904.coefficient178_246,
    output := OriginalRow227TriangleData1909.coefficient179_246, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_248, Icur := OriginalRow227TriangleData1904.coefficient178_247,
    output := OriginalRow227TriangleData1909.coefficient179_247, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_249, Icur := OriginalRow227TriangleData1904.coefficient178_248,
    output := OriginalRow227TriangleData1909.coefficient179_248, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_250, Icur := OriginalRow227TriangleData1904.coefficient178_249,
    output := OriginalRow227TriangleData1909.coefficient179_249, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_251, Icur := OriginalRow227TriangleData1904.coefficient178_250,
    output := OriginalRow227TriangleData1909.coefficient179_250, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_252, Icur := OriginalRow227TriangleData1904.coefficient178_251,
    output := OriginalRow227TriangleData1909.coefficient179_251, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_253, Icur := OriginalRow227TriangleData1904.coefficient178_252,
    output := OriginalRow227TriangleData1909.coefficient179_252, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_254, Icur := OriginalRow227TriangleData1904.coefficient178_253,
    output := OriginalRow227TriangleData1909.coefficient179_253, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_255, Icur := OriginalRow227TriangleData1904.coefficient178_254,
    output := OriginalRow227TriangleData1909.coefficient179_254, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_256, Icur := OriginalRow227TriangleData1904.coefficient178_255,
    output := OriginalRow227TriangleData1909.coefficient179_255, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_257, Icur := OriginalRow227TriangleData1904.coefficient178_256,
    output := OriginalRow227TriangleData1909.coefficient179_256, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_258, Icur := OriginalRow227TriangleData1904.coefficient178_257,
    output := OriginalRow227TriangleData1909.coefficient179_257, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_259, Icur := OriginalRow227TriangleData1904.coefficient178_258,
    output := OriginalRow227TriangleData1909.coefficient179_258, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_260, Icur := OriginalRow227TriangleData1904.coefficient178_259,
    output := OriginalRow227TriangleData1909.coefficient179_259, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_261, Icur := OriginalRow227TriangleData1904.coefficient178_260,
    output := OriginalRow227TriangleData1909.coefficient179_260, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_262, Icur := OriginalRow227TriangleData1904.coefficient178_261,
    output := OriginalRow227TriangleData1909.coefficient179_261, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_263, Icur := OriginalRow227TriangleData1904.coefficient178_262,
    output := OriginalRow227TriangleData1909.coefficient179_262, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_264, Icur := OriginalRow227TriangleData1904.coefficient178_263,
    output := OriginalRow227TriangleData1909.coefficient179_263, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_265, Icur := OriginalRow227TriangleData1904.coefficient178_264,
    output := OriginalRow227TriangleData1909.coefficient179_264, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_266, Icur := OriginalRow227TriangleData1904.coefficient178_265,
    output := OriginalRow227TriangleData1909.coefficient179_265, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_267, Icur := OriginalRow227TriangleData1904.coefficient178_266,
    output := OriginalRow227TriangleData1909.coefficient179_266, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_268, Icur := OriginalRow227TriangleData1904.coefficient178_267,
    output := OriginalRow227TriangleData1909.coefficient179_267, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_269, Icur := OriginalRow227TriangleData1904.coefficient178_268,
    output := OriginalRow227TriangleData1909.coefficient179_268, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_270, Icur := OriginalRow227TriangleData1904.coefficient178_269,
    output := OriginalRow227TriangleData1909.coefficient179_269, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_271, Icur := OriginalRow227TriangleData1904.coefficient178_270,
    output := OriginalRow227TriangleData1909.coefficient179_270, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1904.coefficient178_272, Icur := OriginalRow227TriangleData1904.coefficient178_271,
    output := OriginalRow227TriangleData1909.coefficient179_271, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1905.coefficient178_273, Icur := OriginalRow227TriangleData1904.coefficient178_272,
    output := OriginalRow227TriangleData1909.coefficient179_272, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root179,
    Inext := OriginalRow227TriangleData1905.coefficient178_274, Icur := OriginalRow227TriangleData1905.coefficient178_273,
    output := OriginalRow227TriangleData1909.coefficient179_273, hC := OriginalRow227TriangleRoots05.root179_pos, hAC := OriginalRow227TriangleRoots05.product179_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1893

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1893.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
