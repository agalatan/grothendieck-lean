import Grothe.UpperChaos.OriginalRow227TriangleData2058
import Grothe.UpperChaos.OriginalRow227TriangleData2059
import Grothe.UpperChaos.OriginalRow227TriangleData2061
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2045
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_219, Icur := OriginalRow227TriangleData2058.coefficient218_218,
    output := OriginalRow227TriangleData2061.coefficient219_218, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_220, Icur := OriginalRow227TriangleData2058.coefficient218_219,
    output := OriginalRow227TriangleData2061.coefficient219_219, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_221, Icur := OriginalRow227TriangleData2058.coefficient218_220,
    output := OriginalRow227TriangleData2061.coefficient219_220, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_222, Icur := OriginalRow227TriangleData2058.coefficient218_221,
    output := OriginalRow227TriangleData2061.coefficient219_221, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_223, Icur := OriginalRow227TriangleData2058.coefficient218_222,
    output := OriginalRow227TriangleData2061.coefficient219_222, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_224, Icur := OriginalRow227TriangleData2058.coefficient218_223,
    output := OriginalRow227TriangleData2061.coefficient219_223, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_225, Icur := OriginalRow227TriangleData2058.coefficient218_224,
    output := OriginalRow227TriangleData2061.coefficient219_224, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_226, Icur := OriginalRow227TriangleData2058.coefficient218_225,
    output := OriginalRow227TriangleData2061.coefficient219_225, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_227, Icur := OriginalRow227TriangleData2058.coefficient218_226,
    output := OriginalRow227TriangleData2061.coefficient219_226, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_228, Icur := OriginalRow227TriangleData2058.coefficient218_227,
    output := OriginalRow227TriangleData2061.coefficient219_227, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_229, Icur := OriginalRow227TriangleData2058.coefficient218_228,
    output := OriginalRow227TriangleData2061.coefficient219_228, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_230, Icur := OriginalRow227TriangleData2058.coefficient218_229,
    output := OriginalRow227TriangleData2061.coefficient219_229, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_231, Icur := OriginalRow227TriangleData2058.coefficient218_230,
    output := OriginalRow227TriangleData2061.coefficient219_230, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_232, Icur := OriginalRow227TriangleData2058.coefficient218_231,
    output := OriginalRow227TriangleData2061.coefficient219_231, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_233, Icur := OriginalRow227TriangleData2058.coefficient218_232,
    output := OriginalRow227TriangleData2061.coefficient219_232, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_234, Icur := OriginalRow227TriangleData2058.coefficient218_233,
    output := OriginalRow227TriangleData2061.coefficient219_233, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_235, Icur := OriginalRow227TriangleData2058.coefficient218_234,
    output := OriginalRow227TriangleData2061.coefficient219_234, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_236, Icur := OriginalRow227TriangleData2058.coefficient218_235,
    output := OriginalRow227TriangleData2061.coefficient219_235, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_237, Icur := OriginalRow227TriangleData2058.coefficient218_236,
    output := OriginalRow227TriangleData2061.coefficient219_236, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_238, Icur := OriginalRow227TriangleData2058.coefficient218_237,
    output := OriginalRow227TriangleData2061.coefficient219_237, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_239, Icur := OriginalRow227TriangleData2058.coefficient218_238,
    output := OriginalRow227TriangleData2061.coefficient219_238, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_240, Icur := OriginalRow227TriangleData2058.coefficient218_239,
    output := OriginalRow227TriangleData2061.coefficient219_239, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_241, Icur := OriginalRow227TriangleData2058.coefficient218_240,
    output := OriginalRow227TriangleData2061.coefficient219_240, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_242, Icur := OriginalRow227TriangleData2058.coefficient218_241,
    output := OriginalRow227TriangleData2061.coefficient219_241, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_243, Icur := OriginalRow227TriangleData2058.coefficient218_242,
    output := OriginalRow227TriangleData2061.coefficient219_242, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_244, Icur := OriginalRow227TriangleData2058.coefficient218_243,
    output := OriginalRow227TriangleData2061.coefficient219_243, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_245, Icur := OriginalRow227TriangleData2058.coefficient218_244,
    output := OriginalRow227TriangleData2061.coefficient219_244, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_246, Icur := OriginalRow227TriangleData2058.coefficient218_245,
    output := OriginalRow227TriangleData2061.coefficient219_245, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_247, Icur := OriginalRow227TriangleData2058.coefficient218_246,
    output := OriginalRow227TriangleData2061.coefficient219_246, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2058.coefficient218_248, Icur := OriginalRow227TriangleData2058.coefficient218_247,
    output := OriginalRow227TriangleData2061.coefficient219_247, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2059.coefficient218_249, Icur := OriginalRow227TriangleData2058.coefficient218_248,
    output := OriginalRow227TriangleData2061.coefficient219_248, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root219,
    Inext := OriginalRow227TriangleData2059.coefficient218_250, Icur := OriginalRow227TriangleData2059.coefficient218_249,
    output := OriginalRow227TriangleData2061.coefficient219_249, hC := OriginalRow227TriangleRoots06.root219_pos, hAC := OriginalRow227TriangleRoots06.product219_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2045

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2045.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
