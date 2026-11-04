import Grothe.UpperChaos.OriginalRow227TriangleData1650
import Grothe.UpperChaos.OriginalRow227TriangleData1651
import Grothe.UpperChaos.OriginalRow227TriangleData1658
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1642
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_203, Icur := OriginalRow227TriangleData1650.coefficient138_202,
    output := OriginalRow227TriangleData1658.coefficient139_202, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_204, Icur := OriginalRow227TriangleData1650.coefficient138_203,
    output := OriginalRow227TriangleData1658.coefficient139_203, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_205, Icur := OriginalRow227TriangleData1650.coefficient138_204,
    output := OriginalRow227TriangleData1658.coefficient139_204, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_206, Icur := OriginalRow227TriangleData1650.coefficient138_205,
    output := OriginalRow227TriangleData1658.coefficient139_205, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_207, Icur := OriginalRow227TriangleData1650.coefficient138_206,
    output := OriginalRow227TriangleData1658.coefficient139_206, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_208, Icur := OriginalRow227TriangleData1650.coefficient138_207,
    output := OriginalRow227TriangleData1658.coefficient139_207, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_209, Icur := OriginalRow227TriangleData1650.coefficient138_208,
    output := OriginalRow227TriangleData1658.coefficient139_208, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_210, Icur := OriginalRow227TriangleData1650.coefficient138_209,
    output := OriginalRow227TriangleData1658.coefficient139_209, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_211, Icur := OriginalRow227TriangleData1650.coefficient138_210,
    output := OriginalRow227TriangleData1658.coefficient139_210, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_212, Icur := OriginalRow227TriangleData1650.coefficient138_211,
    output := OriginalRow227TriangleData1658.coefficient139_211, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_213, Icur := OriginalRow227TriangleData1650.coefficient138_212,
    output := OriginalRow227TriangleData1658.coefficient139_212, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_214, Icur := OriginalRow227TriangleData1650.coefficient138_213,
    output := OriginalRow227TriangleData1658.coefficient139_213, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_215, Icur := OriginalRow227TriangleData1650.coefficient138_214,
    output := OriginalRow227TriangleData1658.coefficient139_214, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_216, Icur := OriginalRow227TriangleData1650.coefficient138_215,
    output := OriginalRow227TriangleData1658.coefficient139_215, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_217, Icur := OriginalRow227TriangleData1650.coefficient138_216,
    output := OriginalRow227TriangleData1658.coefficient139_216, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_218, Icur := OriginalRow227TriangleData1650.coefficient138_217,
    output := OriginalRow227TriangleData1658.coefficient139_217, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_219, Icur := OriginalRow227TriangleData1650.coefficient138_218,
    output := OriginalRow227TriangleData1658.coefficient139_218, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_220, Icur := OriginalRow227TriangleData1650.coefficient138_219,
    output := OriginalRow227TriangleData1658.coefficient139_219, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_221, Icur := OriginalRow227TriangleData1650.coefficient138_220,
    output := OriginalRow227TriangleData1658.coefficient139_220, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_222, Icur := OriginalRow227TriangleData1650.coefficient138_221,
    output := OriginalRow227TriangleData1658.coefficient139_221, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_223, Icur := OriginalRow227TriangleData1650.coefficient138_222,
    output := OriginalRow227TriangleData1658.coefficient139_222, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_224, Icur := OriginalRow227TriangleData1650.coefficient138_223,
    output := OriginalRow227TriangleData1658.coefficient139_223, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_225, Icur := OriginalRow227TriangleData1650.coefficient138_224,
    output := OriginalRow227TriangleData1658.coefficient139_224, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_226, Icur := OriginalRow227TriangleData1650.coefficient138_225,
    output := OriginalRow227TriangleData1658.coefficient139_225, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_227, Icur := OriginalRow227TriangleData1650.coefficient138_226,
    output := OriginalRow227TriangleData1658.coefficient139_226, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_228, Icur := OriginalRow227TriangleData1650.coefficient138_227,
    output := OriginalRow227TriangleData1658.coefficient139_227, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_229, Icur := OriginalRow227TriangleData1650.coefficient138_228,
    output := OriginalRow227TriangleData1658.coefficient139_228, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_230, Icur := OriginalRow227TriangleData1650.coefficient138_229,
    output := OriginalRow227TriangleData1658.coefficient139_229, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_231, Icur := OriginalRow227TriangleData1650.coefficient138_230,
    output := OriginalRow227TriangleData1658.coefficient139_230, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_232, Icur := OriginalRow227TriangleData1650.coefficient138_231,
    output := OriginalRow227TriangleData1658.coefficient139_231, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_233, Icur := OriginalRow227TriangleData1650.coefficient138_232,
    output := OriginalRow227TriangleData1658.coefficient139_232, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1651.coefficient138_234, Icur := OriginalRow227TriangleData1651.coefficient138_233,
    output := OriginalRow227TriangleData1658.coefficient139_233, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1642

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1642.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
