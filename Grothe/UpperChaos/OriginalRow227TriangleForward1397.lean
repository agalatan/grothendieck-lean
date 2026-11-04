import Grothe.UpperChaos.OriginalRow227TriangleData1404
import Grothe.UpperChaos.OriginalRow227TriangleData1405
import Grothe.UpperChaos.OriginalRow227TriangleData1413
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1397
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_206, Icur := OriginalRow227TriangleData1404.coefficient109_205,
    output := OriginalRow227TriangleData1413.coefficient110_205, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_207, Icur := OriginalRow227TriangleData1404.coefficient109_206,
    output := OriginalRow227TriangleData1413.coefficient110_206, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_208, Icur := OriginalRow227TriangleData1404.coefficient109_207,
    output := OriginalRow227TriangleData1413.coefficient110_207, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_209, Icur := OriginalRow227TriangleData1404.coefficient109_208,
    output := OriginalRow227TriangleData1413.coefficient110_208, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_210, Icur := OriginalRow227TriangleData1404.coefficient109_209,
    output := OriginalRow227TriangleData1413.coefficient110_209, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_211, Icur := OriginalRow227TriangleData1404.coefficient109_210,
    output := OriginalRow227TriangleData1413.coefficient110_210, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_212, Icur := OriginalRow227TriangleData1404.coefficient109_211,
    output := OriginalRow227TriangleData1413.coefficient110_211, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_213, Icur := OriginalRow227TriangleData1404.coefficient109_212,
    output := OriginalRow227TriangleData1413.coefficient110_212, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_214, Icur := OriginalRow227TriangleData1404.coefficient109_213,
    output := OriginalRow227TriangleData1413.coefficient110_213, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_215, Icur := OriginalRow227TriangleData1404.coefficient109_214,
    output := OriginalRow227TriangleData1413.coefficient110_214, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_216, Icur := OriginalRow227TriangleData1404.coefficient109_215,
    output := OriginalRow227TriangleData1413.coefficient110_215, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_217, Icur := OriginalRow227TriangleData1404.coefficient109_216,
    output := OriginalRow227TriangleData1413.coefficient110_216, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_218, Icur := OriginalRow227TriangleData1404.coefficient109_217,
    output := OriginalRow227TriangleData1413.coefficient110_217, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_219, Icur := OriginalRow227TriangleData1404.coefficient109_218,
    output := OriginalRow227TriangleData1413.coefficient110_218, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_220, Icur := OriginalRow227TriangleData1404.coefficient109_219,
    output := OriginalRow227TriangleData1413.coefficient110_219, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_221, Icur := OriginalRow227TriangleData1404.coefficient109_220,
    output := OriginalRow227TriangleData1413.coefficient110_220, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_222, Icur := OriginalRow227TriangleData1404.coefficient109_221,
    output := OriginalRow227TriangleData1413.coefficient110_221, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_223, Icur := OriginalRow227TriangleData1404.coefficient109_222,
    output := OriginalRow227TriangleData1413.coefficient110_222, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_224, Icur := OriginalRow227TriangleData1404.coefficient109_223,
    output := OriginalRow227TriangleData1413.coefficient110_223, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_225, Icur := OriginalRow227TriangleData1404.coefficient109_224,
    output := OriginalRow227TriangleData1413.coefficient110_224, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_226, Icur := OriginalRow227TriangleData1404.coefficient109_225,
    output := OriginalRow227TriangleData1413.coefficient110_225, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_227, Icur := OriginalRow227TriangleData1404.coefficient109_226,
    output := OriginalRow227TriangleData1413.coefficient110_226, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_228, Icur := OriginalRow227TriangleData1404.coefficient109_227,
    output := OriginalRow227TriangleData1413.coefficient110_227, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_229, Icur := OriginalRow227TriangleData1404.coefficient109_228,
    output := OriginalRow227TriangleData1413.coefficient110_228, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_230, Icur := OriginalRow227TriangleData1404.coefficient109_229,
    output := OriginalRow227TriangleData1413.coefficient110_229, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_231, Icur := OriginalRow227TriangleData1404.coefficient109_230,
    output := OriginalRow227TriangleData1413.coefficient110_230, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_232, Icur := OriginalRow227TriangleData1404.coefficient109_231,
    output := OriginalRow227TriangleData1413.coefficient110_231, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_233, Icur := OriginalRow227TriangleData1404.coefficient109_232,
    output := OriginalRow227TriangleData1413.coefficient110_232, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_234, Icur := OriginalRow227TriangleData1404.coefficient109_233,
    output := OriginalRow227TriangleData1413.coefficient110_233, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1404.coefficient109_235, Icur := OriginalRow227TriangleData1404.coefficient109_234,
    output := OriginalRow227TriangleData1413.coefficient110_234, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1405.coefficient109_236, Icur := OriginalRow227TriangleData1404.coefficient109_235,
    output := OriginalRow227TriangleData1413.coefficient110_235, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1405.coefficient109_237, Icur := OriginalRow227TriangleData1405.coefficient109_236,
    output := OriginalRow227TriangleData1413.coefficient110_236, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1397

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1397.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
