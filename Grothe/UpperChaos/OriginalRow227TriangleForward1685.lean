import Grothe.UpperChaos.OriginalRow227TriangleData1694
import Grothe.UpperChaos.OriginalRow227TriangleData1695
import Grothe.UpperChaos.OriginalRow227TriangleData1701
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1685
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_209, Icur := OriginalRow227TriangleData1694.coefficient144_208,
    output := OriginalRow227TriangleData1701.coefficient145_208, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_210, Icur := OriginalRow227TriangleData1694.coefficient144_209,
    output := OriginalRow227TriangleData1701.coefficient145_209, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_211, Icur := OriginalRow227TriangleData1694.coefficient144_210,
    output := OriginalRow227TriangleData1701.coefficient145_210, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_212, Icur := OriginalRow227TriangleData1694.coefficient144_211,
    output := OriginalRow227TriangleData1701.coefficient145_211, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_213, Icur := OriginalRow227TriangleData1694.coefficient144_212,
    output := OriginalRow227TriangleData1701.coefficient145_212, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_214, Icur := OriginalRow227TriangleData1694.coefficient144_213,
    output := OriginalRow227TriangleData1701.coefficient145_213, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_215, Icur := OriginalRow227TriangleData1694.coefficient144_214,
    output := OriginalRow227TriangleData1701.coefficient145_214, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_216, Icur := OriginalRow227TriangleData1694.coefficient144_215,
    output := OriginalRow227TriangleData1701.coefficient145_215, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_217, Icur := OriginalRow227TriangleData1694.coefficient144_216,
    output := OriginalRow227TriangleData1701.coefficient145_216, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_218, Icur := OriginalRow227TriangleData1694.coefficient144_217,
    output := OriginalRow227TriangleData1701.coefficient145_217, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_219, Icur := OriginalRow227TriangleData1694.coefficient144_218,
    output := OriginalRow227TriangleData1701.coefficient145_218, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_220, Icur := OriginalRow227TriangleData1694.coefficient144_219,
    output := OriginalRow227TriangleData1701.coefficient145_219, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_221, Icur := OriginalRow227TriangleData1694.coefficient144_220,
    output := OriginalRow227TriangleData1701.coefficient145_220, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_222, Icur := OriginalRow227TriangleData1694.coefficient144_221,
    output := OriginalRow227TriangleData1701.coefficient145_221, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_223, Icur := OriginalRow227TriangleData1694.coefficient144_222,
    output := OriginalRow227TriangleData1701.coefficient145_222, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_224, Icur := OriginalRow227TriangleData1694.coefficient144_223,
    output := OriginalRow227TriangleData1701.coefficient145_223, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_225, Icur := OriginalRow227TriangleData1694.coefficient144_224,
    output := OriginalRow227TriangleData1701.coefficient145_224, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_226, Icur := OriginalRow227TriangleData1694.coefficient144_225,
    output := OriginalRow227TriangleData1701.coefficient145_225, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_227, Icur := OriginalRow227TriangleData1694.coefficient144_226,
    output := OriginalRow227TriangleData1701.coefficient145_226, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_228, Icur := OriginalRow227TriangleData1694.coefficient144_227,
    output := OriginalRow227TriangleData1701.coefficient145_227, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_229, Icur := OriginalRow227TriangleData1694.coefficient144_228,
    output := OriginalRow227TriangleData1701.coefficient145_228, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_230, Icur := OriginalRow227TriangleData1694.coefficient144_229,
    output := OriginalRow227TriangleData1701.coefficient145_229, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_231, Icur := OriginalRow227TriangleData1694.coefficient144_230,
    output := OriginalRow227TriangleData1701.coefficient145_230, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_232, Icur := OriginalRow227TriangleData1694.coefficient144_231,
    output := OriginalRow227TriangleData1701.coefficient145_231, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_233, Icur := OriginalRow227TriangleData1694.coefficient144_232,
    output := OriginalRow227TriangleData1701.coefficient145_232, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_234, Icur := OriginalRow227TriangleData1694.coefficient144_233,
    output := OriginalRow227TriangleData1701.coefficient145_233, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_235, Icur := OriginalRow227TriangleData1694.coefficient144_234,
    output := OriginalRow227TriangleData1701.coefficient145_234, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_236, Icur := OriginalRow227TriangleData1694.coefficient144_235,
    output := OriginalRow227TriangleData1701.coefficient145_235, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_237, Icur := OriginalRow227TriangleData1694.coefficient144_236,
    output := OriginalRow227TriangleData1701.coefficient145_236, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1694.coefficient144_238, Icur := OriginalRow227TriangleData1694.coefficient144_237,
    output := OriginalRow227TriangleData1701.coefficient145_237, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_239, Icur := OriginalRow227TriangleData1694.coefficient144_238,
    output := OriginalRow227TriangleData1701.coefficient145_238, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_240, Icur := OriginalRow227TriangleData1695.coefficient144_239,
    output := OriginalRow227TriangleData1701.coefficient145_239, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1685

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1685.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
