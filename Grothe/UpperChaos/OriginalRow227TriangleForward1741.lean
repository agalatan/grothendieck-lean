import Grothe.UpperChaos.OriginalRow227TriangleData1750
import Grothe.UpperChaos.OriginalRow227TriangleData1751
import Grothe.UpperChaos.OriginalRow227TriangleData1757
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1741
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_217, Icur := OriginalRow227TriangleData1750.coefficient152_216,
    output := OriginalRow227TriangleData1757.coefficient153_216, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_218, Icur := OriginalRow227TriangleData1750.coefficient152_217,
    output := OriginalRow227TriangleData1757.coefficient153_217, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_219, Icur := OriginalRow227TriangleData1750.coefficient152_218,
    output := OriginalRow227TriangleData1757.coefficient153_218, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_220, Icur := OriginalRow227TriangleData1750.coefficient152_219,
    output := OriginalRow227TriangleData1757.coefficient153_219, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_221, Icur := OriginalRow227TriangleData1750.coefficient152_220,
    output := OriginalRow227TriangleData1757.coefficient153_220, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_222, Icur := OriginalRow227TriangleData1750.coefficient152_221,
    output := OriginalRow227TriangleData1757.coefficient153_221, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_223, Icur := OriginalRow227TriangleData1750.coefficient152_222,
    output := OriginalRow227TriangleData1757.coefficient153_222, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_224, Icur := OriginalRow227TriangleData1750.coefficient152_223,
    output := OriginalRow227TriangleData1757.coefficient153_223, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_225, Icur := OriginalRow227TriangleData1750.coefficient152_224,
    output := OriginalRow227TriangleData1757.coefficient153_224, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_226, Icur := OriginalRow227TriangleData1750.coefficient152_225,
    output := OriginalRow227TriangleData1757.coefficient153_225, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_227, Icur := OriginalRow227TriangleData1750.coefficient152_226,
    output := OriginalRow227TriangleData1757.coefficient153_226, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_228, Icur := OriginalRow227TriangleData1750.coefficient152_227,
    output := OriginalRow227TriangleData1757.coefficient153_227, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_229, Icur := OriginalRow227TriangleData1750.coefficient152_228,
    output := OriginalRow227TriangleData1757.coefficient153_228, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_230, Icur := OriginalRow227TriangleData1750.coefficient152_229,
    output := OriginalRow227TriangleData1757.coefficient153_229, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_231, Icur := OriginalRow227TriangleData1750.coefficient152_230,
    output := OriginalRow227TriangleData1757.coefficient153_230, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_232, Icur := OriginalRow227TriangleData1750.coefficient152_231,
    output := OriginalRow227TriangleData1757.coefficient153_231, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_233, Icur := OriginalRow227TriangleData1750.coefficient152_232,
    output := OriginalRow227TriangleData1757.coefficient153_232, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_234, Icur := OriginalRow227TriangleData1750.coefficient152_233,
    output := OriginalRow227TriangleData1757.coefficient153_233, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_235, Icur := OriginalRow227TriangleData1750.coefficient152_234,
    output := OriginalRow227TriangleData1757.coefficient153_234, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_236, Icur := OriginalRow227TriangleData1750.coefficient152_235,
    output := OriginalRow227TriangleData1757.coefficient153_235, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_237, Icur := OriginalRow227TriangleData1750.coefficient152_236,
    output := OriginalRow227TriangleData1757.coefficient153_236, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_238, Icur := OriginalRow227TriangleData1750.coefficient152_237,
    output := OriginalRow227TriangleData1757.coefficient153_237, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_239, Icur := OriginalRow227TriangleData1750.coefficient152_238,
    output := OriginalRow227TriangleData1757.coefficient153_238, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_240, Icur := OriginalRow227TriangleData1750.coefficient152_239,
    output := OriginalRow227TriangleData1757.coefficient153_239, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_241, Icur := OriginalRow227TriangleData1750.coefficient152_240,
    output := OriginalRow227TriangleData1757.coefficient153_240, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_242, Icur := OriginalRow227TriangleData1750.coefficient152_241,
    output := OriginalRow227TriangleData1757.coefficient153_241, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_243, Icur := OriginalRow227TriangleData1750.coefficient152_242,
    output := OriginalRow227TriangleData1757.coefficient153_242, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_244, Icur := OriginalRow227TriangleData1750.coefficient152_243,
    output := OriginalRow227TriangleData1757.coefficient153_243, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_245, Icur := OriginalRow227TriangleData1750.coefficient152_244,
    output := OriginalRow227TriangleData1757.coefficient153_244, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1750.coefficient152_246, Icur := OriginalRow227TriangleData1750.coefficient152_245,
    output := OriginalRow227TriangleData1757.coefficient153_245, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1751.coefficient152_247, Icur := OriginalRow227TriangleData1750.coefficient152_246,
    output := OriginalRow227TriangleData1757.coefficient153_246, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1751.coefficient152_248, Icur := OriginalRow227TriangleData1751.coefficient152_247,
    output := OriginalRow227TriangleData1757.coefficient153_247, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1741

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1741.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
