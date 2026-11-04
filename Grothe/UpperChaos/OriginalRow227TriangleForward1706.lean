import Grothe.UpperChaos.OriginalRow227TriangleData1715
import Grothe.UpperChaos.OriginalRow227TriangleData1716
import Grothe.UpperChaos.OriginalRow227TriangleData1722
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1706
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_212, Icur := OriginalRow227TriangleData1715.coefficient147_211,
    output := OriginalRow227TriangleData1722.coefficient148_211, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_213, Icur := OriginalRow227TriangleData1715.coefficient147_212,
    output := OriginalRow227TriangleData1722.coefficient148_212, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_214, Icur := OriginalRow227TriangleData1715.coefficient147_213,
    output := OriginalRow227TriangleData1722.coefficient148_213, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_215, Icur := OriginalRow227TriangleData1715.coefficient147_214,
    output := OriginalRow227TriangleData1722.coefficient148_214, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_216, Icur := OriginalRow227TriangleData1715.coefficient147_215,
    output := OriginalRow227TriangleData1722.coefficient148_215, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_217, Icur := OriginalRow227TriangleData1715.coefficient147_216,
    output := OriginalRow227TriangleData1722.coefficient148_216, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_218, Icur := OriginalRow227TriangleData1715.coefficient147_217,
    output := OriginalRow227TriangleData1722.coefficient148_217, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_219, Icur := OriginalRow227TriangleData1715.coefficient147_218,
    output := OriginalRow227TriangleData1722.coefficient148_218, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_220, Icur := OriginalRow227TriangleData1715.coefficient147_219,
    output := OriginalRow227TriangleData1722.coefficient148_219, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_221, Icur := OriginalRow227TriangleData1715.coefficient147_220,
    output := OriginalRow227TriangleData1722.coefficient148_220, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_222, Icur := OriginalRow227TriangleData1715.coefficient147_221,
    output := OriginalRow227TriangleData1722.coefficient148_221, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_223, Icur := OriginalRow227TriangleData1715.coefficient147_222,
    output := OriginalRow227TriangleData1722.coefficient148_222, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_224, Icur := OriginalRow227TriangleData1715.coefficient147_223,
    output := OriginalRow227TriangleData1722.coefficient148_223, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_225, Icur := OriginalRow227TriangleData1715.coefficient147_224,
    output := OriginalRow227TriangleData1722.coefficient148_224, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_226, Icur := OriginalRow227TriangleData1715.coefficient147_225,
    output := OriginalRow227TriangleData1722.coefficient148_225, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_227, Icur := OriginalRow227TriangleData1715.coefficient147_226,
    output := OriginalRow227TriangleData1722.coefficient148_226, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_228, Icur := OriginalRow227TriangleData1715.coefficient147_227,
    output := OriginalRow227TriangleData1722.coefficient148_227, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_229, Icur := OriginalRow227TriangleData1715.coefficient147_228,
    output := OriginalRow227TriangleData1722.coefficient148_228, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_230, Icur := OriginalRow227TriangleData1715.coefficient147_229,
    output := OriginalRow227TriangleData1722.coefficient148_229, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_231, Icur := OriginalRow227TriangleData1715.coefficient147_230,
    output := OriginalRow227TriangleData1722.coefficient148_230, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_232, Icur := OriginalRow227TriangleData1715.coefficient147_231,
    output := OriginalRow227TriangleData1722.coefficient148_231, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_233, Icur := OriginalRow227TriangleData1715.coefficient147_232,
    output := OriginalRow227TriangleData1722.coefficient148_232, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_234, Icur := OriginalRow227TriangleData1715.coefficient147_233,
    output := OriginalRow227TriangleData1722.coefficient148_233, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_235, Icur := OriginalRow227TriangleData1715.coefficient147_234,
    output := OriginalRow227TriangleData1722.coefficient148_234, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_236, Icur := OriginalRow227TriangleData1715.coefficient147_235,
    output := OriginalRow227TriangleData1722.coefficient148_235, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_237, Icur := OriginalRow227TriangleData1715.coefficient147_236,
    output := OriginalRow227TriangleData1722.coefficient148_236, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_238, Icur := OriginalRow227TriangleData1715.coefficient147_237,
    output := OriginalRow227TriangleData1722.coefficient148_237, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_239, Icur := OriginalRow227TriangleData1715.coefficient147_238,
    output := OriginalRow227TriangleData1722.coefficient148_238, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_240, Icur := OriginalRow227TriangleData1715.coefficient147_239,
    output := OriginalRow227TriangleData1722.coefficient148_239, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_241, Icur := OriginalRow227TriangleData1715.coefficient147_240,
    output := OriginalRow227TriangleData1722.coefficient148_240, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1716.coefficient147_242, Icur := OriginalRow227TriangleData1715.coefficient147_241,
    output := OriginalRow227TriangleData1722.coefficient148_241, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1716.coefficient147_243, Icur := OriginalRow227TriangleData1716.coefficient147_242,
    output := OriginalRow227TriangleData1722.coefficient148_242, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1706

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1706.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
