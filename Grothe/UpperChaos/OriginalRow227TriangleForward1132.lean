import Grothe.UpperChaos.OriginalRow227TriangleData1137
import Grothe.UpperChaos.OriginalRow227TriangleData1138
import Grothe.UpperChaos.OriginalRow227TriangleData1148
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1132
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_212, Icur := OriginalRow227TriangleData1137.coefficient83_211,
    output := OriginalRow227TriangleData1148.coefficient84_211, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_213, Icur := OriginalRow227TriangleData1137.coefficient83_212,
    output := OriginalRow227TriangleData1148.coefficient84_212, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_214, Icur := OriginalRow227TriangleData1137.coefficient83_213,
    output := OriginalRow227TriangleData1148.coefficient84_213, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_215, Icur := OriginalRow227TriangleData1137.coefficient83_214,
    output := OriginalRow227TriangleData1148.coefficient84_214, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_216, Icur := OriginalRow227TriangleData1137.coefficient83_215,
    output := OriginalRow227TriangleData1148.coefficient84_215, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_217, Icur := OriginalRow227TriangleData1137.coefficient83_216,
    output := OriginalRow227TriangleData1148.coefficient84_216, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_218, Icur := OriginalRow227TriangleData1137.coefficient83_217,
    output := OriginalRow227TriangleData1148.coefficient84_217, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_219, Icur := OriginalRow227TriangleData1137.coefficient83_218,
    output := OriginalRow227TriangleData1148.coefficient84_218, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_220, Icur := OriginalRow227TriangleData1137.coefficient83_219,
    output := OriginalRow227TriangleData1148.coefficient84_219, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_221, Icur := OriginalRow227TriangleData1137.coefficient83_220,
    output := OriginalRow227TriangleData1148.coefficient84_220, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_222, Icur := OriginalRow227TriangleData1137.coefficient83_221,
    output := OriginalRow227TriangleData1148.coefficient84_221, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_223, Icur := OriginalRow227TriangleData1137.coefficient83_222,
    output := OriginalRow227TriangleData1148.coefficient84_222, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_224, Icur := OriginalRow227TriangleData1137.coefficient83_223,
    output := OriginalRow227TriangleData1148.coefficient84_223, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_225, Icur := OriginalRow227TriangleData1137.coefficient83_224,
    output := OriginalRow227TriangleData1148.coefficient84_224, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_226, Icur := OriginalRow227TriangleData1137.coefficient83_225,
    output := OriginalRow227TriangleData1148.coefficient84_225, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_227, Icur := OriginalRow227TriangleData1137.coefficient83_226,
    output := OriginalRow227TriangleData1148.coefficient84_226, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_228, Icur := OriginalRow227TriangleData1137.coefficient83_227,
    output := OriginalRow227TriangleData1148.coefficient84_227, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_229, Icur := OriginalRow227TriangleData1137.coefficient83_228,
    output := OriginalRow227TriangleData1148.coefficient84_228, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_230, Icur := OriginalRow227TriangleData1137.coefficient83_229,
    output := OriginalRow227TriangleData1148.coefficient84_229, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_231, Icur := OriginalRow227TriangleData1137.coefficient83_230,
    output := OriginalRow227TriangleData1148.coefficient84_230, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_232, Icur := OriginalRow227TriangleData1137.coefficient83_231,
    output := OriginalRow227TriangleData1148.coefficient84_231, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_233, Icur := OriginalRow227TriangleData1137.coefficient83_232,
    output := OriginalRow227TriangleData1148.coefficient84_232, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_234, Icur := OriginalRow227TriangleData1137.coefficient83_233,
    output := OriginalRow227TriangleData1148.coefficient84_233, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_235, Icur := OriginalRow227TriangleData1137.coefficient83_234,
    output := OriginalRow227TriangleData1148.coefficient84_234, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_236, Icur := OriginalRow227TriangleData1137.coefficient83_235,
    output := OriginalRow227TriangleData1148.coefficient84_235, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_237, Icur := OriginalRow227TriangleData1137.coefficient83_236,
    output := OriginalRow227TriangleData1148.coefficient84_236, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_238, Icur := OriginalRow227TriangleData1137.coefficient83_237,
    output := OriginalRow227TriangleData1148.coefficient84_237, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_239, Icur := OriginalRow227TriangleData1137.coefficient83_238,
    output := OriginalRow227TriangleData1148.coefficient84_238, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_240, Icur := OriginalRow227TriangleData1137.coefficient83_239,
    output := OriginalRow227TriangleData1148.coefficient84_239, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1137.coefficient83_241, Icur := OriginalRow227TriangleData1137.coefficient83_240,
    output := OriginalRow227TriangleData1148.coefficient84_240, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1138.coefficient83_242, Icur := OriginalRow227TriangleData1137.coefficient83_241,
    output := OriginalRow227TriangleData1148.coefficient84_241, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1138.coefficient83_243, Icur := OriginalRow227TriangleData1138.coefficient83_242,
    output := OriginalRow227TriangleData1148.coefficient84_242, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1132

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1132.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
