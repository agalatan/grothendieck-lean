import Grothe.UpperChaos.OriginalRow227TriangleData1467
import Grothe.UpperChaos.OriginalRow227TriangleData1468
import Grothe.UpperChaos.OriginalRow227TriangleData1476
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1460
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_213, Icur := OriginalRow227TriangleData1467.coefficient116_212,
    output := OriginalRow227TriangleData1476.coefficient117_212, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_214, Icur := OriginalRow227TriangleData1467.coefficient116_213,
    output := OriginalRow227TriangleData1476.coefficient117_213, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_215, Icur := OriginalRow227TriangleData1467.coefficient116_214,
    output := OriginalRow227TriangleData1476.coefficient117_214, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_216, Icur := OriginalRow227TriangleData1467.coefficient116_215,
    output := OriginalRow227TriangleData1476.coefficient117_215, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_217, Icur := OriginalRow227TriangleData1467.coefficient116_216,
    output := OriginalRow227TriangleData1476.coefficient117_216, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_218, Icur := OriginalRow227TriangleData1467.coefficient116_217,
    output := OriginalRow227TriangleData1476.coefficient117_217, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_219, Icur := OriginalRow227TriangleData1467.coefficient116_218,
    output := OriginalRow227TriangleData1476.coefficient117_218, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_220, Icur := OriginalRow227TriangleData1467.coefficient116_219,
    output := OriginalRow227TriangleData1476.coefficient117_219, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_221, Icur := OriginalRow227TriangleData1467.coefficient116_220,
    output := OriginalRow227TriangleData1476.coefficient117_220, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_222, Icur := OriginalRow227TriangleData1467.coefficient116_221,
    output := OriginalRow227TriangleData1476.coefficient117_221, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_223, Icur := OriginalRow227TriangleData1467.coefficient116_222,
    output := OriginalRow227TriangleData1476.coefficient117_222, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_224, Icur := OriginalRow227TriangleData1467.coefficient116_223,
    output := OriginalRow227TriangleData1476.coefficient117_223, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_225, Icur := OriginalRow227TriangleData1467.coefficient116_224,
    output := OriginalRow227TriangleData1476.coefficient117_224, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_226, Icur := OriginalRow227TriangleData1467.coefficient116_225,
    output := OriginalRow227TriangleData1476.coefficient117_225, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_227, Icur := OriginalRow227TriangleData1467.coefficient116_226,
    output := OriginalRow227TriangleData1476.coefficient117_226, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_228, Icur := OriginalRow227TriangleData1467.coefficient116_227,
    output := OriginalRow227TriangleData1476.coefficient117_227, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_229, Icur := OriginalRow227TriangleData1467.coefficient116_228,
    output := OriginalRow227TriangleData1476.coefficient117_228, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_230, Icur := OriginalRow227TriangleData1467.coefficient116_229,
    output := OriginalRow227TriangleData1476.coefficient117_229, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_231, Icur := OriginalRow227TriangleData1467.coefficient116_230,
    output := OriginalRow227TriangleData1476.coefficient117_230, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_232, Icur := OriginalRow227TriangleData1467.coefficient116_231,
    output := OriginalRow227TriangleData1476.coefficient117_231, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_233, Icur := OriginalRow227TriangleData1467.coefficient116_232,
    output := OriginalRow227TriangleData1476.coefficient117_232, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_234, Icur := OriginalRow227TriangleData1467.coefficient116_233,
    output := OriginalRow227TriangleData1476.coefficient117_233, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_235, Icur := OriginalRow227TriangleData1467.coefficient116_234,
    output := OriginalRow227TriangleData1476.coefficient117_234, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_236, Icur := OriginalRow227TriangleData1467.coefficient116_235,
    output := OriginalRow227TriangleData1476.coefficient117_235, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_237, Icur := OriginalRow227TriangleData1467.coefficient116_236,
    output := OriginalRow227TriangleData1476.coefficient117_236, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_238, Icur := OriginalRow227TriangleData1467.coefficient116_237,
    output := OriginalRow227TriangleData1476.coefficient117_237, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_239, Icur := OriginalRow227TriangleData1467.coefficient116_238,
    output := OriginalRow227TriangleData1476.coefficient117_238, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_240, Icur := OriginalRow227TriangleData1467.coefficient116_239,
    output := OriginalRow227TriangleData1476.coefficient117_239, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_241, Icur := OriginalRow227TriangleData1467.coefficient116_240,
    output := OriginalRow227TriangleData1476.coefficient117_240, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1467.coefficient116_242, Icur := OriginalRow227TriangleData1467.coefficient116_241,
    output := OriginalRow227TriangleData1476.coefficient117_241, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1468.coefficient116_243, Icur := OriginalRow227TriangleData1467.coefficient116_242,
    output := OriginalRow227TriangleData1476.coefficient117_242, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1468.coefficient116_244, Icur := OriginalRow227TriangleData1468.coefficient116_243,
    output := OriginalRow227TriangleData1476.coefficient117_243, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1460

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1460.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
