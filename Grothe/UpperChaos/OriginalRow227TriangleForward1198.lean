import Grothe.UpperChaos.OriginalRow227TriangleData1203
import Grothe.UpperChaos.OriginalRow227TriangleData1204
import Grothe.UpperChaos.OriginalRow227TriangleData1214
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1198
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_218, Icur := OriginalRow227TriangleData1203.coefficient89_217,
    output := OriginalRow227TriangleData1214.coefficient90_217, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_219, Icur := OriginalRow227TriangleData1203.coefficient89_218,
    output := OriginalRow227TriangleData1214.coefficient90_218, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_220, Icur := OriginalRow227TriangleData1203.coefficient89_219,
    output := OriginalRow227TriangleData1214.coefficient90_219, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_221, Icur := OriginalRow227TriangleData1203.coefficient89_220,
    output := OriginalRow227TriangleData1214.coefficient90_220, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_222, Icur := OriginalRow227TriangleData1203.coefficient89_221,
    output := OriginalRow227TriangleData1214.coefficient90_221, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_223, Icur := OriginalRow227TriangleData1203.coefficient89_222,
    output := OriginalRow227TriangleData1214.coefficient90_222, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_224, Icur := OriginalRow227TriangleData1203.coefficient89_223,
    output := OriginalRow227TriangleData1214.coefficient90_223, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_225, Icur := OriginalRow227TriangleData1203.coefficient89_224,
    output := OriginalRow227TriangleData1214.coefficient90_224, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_226, Icur := OriginalRow227TriangleData1203.coefficient89_225,
    output := OriginalRow227TriangleData1214.coefficient90_225, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_227, Icur := OriginalRow227TriangleData1203.coefficient89_226,
    output := OriginalRow227TriangleData1214.coefficient90_226, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_228, Icur := OriginalRow227TriangleData1203.coefficient89_227,
    output := OriginalRow227TriangleData1214.coefficient90_227, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_229, Icur := OriginalRow227TriangleData1203.coefficient89_228,
    output := OriginalRow227TriangleData1214.coefficient90_228, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_230, Icur := OriginalRow227TriangleData1203.coefficient89_229,
    output := OriginalRow227TriangleData1214.coefficient90_229, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_231, Icur := OriginalRow227TriangleData1203.coefficient89_230,
    output := OriginalRow227TriangleData1214.coefficient90_230, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_232, Icur := OriginalRow227TriangleData1203.coefficient89_231,
    output := OriginalRow227TriangleData1214.coefficient90_231, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_233, Icur := OriginalRow227TriangleData1203.coefficient89_232,
    output := OriginalRow227TriangleData1214.coefficient90_232, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_234, Icur := OriginalRow227TriangleData1203.coefficient89_233,
    output := OriginalRow227TriangleData1214.coefficient90_233, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_235, Icur := OriginalRow227TriangleData1203.coefficient89_234,
    output := OriginalRow227TriangleData1214.coefficient90_234, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_236, Icur := OriginalRow227TriangleData1203.coefficient89_235,
    output := OriginalRow227TriangleData1214.coefficient90_235, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_237, Icur := OriginalRow227TriangleData1203.coefficient89_236,
    output := OriginalRow227TriangleData1214.coefficient90_236, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_238, Icur := OriginalRow227TriangleData1203.coefficient89_237,
    output := OriginalRow227TriangleData1214.coefficient90_237, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_239, Icur := OriginalRow227TriangleData1203.coefficient89_238,
    output := OriginalRow227TriangleData1214.coefficient90_238, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_240, Icur := OriginalRow227TriangleData1203.coefficient89_239,
    output := OriginalRow227TriangleData1214.coefficient90_239, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_241, Icur := OriginalRow227TriangleData1203.coefficient89_240,
    output := OriginalRow227TriangleData1214.coefficient90_240, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_242, Icur := OriginalRow227TriangleData1203.coefficient89_241,
    output := OriginalRow227TriangleData1214.coefficient90_241, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_243, Icur := OriginalRow227TriangleData1203.coefficient89_242,
    output := OriginalRow227TriangleData1214.coefficient90_242, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_244, Icur := OriginalRow227TriangleData1203.coefficient89_243,
    output := OriginalRow227TriangleData1214.coefficient90_243, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_245, Icur := OriginalRow227TriangleData1203.coefficient89_244,
    output := OriginalRow227TriangleData1214.coefficient90_244, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_246, Icur := OriginalRow227TriangleData1203.coefficient89_245,
    output := OriginalRow227TriangleData1214.coefficient90_245, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1203.coefficient89_247, Icur := OriginalRow227TriangleData1203.coefficient89_246,
    output := OriginalRow227TriangleData1214.coefficient90_246, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1204.coefficient89_248, Icur := OriginalRow227TriangleData1203.coefficient89_247,
    output := OriginalRow227TriangleData1214.coefficient90_247, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1204.coefficient89_249, Icur := OriginalRow227TriangleData1204.coefficient89_248,
    output := OriginalRow227TriangleData1214.coefficient90_248, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1198

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1198.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
