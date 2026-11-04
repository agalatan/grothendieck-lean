import Grothe.UpperChaos.OriginalRow227TriangleData1651
import Grothe.UpperChaos.OriginalRow227TriangleData1652
import Grothe.UpperChaos.OriginalRow227TriangleData1659
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1643
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_235, Icur := OriginalRow227TriangleData1651.coefficient138_234,
    output := OriginalRow227TriangleData1659.coefficient139_234, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_236, Icur := OriginalRow227TriangleData1651.coefficient138_235,
    output := OriginalRow227TriangleData1659.coefficient139_235, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_237, Icur := OriginalRow227TriangleData1651.coefficient138_236,
    output := OriginalRow227TriangleData1659.coefficient139_236, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_238, Icur := OriginalRow227TriangleData1651.coefficient138_237,
    output := OriginalRow227TriangleData1659.coefficient139_237, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_239, Icur := OriginalRow227TriangleData1651.coefficient138_238,
    output := OriginalRow227TriangleData1659.coefficient139_238, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_240, Icur := OriginalRow227TriangleData1651.coefficient138_239,
    output := OriginalRow227TriangleData1659.coefficient139_239, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_241, Icur := OriginalRow227TriangleData1651.coefficient138_240,
    output := OriginalRow227TriangleData1659.coefficient139_240, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_242, Icur := OriginalRow227TriangleData1651.coefficient138_241,
    output := OriginalRow227TriangleData1659.coefficient139_241, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_243, Icur := OriginalRow227TriangleData1651.coefficient138_242,
    output := OriginalRow227TriangleData1659.coefficient139_242, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_244, Icur := OriginalRow227TriangleData1651.coefficient138_243,
    output := OriginalRow227TriangleData1659.coefficient139_243, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_245, Icur := OriginalRow227TriangleData1651.coefficient138_244,
    output := OriginalRow227TriangleData1659.coefficient139_244, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_246, Icur := OriginalRow227TriangleData1651.coefficient138_245,
    output := OriginalRow227TriangleData1659.coefficient139_245, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_247, Icur := OriginalRow227TriangleData1651.coefficient138_246,
    output := OriginalRow227TriangleData1659.coefficient139_246, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_248, Icur := OriginalRow227TriangleData1651.coefficient138_247,
    output := OriginalRow227TriangleData1659.coefficient139_247, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_249, Icur := OriginalRow227TriangleData1651.coefficient138_248,
    output := OriginalRow227TriangleData1659.coefficient139_248, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_250, Icur := OriginalRow227TriangleData1651.coefficient138_249,
    output := OriginalRow227TriangleData1659.coefficient139_249, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_251, Icur := OriginalRow227TriangleData1651.coefficient138_250,
    output := OriginalRow227TriangleData1659.coefficient139_250, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_252, Icur := OriginalRow227TriangleData1651.coefficient138_251,
    output := OriginalRow227TriangleData1659.coefficient139_251, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_253, Icur := OriginalRow227TriangleData1651.coefficient138_252,
    output := OriginalRow227TriangleData1659.coefficient139_252, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_254, Icur := OriginalRow227TriangleData1651.coefficient138_253,
    output := OriginalRow227TriangleData1659.coefficient139_253, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_255, Icur := OriginalRow227TriangleData1651.coefficient138_254,
    output := OriginalRow227TriangleData1659.coefficient139_254, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_256, Icur := OriginalRow227TriangleData1651.coefficient138_255,
    output := OriginalRow227TriangleData1659.coefficient139_255, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_257, Icur := OriginalRow227TriangleData1651.coefficient138_256,
    output := OriginalRow227TriangleData1659.coefficient139_256, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_258, Icur := OriginalRow227TriangleData1651.coefficient138_257,
    output := OriginalRow227TriangleData1659.coefficient139_257, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_259, Icur := OriginalRow227TriangleData1651.coefficient138_258,
    output := OriginalRow227TriangleData1659.coefficient139_258, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_260, Icur := OriginalRow227TriangleData1651.coefficient138_259,
    output := OriginalRow227TriangleData1659.coefficient139_259, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_261, Icur := OriginalRow227TriangleData1651.coefficient138_260,
    output := OriginalRow227TriangleData1659.coefficient139_260, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_262, Icur := OriginalRow227TriangleData1651.coefficient138_261,
    output := OriginalRow227TriangleData1659.coefficient139_261, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_263, Icur := OriginalRow227TriangleData1651.coefficient138_262,
    output := OriginalRow227TriangleData1659.coefficient139_262, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_264, Icur := OriginalRow227TriangleData1651.coefficient138_263,
    output := OriginalRow227TriangleData1659.coefficient139_263, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1652.coefficient138_265, Icur := OriginalRow227TriangleData1651.coefficient138_264,
    output := OriginalRow227TriangleData1659.coefficient139_264, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1652.coefficient138_266, Icur := OriginalRow227TriangleData1652.coefficient138_265,
    output := OriginalRow227TriangleData1659.coefficient139_265, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1643

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1643.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
