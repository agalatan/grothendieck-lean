import Grothe.UpperChaos.OriginalRow227TriangleData1422
import Grothe.UpperChaos.OriginalRow227TriangleData1423
import Grothe.UpperChaos.OriginalRow227TriangleData1431
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1415
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_208, Icur := OriginalRow227TriangleData1422.coefficient111_207,
    output := OriginalRow227TriangleData1431.coefficient112_207, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_209, Icur := OriginalRow227TriangleData1422.coefficient111_208,
    output := OriginalRow227TriangleData1431.coefficient112_208, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_210, Icur := OriginalRow227TriangleData1422.coefficient111_209,
    output := OriginalRow227TriangleData1431.coefficient112_209, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_211, Icur := OriginalRow227TriangleData1422.coefficient111_210,
    output := OriginalRow227TriangleData1431.coefficient112_210, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_212, Icur := OriginalRow227TriangleData1422.coefficient111_211,
    output := OriginalRow227TriangleData1431.coefficient112_211, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_213, Icur := OriginalRow227TriangleData1422.coefficient111_212,
    output := OriginalRow227TriangleData1431.coefficient112_212, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_214, Icur := OriginalRow227TriangleData1422.coefficient111_213,
    output := OriginalRow227TriangleData1431.coefficient112_213, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_215, Icur := OriginalRow227TriangleData1422.coefficient111_214,
    output := OriginalRow227TriangleData1431.coefficient112_214, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_216, Icur := OriginalRow227TriangleData1422.coefficient111_215,
    output := OriginalRow227TriangleData1431.coefficient112_215, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_217, Icur := OriginalRow227TriangleData1422.coefficient111_216,
    output := OriginalRow227TriangleData1431.coefficient112_216, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_218, Icur := OriginalRow227TriangleData1422.coefficient111_217,
    output := OriginalRow227TriangleData1431.coefficient112_217, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_219, Icur := OriginalRow227TriangleData1422.coefficient111_218,
    output := OriginalRow227TriangleData1431.coefficient112_218, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_220, Icur := OriginalRow227TriangleData1422.coefficient111_219,
    output := OriginalRow227TriangleData1431.coefficient112_219, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_221, Icur := OriginalRow227TriangleData1422.coefficient111_220,
    output := OriginalRow227TriangleData1431.coefficient112_220, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_222, Icur := OriginalRow227TriangleData1422.coefficient111_221,
    output := OriginalRow227TriangleData1431.coefficient112_221, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_223, Icur := OriginalRow227TriangleData1422.coefficient111_222,
    output := OriginalRow227TriangleData1431.coefficient112_222, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_224, Icur := OriginalRow227TriangleData1422.coefficient111_223,
    output := OriginalRow227TriangleData1431.coefficient112_223, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_225, Icur := OriginalRow227TriangleData1422.coefficient111_224,
    output := OriginalRow227TriangleData1431.coefficient112_224, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_226, Icur := OriginalRow227TriangleData1422.coefficient111_225,
    output := OriginalRow227TriangleData1431.coefficient112_225, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_227, Icur := OriginalRow227TriangleData1422.coefficient111_226,
    output := OriginalRow227TriangleData1431.coefficient112_226, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_228, Icur := OriginalRow227TriangleData1422.coefficient111_227,
    output := OriginalRow227TriangleData1431.coefficient112_227, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_229, Icur := OriginalRow227TriangleData1422.coefficient111_228,
    output := OriginalRow227TriangleData1431.coefficient112_228, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_230, Icur := OriginalRow227TriangleData1422.coefficient111_229,
    output := OriginalRow227TriangleData1431.coefficient112_229, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_231, Icur := OriginalRow227TriangleData1422.coefficient111_230,
    output := OriginalRow227TriangleData1431.coefficient112_230, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_232, Icur := OriginalRow227TriangleData1422.coefficient111_231,
    output := OriginalRow227TriangleData1431.coefficient112_231, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_233, Icur := OriginalRow227TriangleData1422.coefficient111_232,
    output := OriginalRow227TriangleData1431.coefficient112_232, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_234, Icur := OriginalRow227TriangleData1422.coefficient111_233,
    output := OriginalRow227TriangleData1431.coefficient112_233, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_235, Icur := OriginalRow227TriangleData1422.coefficient111_234,
    output := OriginalRow227TriangleData1431.coefficient112_234, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_236, Icur := OriginalRow227TriangleData1422.coefficient111_235,
    output := OriginalRow227TriangleData1431.coefficient112_235, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1422.coefficient111_237, Icur := OriginalRow227TriangleData1422.coefficient111_236,
    output := OriginalRow227TriangleData1431.coefficient112_236, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1423.coefficient111_238, Icur := OriginalRow227TriangleData1422.coefficient111_237,
    output := OriginalRow227TriangleData1431.coefficient112_237, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1423.coefficient111_239, Icur := OriginalRow227TriangleData1423.coefficient111_238,
    output := OriginalRow227TriangleData1431.coefficient112_238, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1415

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1415.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
