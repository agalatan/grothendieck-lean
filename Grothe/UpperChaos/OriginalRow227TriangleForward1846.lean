import Grothe.UpperChaos.OriginalRow227TriangleData1856
import Grothe.UpperChaos.OriginalRow227TriangleData1857
import Grothe.UpperChaos.OriginalRow227TriangleData1862
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1846
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_234, Icur := OriginalRow227TriangleData1856.coefficient169_233,
    output := OriginalRow227TriangleData1862.coefficient170_233, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_235, Icur := OriginalRow227TriangleData1856.coefficient169_234,
    output := OriginalRow227TriangleData1862.coefficient170_234, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_236, Icur := OriginalRow227TriangleData1856.coefficient169_235,
    output := OriginalRow227TriangleData1862.coefficient170_235, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_237, Icur := OriginalRow227TriangleData1856.coefficient169_236,
    output := OriginalRow227TriangleData1862.coefficient170_236, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_238, Icur := OriginalRow227TriangleData1856.coefficient169_237,
    output := OriginalRow227TriangleData1862.coefficient170_237, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_239, Icur := OriginalRow227TriangleData1856.coefficient169_238,
    output := OriginalRow227TriangleData1862.coefficient170_238, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_240, Icur := OriginalRow227TriangleData1856.coefficient169_239,
    output := OriginalRow227TriangleData1862.coefficient170_239, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_241, Icur := OriginalRow227TriangleData1856.coefficient169_240,
    output := OriginalRow227TriangleData1862.coefficient170_240, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_242, Icur := OriginalRow227TriangleData1856.coefficient169_241,
    output := OriginalRow227TriangleData1862.coefficient170_241, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_243, Icur := OriginalRow227TriangleData1856.coefficient169_242,
    output := OriginalRow227TriangleData1862.coefficient170_242, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_244, Icur := OriginalRow227TriangleData1856.coefficient169_243,
    output := OriginalRow227TriangleData1862.coefficient170_243, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_245, Icur := OriginalRow227TriangleData1856.coefficient169_244,
    output := OriginalRow227TriangleData1862.coefficient170_244, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_246, Icur := OriginalRow227TriangleData1856.coefficient169_245,
    output := OriginalRow227TriangleData1862.coefficient170_245, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_247, Icur := OriginalRow227TriangleData1856.coefficient169_246,
    output := OriginalRow227TriangleData1862.coefficient170_246, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_248, Icur := OriginalRow227TriangleData1856.coefficient169_247,
    output := OriginalRow227TriangleData1862.coefficient170_247, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_249, Icur := OriginalRow227TriangleData1856.coefficient169_248,
    output := OriginalRow227TriangleData1862.coefficient170_248, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_250, Icur := OriginalRow227TriangleData1856.coefficient169_249,
    output := OriginalRow227TriangleData1862.coefficient170_249, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_251, Icur := OriginalRow227TriangleData1856.coefficient169_250,
    output := OriginalRow227TriangleData1862.coefficient170_250, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_252, Icur := OriginalRow227TriangleData1856.coefficient169_251,
    output := OriginalRow227TriangleData1862.coefficient170_251, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_253, Icur := OriginalRow227TriangleData1856.coefficient169_252,
    output := OriginalRow227TriangleData1862.coefficient170_252, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_254, Icur := OriginalRow227TriangleData1856.coefficient169_253,
    output := OriginalRow227TriangleData1862.coefficient170_253, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_255, Icur := OriginalRow227TriangleData1856.coefficient169_254,
    output := OriginalRow227TriangleData1862.coefficient170_254, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_256, Icur := OriginalRow227TriangleData1856.coefficient169_255,
    output := OriginalRow227TriangleData1862.coefficient170_255, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_257, Icur := OriginalRow227TriangleData1856.coefficient169_256,
    output := OriginalRow227TriangleData1862.coefficient170_256, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_258, Icur := OriginalRow227TriangleData1856.coefficient169_257,
    output := OriginalRow227TriangleData1862.coefficient170_257, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_259, Icur := OriginalRow227TriangleData1856.coefficient169_258,
    output := OriginalRow227TriangleData1862.coefficient170_258, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_260, Icur := OriginalRow227TriangleData1856.coefficient169_259,
    output := OriginalRow227TriangleData1862.coefficient170_259, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_261, Icur := OriginalRow227TriangleData1856.coefficient169_260,
    output := OriginalRow227TriangleData1862.coefficient170_260, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_262, Icur := OriginalRow227TriangleData1856.coefficient169_261,
    output := OriginalRow227TriangleData1862.coefficient170_261, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1856.coefficient169_263, Icur := OriginalRow227TriangleData1856.coefficient169_262,
    output := OriginalRow227TriangleData1862.coefficient170_262, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1857.coefficient169_264, Icur := OriginalRow227TriangleData1856.coefficient169_263,
    output := OriginalRow227TriangleData1862.coefficient170_263, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root170,
    Inext := OriginalRow227TriangleData1857.coefficient169_265, Icur := OriginalRow227TriangleData1857.coefficient169_264,
    output := OriginalRow227TriangleData1862.coefficient170_264, hC := OriginalRow227TriangleRoots05.root170_pos, hAC := OriginalRow227TriangleRoots05.product170_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1846

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1846.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
