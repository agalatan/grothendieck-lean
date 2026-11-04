import Grothe.UpperChaos.OriginalRow227TriangleData1619
import Grothe.UpperChaos.OriginalRow227TriangleData1620
import Grothe.UpperChaos.OriginalRow227TriangleData1627
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1611
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_231, Icur := OriginalRow227TriangleData1619.coefficient134_230,
    output := OriginalRow227TriangleData1627.coefficient135_230, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_232, Icur := OriginalRow227TriangleData1619.coefficient134_231,
    output := OriginalRow227TriangleData1627.coefficient135_231, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_233, Icur := OriginalRow227TriangleData1619.coefficient134_232,
    output := OriginalRow227TriangleData1627.coefficient135_232, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_234, Icur := OriginalRow227TriangleData1619.coefficient134_233,
    output := OriginalRow227TriangleData1627.coefficient135_233, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_235, Icur := OriginalRow227TriangleData1619.coefficient134_234,
    output := OriginalRow227TriangleData1627.coefficient135_234, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_236, Icur := OriginalRow227TriangleData1619.coefficient134_235,
    output := OriginalRow227TriangleData1627.coefficient135_235, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_237, Icur := OriginalRow227TriangleData1619.coefficient134_236,
    output := OriginalRow227TriangleData1627.coefficient135_236, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_238, Icur := OriginalRow227TriangleData1619.coefficient134_237,
    output := OriginalRow227TriangleData1627.coefficient135_237, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_239, Icur := OriginalRow227TriangleData1619.coefficient134_238,
    output := OriginalRow227TriangleData1627.coefficient135_238, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_240, Icur := OriginalRow227TriangleData1619.coefficient134_239,
    output := OriginalRow227TriangleData1627.coefficient135_239, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_241, Icur := OriginalRow227TriangleData1619.coefficient134_240,
    output := OriginalRow227TriangleData1627.coefficient135_240, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_242, Icur := OriginalRow227TriangleData1619.coefficient134_241,
    output := OriginalRow227TriangleData1627.coefficient135_241, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_243, Icur := OriginalRow227TriangleData1619.coefficient134_242,
    output := OriginalRow227TriangleData1627.coefficient135_242, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_244, Icur := OriginalRow227TriangleData1619.coefficient134_243,
    output := OriginalRow227TriangleData1627.coefficient135_243, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_245, Icur := OriginalRow227TriangleData1619.coefficient134_244,
    output := OriginalRow227TriangleData1627.coefficient135_244, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_246, Icur := OriginalRow227TriangleData1619.coefficient134_245,
    output := OriginalRow227TriangleData1627.coefficient135_245, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_247, Icur := OriginalRow227TriangleData1619.coefficient134_246,
    output := OriginalRow227TriangleData1627.coefficient135_246, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_248, Icur := OriginalRow227TriangleData1619.coefficient134_247,
    output := OriginalRow227TriangleData1627.coefficient135_247, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_249, Icur := OriginalRow227TriangleData1619.coefficient134_248,
    output := OriginalRow227TriangleData1627.coefficient135_248, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_250, Icur := OriginalRow227TriangleData1619.coefficient134_249,
    output := OriginalRow227TriangleData1627.coefficient135_249, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_251, Icur := OriginalRow227TriangleData1619.coefficient134_250,
    output := OriginalRow227TriangleData1627.coefficient135_250, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_252, Icur := OriginalRow227TriangleData1619.coefficient134_251,
    output := OriginalRow227TriangleData1627.coefficient135_251, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_253, Icur := OriginalRow227TriangleData1619.coefficient134_252,
    output := OriginalRow227TriangleData1627.coefficient135_252, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_254, Icur := OriginalRow227TriangleData1619.coefficient134_253,
    output := OriginalRow227TriangleData1627.coefficient135_253, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_255, Icur := OriginalRow227TriangleData1619.coefficient134_254,
    output := OriginalRow227TriangleData1627.coefficient135_254, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_256, Icur := OriginalRow227TriangleData1619.coefficient134_255,
    output := OriginalRow227TriangleData1627.coefficient135_255, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_257, Icur := OriginalRow227TriangleData1619.coefficient134_256,
    output := OriginalRow227TriangleData1627.coefficient135_256, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_258, Icur := OriginalRow227TriangleData1619.coefficient134_257,
    output := OriginalRow227TriangleData1627.coefficient135_257, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_259, Icur := OriginalRow227TriangleData1619.coefficient134_258,
    output := OriginalRow227TriangleData1627.coefficient135_258, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1619.coefficient134_260, Icur := OriginalRow227TriangleData1619.coefficient134_259,
    output := OriginalRow227TriangleData1627.coefficient135_259, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1620.coefficient134_261, Icur := OriginalRow227TriangleData1619.coefficient134_260,
    output := OriginalRow227TriangleData1627.coefficient135_260, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1620.coefficient134_262, Icur := OriginalRow227TriangleData1620.coefficient134_261,
    output := OriginalRow227TriangleData1627.coefficient135_261, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1611

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1611.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
