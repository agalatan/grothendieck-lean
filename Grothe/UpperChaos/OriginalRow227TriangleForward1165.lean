import Grothe.UpperChaos.OriginalRow227TriangleData1170
import Grothe.UpperChaos.OriginalRow227TriangleData1171
import Grothe.UpperChaos.OriginalRow227TriangleData1181
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1165
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_215, Icur := OriginalRow227TriangleData1170.coefficient86_214,
    output := OriginalRow227TriangleData1181.coefficient87_214, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_216, Icur := OriginalRow227TriangleData1170.coefficient86_215,
    output := OriginalRow227TriangleData1181.coefficient87_215, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_217, Icur := OriginalRow227TriangleData1170.coefficient86_216,
    output := OriginalRow227TriangleData1181.coefficient87_216, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_218, Icur := OriginalRow227TriangleData1170.coefficient86_217,
    output := OriginalRow227TriangleData1181.coefficient87_217, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_219, Icur := OriginalRow227TriangleData1170.coefficient86_218,
    output := OriginalRow227TriangleData1181.coefficient87_218, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_220, Icur := OriginalRow227TriangleData1170.coefficient86_219,
    output := OriginalRow227TriangleData1181.coefficient87_219, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_221, Icur := OriginalRow227TriangleData1170.coefficient86_220,
    output := OriginalRow227TriangleData1181.coefficient87_220, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_222, Icur := OriginalRow227TriangleData1170.coefficient86_221,
    output := OriginalRow227TriangleData1181.coefficient87_221, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_223, Icur := OriginalRow227TriangleData1170.coefficient86_222,
    output := OriginalRow227TriangleData1181.coefficient87_222, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_224, Icur := OriginalRow227TriangleData1170.coefficient86_223,
    output := OriginalRow227TriangleData1181.coefficient87_223, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_225, Icur := OriginalRow227TriangleData1170.coefficient86_224,
    output := OriginalRow227TriangleData1181.coefficient87_224, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_226, Icur := OriginalRow227TriangleData1170.coefficient86_225,
    output := OriginalRow227TriangleData1181.coefficient87_225, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_227, Icur := OriginalRow227TriangleData1170.coefficient86_226,
    output := OriginalRow227TriangleData1181.coefficient87_226, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_228, Icur := OriginalRow227TriangleData1170.coefficient86_227,
    output := OriginalRow227TriangleData1181.coefficient87_227, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_229, Icur := OriginalRow227TriangleData1170.coefficient86_228,
    output := OriginalRow227TriangleData1181.coefficient87_228, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_230, Icur := OriginalRow227TriangleData1170.coefficient86_229,
    output := OriginalRow227TriangleData1181.coefficient87_229, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_231, Icur := OriginalRow227TriangleData1170.coefficient86_230,
    output := OriginalRow227TriangleData1181.coefficient87_230, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_232, Icur := OriginalRow227TriangleData1170.coefficient86_231,
    output := OriginalRow227TriangleData1181.coefficient87_231, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_233, Icur := OriginalRow227TriangleData1170.coefficient86_232,
    output := OriginalRow227TriangleData1181.coefficient87_232, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_234, Icur := OriginalRow227TriangleData1170.coefficient86_233,
    output := OriginalRow227TriangleData1181.coefficient87_233, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_235, Icur := OriginalRow227TriangleData1170.coefficient86_234,
    output := OriginalRow227TriangleData1181.coefficient87_234, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_236, Icur := OriginalRow227TriangleData1170.coefficient86_235,
    output := OriginalRow227TriangleData1181.coefficient87_235, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_237, Icur := OriginalRow227TriangleData1170.coefficient86_236,
    output := OriginalRow227TriangleData1181.coefficient87_236, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_238, Icur := OriginalRow227TriangleData1170.coefficient86_237,
    output := OriginalRow227TriangleData1181.coefficient87_237, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_239, Icur := OriginalRow227TriangleData1170.coefficient86_238,
    output := OriginalRow227TriangleData1181.coefficient87_238, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_240, Icur := OriginalRow227TriangleData1170.coefficient86_239,
    output := OriginalRow227TriangleData1181.coefficient87_239, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_241, Icur := OriginalRow227TriangleData1170.coefficient86_240,
    output := OriginalRow227TriangleData1181.coefficient87_240, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_242, Icur := OriginalRow227TriangleData1170.coefficient86_241,
    output := OriginalRow227TriangleData1181.coefficient87_241, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_243, Icur := OriginalRow227TriangleData1170.coefficient86_242,
    output := OriginalRow227TriangleData1181.coefficient87_242, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1170.coefficient86_244, Icur := OriginalRow227TriangleData1170.coefficient86_243,
    output := OriginalRow227TriangleData1181.coefficient87_243, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1171.coefficient86_245, Icur := OriginalRow227TriangleData1170.coefficient86_244,
    output := OriginalRow227TriangleData1181.coefficient87_244, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1171.coefficient86_246, Icur := OriginalRow227TriangleData1171.coefficient86_245,
    output := OriginalRow227TriangleData1181.coefficient87_245, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1165

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1165.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
