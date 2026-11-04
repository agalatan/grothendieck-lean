import Grothe.UpperChaos.OriginalRow227TriangleData1413
import Grothe.UpperChaos.OriginalRow227TriangleData1414
import Grothe.UpperChaos.OriginalRow227TriangleData1422
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1406
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_207, Icur := OriginalRow227TriangleData1413.coefficient110_206,
    output := OriginalRow227TriangleData1422.coefficient111_206, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_208, Icur := OriginalRow227TriangleData1413.coefficient110_207,
    output := OriginalRow227TriangleData1422.coefficient111_207, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_209, Icur := OriginalRow227TriangleData1413.coefficient110_208,
    output := OriginalRow227TriangleData1422.coefficient111_208, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_210, Icur := OriginalRow227TriangleData1413.coefficient110_209,
    output := OriginalRow227TriangleData1422.coefficient111_209, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_211, Icur := OriginalRow227TriangleData1413.coefficient110_210,
    output := OriginalRow227TriangleData1422.coefficient111_210, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_212, Icur := OriginalRow227TriangleData1413.coefficient110_211,
    output := OriginalRow227TriangleData1422.coefficient111_211, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_213, Icur := OriginalRow227TriangleData1413.coefficient110_212,
    output := OriginalRow227TriangleData1422.coefficient111_212, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_214, Icur := OriginalRow227TriangleData1413.coefficient110_213,
    output := OriginalRow227TriangleData1422.coefficient111_213, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_215, Icur := OriginalRow227TriangleData1413.coefficient110_214,
    output := OriginalRow227TriangleData1422.coefficient111_214, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_216, Icur := OriginalRow227TriangleData1413.coefficient110_215,
    output := OriginalRow227TriangleData1422.coefficient111_215, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_217, Icur := OriginalRow227TriangleData1413.coefficient110_216,
    output := OriginalRow227TriangleData1422.coefficient111_216, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_218, Icur := OriginalRow227TriangleData1413.coefficient110_217,
    output := OriginalRow227TriangleData1422.coefficient111_217, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_219, Icur := OriginalRow227TriangleData1413.coefficient110_218,
    output := OriginalRow227TriangleData1422.coefficient111_218, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_220, Icur := OriginalRow227TriangleData1413.coefficient110_219,
    output := OriginalRow227TriangleData1422.coefficient111_219, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_221, Icur := OriginalRow227TriangleData1413.coefficient110_220,
    output := OriginalRow227TriangleData1422.coefficient111_220, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_222, Icur := OriginalRow227TriangleData1413.coefficient110_221,
    output := OriginalRow227TriangleData1422.coefficient111_221, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_223, Icur := OriginalRow227TriangleData1413.coefficient110_222,
    output := OriginalRow227TriangleData1422.coefficient111_222, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_224, Icur := OriginalRow227TriangleData1413.coefficient110_223,
    output := OriginalRow227TriangleData1422.coefficient111_223, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_225, Icur := OriginalRow227TriangleData1413.coefficient110_224,
    output := OriginalRow227TriangleData1422.coefficient111_224, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_226, Icur := OriginalRow227TriangleData1413.coefficient110_225,
    output := OriginalRow227TriangleData1422.coefficient111_225, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_227, Icur := OriginalRow227TriangleData1413.coefficient110_226,
    output := OriginalRow227TriangleData1422.coefficient111_226, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_228, Icur := OriginalRow227TriangleData1413.coefficient110_227,
    output := OriginalRow227TriangleData1422.coefficient111_227, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_229, Icur := OriginalRow227TriangleData1413.coefficient110_228,
    output := OriginalRow227TriangleData1422.coefficient111_228, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_230, Icur := OriginalRow227TriangleData1413.coefficient110_229,
    output := OriginalRow227TriangleData1422.coefficient111_229, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_231, Icur := OriginalRow227TriangleData1413.coefficient110_230,
    output := OriginalRow227TriangleData1422.coefficient111_230, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_232, Icur := OriginalRow227TriangleData1413.coefficient110_231,
    output := OriginalRow227TriangleData1422.coefficient111_231, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_233, Icur := OriginalRow227TriangleData1413.coefficient110_232,
    output := OriginalRow227TriangleData1422.coefficient111_232, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_234, Icur := OriginalRow227TriangleData1413.coefficient110_233,
    output := OriginalRow227TriangleData1422.coefficient111_233, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_235, Icur := OriginalRow227TriangleData1413.coefficient110_234,
    output := OriginalRow227TriangleData1422.coefficient111_234, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1413.coefficient110_236, Icur := OriginalRow227TriangleData1413.coefficient110_235,
    output := OriginalRow227TriangleData1422.coefficient111_235, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_237, Icur := OriginalRow227TriangleData1413.coefficient110_236,
    output := OriginalRow227TriangleData1422.coefficient111_236, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_238, Icur := OriginalRow227TriangleData1414.coefficient110_237,
    output := OriginalRow227TriangleData1422.coefficient111_237, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1406

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1406.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
