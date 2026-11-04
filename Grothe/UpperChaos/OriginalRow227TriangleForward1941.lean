import Grothe.UpperChaos.OriginalRow227TriangleData1953
import Grothe.UpperChaos.OriginalRow227TriangleData1954
import Grothe.UpperChaos.OriginalRow227TriangleData1957
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1941
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_221, Icur := OriginalRow227TriangleData1953.coefficient188_220,
    output := OriginalRow227TriangleData1957.coefficient189_220, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_222, Icur := OriginalRow227TriangleData1953.coefficient188_221,
    output := OriginalRow227TriangleData1957.coefficient189_221, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_223, Icur := OriginalRow227TriangleData1953.coefficient188_222,
    output := OriginalRow227TriangleData1957.coefficient189_222, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_224, Icur := OriginalRow227TriangleData1953.coefficient188_223,
    output := OriginalRow227TriangleData1957.coefficient189_223, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_225, Icur := OriginalRow227TriangleData1953.coefficient188_224,
    output := OriginalRow227TriangleData1957.coefficient189_224, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_226, Icur := OriginalRow227TriangleData1953.coefficient188_225,
    output := OriginalRow227TriangleData1957.coefficient189_225, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_227, Icur := OriginalRow227TriangleData1953.coefficient188_226,
    output := OriginalRow227TriangleData1957.coefficient189_226, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_228, Icur := OriginalRow227TriangleData1953.coefficient188_227,
    output := OriginalRow227TriangleData1957.coefficient189_227, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_229, Icur := OriginalRow227TriangleData1953.coefficient188_228,
    output := OriginalRow227TriangleData1957.coefficient189_228, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_230, Icur := OriginalRow227TriangleData1953.coefficient188_229,
    output := OriginalRow227TriangleData1957.coefficient189_229, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_231, Icur := OriginalRow227TriangleData1953.coefficient188_230,
    output := OriginalRow227TriangleData1957.coefficient189_230, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_232, Icur := OriginalRow227TriangleData1953.coefficient188_231,
    output := OriginalRow227TriangleData1957.coefficient189_231, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_233, Icur := OriginalRow227TriangleData1953.coefficient188_232,
    output := OriginalRow227TriangleData1957.coefficient189_232, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_234, Icur := OriginalRow227TriangleData1953.coefficient188_233,
    output := OriginalRow227TriangleData1957.coefficient189_233, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_235, Icur := OriginalRow227TriangleData1953.coefficient188_234,
    output := OriginalRow227TriangleData1957.coefficient189_234, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_236, Icur := OriginalRow227TriangleData1953.coefficient188_235,
    output := OriginalRow227TriangleData1957.coefficient189_235, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_237, Icur := OriginalRow227TriangleData1953.coefficient188_236,
    output := OriginalRow227TriangleData1957.coefficient189_236, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_238, Icur := OriginalRow227TriangleData1953.coefficient188_237,
    output := OriginalRow227TriangleData1957.coefficient189_237, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_239, Icur := OriginalRow227TriangleData1953.coefficient188_238,
    output := OriginalRow227TriangleData1957.coefficient189_238, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_240, Icur := OriginalRow227TriangleData1953.coefficient188_239,
    output := OriginalRow227TriangleData1957.coefficient189_239, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_241, Icur := OriginalRow227TriangleData1953.coefficient188_240,
    output := OriginalRow227TriangleData1957.coefficient189_240, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_242, Icur := OriginalRow227TriangleData1953.coefficient188_241,
    output := OriginalRow227TriangleData1957.coefficient189_241, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_243, Icur := OriginalRow227TriangleData1953.coefficient188_242,
    output := OriginalRow227TriangleData1957.coefficient189_242, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_244, Icur := OriginalRow227TriangleData1953.coefficient188_243,
    output := OriginalRow227TriangleData1957.coefficient189_243, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_245, Icur := OriginalRow227TriangleData1953.coefficient188_244,
    output := OriginalRow227TriangleData1957.coefficient189_244, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_246, Icur := OriginalRow227TriangleData1953.coefficient188_245,
    output := OriginalRow227TriangleData1957.coefficient189_245, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_247, Icur := OriginalRow227TriangleData1953.coefficient188_246,
    output := OriginalRow227TriangleData1957.coefficient189_246, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_248, Icur := OriginalRow227TriangleData1953.coefficient188_247,
    output := OriginalRow227TriangleData1957.coefficient189_247, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_249, Icur := OriginalRow227TriangleData1953.coefficient188_248,
    output := OriginalRow227TriangleData1957.coefficient189_248, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1953.coefficient188_250, Icur := OriginalRow227TriangleData1953.coefficient188_249,
    output := OriginalRow227TriangleData1957.coefficient189_249, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1954.coefficient188_251, Icur := OriginalRow227TriangleData1953.coefficient188_250,
    output := OriginalRow227TriangleData1957.coefficient189_250, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root189,
    Inext := OriginalRow227TriangleData1954.coefficient188_252, Icur := OriginalRow227TriangleData1954.coefficient188_251,
    output := OriginalRow227TriangleData1957.coefficient189_251, hC := OriginalRow227TriangleRoots05.root189_pos, hAC := OriginalRow227TriangleRoots05.product189_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1941

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1941.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
