import Grothe.UpperChaos.OriginalRow227TriangleData0536
import Grothe.UpperChaos.OriginalRow227TriangleData0537
import Grothe.UpperChaos.OriginalRow227TriangleData0550
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0534
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_228, Icur := OriginalRow227TriangleData0536.coefficient35_227,
    output := OriginalRow227TriangleData0550.coefficient36_227, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_229, Icur := OriginalRow227TriangleData0536.coefficient35_228,
    output := OriginalRow227TriangleData0550.coefficient36_228, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_230, Icur := OriginalRow227TriangleData0536.coefficient35_229,
    output := OriginalRow227TriangleData0550.coefficient36_229, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_231, Icur := OriginalRow227TriangleData0536.coefficient35_230,
    output := OriginalRow227TriangleData0550.coefficient36_230, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_232, Icur := OriginalRow227TriangleData0536.coefficient35_231,
    output := OriginalRow227TriangleData0550.coefficient36_231, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_233, Icur := OriginalRow227TriangleData0536.coefficient35_232,
    output := OriginalRow227TriangleData0550.coefficient36_232, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_234, Icur := OriginalRow227TriangleData0536.coefficient35_233,
    output := OriginalRow227TriangleData0550.coefficient36_233, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_235, Icur := OriginalRow227TriangleData0536.coefficient35_234,
    output := OriginalRow227TriangleData0550.coefficient36_234, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_236, Icur := OriginalRow227TriangleData0536.coefficient35_235,
    output := OriginalRow227TriangleData0550.coefficient36_235, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_237, Icur := OriginalRow227TriangleData0536.coefficient35_236,
    output := OriginalRow227TriangleData0550.coefficient36_236, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_238, Icur := OriginalRow227TriangleData0536.coefficient35_237,
    output := OriginalRow227TriangleData0550.coefficient36_237, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_239, Icur := OriginalRow227TriangleData0536.coefficient35_238,
    output := OriginalRow227TriangleData0550.coefficient36_238, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_240, Icur := OriginalRow227TriangleData0536.coefficient35_239,
    output := OriginalRow227TriangleData0550.coefficient36_239, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_241, Icur := OriginalRow227TriangleData0536.coefficient35_240,
    output := OriginalRow227TriangleData0550.coefficient36_240, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_242, Icur := OriginalRow227TriangleData0536.coefficient35_241,
    output := OriginalRow227TriangleData0550.coefficient36_241, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_243, Icur := OriginalRow227TriangleData0536.coefficient35_242,
    output := OriginalRow227TriangleData0550.coefficient36_242, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_244, Icur := OriginalRow227TriangleData0536.coefficient35_243,
    output := OriginalRow227TriangleData0550.coefficient36_243, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_245, Icur := OriginalRow227TriangleData0536.coefficient35_244,
    output := OriginalRow227TriangleData0550.coefficient36_244, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_246, Icur := OriginalRow227TriangleData0536.coefficient35_245,
    output := OriginalRow227TriangleData0550.coefficient36_245, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_247, Icur := OriginalRow227TriangleData0536.coefficient35_246,
    output := OriginalRow227TriangleData0550.coefficient36_246, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_248, Icur := OriginalRow227TriangleData0536.coefficient35_247,
    output := OriginalRow227TriangleData0550.coefficient36_247, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_249, Icur := OriginalRow227TriangleData0536.coefficient35_248,
    output := OriginalRow227TriangleData0550.coefficient36_248, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_250, Icur := OriginalRow227TriangleData0536.coefficient35_249,
    output := OriginalRow227TriangleData0550.coefficient36_249, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_251, Icur := OriginalRow227TriangleData0536.coefficient35_250,
    output := OriginalRow227TriangleData0550.coefficient36_250, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_252, Icur := OriginalRow227TriangleData0536.coefficient35_251,
    output := OriginalRow227TriangleData0550.coefficient36_251, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_253, Icur := OriginalRow227TriangleData0536.coefficient35_252,
    output := OriginalRow227TriangleData0550.coefficient36_252, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_254, Icur := OriginalRow227TriangleData0536.coefficient35_253,
    output := OriginalRow227TriangleData0550.coefficient36_253, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_255, Icur := OriginalRow227TriangleData0536.coefficient35_254,
    output := OriginalRow227TriangleData0550.coefficient36_254, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_256, Icur := OriginalRow227TriangleData0536.coefficient35_255,
    output := OriginalRow227TriangleData0550.coefficient36_255, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0536.coefficient35_257, Icur := OriginalRow227TriangleData0536.coefficient35_256,
    output := OriginalRow227TriangleData0550.coefficient36_256, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_258, Icur := OriginalRow227TriangleData0536.coefficient35_257,
    output := OriginalRow227TriangleData0550.coefficient36_257, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root36,
    Inext := OriginalRow227TriangleData0537.coefficient35_259, Icur := OriginalRow227TriangleData0537.coefficient35_258,
    output := OriginalRow227TriangleData0550.coefficient36_258, hC := OriginalRow227TriangleRoots01.root36_pos, hAC := OriginalRow227TriangleRoots01.product36_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0534

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0534.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
