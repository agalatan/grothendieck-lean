import Grothe.UpperChaos.OriginalRow227TriangleData1909
import Grothe.UpperChaos.OriginalRow227TriangleData1910
import Grothe.UpperChaos.OriginalRow227TriangleData1914
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1898
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_244, Icur := OriginalRow227TriangleData1909.coefficient179_243,
    output := OriginalRow227TriangleData1914.coefficient180_243, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_245, Icur := OriginalRow227TriangleData1909.coefficient179_244,
    output := OriginalRow227TriangleData1914.coefficient180_244, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_246, Icur := OriginalRow227TriangleData1909.coefficient179_245,
    output := OriginalRow227TriangleData1914.coefficient180_245, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_247, Icur := OriginalRow227TriangleData1909.coefficient179_246,
    output := OriginalRow227TriangleData1914.coefficient180_246, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_248, Icur := OriginalRow227TriangleData1909.coefficient179_247,
    output := OriginalRow227TriangleData1914.coefficient180_247, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_249, Icur := OriginalRow227TriangleData1909.coefficient179_248,
    output := OriginalRow227TriangleData1914.coefficient180_248, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_250, Icur := OriginalRow227TriangleData1909.coefficient179_249,
    output := OriginalRow227TriangleData1914.coefficient180_249, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_251, Icur := OriginalRow227TriangleData1909.coefficient179_250,
    output := OriginalRow227TriangleData1914.coefficient180_250, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_252, Icur := OriginalRow227TriangleData1909.coefficient179_251,
    output := OriginalRow227TriangleData1914.coefficient180_251, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_253, Icur := OriginalRow227TriangleData1909.coefficient179_252,
    output := OriginalRow227TriangleData1914.coefficient180_252, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_254, Icur := OriginalRow227TriangleData1909.coefficient179_253,
    output := OriginalRow227TriangleData1914.coefficient180_253, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_255, Icur := OriginalRow227TriangleData1909.coefficient179_254,
    output := OriginalRow227TriangleData1914.coefficient180_254, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_256, Icur := OriginalRow227TriangleData1909.coefficient179_255,
    output := OriginalRow227TriangleData1914.coefficient180_255, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_257, Icur := OriginalRow227TriangleData1909.coefficient179_256,
    output := OriginalRow227TriangleData1914.coefficient180_256, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_258, Icur := OriginalRow227TriangleData1909.coefficient179_257,
    output := OriginalRow227TriangleData1914.coefficient180_257, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_259, Icur := OriginalRow227TriangleData1909.coefficient179_258,
    output := OriginalRow227TriangleData1914.coefficient180_258, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_260, Icur := OriginalRow227TriangleData1909.coefficient179_259,
    output := OriginalRow227TriangleData1914.coefficient180_259, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_261, Icur := OriginalRow227TriangleData1909.coefficient179_260,
    output := OriginalRow227TriangleData1914.coefficient180_260, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_262, Icur := OriginalRow227TriangleData1909.coefficient179_261,
    output := OriginalRow227TriangleData1914.coefficient180_261, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_263, Icur := OriginalRow227TriangleData1909.coefficient179_262,
    output := OriginalRow227TriangleData1914.coefficient180_262, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_264, Icur := OriginalRow227TriangleData1909.coefficient179_263,
    output := OriginalRow227TriangleData1914.coefficient180_263, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_265, Icur := OriginalRow227TriangleData1909.coefficient179_264,
    output := OriginalRow227TriangleData1914.coefficient180_264, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_266, Icur := OriginalRow227TriangleData1909.coefficient179_265,
    output := OriginalRow227TriangleData1914.coefficient180_265, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_267, Icur := OriginalRow227TriangleData1909.coefficient179_266,
    output := OriginalRow227TriangleData1914.coefficient180_266, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_268, Icur := OriginalRow227TriangleData1909.coefficient179_267,
    output := OriginalRow227TriangleData1914.coefficient180_267, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_269, Icur := OriginalRow227TriangleData1909.coefficient179_268,
    output := OriginalRow227TriangleData1914.coefficient180_268, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_270, Icur := OriginalRow227TriangleData1909.coefficient179_269,
    output := OriginalRow227TriangleData1914.coefficient180_269, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_271, Icur := OriginalRow227TriangleData1909.coefficient179_270,
    output := OriginalRow227TriangleData1914.coefficient180_270, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_272, Icur := OriginalRow227TriangleData1909.coefficient179_271,
    output := OriginalRow227TriangleData1914.coefficient180_271, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_273, Icur := OriginalRow227TriangleData1909.coefficient179_272,
    output := OriginalRow227TriangleData1914.coefficient180_272, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_274, Icur := OriginalRow227TriangleData1909.coefficient179_273,
    output := OriginalRow227TriangleData1914.coefficient180_273, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1910.coefficient179_275, Icur := OriginalRow227TriangleData1910.coefficient179_274,
    output := OriginalRow227TriangleData1914.coefficient180_274, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1898

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1898.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
