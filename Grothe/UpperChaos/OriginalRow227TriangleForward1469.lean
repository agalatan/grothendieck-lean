import Grothe.UpperChaos.OriginalRow227TriangleData1476
import Grothe.UpperChaos.OriginalRow227TriangleData1477
import Grothe.UpperChaos.OriginalRow227TriangleData1485
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1469
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_214, Icur := OriginalRow227TriangleData1476.coefficient117_213,
    output := OriginalRow227TriangleData1485.coefficient118_213, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_215, Icur := OriginalRow227TriangleData1476.coefficient117_214,
    output := OriginalRow227TriangleData1485.coefficient118_214, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_216, Icur := OriginalRow227TriangleData1476.coefficient117_215,
    output := OriginalRow227TriangleData1485.coefficient118_215, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_217, Icur := OriginalRow227TriangleData1476.coefficient117_216,
    output := OriginalRow227TriangleData1485.coefficient118_216, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_218, Icur := OriginalRow227TriangleData1476.coefficient117_217,
    output := OriginalRow227TriangleData1485.coefficient118_217, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_219, Icur := OriginalRow227TriangleData1476.coefficient117_218,
    output := OriginalRow227TriangleData1485.coefficient118_218, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_220, Icur := OriginalRow227TriangleData1476.coefficient117_219,
    output := OriginalRow227TriangleData1485.coefficient118_219, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_221, Icur := OriginalRow227TriangleData1476.coefficient117_220,
    output := OriginalRow227TriangleData1485.coefficient118_220, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_222, Icur := OriginalRow227TriangleData1476.coefficient117_221,
    output := OriginalRow227TriangleData1485.coefficient118_221, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_223, Icur := OriginalRow227TriangleData1476.coefficient117_222,
    output := OriginalRow227TriangleData1485.coefficient118_222, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_224, Icur := OriginalRow227TriangleData1476.coefficient117_223,
    output := OriginalRow227TriangleData1485.coefficient118_223, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_225, Icur := OriginalRow227TriangleData1476.coefficient117_224,
    output := OriginalRow227TriangleData1485.coefficient118_224, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_226, Icur := OriginalRow227TriangleData1476.coefficient117_225,
    output := OriginalRow227TriangleData1485.coefficient118_225, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_227, Icur := OriginalRow227TriangleData1476.coefficient117_226,
    output := OriginalRow227TriangleData1485.coefficient118_226, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_228, Icur := OriginalRow227TriangleData1476.coefficient117_227,
    output := OriginalRow227TriangleData1485.coefficient118_227, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_229, Icur := OriginalRow227TriangleData1476.coefficient117_228,
    output := OriginalRow227TriangleData1485.coefficient118_228, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_230, Icur := OriginalRow227TriangleData1476.coefficient117_229,
    output := OriginalRow227TriangleData1485.coefficient118_229, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_231, Icur := OriginalRow227TriangleData1476.coefficient117_230,
    output := OriginalRow227TriangleData1485.coefficient118_230, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_232, Icur := OriginalRow227TriangleData1476.coefficient117_231,
    output := OriginalRow227TriangleData1485.coefficient118_231, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_233, Icur := OriginalRow227TriangleData1476.coefficient117_232,
    output := OriginalRow227TriangleData1485.coefficient118_232, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_234, Icur := OriginalRow227TriangleData1476.coefficient117_233,
    output := OriginalRow227TriangleData1485.coefficient118_233, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_235, Icur := OriginalRow227TriangleData1476.coefficient117_234,
    output := OriginalRow227TriangleData1485.coefficient118_234, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_236, Icur := OriginalRow227TriangleData1476.coefficient117_235,
    output := OriginalRow227TriangleData1485.coefficient118_235, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_237, Icur := OriginalRow227TriangleData1476.coefficient117_236,
    output := OriginalRow227TriangleData1485.coefficient118_236, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_238, Icur := OriginalRow227TriangleData1476.coefficient117_237,
    output := OriginalRow227TriangleData1485.coefficient118_237, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_239, Icur := OriginalRow227TriangleData1476.coefficient117_238,
    output := OriginalRow227TriangleData1485.coefficient118_238, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_240, Icur := OriginalRow227TriangleData1476.coefficient117_239,
    output := OriginalRow227TriangleData1485.coefficient118_239, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_241, Icur := OriginalRow227TriangleData1476.coefficient117_240,
    output := OriginalRow227TriangleData1485.coefficient118_240, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_242, Icur := OriginalRow227TriangleData1476.coefficient117_241,
    output := OriginalRow227TriangleData1485.coefficient118_241, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1476.coefficient117_243, Icur := OriginalRow227TriangleData1476.coefficient117_242,
    output := OriginalRow227TriangleData1485.coefficient118_242, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1477.coefficient117_244, Icur := OriginalRow227TriangleData1476.coefficient117_243,
    output := OriginalRow227TriangleData1485.coefficient118_243, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root118,
    Inext := OriginalRow227TriangleData1477.coefficient117_245, Icur := OriginalRow227TriangleData1477.coefficient117_244,
    output := OriginalRow227TriangleData1485.coefficient118_244, hC := OriginalRow227TriangleRoots03.root118_pos, hAC := OriginalRow227TriangleRoots03.product118_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1469

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1469.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
