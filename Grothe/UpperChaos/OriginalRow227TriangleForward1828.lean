import Grothe.UpperChaos.OriginalRow227TriangleData1838
import Grothe.UpperChaos.OriginalRow227TriangleData1839
import Grothe.UpperChaos.OriginalRow227TriangleData1844
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1828
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_231, Icur := OriginalRow227TriangleData1838.coefficient166_230,
    output := OriginalRow227TriangleData1844.coefficient167_230, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_232, Icur := OriginalRow227TriangleData1838.coefficient166_231,
    output := OriginalRow227TriangleData1844.coefficient167_231, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_233, Icur := OriginalRow227TriangleData1838.coefficient166_232,
    output := OriginalRow227TriangleData1844.coefficient167_232, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_234, Icur := OriginalRow227TriangleData1838.coefficient166_233,
    output := OriginalRow227TriangleData1844.coefficient167_233, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_235, Icur := OriginalRow227TriangleData1838.coefficient166_234,
    output := OriginalRow227TriangleData1844.coefficient167_234, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_236, Icur := OriginalRow227TriangleData1838.coefficient166_235,
    output := OriginalRow227TriangleData1844.coefficient167_235, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_237, Icur := OriginalRow227TriangleData1838.coefficient166_236,
    output := OriginalRow227TriangleData1844.coefficient167_236, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_238, Icur := OriginalRow227TriangleData1838.coefficient166_237,
    output := OriginalRow227TriangleData1844.coefficient167_237, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_239, Icur := OriginalRow227TriangleData1838.coefficient166_238,
    output := OriginalRow227TriangleData1844.coefficient167_238, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_240, Icur := OriginalRow227TriangleData1838.coefficient166_239,
    output := OriginalRow227TriangleData1844.coefficient167_239, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_241, Icur := OriginalRow227TriangleData1838.coefficient166_240,
    output := OriginalRow227TriangleData1844.coefficient167_240, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_242, Icur := OriginalRow227TriangleData1838.coefficient166_241,
    output := OriginalRow227TriangleData1844.coefficient167_241, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_243, Icur := OriginalRow227TriangleData1838.coefficient166_242,
    output := OriginalRow227TriangleData1844.coefficient167_242, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_244, Icur := OriginalRow227TriangleData1838.coefficient166_243,
    output := OriginalRow227TriangleData1844.coefficient167_243, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_245, Icur := OriginalRow227TriangleData1838.coefficient166_244,
    output := OriginalRow227TriangleData1844.coefficient167_244, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_246, Icur := OriginalRow227TriangleData1838.coefficient166_245,
    output := OriginalRow227TriangleData1844.coefficient167_245, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_247, Icur := OriginalRow227TriangleData1838.coefficient166_246,
    output := OriginalRow227TriangleData1844.coefficient167_246, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_248, Icur := OriginalRow227TriangleData1838.coefficient166_247,
    output := OriginalRow227TriangleData1844.coefficient167_247, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_249, Icur := OriginalRow227TriangleData1838.coefficient166_248,
    output := OriginalRow227TriangleData1844.coefficient167_248, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_250, Icur := OriginalRow227TriangleData1838.coefficient166_249,
    output := OriginalRow227TriangleData1844.coefficient167_249, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_251, Icur := OriginalRow227TriangleData1838.coefficient166_250,
    output := OriginalRow227TriangleData1844.coefficient167_250, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_252, Icur := OriginalRow227TriangleData1838.coefficient166_251,
    output := OriginalRow227TriangleData1844.coefficient167_251, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_253, Icur := OriginalRow227TriangleData1838.coefficient166_252,
    output := OriginalRow227TriangleData1844.coefficient167_252, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_254, Icur := OriginalRow227TriangleData1838.coefficient166_253,
    output := OriginalRow227TriangleData1844.coefficient167_253, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_255, Icur := OriginalRow227TriangleData1838.coefficient166_254,
    output := OriginalRow227TriangleData1844.coefficient167_254, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_256, Icur := OriginalRow227TriangleData1838.coefficient166_255,
    output := OriginalRow227TriangleData1844.coefficient167_255, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_257, Icur := OriginalRow227TriangleData1838.coefficient166_256,
    output := OriginalRow227TriangleData1844.coefficient167_256, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_258, Icur := OriginalRow227TriangleData1838.coefficient166_257,
    output := OriginalRow227TriangleData1844.coefficient167_257, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_259, Icur := OriginalRow227TriangleData1838.coefficient166_258,
    output := OriginalRow227TriangleData1844.coefficient167_258, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1838.coefficient166_260, Icur := OriginalRow227TriangleData1838.coefficient166_259,
    output := OriginalRow227TriangleData1844.coefficient167_259, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_261, Icur := OriginalRow227TriangleData1838.coefficient166_260,
    output := OriginalRow227TriangleData1844.coefficient167_260, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1839.coefficient166_262, Icur := OriginalRow227TriangleData1839.coefficient166_261,
    output := OriginalRow227TriangleData1844.coefficient167_261, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1828

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1828.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
