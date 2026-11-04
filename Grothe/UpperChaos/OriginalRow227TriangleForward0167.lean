import Grothe.UpperChaos.OriginalRow227TriangleData0167
import Grothe.UpperChaos.OriginalRow227TriangleData0168
import Grothe.UpperChaos.OriginalRow227TriangleData0183
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0167
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_235, Icur := OriginalRow227TriangleData0167.coefficient10_234,
    output := OriginalRow227TriangleData0183.coefficient11_234, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_236, Icur := OriginalRow227TriangleData0167.coefficient10_235,
    output := OriginalRow227TriangleData0183.coefficient11_235, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_237, Icur := OriginalRow227TriangleData0167.coefficient10_236,
    output := OriginalRow227TriangleData0183.coefficient11_236, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_238, Icur := OriginalRow227TriangleData0167.coefficient10_237,
    output := OriginalRow227TriangleData0183.coefficient11_237, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_239, Icur := OriginalRow227TriangleData0167.coefficient10_238,
    output := OriginalRow227TriangleData0183.coefficient11_238, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_240, Icur := OriginalRow227TriangleData0167.coefficient10_239,
    output := OriginalRow227TriangleData0183.coefficient11_239, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_241, Icur := OriginalRow227TriangleData0167.coefficient10_240,
    output := OriginalRow227TriangleData0183.coefficient11_240, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_242, Icur := OriginalRow227TriangleData0167.coefficient10_241,
    output := OriginalRow227TriangleData0183.coefficient11_241, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_243, Icur := OriginalRow227TriangleData0167.coefficient10_242,
    output := OriginalRow227TriangleData0183.coefficient11_242, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_244, Icur := OriginalRow227TriangleData0167.coefficient10_243,
    output := OriginalRow227TriangleData0183.coefficient11_243, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_245, Icur := OriginalRow227TriangleData0167.coefficient10_244,
    output := OriginalRow227TriangleData0183.coefficient11_244, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_246, Icur := OriginalRow227TriangleData0167.coefficient10_245,
    output := OriginalRow227TriangleData0183.coefficient11_245, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_247, Icur := OriginalRow227TriangleData0167.coefficient10_246,
    output := OriginalRow227TriangleData0183.coefficient11_246, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_248, Icur := OriginalRow227TriangleData0167.coefficient10_247,
    output := OriginalRow227TriangleData0183.coefficient11_247, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_249, Icur := OriginalRow227TriangleData0167.coefficient10_248,
    output := OriginalRow227TriangleData0183.coefficient11_248, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_250, Icur := OriginalRow227TriangleData0167.coefficient10_249,
    output := OriginalRow227TriangleData0183.coefficient11_249, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_251, Icur := OriginalRow227TriangleData0167.coefficient10_250,
    output := OriginalRow227TriangleData0183.coefficient11_250, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_252, Icur := OriginalRow227TriangleData0167.coefficient10_251,
    output := OriginalRow227TriangleData0183.coefficient11_251, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_253, Icur := OriginalRow227TriangleData0167.coefficient10_252,
    output := OriginalRow227TriangleData0183.coefficient11_252, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_254, Icur := OriginalRow227TriangleData0167.coefficient10_253,
    output := OriginalRow227TriangleData0183.coefficient11_253, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_255, Icur := OriginalRow227TriangleData0167.coefficient10_254,
    output := OriginalRow227TriangleData0183.coefficient11_254, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_256, Icur := OriginalRow227TriangleData0167.coefficient10_255,
    output := OriginalRow227TriangleData0183.coefficient11_255, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_257, Icur := OriginalRow227TriangleData0167.coefficient10_256,
    output := OriginalRow227TriangleData0183.coefficient11_256, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_258, Icur := OriginalRow227TriangleData0167.coefficient10_257,
    output := OriginalRow227TriangleData0183.coefficient11_257, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_259, Icur := OriginalRow227TriangleData0167.coefficient10_258,
    output := OriginalRow227TriangleData0183.coefficient11_258, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_260, Icur := OriginalRow227TriangleData0167.coefficient10_259,
    output := OriginalRow227TriangleData0183.coefficient11_259, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_261, Icur := OriginalRow227TriangleData0167.coefficient10_260,
    output := OriginalRow227TriangleData0183.coefficient11_260, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_262, Icur := OriginalRow227TriangleData0167.coefficient10_261,
    output := OriginalRow227TriangleData0183.coefficient11_261, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_263, Icur := OriginalRow227TriangleData0167.coefficient10_262,
    output := OriginalRow227TriangleData0183.coefficient11_262, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0167.coefficient10_264, Icur := OriginalRow227TriangleData0167.coefficient10_263,
    output := OriginalRow227TriangleData0183.coefficient11_263, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_265, Icur := OriginalRow227TriangleData0167.coefficient10_264,
    output := OriginalRow227TriangleData0183.coefficient11_264, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0168.coefficient10_266, Icur := OriginalRow227TriangleData0168.coefficient10_265,
    output := OriginalRow227TriangleData0183.coefficient11_265, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0167

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0167.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
