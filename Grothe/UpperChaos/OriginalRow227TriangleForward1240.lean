import Grothe.UpperChaos.OriginalRow227TriangleData1246
import Grothe.UpperChaos.OriginalRow227TriangleData1247
import Grothe.UpperChaos.OriginalRow227TriangleData1256
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1240
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_222, Icur := OriginalRow227TriangleData1246.coefficient93_221,
    output := OriginalRow227TriangleData1256.coefficient94_221, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_223, Icur := OriginalRow227TriangleData1246.coefficient93_222,
    output := OriginalRow227TriangleData1256.coefficient94_222, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_224, Icur := OriginalRow227TriangleData1246.coefficient93_223,
    output := OriginalRow227TriangleData1256.coefficient94_223, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_225, Icur := OriginalRow227TriangleData1246.coefficient93_224,
    output := OriginalRow227TriangleData1256.coefficient94_224, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_226, Icur := OriginalRow227TriangleData1246.coefficient93_225,
    output := OriginalRow227TriangleData1256.coefficient94_225, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_227, Icur := OriginalRow227TriangleData1246.coefficient93_226,
    output := OriginalRow227TriangleData1256.coefficient94_226, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_228, Icur := OriginalRow227TriangleData1246.coefficient93_227,
    output := OriginalRow227TriangleData1256.coefficient94_227, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_229, Icur := OriginalRow227TriangleData1246.coefficient93_228,
    output := OriginalRow227TriangleData1256.coefficient94_228, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_230, Icur := OriginalRow227TriangleData1246.coefficient93_229,
    output := OriginalRow227TriangleData1256.coefficient94_229, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_231, Icur := OriginalRow227TriangleData1246.coefficient93_230,
    output := OriginalRow227TriangleData1256.coefficient94_230, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_232, Icur := OriginalRow227TriangleData1246.coefficient93_231,
    output := OriginalRow227TriangleData1256.coefficient94_231, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_233, Icur := OriginalRow227TriangleData1246.coefficient93_232,
    output := OriginalRow227TriangleData1256.coefficient94_232, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_234, Icur := OriginalRow227TriangleData1246.coefficient93_233,
    output := OriginalRow227TriangleData1256.coefficient94_233, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_235, Icur := OriginalRow227TriangleData1246.coefficient93_234,
    output := OriginalRow227TriangleData1256.coefficient94_234, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_236, Icur := OriginalRow227TriangleData1246.coefficient93_235,
    output := OriginalRow227TriangleData1256.coefficient94_235, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_237, Icur := OriginalRow227TriangleData1246.coefficient93_236,
    output := OriginalRow227TriangleData1256.coefficient94_236, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_238, Icur := OriginalRow227TriangleData1246.coefficient93_237,
    output := OriginalRow227TriangleData1256.coefficient94_237, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_239, Icur := OriginalRow227TriangleData1246.coefficient93_238,
    output := OriginalRow227TriangleData1256.coefficient94_238, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_240, Icur := OriginalRow227TriangleData1246.coefficient93_239,
    output := OriginalRow227TriangleData1256.coefficient94_239, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_241, Icur := OriginalRow227TriangleData1246.coefficient93_240,
    output := OriginalRow227TriangleData1256.coefficient94_240, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_242, Icur := OriginalRow227TriangleData1246.coefficient93_241,
    output := OriginalRow227TriangleData1256.coefficient94_241, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_243, Icur := OriginalRow227TriangleData1246.coefficient93_242,
    output := OriginalRow227TriangleData1256.coefficient94_242, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_244, Icur := OriginalRow227TriangleData1246.coefficient93_243,
    output := OriginalRow227TriangleData1256.coefficient94_243, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_245, Icur := OriginalRow227TriangleData1246.coefficient93_244,
    output := OriginalRow227TriangleData1256.coefficient94_244, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_246, Icur := OriginalRow227TriangleData1246.coefficient93_245,
    output := OriginalRow227TriangleData1256.coefficient94_245, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_247, Icur := OriginalRow227TriangleData1246.coefficient93_246,
    output := OriginalRow227TriangleData1256.coefficient94_246, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_248, Icur := OriginalRow227TriangleData1246.coefficient93_247,
    output := OriginalRow227TriangleData1256.coefficient94_247, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_249, Icur := OriginalRow227TriangleData1246.coefficient93_248,
    output := OriginalRow227TriangleData1256.coefficient94_248, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_250, Icur := OriginalRow227TriangleData1246.coefficient93_249,
    output := OriginalRow227TriangleData1256.coefficient94_249, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1246.coefficient93_251, Icur := OriginalRow227TriangleData1246.coefficient93_250,
    output := OriginalRow227TriangleData1256.coefficient94_250, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_252, Icur := OriginalRow227TriangleData1246.coefficient93_251,
    output := OriginalRow227TriangleData1256.coefficient94_251, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_253, Icur := OriginalRow227TriangleData1247.coefficient93_252,
    output := OriginalRow227TriangleData1256.coefficient94_252, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1240

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1240.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
