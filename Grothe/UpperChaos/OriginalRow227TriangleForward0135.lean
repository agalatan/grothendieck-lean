import Grothe.UpperChaos.OriginalRow227TriangleData0135
import Grothe.UpperChaos.OriginalRow227TriangleData0136
import Grothe.UpperChaos.OriginalRow227TriangleData0151
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0135
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_233, Icur := OriginalRow227TriangleData0135.coefficient8_232,
    output := OriginalRow227TriangleData0151.coefficient9_232, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_234, Icur := OriginalRow227TriangleData0135.coefficient8_233,
    output := OriginalRow227TriangleData0151.coefficient9_233, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_235, Icur := OriginalRow227TriangleData0135.coefficient8_234,
    output := OriginalRow227TriangleData0151.coefficient9_234, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_236, Icur := OriginalRow227TriangleData0135.coefficient8_235,
    output := OriginalRow227TriangleData0151.coefficient9_235, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_237, Icur := OriginalRow227TriangleData0135.coefficient8_236,
    output := OriginalRow227TriangleData0151.coefficient9_236, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_238, Icur := OriginalRow227TriangleData0135.coefficient8_237,
    output := OriginalRow227TriangleData0151.coefficient9_237, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_239, Icur := OriginalRow227TriangleData0135.coefficient8_238,
    output := OriginalRow227TriangleData0151.coefficient9_238, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_240, Icur := OriginalRow227TriangleData0135.coefficient8_239,
    output := OriginalRow227TriangleData0151.coefficient9_239, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_241, Icur := OriginalRow227TriangleData0135.coefficient8_240,
    output := OriginalRow227TriangleData0151.coefficient9_240, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_242, Icur := OriginalRow227TriangleData0135.coefficient8_241,
    output := OriginalRow227TriangleData0151.coefficient9_241, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_243, Icur := OriginalRow227TriangleData0135.coefficient8_242,
    output := OriginalRow227TriangleData0151.coefficient9_242, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_244, Icur := OriginalRow227TriangleData0135.coefficient8_243,
    output := OriginalRow227TriangleData0151.coefficient9_243, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_245, Icur := OriginalRow227TriangleData0135.coefficient8_244,
    output := OriginalRow227TriangleData0151.coefficient9_244, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_246, Icur := OriginalRow227TriangleData0135.coefficient8_245,
    output := OriginalRow227TriangleData0151.coefficient9_245, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_247, Icur := OriginalRow227TriangleData0135.coefficient8_246,
    output := OriginalRow227TriangleData0151.coefficient9_246, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_248, Icur := OriginalRow227TriangleData0135.coefficient8_247,
    output := OriginalRow227TriangleData0151.coefficient9_247, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_249, Icur := OriginalRow227TriangleData0135.coefficient8_248,
    output := OriginalRow227TriangleData0151.coefficient9_248, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_250, Icur := OriginalRow227TriangleData0135.coefficient8_249,
    output := OriginalRow227TriangleData0151.coefficient9_249, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_251, Icur := OriginalRow227TriangleData0135.coefficient8_250,
    output := OriginalRow227TriangleData0151.coefficient9_250, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_252, Icur := OriginalRow227TriangleData0135.coefficient8_251,
    output := OriginalRow227TriangleData0151.coefficient9_251, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_253, Icur := OriginalRow227TriangleData0135.coefficient8_252,
    output := OriginalRow227TriangleData0151.coefficient9_252, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_254, Icur := OriginalRow227TriangleData0135.coefficient8_253,
    output := OriginalRow227TriangleData0151.coefficient9_253, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_255, Icur := OriginalRow227TriangleData0135.coefficient8_254,
    output := OriginalRow227TriangleData0151.coefficient9_254, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_256, Icur := OriginalRow227TriangleData0135.coefficient8_255,
    output := OriginalRow227TriangleData0151.coefficient9_255, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_257, Icur := OriginalRow227TriangleData0135.coefficient8_256,
    output := OriginalRow227TriangleData0151.coefficient9_256, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_258, Icur := OriginalRow227TriangleData0135.coefficient8_257,
    output := OriginalRow227TriangleData0151.coefficient9_257, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_259, Icur := OriginalRow227TriangleData0135.coefficient8_258,
    output := OriginalRow227TriangleData0151.coefficient9_258, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_260, Icur := OriginalRow227TriangleData0135.coefficient8_259,
    output := OriginalRow227TriangleData0151.coefficient9_259, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_261, Icur := OriginalRow227TriangleData0135.coefficient8_260,
    output := OriginalRow227TriangleData0151.coefficient9_260, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0135.coefficient8_262, Icur := OriginalRow227TriangleData0135.coefficient8_261,
    output := OriginalRow227TriangleData0151.coefficient9_261, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_263, Icur := OriginalRow227TriangleData0135.coefficient8_262,
    output := OriginalRow227TriangleData0151.coefficient9_262, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0136.coefficient8_264, Icur := OriginalRow227TriangleData0136.coefficient8_263,
    output := OriginalRow227TriangleData0151.coefficient9_263, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0135

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0135.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
