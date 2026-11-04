import Grothe.UpperChaos.OriginalRow227TriangleData0592
import Grothe.UpperChaos.OriginalRow227TriangleData0593
import Grothe.UpperChaos.OriginalRow227TriangleData0606
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0590
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_232, Icur := OriginalRow227TriangleData0592.coefficient39_231,
    output := OriginalRow227TriangleData0606.coefficient40_231, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_233, Icur := OriginalRow227TriangleData0592.coefficient39_232,
    output := OriginalRow227TriangleData0606.coefficient40_232, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_234, Icur := OriginalRow227TriangleData0592.coefficient39_233,
    output := OriginalRow227TriangleData0606.coefficient40_233, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_235, Icur := OriginalRow227TriangleData0592.coefficient39_234,
    output := OriginalRow227TriangleData0606.coefficient40_234, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_236, Icur := OriginalRow227TriangleData0592.coefficient39_235,
    output := OriginalRow227TriangleData0606.coefficient40_235, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_237, Icur := OriginalRow227TriangleData0592.coefficient39_236,
    output := OriginalRow227TriangleData0606.coefficient40_236, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_238, Icur := OriginalRow227TriangleData0592.coefficient39_237,
    output := OriginalRow227TriangleData0606.coefficient40_237, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_239, Icur := OriginalRow227TriangleData0592.coefficient39_238,
    output := OriginalRow227TriangleData0606.coefficient40_238, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_240, Icur := OriginalRow227TriangleData0592.coefficient39_239,
    output := OriginalRow227TriangleData0606.coefficient40_239, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_241, Icur := OriginalRow227TriangleData0592.coefficient39_240,
    output := OriginalRow227TriangleData0606.coefficient40_240, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_242, Icur := OriginalRow227TriangleData0592.coefficient39_241,
    output := OriginalRow227TriangleData0606.coefficient40_241, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_243, Icur := OriginalRow227TriangleData0592.coefficient39_242,
    output := OriginalRow227TriangleData0606.coefficient40_242, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_244, Icur := OriginalRow227TriangleData0592.coefficient39_243,
    output := OriginalRow227TriangleData0606.coefficient40_243, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_245, Icur := OriginalRow227TriangleData0592.coefficient39_244,
    output := OriginalRow227TriangleData0606.coefficient40_244, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_246, Icur := OriginalRow227TriangleData0592.coefficient39_245,
    output := OriginalRow227TriangleData0606.coefficient40_245, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_247, Icur := OriginalRow227TriangleData0592.coefficient39_246,
    output := OriginalRow227TriangleData0606.coefficient40_246, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_248, Icur := OriginalRow227TriangleData0592.coefficient39_247,
    output := OriginalRow227TriangleData0606.coefficient40_247, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_249, Icur := OriginalRow227TriangleData0592.coefficient39_248,
    output := OriginalRow227TriangleData0606.coefficient40_248, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_250, Icur := OriginalRow227TriangleData0592.coefficient39_249,
    output := OriginalRow227TriangleData0606.coefficient40_249, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_251, Icur := OriginalRow227TriangleData0592.coefficient39_250,
    output := OriginalRow227TriangleData0606.coefficient40_250, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_252, Icur := OriginalRow227TriangleData0592.coefficient39_251,
    output := OriginalRow227TriangleData0606.coefficient40_251, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_253, Icur := OriginalRow227TriangleData0592.coefficient39_252,
    output := OriginalRow227TriangleData0606.coefficient40_252, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_254, Icur := OriginalRow227TriangleData0592.coefficient39_253,
    output := OriginalRow227TriangleData0606.coefficient40_253, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_255, Icur := OriginalRow227TriangleData0592.coefficient39_254,
    output := OriginalRow227TriangleData0606.coefficient40_254, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_256, Icur := OriginalRow227TriangleData0592.coefficient39_255,
    output := OriginalRow227TriangleData0606.coefficient40_255, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_257, Icur := OriginalRow227TriangleData0592.coefficient39_256,
    output := OriginalRow227TriangleData0606.coefficient40_256, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_258, Icur := OriginalRow227TriangleData0592.coefficient39_257,
    output := OriginalRow227TriangleData0606.coefficient40_257, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_259, Icur := OriginalRow227TriangleData0592.coefficient39_258,
    output := OriginalRow227TriangleData0606.coefficient40_258, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_260, Icur := OriginalRow227TriangleData0592.coefficient39_259,
    output := OriginalRow227TriangleData0606.coefficient40_259, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0592.coefficient39_261, Icur := OriginalRow227TriangleData0592.coefficient39_260,
    output := OriginalRow227TriangleData0606.coefficient40_260, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0593.coefficient39_262, Icur := OriginalRow227TriangleData0592.coefficient39_261,
    output := OriginalRow227TriangleData0606.coefficient40_261, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0593.coefficient39_263, Icur := OriginalRow227TriangleData0593.coefficient39_262,
    output := OriginalRow227TriangleData0606.coefficient40_262, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0590

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0590.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
