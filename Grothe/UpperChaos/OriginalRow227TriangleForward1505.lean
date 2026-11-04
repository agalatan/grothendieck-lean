import Grothe.UpperChaos.OriginalRow227TriangleData1512
import Grothe.UpperChaos.OriginalRow227TriangleData1513
import Grothe.UpperChaos.OriginalRow227TriangleData1521
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1505
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_218, Icur := OriginalRow227TriangleData1512.coefficient121_217,
    output := OriginalRow227TriangleData1521.coefficient122_217, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_219, Icur := OriginalRow227TriangleData1512.coefficient121_218,
    output := OriginalRow227TriangleData1521.coefficient122_218, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_220, Icur := OriginalRow227TriangleData1512.coefficient121_219,
    output := OriginalRow227TriangleData1521.coefficient122_219, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_221, Icur := OriginalRow227TriangleData1512.coefficient121_220,
    output := OriginalRow227TriangleData1521.coefficient122_220, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_222, Icur := OriginalRow227TriangleData1512.coefficient121_221,
    output := OriginalRow227TriangleData1521.coefficient122_221, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_223, Icur := OriginalRow227TriangleData1512.coefficient121_222,
    output := OriginalRow227TriangleData1521.coefficient122_222, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_224, Icur := OriginalRow227TriangleData1512.coefficient121_223,
    output := OriginalRow227TriangleData1521.coefficient122_223, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_225, Icur := OriginalRow227TriangleData1512.coefficient121_224,
    output := OriginalRow227TriangleData1521.coefficient122_224, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_226, Icur := OriginalRow227TriangleData1512.coefficient121_225,
    output := OriginalRow227TriangleData1521.coefficient122_225, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_227, Icur := OriginalRow227TriangleData1512.coefficient121_226,
    output := OriginalRow227TriangleData1521.coefficient122_226, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_228, Icur := OriginalRow227TriangleData1512.coefficient121_227,
    output := OriginalRow227TriangleData1521.coefficient122_227, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_229, Icur := OriginalRow227TriangleData1512.coefficient121_228,
    output := OriginalRow227TriangleData1521.coefficient122_228, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_230, Icur := OriginalRow227TriangleData1512.coefficient121_229,
    output := OriginalRow227TriangleData1521.coefficient122_229, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_231, Icur := OriginalRow227TriangleData1512.coefficient121_230,
    output := OriginalRow227TriangleData1521.coefficient122_230, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_232, Icur := OriginalRow227TriangleData1512.coefficient121_231,
    output := OriginalRow227TriangleData1521.coefficient122_231, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_233, Icur := OriginalRow227TriangleData1512.coefficient121_232,
    output := OriginalRow227TriangleData1521.coefficient122_232, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_234, Icur := OriginalRow227TriangleData1512.coefficient121_233,
    output := OriginalRow227TriangleData1521.coefficient122_233, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_235, Icur := OriginalRow227TriangleData1512.coefficient121_234,
    output := OriginalRow227TriangleData1521.coefficient122_234, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_236, Icur := OriginalRow227TriangleData1512.coefficient121_235,
    output := OriginalRow227TriangleData1521.coefficient122_235, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_237, Icur := OriginalRow227TriangleData1512.coefficient121_236,
    output := OriginalRow227TriangleData1521.coefficient122_236, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_238, Icur := OriginalRow227TriangleData1512.coefficient121_237,
    output := OriginalRow227TriangleData1521.coefficient122_237, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_239, Icur := OriginalRow227TriangleData1512.coefficient121_238,
    output := OriginalRow227TriangleData1521.coefficient122_238, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_240, Icur := OriginalRow227TriangleData1512.coefficient121_239,
    output := OriginalRow227TriangleData1521.coefficient122_239, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_241, Icur := OriginalRow227TriangleData1512.coefficient121_240,
    output := OriginalRow227TriangleData1521.coefficient122_240, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_242, Icur := OriginalRow227TriangleData1512.coefficient121_241,
    output := OriginalRow227TriangleData1521.coefficient122_241, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_243, Icur := OriginalRow227TriangleData1512.coefficient121_242,
    output := OriginalRow227TriangleData1521.coefficient122_242, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_244, Icur := OriginalRow227TriangleData1512.coefficient121_243,
    output := OriginalRow227TriangleData1521.coefficient122_243, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_245, Icur := OriginalRow227TriangleData1512.coefficient121_244,
    output := OriginalRow227TriangleData1521.coefficient122_244, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_246, Icur := OriginalRow227TriangleData1512.coefficient121_245,
    output := OriginalRow227TriangleData1521.coefficient122_245, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1512.coefficient121_247, Icur := OriginalRow227TriangleData1512.coefficient121_246,
    output := OriginalRow227TriangleData1521.coefficient122_246, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1513.coefficient121_248, Icur := OriginalRow227TriangleData1512.coefficient121_247,
    output := OriginalRow227TriangleData1521.coefficient122_247, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root122,
    Inext := OriginalRow227TriangleData1513.coefficient121_249, Icur := OriginalRow227TriangleData1513.coefficient121_248,
    output := OriginalRow227TriangleData1521.coefficient122_248, hC := OriginalRow227TriangleRoots03.root122_pos, hAC := OriginalRow227TriangleRoots03.product122_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1505

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1505.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
