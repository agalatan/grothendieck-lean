import Grothe.UpperChaos.OriginalRow227TriangleData2076
import Grothe.UpperChaos.OriginalRow227TriangleData2077
import Grothe.UpperChaos.OriginalRow227TriangleData2078
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2062
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_227, Icur := OriginalRow227TriangleData2076.coefficient226_226,
    output := OriginalRow227TriangleData2078.coefficient227_226, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_228, Icur := OriginalRow227TriangleData2076.coefficient226_227,
    output := OriginalRow227TriangleData2078.coefficient227_227, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_229, Icur := OriginalRow227TriangleData2076.coefficient226_228,
    output := OriginalRow227TriangleData2078.coefficient227_228, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_230, Icur := OriginalRow227TriangleData2076.coefficient226_229,
    output := OriginalRow227TriangleData2078.coefficient227_229, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_231, Icur := OriginalRow227TriangleData2076.coefficient226_230,
    output := OriginalRow227TriangleData2078.coefficient227_230, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_232, Icur := OriginalRow227TriangleData2076.coefficient226_231,
    output := OriginalRow227TriangleData2078.coefficient227_231, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_233, Icur := OriginalRow227TriangleData2076.coefficient226_232,
    output := OriginalRow227TriangleData2078.coefficient227_232, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_234, Icur := OriginalRow227TriangleData2076.coefficient226_233,
    output := OriginalRow227TriangleData2078.coefficient227_233, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_235, Icur := OriginalRow227TriangleData2076.coefficient226_234,
    output := OriginalRow227TriangleData2078.coefficient227_234, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_236, Icur := OriginalRow227TriangleData2076.coefficient226_235,
    output := OriginalRow227TriangleData2078.coefficient227_235, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_237, Icur := OriginalRow227TriangleData2076.coefficient226_236,
    output := OriginalRow227TriangleData2078.coefficient227_236, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_238, Icur := OriginalRow227TriangleData2076.coefficient226_237,
    output := OriginalRow227TriangleData2078.coefficient227_237, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_239, Icur := OriginalRow227TriangleData2076.coefficient226_238,
    output := OriginalRow227TriangleData2078.coefficient227_238, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_240, Icur := OriginalRow227TriangleData2076.coefficient226_239,
    output := OriginalRow227TriangleData2078.coefficient227_239, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_241, Icur := OriginalRow227TriangleData2076.coefficient226_240,
    output := OriginalRow227TriangleData2078.coefficient227_240, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_242, Icur := OriginalRow227TriangleData2076.coefficient226_241,
    output := OriginalRow227TriangleData2078.coefficient227_241, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_243, Icur := OriginalRow227TriangleData2076.coefficient226_242,
    output := OriginalRow227TriangleData2078.coefficient227_242, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_244, Icur := OriginalRow227TriangleData2076.coefficient226_243,
    output := OriginalRow227TriangleData2078.coefficient227_243, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_245, Icur := OriginalRow227TriangleData2076.coefficient226_244,
    output := OriginalRow227TriangleData2078.coefficient227_244, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_246, Icur := OriginalRow227TriangleData2076.coefficient226_245,
    output := OriginalRow227TriangleData2078.coefficient227_245, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_247, Icur := OriginalRow227TriangleData2076.coefficient226_246,
    output := OriginalRow227TriangleData2078.coefficient227_246, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_248, Icur := OriginalRow227TriangleData2076.coefficient226_247,
    output := OriginalRow227TriangleData2078.coefficient227_247, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_249, Icur := OriginalRow227TriangleData2076.coefficient226_248,
    output := OriginalRow227TriangleData2078.coefficient227_248, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_250, Icur := OriginalRow227TriangleData2076.coefficient226_249,
    output := OriginalRow227TriangleData2078.coefficient227_249, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_251, Icur := OriginalRow227TriangleData2076.coefficient226_250,
    output := OriginalRow227TriangleData2078.coefficient227_250, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_252, Icur := OriginalRow227TriangleData2076.coefficient226_251,
    output := OriginalRow227TriangleData2078.coefficient227_251, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_253, Icur := OriginalRow227TriangleData2076.coefficient226_252,
    output := OriginalRow227TriangleData2078.coefficient227_252, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_254, Icur := OriginalRow227TriangleData2076.coefficient226_253,
    output := OriginalRow227TriangleData2078.coefficient227_253, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_255, Icur := OriginalRow227TriangleData2076.coefficient226_254,
    output := OriginalRow227TriangleData2078.coefficient227_254, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2076.coefficient226_256, Icur := OriginalRow227TriangleData2076.coefficient226_255,
    output := OriginalRow227TriangleData2078.coefficient227_255, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2077.coefficient226_257, Icur := OriginalRow227TriangleData2076.coefficient226_256,
    output := OriginalRow227TriangleData2078.coefficient227_256, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root227,
    Inext := OriginalRow227TriangleData2077.coefficient226_258, Icur := OriginalRow227TriangleData2077.coefficient226_257,
    output := OriginalRow227TriangleData2078.coefficient227_257, hC := OriginalRow227TriangleRoots07.root227_pos, hAC := OriginalRow227TriangleRoots07.product227_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2062

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2062.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
