import Grothe.UpperChaos.OriginalRow227TriangleData1071
import Grothe.UpperChaos.OriginalRow227TriangleData1072
import Grothe.UpperChaos.OriginalRow227TriangleData1082
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1066
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_206, Icur := OriginalRow227TriangleData1071.coefficient77_205,
    output := OriginalRow227TriangleData1082.coefficient78_205, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_207, Icur := OriginalRow227TriangleData1071.coefficient77_206,
    output := OriginalRow227TriangleData1082.coefficient78_206, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_208, Icur := OriginalRow227TriangleData1071.coefficient77_207,
    output := OriginalRow227TriangleData1082.coefficient78_207, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_209, Icur := OriginalRow227TriangleData1071.coefficient77_208,
    output := OriginalRow227TriangleData1082.coefficient78_208, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_210, Icur := OriginalRow227TriangleData1071.coefficient77_209,
    output := OriginalRow227TriangleData1082.coefficient78_209, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_211, Icur := OriginalRow227TriangleData1071.coefficient77_210,
    output := OriginalRow227TriangleData1082.coefficient78_210, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_212, Icur := OriginalRow227TriangleData1071.coefficient77_211,
    output := OriginalRow227TriangleData1082.coefficient78_211, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_213, Icur := OriginalRow227TriangleData1071.coefficient77_212,
    output := OriginalRow227TriangleData1082.coefficient78_212, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_214, Icur := OriginalRow227TriangleData1071.coefficient77_213,
    output := OriginalRow227TriangleData1082.coefficient78_213, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_215, Icur := OriginalRow227TriangleData1071.coefficient77_214,
    output := OriginalRow227TriangleData1082.coefficient78_214, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_216, Icur := OriginalRow227TriangleData1071.coefficient77_215,
    output := OriginalRow227TriangleData1082.coefficient78_215, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_217, Icur := OriginalRow227TriangleData1071.coefficient77_216,
    output := OriginalRow227TriangleData1082.coefficient78_216, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_218, Icur := OriginalRow227TriangleData1071.coefficient77_217,
    output := OriginalRow227TriangleData1082.coefficient78_217, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_219, Icur := OriginalRow227TriangleData1071.coefficient77_218,
    output := OriginalRow227TriangleData1082.coefficient78_218, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_220, Icur := OriginalRow227TriangleData1071.coefficient77_219,
    output := OriginalRow227TriangleData1082.coefficient78_219, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_221, Icur := OriginalRow227TriangleData1071.coefficient77_220,
    output := OriginalRow227TriangleData1082.coefficient78_220, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_222, Icur := OriginalRow227TriangleData1071.coefficient77_221,
    output := OriginalRow227TriangleData1082.coefficient78_221, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_223, Icur := OriginalRow227TriangleData1071.coefficient77_222,
    output := OriginalRow227TriangleData1082.coefficient78_222, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_224, Icur := OriginalRow227TriangleData1071.coefficient77_223,
    output := OriginalRow227TriangleData1082.coefficient78_223, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_225, Icur := OriginalRow227TriangleData1071.coefficient77_224,
    output := OriginalRow227TriangleData1082.coefficient78_224, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_226, Icur := OriginalRow227TriangleData1071.coefficient77_225,
    output := OriginalRow227TriangleData1082.coefficient78_225, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_227, Icur := OriginalRow227TriangleData1071.coefficient77_226,
    output := OriginalRow227TriangleData1082.coefficient78_226, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_228, Icur := OriginalRow227TriangleData1071.coefficient77_227,
    output := OriginalRow227TriangleData1082.coefficient78_227, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_229, Icur := OriginalRow227TriangleData1071.coefficient77_228,
    output := OriginalRow227TriangleData1082.coefficient78_228, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_230, Icur := OriginalRow227TriangleData1071.coefficient77_229,
    output := OriginalRow227TriangleData1082.coefficient78_229, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_231, Icur := OriginalRow227TriangleData1071.coefficient77_230,
    output := OriginalRow227TriangleData1082.coefficient78_230, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_232, Icur := OriginalRow227TriangleData1071.coefficient77_231,
    output := OriginalRow227TriangleData1082.coefficient78_231, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_233, Icur := OriginalRow227TriangleData1071.coefficient77_232,
    output := OriginalRow227TriangleData1082.coefficient78_232, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_234, Icur := OriginalRow227TriangleData1071.coefficient77_233,
    output := OriginalRow227TriangleData1082.coefficient78_233, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1071.coefficient77_235, Icur := OriginalRow227TriangleData1071.coefficient77_234,
    output := OriginalRow227TriangleData1082.coefficient78_234, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1072.coefficient77_236, Icur := OriginalRow227TriangleData1071.coefficient77_235,
    output := OriginalRow227TriangleData1082.coefficient78_235, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1072.coefficient77_237, Icur := OriginalRow227TriangleData1072.coefficient77_236,
    output := OriginalRow227TriangleData1082.coefficient78_236, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1066

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1066.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
