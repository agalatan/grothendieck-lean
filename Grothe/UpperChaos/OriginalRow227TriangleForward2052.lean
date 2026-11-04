import Grothe.UpperChaos.OriginalRow227TriangleData2066
import Grothe.UpperChaos.OriginalRow227TriangleData2067
import Grothe.UpperChaos.OriginalRow227TriangleData2068
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2052
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_222, Icur := OriginalRow227TriangleData2066.coefficient221_221,
    output := OriginalRow227TriangleData2068.coefficient222_221, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_223, Icur := OriginalRow227TriangleData2066.coefficient221_222,
    output := OriginalRow227TriangleData2068.coefficient222_222, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_224, Icur := OriginalRow227TriangleData2066.coefficient221_223,
    output := OriginalRow227TriangleData2068.coefficient222_223, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_225, Icur := OriginalRow227TriangleData2066.coefficient221_224,
    output := OriginalRow227TriangleData2068.coefficient222_224, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_226, Icur := OriginalRow227TriangleData2066.coefficient221_225,
    output := OriginalRow227TriangleData2068.coefficient222_225, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_227, Icur := OriginalRow227TriangleData2066.coefficient221_226,
    output := OriginalRow227TriangleData2068.coefficient222_226, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_228, Icur := OriginalRow227TriangleData2066.coefficient221_227,
    output := OriginalRow227TriangleData2068.coefficient222_227, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_229, Icur := OriginalRow227TriangleData2066.coefficient221_228,
    output := OriginalRow227TriangleData2068.coefficient222_228, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_230, Icur := OriginalRow227TriangleData2066.coefficient221_229,
    output := OriginalRow227TriangleData2068.coefficient222_229, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_231, Icur := OriginalRow227TriangleData2066.coefficient221_230,
    output := OriginalRow227TriangleData2068.coefficient222_230, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_232, Icur := OriginalRow227TriangleData2066.coefficient221_231,
    output := OriginalRow227TriangleData2068.coefficient222_231, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_233, Icur := OriginalRow227TriangleData2066.coefficient221_232,
    output := OriginalRow227TriangleData2068.coefficient222_232, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_234, Icur := OriginalRow227TriangleData2066.coefficient221_233,
    output := OriginalRow227TriangleData2068.coefficient222_233, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_235, Icur := OriginalRow227TriangleData2066.coefficient221_234,
    output := OriginalRow227TriangleData2068.coefficient222_234, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_236, Icur := OriginalRow227TriangleData2066.coefficient221_235,
    output := OriginalRow227TriangleData2068.coefficient222_235, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_237, Icur := OriginalRow227TriangleData2066.coefficient221_236,
    output := OriginalRow227TriangleData2068.coefficient222_236, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_238, Icur := OriginalRow227TriangleData2066.coefficient221_237,
    output := OriginalRow227TriangleData2068.coefficient222_237, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_239, Icur := OriginalRow227TriangleData2066.coefficient221_238,
    output := OriginalRow227TriangleData2068.coefficient222_238, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_240, Icur := OriginalRow227TriangleData2066.coefficient221_239,
    output := OriginalRow227TriangleData2068.coefficient222_239, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_241, Icur := OriginalRow227TriangleData2066.coefficient221_240,
    output := OriginalRow227TriangleData2068.coefficient222_240, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_242, Icur := OriginalRow227TriangleData2066.coefficient221_241,
    output := OriginalRow227TriangleData2068.coefficient222_241, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_243, Icur := OriginalRow227TriangleData2066.coefficient221_242,
    output := OriginalRow227TriangleData2068.coefficient222_242, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_244, Icur := OriginalRow227TriangleData2066.coefficient221_243,
    output := OriginalRow227TriangleData2068.coefficient222_243, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_245, Icur := OriginalRow227TriangleData2066.coefficient221_244,
    output := OriginalRow227TriangleData2068.coefficient222_244, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_246, Icur := OriginalRow227TriangleData2066.coefficient221_245,
    output := OriginalRow227TriangleData2068.coefficient222_245, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_247, Icur := OriginalRow227TriangleData2066.coefficient221_246,
    output := OriginalRow227TriangleData2068.coefficient222_246, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_248, Icur := OriginalRow227TriangleData2066.coefficient221_247,
    output := OriginalRow227TriangleData2068.coefficient222_247, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_249, Icur := OriginalRow227TriangleData2066.coefficient221_248,
    output := OriginalRow227TriangleData2068.coefficient222_248, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_250, Icur := OriginalRow227TriangleData2066.coefficient221_249,
    output := OriginalRow227TriangleData2068.coefficient222_249, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2066.coefficient221_251, Icur := OriginalRow227TriangleData2066.coefficient221_250,
    output := OriginalRow227TriangleData2068.coefficient222_250, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2067.coefficient221_252, Icur := OriginalRow227TriangleData2066.coefficient221_251,
    output := OriginalRow227TriangleData2068.coefficient222_251, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root222,
    Inext := OriginalRow227TriangleData2067.coefficient221_253, Icur := OriginalRow227TriangleData2067.coefficient221_252,
    output := OriginalRow227TriangleData2068.coefficient222_252, hC := OriginalRow227TriangleRoots06.root222_pos, hAC := OriginalRow227TriangleRoots06.product222_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2052

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2052.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
