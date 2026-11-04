import Grothe.UpperChaos.OriginalRow227TriangleData1214
import Grothe.UpperChaos.OriginalRow227TriangleData1215
import Grothe.UpperChaos.OriginalRow227TriangleData1225
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1209
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_219, Icur := OriginalRow227TriangleData1214.coefficient90_218,
    output := OriginalRow227TriangleData1225.coefficient91_218, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_220, Icur := OriginalRow227TriangleData1214.coefficient90_219,
    output := OriginalRow227TriangleData1225.coefficient91_219, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_221, Icur := OriginalRow227TriangleData1214.coefficient90_220,
    output := OriginalRow227TriangleData1225.coefficient91_220, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_222, Icur := OriginalRow227TriangleData1214.coefficient90_221,
    output := OriginalRow227TriangleData1225.coefficient91_221, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_223, Icur := OriginalRow227TriangleData1214.coefficient90_222,
    output := OriginalRow227TriangleData1225.coefficient91_222, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_224, Icur := OriginalRow227TriangleData1214.coefficient90_223,
    output := OriginalRow227TriangleData1225.coefficient91_223, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_225, Icur := OriginalRow227TriangleData1214.coefficient90_224,
    output := OriginalRow227TriangleData1225.coefficient91_224, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_226, Icur := OriginalRow227TriangleData1214.coefficient90_225,
    output := OriginalRow227TriangleData1225.coefficient91_225, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_227, Icur := OriginalRow227TriangleData1214.coefficient90_226,
    output := OriginalRow227TriangleData1225.coefficient91_226, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_228, Icur := OriginalRow227TriangleData1214.coefficient90_227,
    output := OriginalRow227TriangleData1225.coefficient91_227, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_229, Icur := OriginalRow227TriangleData1214.coefficient90_228,
    output := OriginalRow227TriangleData1225.coefficient91_228, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_230, Icur := OriginalRow227TriangleData1214.coefficient90_229,
    output := OriginalRow227TriangleData1225.coefficient91_229, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_231, Icur := OriginalRow227TriangleData1214.coefficient90_230,
    output := OriginalRow227TriangleData1225.coefficient91_230, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_232, Icur := OriginalRow227TriangleData1214.coefficient90_231,
    output := OriginalRow227TriangleData1225.coefficient91_231, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_233, Icur := OriginalRow227TriangleData1214.coefficient90_232,
    output := OriginalRow227TriangleData1225.coefficient91_232, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_234, Icur := OriginalRow227TriangleData1214.coefficient90_233,
    output := OriginalRow227TriangleData1225.coefficient91_233, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_235, Icur := OriginalRow227TriangleData1214.coefficient90_234,
    output := OriginalRow227TriangleData1225.coefficient91_234, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_236, Icur := OriginalRow227TriangleData1214.coefficient90_235,
    output := OriginalRow227TriangleData1225.coefficient91_235, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_237, Icur := OriginalRow227TriangleData1214.coefficient90_236,
    output := OriginalRow227TriangleData1225.coefficient91_236, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_238, Icur := OriginalRow227TriangleData1214.coefficient90_237,
    output := OriginalRow227TriangleData1225.coefficient91_237, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_239, Icur := OriginalRow227TriangleData1214.coefficient90_238,
    output := OriginalRow227TriangleData1225.coefficient91_238, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_240, Icur := OriginalRow227TriangleData1214.coefficient90_239,
    output := OriginalRow227TriangleData1225.coefficient91_239, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_241, Icur := OriginalRow227TriangleData1214.coefficient90_240,
    output := OriginalRow227TriangleData1225.coefficient91_240, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_242, Icur := OriginalRow227TriangleData1214.coefficient90_241,
    output := OriginalRow227TriangleData1225.coefficient91_241, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_243, Icur := OriginalRow227TriangleData1214.coefficient90_242,
    output := OriginalRow227TriangleData1225.coefficient91_242, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_244, Icur := OriginalRow227TriangleData1214.coefficient90_243,
    output := OriginalRow227TriangleData1225.coefficient91_243, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_245, Icur := OriginalRow227TriangleData1214.coefficient90_244,
    output := OriginalRow227TriangleData1225.coefficient91_244, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_246, Icur := OriginalRow227TriangleData1214.coefficient90_245,
    output := OriginalRow227TriangleData1225.coefficient91_245, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_247, Icur := OriginalRow227TriangleData1214.coefficient90_246,
    output := OriginalRow227TriangleData1225.coefficient91_246, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1214.coefficient90_248, Icur := OriginalRow227TriangleData1214.coefficient90_247,
    output := OriginalRow227TriangleData1225.coefficient91_247, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1215.coefficient90_249, Icur := OriginalRow227TriangleData1214.coefficient90_248,
    output := OriginalRow227TriangleData1225.coefficient91_248, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1215.coefficient90_250, Icur := OriginalRow227TriangleData1215.coefficient90_249,
    output := OriginalRow227TriangleData1225.coefficient91_249, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1209

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1209.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
