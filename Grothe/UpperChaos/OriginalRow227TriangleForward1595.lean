import Grothe.UpperChaos.OriginalRow227TriangleData1603
import Grothe.UpperChaos.OriginalRow227TriangleData1604
import Grothe.UpperChaos.OriginalRow227TriangleData1611
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1595
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_229, Icur := OriginalRow227TriangleData1603.coefficient132_228,
    output := OriginalRow227TriangleData1611.coefficient133_228, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_230, Icur := OriginalRow227TriangleData1603.coefficient132_229,
    output := OriginalRow227TriangleData1611.coefficient133_229, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_231, Icur := OriginalRow227TriangleData1603.coefficient132_230,
    output := OriginalRow227TriangleData1611.coefficient133_230, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_232, Icur := OriginalRow227TriangleData1603.coefficient132_231,
    output := OriginalRow227TriangleData1611.coefficient133_231, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_233, Icur := OriginalRow227TriangleData1603.coefficient132_232,
    output := OriginalRow227TriangleData1611.coefficient133_232, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_234, Icur := OriginalRow227TriangleData1603.coefficient132_233,
    output := OriginalRow227TriangleData1611.coefficient133_233, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_235, Icur := OriginalRow227TriangleData1603.coefficient132_234,
    output := OriginalRow227TriangleData1611.coefficient133_234, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_236, Icur := OriginalRow227TriangleData1603.coefficient132_235,
    output := OriginalRow227TriangleData1611.coefficient133_235, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_237, Icur := OriginalRow227TriangleData1603.coefficient132_236,
    output := OriginalRow227TriangleData1611.coefficient133_236, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_238, Icur := OriginalRow227TriangleData1603.coefficient132_237,
    output := OriginalRow227TriangleData1611.coefficient133_237, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_239, Icur := OriginalRow227TriangleData1603.coefficient132_238,
    output := OriginalRow227TriangleData1611.coefficient133_238, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_240, Icur := OriginalRow227TriangleData1603.coefficient132_239,
    output := OriginalRow227TriangleData1611.coefficient133_239, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_241, Icur := OriginalRow227TriangleData1603.coefficient132_240,
    output := OriginalRow227TriangleData1611.coefficient133_240, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_242, Icur := OriginalRow227TriangleData1603.coefficient132_241,
    output := OriginalRow227TriangleData1611.coefficient133_241, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_243, Icur := OriginalRow227TriangleData1603.coefficient132_242,
    output := OriginalRow227TriangleData1611.coefficient133_242, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_244, Icur := OriginalRow227TriangleData1603.coefficient132_243,
    output := OriginalRow227TriangleData1611.coefficient133_243, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_245, Icur := OriginalRow227TriangleData1603.coefficient132_244,
    output := OriginalRow227TriangleData1611.coefficient133_244, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_246, Icur := OriginalRow227TriangleData1603.coefficient132_245,
    output := OriginalRow227TriangleData1611.coefficient133_245, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_247, Icur := OriginalRow227TriangleData1603.coefficient132_246,
    output := OriginalRow227TriangleData1611.coefficient133_246, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_248, Icur := OriginalRow227TriangleData1603.coefficient132_247,
    output := OriginalRow227TriangleData1611.coefficient133_247, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_249, Icur := OriginalRow227TriangleData1603.coefficient132_248,
    output := OriginalRow227TriangleData1611.coefficient133_248, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_250, Icur := OriginalRow227TriangleData1603.coefficient132_249,
    output := OriginalRow227TriangleData1611.coefficient133_249, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_251, Icur := OriginalRow227TriangleData1603.coefficient132_250,
    output := OriginalRow227TriangleData1611.coefficient133_250, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_252, Icur := OriginalRow227TriangleData1603.coefficient132_251,
    output := OriginalRow227TriangleData1611.coefficient133_251, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_253, Icur := OriginalRow227TriangleData1603.coefficient132_252,
    output := OriginalRow227TriangleData1611.coefficient133_252, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_254, Icur := OriginalRow227TriangleData1603.coefficient132_253,
    output := OriginalRow227TriangleData1611.coefficient133_253, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_255, Icur := OriginalRow227TriangleData1603.coefficient132_254,
    output := OriginalRow227TriangleData1611.coefficient133_254, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_256, Icur := OriginalRow227TriangleData1603.coefficient132_255,
    output := OriginalRow227TriangleData1611.coefficient133_255, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_257, Icur := OriginalRow227TriangleData1603.coefficient132_256,
    output := OriginalRow227TriangleData1611.coefficient133_256, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1603.coefficient132_258, Icur := OriginalRow227TriangleData1603.coefficient132_257,
    output := OriginalRow227TriangleData1611.coefficient133_257, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_259, Icur := OriginalRow227TriangleData1603.coefficient132_258,
    output := OriginalRow227TriangleData1611.coefficient133_258, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_260, Icur := OriginalRow227TriangleData1604.coefficient132_259,
    output := OriginalRow227TriangleData1611.coefficient133_259, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1595

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1595.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
