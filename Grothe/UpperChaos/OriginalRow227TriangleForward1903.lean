import Grothe.UpperChaos.OriginalRow227TriangleData1914
import Grothe.UpperChaos.OriginalRow227TriangleData1915
import Grothe.UpperChaos.OriginalRow227TriangleData1919
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1903
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_245, Icur := OriginalRow227TriangleData1914.coefficient180_244,
    output := OriginalRow227TriangleData1919.coefficient181_244, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_246, Icur := OriginalRow227TriangleData1914.coefficient180_245,
    output := OriginalRow227TriangleData1919.coefficient181_245, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_247, Icur := OriginalRow227TriangleData1914.coefficient180_246,
    output := OriginalRow227TriangleData1919.coefficient181_246, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_248, Icur := OriginalRow227TriangleData1914.coefficient180_247,
    output := OriginalRow227TriangleData1919.coefficient181_247, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_249, Icur := OriginalRow227TriangleData1914.coefficient180_248,
    output := OriginalRow227TriangleData1919.coefficient181_248, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_250, Icur := OriginalRow227TriangleData1914.coefficient180_249,
    output := OriginalRow227TriangleData1919.coefficient181_249, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_251, Icur := OriginalRow227TriangleData1914.coefficient180_250,
    output := OriginalRow227TriangleData1919.coefficient181_250, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_252, Icur := OriginalRow227TriangleData1914.coefficient180_251,
    output := OriginalRow227TriangleData1919.coefficient181_251, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_253, Icur := OriginalRow227TriangleData1914.coefficient180_252,
    output := OriginalRow227TriangleData1919.coefficient181_252, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_254, Icur := OriginalRow227TriangleData1914.coefficient180_253,
    output := OriginalRow227TriangleData1919.coefficient181_253, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_255, Icur := OriginalRow227TriangleData1914.coefficient180_254,
    output := OriginalRow227TriangleData1919.coefficient181_254, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_256, Icur := OriginalRow227TriangleData1914.coefficient180_255,
    output := OriginalRow227TriangleData1919.coefficient181_255, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_257, Icur := OriginalRow227TriangleData1914.coefficient180_256,
    output := OriginalRow227TriangleData1919.coefficient181_256, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_258, Icur := OriginalRow227TriangleData1914.coefficient180_257,
    output := OriginalRow227TriangleData1919.coefficient181_257, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_259, Icur := OriginalRow227TriangleData1914.coefficient180_258,
    output := OriginalRow227TriangleData1919.coefficient181_258, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_260, Icur := OriginalRow227TriangleData1914.coefficient180_259,
    output := OriginalRow227TriangleData1919.coefficient181_259, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_261, Icur := OriginalRow227TriangleData1914.coefficient180_260,
    output := OriginalRow227TriangleData1919.coefficient181_260, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_262, Icur := OriginalRow227TriangleData1914.coefficient180_261,
    output := OriginalRow227TriangleData1919.coefficient181_261, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_263, Icur := OriginalRow227TriangleData1914.coefficient180_262,
    output := OriginalRow227TriangleData1919.coefficient181_262, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_264, Icur := OriginalRow227TriangleData1914.coefficient180_263,
    output := OriginalRow227TriangleData1919.coefficient181_263, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_265, Icur := OriginalRow227TriangleData1914.coefficient180_264,
    output := OriginalRow227TriangleData1919.coefficient181_264, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_266, Icur := OriginalRow227TriangleData1914.coefficient180_265,
    output := OriginalRow227TriangleData1919.coefficient181_265, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_267, Icur := OriginalRow227TriangleData1914.coefficient180_266,
    output := OriginalRow227TriangleData1919.coefficient181_266, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_268, Icur := OriginalRow227TriangleData1914.coefficient180_267,
    output := OriginalRow227TriangleData1919.coefficient181_267, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_269, Icur := OriginalRow227TriangleData1914.coefficient180_268,
    output := OriginalRow227TriangleData1919.coefficient181_268, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_270, Icur := OriginalRow227TriangleData1914.coefficient180_269,
    output := OriginalRow227TriangleData1919.coefficient181_269, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_271, Icur := OriginalRow227TriangleData1914.coefficient180_270,
    output := OriginalRow227TriangleData1919.coefficient181_270, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_272, Icur := OriginalRow227TriangleData1914.coefficient180_271,
    output := OriginalRow227TriangleData1919.coefficient181_271, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_273, Icur := OriginalRow227TriangleData1914.coefficient180_272,
    output := OriginalRow227TriangleData1919.coefficient181_272, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1914.coefficient180_274, Icur := OriginalRow227TriangleData1914.coefficient180_273,
    output := OriginalRow227TriangleData1919.coefficient181_273, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1915.coefficient180_275, Icur := OriginalRow227TriangleData1914.coefficient180_274,
    output := OriginalRow227TriangleData1919.coefficient181_274, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root181,
    Inext := OriginalRow227TriangleData1915.coefficient180_276, Icur := OriginalRow227TriangleData1915.coefficient180_275,
    output := OriginalRow227TriangleData1919.coefficient181_275, hC := OriginalRow227TriangleRoots05.root181_pos, hAC := OriginalRow227TriangleRoots05.product181_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1903

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1903.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
