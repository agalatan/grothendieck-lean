import Grothe.UpperChaos.OriginalRow227TriangleData0929
import Grothe.UpperChaos.OriginalRow227TriangleData0930
import Grothe.UpperChaos.OriginalRow227TriangleData0941
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0925
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_226, Icur := OriginalRow227TriangleData0929.coefficient65_225,
    output := OriginalRow227TriangleData0941.coefficient66_225, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_227, Icur := OriginalRow227TriangleData0929.coefficient65_226,
    output := OriginalRow227TriangleData0941.coefficient66_226, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_228, Icur := OriginalRow227TriangleData0929.coefficient65_227,
    output := OriginalRow227TriangleData0941.coefficient66_227, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_229, Icur := OriginalRow227TriangleData0929.coefficient65_228,
    output := OriginalRow227TriangleData0941.coefficient66_228, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_230, Icur := OriginalRow227TriangleData0929.coefficient65_229,
    output := OriginalRow227TriangleData0941.coefficient66_229, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_231, Icur := OriginalRow227TriangleData0929.coefficient65_230,
    output := OriginalRow227TriangleData0941.coefficient66_230, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_232, Icur := OriginalRow227TriangleData0929.coefficient65_231,
    output := OriginalRow227TriangleData0941.coefficient66_231, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_233, Icur := OriginalRow227TriangleData0929.coefficient65_232,
    output := OriginalRow227TriangleData0941.coefficient66_232, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_234, Icur := OriginalRow227TriangleData0929.coefficient65_233,
    output := OriginalRow227TriangleData0941.coefficient66_233, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_235, Icur := OriginalRow227TriangleData0929.coefficient65_234,
    output := OriginalRow227TriangleData0941.coefficient66_234, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_236, Icur := OriginalRow227TriangleData0929.coefficient65_235,
    output := OriginalRow227TriangleData0941.coefficient66_235, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_237, Icur := OriginalRow227TriangleData0929.coefficient65_236,
    output := OriginalRow227TriangleData0941.coefficient66_236, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_238, Icur := OriginalRow227TriangleData0929.coefficient65_237,
    output := OriginalRow227TriangleData0941.coefficient66_237, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_239, Icur := OriginalRow227TriangleData0929.coefficient65_238,
    output := OriginalRow227TriangleData0941.coefficient66_238, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_240, Icur := OriginalRow227TriangleData0929.coefficient65_239,
    output := OriginalRow227TriangleData0941.coefficient66_239, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_241, Icur := OriginalRow227TriangleData0929.coefficient65_240,
    output := OriginalRow227TriangleData0941.coefficient66_240, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_242, Icur := OriginalRow227TriangleData0929.coefficient65_241,
    output := OriginalRow227TriangleData0941.coefficient66_241, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_243, Icur := OriginalRow227TriangleData0929.coefficient65_242,
    output := OriginalRow227TriangleData0941.coefficient66_242, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_244, Icur := OriginalRow227TriangleData0929.coefficient65_243,
    output := OriginalRow227TriangleData0941.coefficient66_243, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_245, Icur := OriginalRow227TriangleData0929.coefficient65_244,
    output := OriginalRow227TriangleData0941.coefficient66_244, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_246, Icur := OriginalRow227TriangleData0929.coefficient65_245,
    output := OriginalRow227TriangleData0941.coefficient66_245, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_247, Icur := OriginalRow227TriangleData0929.coefficient65_246,
    output := OriginalRow227TriangleData0941.coefficient66_246, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_248, Icur := OriginalRow227TriangleData0929.coefficient65_247,
    output := OriginalRow227TriangleData0941.coefficient66_247, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_249, Icur := OriginalRow227TriangleData0929.coefficient65_248,
    output := OriginalRow227TriangleData0941.coefficient66_248, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_250, Icur := OriginalRow227TriangleData0929.coefficient65_249,
    output := OriginalRow227TriangleData0941.coefficient66_249, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_251, Icur := OriginalRow227TriangleData0929.coefficient65_250,
    output := OriginalRow227TriangleData0941.coefficient66_250, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_252, Icur := OriginalRow227TriangleData0929.coefficient65_251,
    output := OriginalRow227TriangleData0941.coefficient66_251, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_253, Icur := OriginalRow227TriangleData0929.coefficient65_252,
    output := OriginalRow227TriangleData0941.coefficient66_252, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_254, Icur := OriginalRow227TriangleData0929.coefficient65_253,
    output := OriginalRow227TriangleData0941.coefficient66_253, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0929.coefficient65_255, Icur := OriginalRow227TriangleData0929.coefficient65_254,
    output := OriginalRow227TriangleData0941.coefficient66_254, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_256, Icur := OriginalRow227TriangleData0929.coefficient65_255,
    output := OriginalRow227TriangleData0941.coefficient66_255, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0930.coefficient65_257, Icur := OriginalRow227TriangleData0930.coefficient65_256,
    output := OriginalRow227TriangleData0941.coefficient66_256, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0925

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0925.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
