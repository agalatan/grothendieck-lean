import Grothe.UpperChaos.OriginalRow227TriangleData1743
import Grothe.UpperChaos.OriginalRow227TriangleData1744
import Grothe.UpperChaos.OriginalRow227TriangleData1750
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1734
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_216, Icur := OriginalRow227TriangleData1743.coefficient151_215,
    output := OriginalRow227TriangleData1750.coefficient152_215, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_217, Icur := OriginalRow227TriangleData1743.coefficient151_216,
    output := OriginalRow227TriangleData1750.coefficient152_216, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_218, Icur := OriginalRow227TriangleData1743.coefficient151_217,
    output := OriginalRow227TriangleData1750.coefficient152_217, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_219, Icur := OriginalRow227TriangleData1743.coefficient151_218,
    output := OriginalRow227TriangleData1750.coefficient152_218, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_220, Icur := OriginalRow227TriangleData1743.coefficient151_219,
    output := OriginalRow227TriangleData1750.coefficient152_219, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_221, Icur := OriginalRow227TriangleData1743.coefficient151_220,
    output := OriginalRow227TriangleData1750.coefficient152_220, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_222, Icur := OriginalRow227TriangleData1743.coefficient151_221,
    output := OriginalRow227TriangleData1750.coefficient152_221, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_223, Icur := OriginalRow227TriangleData1743.coefficient151_222,
    output := OriginalRow227TriangleData1750.coefficient152_222, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_224, Icur := OriginalRow227TriangleData1743.coefficient151_223,
    output := OriginalRow227TriangleData1750.coefficient152_223, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_225, Icur := OriginalRow227TriangleData1743.coefficient151_224,
    output := OriginalRow227TriangleData1750.coefficient152_224, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_226, Icur := OriginalRow227TriangleData1743.coefficient151_225,
    output := OriginalRow227TriangleData1750.coefficient152_225, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_227, Icur := OriginalRow227TriangleData1743.coefficient151_226,
    output := OriginalRow227TriangleData1750.coefficient152_226, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_228, Icur := OriginalRow227TriangleData1743.coefficient151_227,
    output := OriginalRow227TriangleData1750.coefficient152_227, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_229, Icur := OriginalRow227TriangleData1743.coefficient151_228,
    output := OriginalRow227TriangleData1750.coefficient152_228, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_230, Icur := OriginalRow227TriangleData1743.coefficient151_229,
    output := OriginalRow227TriangleData1750.coefficient152_229, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_231, Icur := OriginalRow227TriangleData1743.coefficient151_230,
    output := OriginalRow227TriangleData1750.coefficient152_230, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_232, Icur := OriginalRow227TriangleData1743.coefficient151_231,
    output := OriginalRow227TriangleData1750.coefficient152_231, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_233, Icur := OriginalRow227TriangleData1743.coefficient151_232,
    output := OriginalRow227TriangleData1750.coefficient152_232, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_234, Icur := OriginalRow227TriangleData1743.coefficient151_233,
    output := OriginalRow227TriangleData1750.coefficient152_233, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_235, Icur := OriginalRow227TriangleData1743.coefficient151_234,
    output := OriginalRow227TriangleData1750.coefficient152_234, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_236, Icur := OriginalRow227TriangleData1743.coefficient151_235,
    output := OriginalRow227TriangleData1750.coefficient152_235, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_237, Icur := OriginalRow227TriangleData1743.coefficient151_236,
    output := OriginalRow227TriangleData1750.coefficient152_236, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_238, Icur := OriginalRow227TriangleData1743.coefficient151_237,
    output := OriginalRow227TriangleData1750.coefficient152_237, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_239, Icur := OriginalRow227TriangleData1743.coefficient151_238,
    output := OriginalRow227TriangleData1750.coefficient152_238, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_240, Icur := OriginalRow227TriangleData1743.coefficient151_239,
    output := OriginalRow227TriangleData1750.coefficient152_239, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_241, Icur := OriginalRow227TriangleData1743.coefficient151_240,
    output := OriginalRow227TriangleData1750.coefficient152_240, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_242, Icur := OriginalRow227TriangleData1743.coefficient151_241,
    output := OriginalRow227TriangleData1750.coefficient152_241, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_243, Icur := OriginalRow227TriangleData1743.coefficient151_242,
    output := OriginalRow227TriangleData1750.coefficient152_242, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_244, Icur := OriginalRow227TriangleData1743.coefficient151_243,
    output := OriginalRow227TriangleData1750.coefficient152_243, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1743.coefficient151_245, Icur := OriginalRow227TriangleData1743.coefficient151_244,
    output := OriginalRow227TriangleData1750.coefficient152_244, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_246, Icur := OriginalRow227TriangleData1743.coefficient151_245,
    output := OriginalRow227TriangleData1750.coefficient152_245, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_247, Icur := OriginalRow227TriangleData1744.coefficient151_246,
    output := OriginalRow227TriangleData1750.coefficient152_246, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1734

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1734.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
