import Grothe.UpperChaos.OriginalRow227TriangleData1530
import Grothe.UpperChaos.OriginalRow227TriangleData1531
import Grothe.UpperChaos.OriginalRow227TriangleData1539
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1523
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_220, Icur := OriginalRow227TriangleData1530.coefficient123_219,
    output := OriginalRow227TriangleData1539.coefficient124_219, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_221, Icur := OriginalRow227TriangleData1530.coefficient123_220,
    output := OriginalRow227TriangleData1539.coefficient124_220, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_222, Icur := OriginalRow227TriangleData1530.coefficient123_221,
    output := OriginalRow227TriangleData1539.coefficient124_221, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_223, Icur := OriginalRow227TriangleData1530.coefficient123_222,
    output := OriginalRow227TriangleData1539.coefficient124_222, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_224, Icur := OriginalRow227TriangleData1530.coefficient123_223,
    output := OriginalRow227TriangleData1539.coefficient124_223, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_225, Icur := OriginalRow227TriangleData1530.coefficient123_224,
    output := OriginalRow227TriangleData1539.coefficient124_224, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_226, Icur := OriginalRow227TriangleData1530.coefficient123_225,
    output := OriginalRow227TriangleData1539.coefficient124_225, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_227, Icur := OriginalRow227TriangleData1530.coefficient123_226,
    output := OriginalRow227TriangleData1539.coefficient124_226, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_228, Icur := OriginalRow227TriangleData1530.coefficient123_227,
    output := OriginalRow227TriangleData1539.coefficient124_227, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_229, Icur := OriginalRow227TriangleData1530.coefficient123_228,
    output := OriginalRow227TriangleData1539.coefficient124_228, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_230, Icur := OriginalRow227TriangleData1530.coefficient123_229,
    output := OriginalRow227TriangleData1539.coefficient124_229, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_231, Icur := OriginalRow227TriangleData1530.coefficient123_230,
    output := OriginalRow227TriangleData1539.coefficient124_230, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_232, Icur := OriginalRow227TriangleData1530.coefficient123_231,
    output := OriginalRow227TriangleData1539.coefficient124_231, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_233, Icur := OriginalRow227TriangleData1530.coefficient123_232,
    output := OriginalRow227TriangleData1539.coefficient124_232, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_234, Icur := OriginalRow227TriangleData1530.coefficient123_233,
    output := OriginalRow227TriangleData1539.coefficient124_233, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_235, Icur := OriginalRow227TriangleData1530.coefficient123_234,
    output := OriginalRow227TriangleData1539.coefficient124_234, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_236, Icur := OriginalRow227TriangleData1530.coefficient123_235,
    output := OriginalRow227TriangleData1539.coefficient124_235, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_237, Icur := OriginalRow227TriangleData1530.coefficient123_236,
    output := OriginalRow227TriangleData1539.coefficient124_236, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_238, Icur := OriginalRow227TriangleData1530.coefficient123_237,
    output := OriginalRow227TriangleData1539.coefficient124_237, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_239, Icur := OriginalRow227TriangleData1530.coefficient123_238,
    output := OriginalRow227TriangleData1539.coefficient124_238, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_240, Icur := OriginalRow227TriangleData1530.coefficient123_239,
    output := OriginalRow227TriangleData1539.coefficient124_239, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_241, Icur := OriginalRow227TriangleData1530.coefficient123_240,
    output := OriginalRow227TriangleData1539.coefficient124_240, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_242, Icur := OriginalRow227TriangleData1530.coefficient123_241,
    output := OriginalRow227TriangleData1539.coefficient124_241, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_243, Icur := OriginalRow227TriangleData1530.coefficient123_242,
    output := OriginalRow227TriangleData1539.coefficient124_242, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_244, Icur := OriginalRow227TriangleData1530.coefficient123_243,
    output := OriginalRow227TriangleData1539.coefficient124_243, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_245, Icur := OriginalRow227TriangleData1530.coefficient123_244,
    output := OriginalRow227TriangleData1539.coefficient124_244, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_246, Icur := OriginalRow227TriangleData1530.coefficient123_245,
    output := OriginalRow227TriangleData1539.coefficient124_245, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_247, Icur := OriginalRow227TriangleData1530.coefficient123_246,
    output := OriginalRow227TriangleData1539.coefficient124_246, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_248, Icur := OriginalRow227TriangleData1530.coefficient123_247,
    output := OriginalRow227TriangleData1539.coefficient124_247, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1530.coefficient123_249, Icur := OriginalRow227TriangleData1530.coefficient123_248,
    output := OriginalRow227TriangleData1539.coefficient124_248, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1531.coefficient123_250, Icur := OriginalRow227TriangleData1530.coefficient123_249,
    output := OriginalRow227TriangleData1539.coefficient124_249, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root124,
    Inext := OriginalRow227TriangleData1531.coefficient123_251, Icur := OriginalRow227TriangleData1531.coefficient123_250,
    output := OriginalRow227TriangleData1539.coefficient124_250, hC := OriginalRow227TriangleRoots03.root124_pos, hAC := OriginalRow227TriangleRoots03.product124_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1523

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1523.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
