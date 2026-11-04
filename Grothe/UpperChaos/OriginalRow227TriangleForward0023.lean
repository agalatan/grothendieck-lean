import Grothe.UpperChaos.OriginalRow227TriangleData0023
import Grothe.UpperChaos.OriginalRow227TriangleData0024
import Grothe.UpperChaos.OriginalRow227TriangleData0039
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0023
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_226, Icur := OriginalRow227TriangleData0023.coefficient1_225,
    output := OriginalRow227TriangleData0039.coefficient2_225, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_227, Icur := OriginalRow227TriangleData0023.coefficient1_226,
    output := OriginalRow227TriangleData0039.coefficient2_226, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_228, Icur := OriginalRow227TriangleData0023.coefficient1_227,
    output := OriginalRow227TriangleData0039.coefficient2_227, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_229, Icur := OriginalRow227TriangleData0023.coefficient1_228,
    output := OriginalRow227TriangleData0039.coefficient2_228, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_230, Icur := OriginalRow227TriangleData0023.coefficient1_229,
    output := OriginalRow227TriangleData0039.coefficient2_229, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_231, Icur := OriginalRow227TriangleData0023.coefficient1_230,
    output := OriginalRow227TriangleData0039.coefficient2_230, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_232, Icur := OriginalRow227TriangleData0023.coefficient1_231,
    output := OriginalRow227TriangleData0039.coefficient2_231, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_233, Icur := OriginalRow227TriangleData0023.coefficient1_232,
    output := OriginalRow227TriangleData0039.coefficient2_232, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_234, Icur := OriginalRow227TriangleData0023.coefficient1_233,
    output := OriginalRow227TriangleData0039.coefficient2_233, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_235, Icur := OriginalRow227TriangleData0023.coefficient1_234,
    output := OriginalRow227TriangleData0039.coefficient2_234, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_236, Icur := OriginalRow227TriangleData0023.coefficient1_235,
    output := OriginalRow227TriangleData0039.coefficient2_235, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_237, Icur := OriginalRow227TriangleData0023.coefficient1_236,
    output := OriginalRow227TriangleData0039.coefficient2_236, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_238, Icur := OriginalRow227TriangleData0023.coefficient1_237,
    output := OriginalRow227TriangleData0039.coefficient2_237, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_239, Icur := OriginalRow227TriangleData0023.coefficient1_238,
    output := OriginalRow227TriangleData0039.coefficient2_238, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_240, Icur := OriginalRow227TriangleData0023.coefficient1_239,
    output := OriginalRow227TriangleData0039.coefficient2_239, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_241, Icur := OriginalRow227TriangleData0023.coefficient1_240,
    output := OriginalRow227TriangleData0039.coefficient2_240, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_242, Icur := OriginalRow227TriangleData0023.coefficient1_241,
    output := OriginalRow227TriangleData0039.coefficient2_241, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_243, Icur := OriginalRow227TriangleData0023.coefficient1_242,
    output := OriginalRow227TriangleData0039.coefficient2_242, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_244, Icur := OriginalRow227TriangleData0023.coefficient1_243,
    output := OriginalRow227TriangleData0039.coefficient2_243, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_245, Icur := OriginalRow227TriangleData0023.coefficient1_244,
    output := OriginalRow227TriangleData0039.coefficient2_244, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_246, Icur := OriginalRow227TriangleData0023.coefficient1_245,
    output := OriginalRow227TriangleData0039.coefficient2_245, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_247, Icur := OriginalRow227TriangleData0023.coefficient1_246,
    output := OriginalRow227TriangleData0039.coefficient2_246, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_248, Icur := OriginalRow227TriangleData0023.coefficient1_247,
    output := OriginalRow227TriangleData0039.coefficient2_247, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_249, Icur := OriginalRow227TriangleData0023.coefficient1_248,
    output := OriginalRow227TriangleData0039.coefficient2_248, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_250, Icur := OriginalRow227TriangleData0023.coefficient1_249,
    output := OriginalRow227TriangleData0039.coefficient2_249, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_251, Icur := OriginalRow227TriangleData0023.coefficient1_250,
    output := OriginalRow227TriangleData0039.coefficient2_250, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_252, Icur := OriginalRow227TriangleData0023.coefficient1_251,
    output := OriginalRow227TriangleData0039.coefficient2_251, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_253, Icur := OriginalRow227TriangleData0023.coefficient1_252,
    output := OriginalRow227TriangleData0039.coefficient2_252, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_254, Icur := OriginalRow227TriangleData0023.coefficient1_253,
    output := OriginalRow227TriangleData0039.coefficient2_253, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0023.coefficient1_255, Icur := OriginalRow227TriangleData0023.coefficient1_254,
    output := OriginalRow227TriangleData0039.coefficient2_254, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0024.coefficient1_256, Icur := OriginalRow227TriangleData0023.coefficient1_255,
    output := OriginalRow227TriangleData0039.coefficient2_255, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0024.coefficient1_257, Icur := OriginalRow227TriangleData0024.coefficient1_256,
    output := OriginalRow227TriangleData0039.coefficient2_256, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0023

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0023.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
