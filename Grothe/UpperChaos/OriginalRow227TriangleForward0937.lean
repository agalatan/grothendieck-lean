import Grothe.UpperChaos.OriginalRow227TriangleData0941
import Grothe.UpperChaos.OriginalRow227TriangleData0942
import Grothe.UpperChaos.OriginalRow227TriangleData0953
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0937
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_227, Icur := OriginalRow227TriangleData0941.coefficient66_226,
    output := OriginalRow227TriangleData0953.coefficient67_226, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_228, Icur := OriginalRow227TriangleData0941.coefficient66_227,
    output := OriginalRow227TriangleData0953.coefficient67_227, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_229, Icur := OriginalRow227TriangleData0941.coefficient66_228,
    output := OriginalRow227TriangleData0953.coefficient67_228, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_230, Icur := OriginalRow227TriangleData0941.coefficient66_229,
    output := OriginalRow227TriangleData0953.coefficient67_229, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_231, Icur := OriginalRow227TriangleData0941.coefficient66_230,
    output := OriginalRow227TriangleData0953.coefficient67_230, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_232, Icur := OriginalRow227TriangleData0941.coefficient66_231,
    output := OriginalRow227TriangleData0953.coefficient67_231, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_233, Icur := OriginalRow227TriangleData0941.coefficient66_232,
    output := OriginalRow227TriangleData0953.coefficient67_232, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_234, Icur := OriginalRow227TriangleData0941.coefficient66_233,
    output := OriginalRow227TriangleData0953.coefficient67_233, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_235, Icur := OriginalRow227TriangleData0941.coefficient66_234,
    output := OriginalRow227TriangleData0953.coefficient67_234, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_236, Icur := OriginalRow227TriangleData0941.coefficient66_235,
    output := OriginalRow227TriangleData0953.coefficient67_235, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_237, Icur := OriginalRow227TriangleData0941.coefficient66_236,
    output := OriginalRow227TriangleData0953.coefficient67_236, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_238, Icur := OriginalRow227TriangleData0941.coefficient66_237,
    output := OriginalRow227TriangleData0953.coefficient67_237, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_239, Icur := OriginalRow227TriangleData0941.coefficient66_238,
    output := OriginalRow227TriangleData0953.coefficient67_238, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_240, Icur := OriginalRow227TriangleData0941.coefficient66_239,
    output := OriginalRow227TriangleData0953.coefficient67_239, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_241, Icur := OriginalRow227TriangleData0941.coefficient66_240,
    output := OriginalRow227TriangleData0953.coefficient67_240, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_242, Icur := OriginalRow227TriangleData0941.coefficient66_241,
    output := OriginalRow227TriangleData0953.coefficient67_241, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_243, Icur := OriginalRow227TriangleData0941.coefficient66_242,
    output := OriginalRow227TriangleData0953.coefficient67_242, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_244, Icur := OriginalRow227TriangleData0941.coefficient66_243,
    output := OriginalRow227TriangleData0953.coefficient67_243, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_245, Icur := OriginalRow227TriangleData0941.coefficient66_244,
    output := OriginalRow227TriangleData0953.coefficient67_244, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_246, Icur := OriginalRow227TriangleData0941.coefficient66_245,
    output := OriginalRow227TriangleData0953.coefficient67_245, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_247, Icur := OriginalRow227TriangleData0941.coefficient66_246,
    output := OriginalRow227TriangleData0953.coefficient67_246, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_248, Icur := OriginalRow227TriangleData0941.coefficient66_247,
    output := OriginalRow227TriangleData0953.coefficient67_247, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_249, Icur := OriginalRow227TriangleData0941.coefficient66_248,
    output := OriginalRow227TriangleData0953.coefficient67_248, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_250, Icur := OriginalRow227TriangleData0941.coefficient66_249,
    output := OriginalRow227TriangleData0953.coefficient67_249, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_251, Icur := OriginalRow227TriangleData0941.coefficient66_250,
    output := OriginalRow227TriangleData0953.coefficient67_250, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_252, Icur := OriginalRow227TriangleData0941.coefficient66_251,
    output := OriginalRow227TriangleData0953.coefficient67_251, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_253, Icur := OriginalRow227TriangleData0941.coefficient66_252,
    output := OriginalRow227TriangleData0953.coefficient67_252, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_254, Icur := OriginalRow227TriangleData0941.coefficient66_253,
    output := OriginalRow227TriangleData0953.coefficient67_253, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_255, Icur := OriginalRow227TriangleData0941.coefficient66_254,
    output := OriginalRow227TriangleData0953.coefficient67_254, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0941.coefficient66_256, Icur := OriginalRow227TriangleData0941.coefficient66_255,
    output := OriginalRow227TriangleData0953.coefficient67_255, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0942.coefficient66_257, Icur := OriginalRow227TriangleData0941.coefficient66_256,
    output := OriginalRow227TriangleData0953.coefficient67_256, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0942.coefficient66_258, Icur := OriginalRow227TriangleData0942.coefficient66_257,
    output := OriginalRow227TriangleData0953.coefficient67_257, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0937

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0937.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
