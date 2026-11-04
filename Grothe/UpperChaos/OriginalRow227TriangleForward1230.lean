import Grothe.UpperChaos.OriginalRow227TriangleData1236
import Grothe.UpperChaos.OriginalRow227TriangleData1237
import Grothe.UpperChaos.OriginalRow227TriangleData1246
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1230
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_221, Icur := OriginalRow227TriangleData1236.coefficient92_220,
    output := OriginalRow227TriangleData1246.coefficient93_220, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_222, Icur := OriginalRow227TriangleData1236.coefficient92_221,
    output := OriginalRow227TriangleData1246.coefficient93_221, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_223, Icur := OriginalRow227TriangleData1236.coefficient92_222,
    output := OriginalRow227TriangleData1246.coefficient93_222, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_224, Icur := OriginalRow227TriangleData1236.coefficient92_223,
    output := OriginalRow227TriangleData1246.coefficient93_223, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_225, Icur := OriginalRow227TriangleData1236.coefficient92_224,
    output := OriginalRow227TriangleData1246.coefficient93_224, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_226, Icur := OriginalRow227TriangleData1236.coefficient92_225,
    output := OriginalRow227TriangleData1246.coefficient93_225, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_227, Icur := OriginalRow227TriangleData1236.coefficient92_226,
    output := OriginalRow227TriangleData1246.coefficient93_226, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_228, Icur := OriginalRow227TriangleData1236.coefficient92_227,
    output := OriginalRow227TriangleData1246.coefficient93_227, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_229, Icur := OriginalRow227TriangleData1236.coefficient92_228,
    output := OriginalRow227TriangleData1246.coefficient93_228, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_230, Icur := OriginalRow227TriangleData1236.coefficient92_229,
    output := OriginalRow227TriangleData1246.coefficient93_229, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_231, Icur := OriginalRow227TriangleData1236.coefficient92_230,
    output := OriginalRow227TriangleData1246.coefficient93_230, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_232, Icur := OriginalRow227TriangleData1236.coefficient92_231,
    output := OriginalRow227TriangleData1246.coefficient93_231, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_233, Icur := OriginalRow227TriangleData1236.coefficient92_232,
    output := OriginalRow227TriangleData1246.coefficient93_232, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_234, Icur := OriginalRow227TriangleData1236.coefficient92_233,
    output := OriginalRow227TriangleData1246.coefficient93_233, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_235, Icur := OriginalRow227TriangleData1236.coefficient92_234,
    output := OriginalRow227TriangleData1246.coefficient93_234, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_236, Icur := OriginalRow227TriangleData1236.coefficient92_235,
    output := OriginalRow227TriangleData1246.coefficient93_235, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_237, Icur := OriginalRow227TriangleData1236.coefficient92_236,
    output := OriginalRow227TriangleData1246.coefficient93_236, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_238, Icur := OriginalRow227TriangleData1236.coefficient92_237,
    output := OriginalRow227TriangleData1246.coefficient93_237, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_239, Icur := OriginalRow227TriangleData1236.coefficient92_238,
    output := OriginalRow227TriangleData1246.coefficient93_238, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_240, Icur := OriginalRow227TriangleData1236.coefficient92_239,
    output := OriginalRow227TriangleData1246.coefficient93_239, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_241, Icur := OriginalRow227TriangleData1236.coefficient92_240,
    output := OriginalRow227TriangleData1246.coefficient93_240, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_242, Icur := OriginalRow227TriangleData1236.coefficient92_241,
    output := OriginalRow227TriangleData1246.coefficient93_241, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_243, Icur := OriginalRow227TriangleData1236.coefficient92_242,
    output := OriginalRow227TriangleData1246.coefficient93_242, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_244, Icur := OriginalRow227TriangleData1236.coefficient92_243,
    output := OriginalRow227TriangleData1246.coefficient93_243, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_245, Icur := OriginalRow227TriangleData1236.coefficient92_244,
    output := OriginalRow227TriangleData1246.coefficient93_244, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_246, Icur := OriginalRow227TriangleData1236.coefficient92_245,
    output := OriginalRow227TriangleData1246.coefficient93_245, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_247, Icur := OriginalRow227TriangleData1236.coefficient92_246,
    output := OriginalRow227TriangleData1246.coefficient93_246, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_248, Icur := OriginalRow227TriangleData1236.coefficient92_247,
    output := OriginalRow227TriangleData1246.coefficient93_247, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_249, Icur := OriginalRow227TriangleData1236.coefficient92_248,
    output := OriginalRow227TriangleData1246.coefficient93_248, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1236.coefficient92_250, Icur := OriginalRow227TriangleData1236.coefficient92_249,
    output := OriginalRow227TriangleData1246.coefficient93_249, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1237.coefficient92_251, Icur := OriginalRow227TriangleData1236.coefficient92_250,
    output := OriginalRow227TriangleData1246.coefficient93_250, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1237.coefficient92_252, Icur := OriginalRow227TriangleData1237.coefficient92_251,
    output := OriginalRow227TriangleData1246.coefficient93_251, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1230

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1230.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
