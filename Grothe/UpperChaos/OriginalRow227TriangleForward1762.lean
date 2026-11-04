import Grothe.UpperChaos.OriginalRow227TriangleData1771
import Grothe.UpperChaos.OriginalRow227TriangleData1772
import Grothe.UpperChaos.OriginalRow227TriangleData1778
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1762
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_220, Icur := OriginalRow227TriangleData1771.coefficient155_219,
    output := OriginalRow227TriangleData1778.coefficient156_219, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_221, Icur := OriginalRow227TriangleData1771.coefficient155_220,
    output := OriginalRow227TriangleData1778.coefficient156_220, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_222, Icur := OriginalRow227TriangleData1771.coefficient155_221,
    output := OriginalRow227TriangleData1778.coefficient156_221, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_223, Icur := OriginalRow227TriangleData1771.coefficient155_222,
    output := OriginalRow227TriangleData1778.coefficient156_222, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_224, Icur := OriginalRow227TriangleData1771.coefficient155_223,
    output := OriginalRow227TriangleData1778.coefficient156_223, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_225, Icur := OriginalRow227TriangleData1771.coefficient155_224,
    output := OriginalRow227TriangleData1778.coefficient156_224, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_226, Icur := OriginalRow227TriangleData1771.coefficient155_225,
    output := OriginalRow227TriangleData1778.coefficient156_225, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_227, Icur := OriginalRow227TriangleData1771.coefficient155_226,
    output := OriginalRow227TriangleData1778.coefficient156_226, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_228, Icur := OriginalRow227TriangleData1771.coefficient155_227,
    output := OriginalRow227TriangleData1778.coefficient156_227, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_229, Icur := OriginalRow227TriangleData1771.coefficient155_228,
    output := OriginalRow227TriangleData1778.coefficient156_228, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_230, Icur := OriginalRow227TriangleData1771.coefficient155_229,
    output := OriginalRow227TriangleData1778.coefficient156_229, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_231, Icur := OriginalRow227TriangleData1771.coefficient155_230,
    output := OriginalRow227TriangleData1778.coefficient156_230, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_232, Icur := OriginalRow227TriangleData1771.coefficient155_231,
    output := OriginalRow227TriangleData1778.coefficient156_231, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_233, Icur := OriginalRow227TriangleData1771.coefficient155_232,
    output := OriginalRow227TriangleData1778.coefficient156_232, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_234, Icur := OriginalRow227TriangleData1771.coefficient155_233,
    output := OriginalRow227TriangleData1778.coefficient156_233, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_235, Icur := OriginalRow227TriangleData1771.coefficient155_234,
    output := OriginalRow227TriangleData1778.coefficient156_234, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_236, Icur := OriginalRow227TriangleData1771.coefficient155_235,
    output := OriginalRow227TriangleData1778.coefficient156_235, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_237, Icur := OriginalRow227TriangleData1771.coefficient155_236,
    output := OriginalRow227TriangleData1778.coefficient156_236, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_238, Icur := OriginalRow227TriangleData1771.coefficient155_237,
    output := OriginalRow227TriangleData1778.coefficient156_237, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_239, Icur := OriginalRow227TriangleData1771.coefficient155_238,
    output := OriginalRow227TriangleData1778.coefficient156_238, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_240, Icur := OriginalRow227TriangleData1771.coefficient155_239,
    output := OriginalRow227TriangleData1778.coefficient156_239, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_241, Icur := OriginalRow227TriangleData1771.coefficient155_240,
    output := OriginalRow227TriangleData1778.coefficient156_240, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_242, Icur := OriginalRow227TriangleData1771.coefficient155_241,
    output := OriginalRow227TriangleData1778.coefficient156_241, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_243, Icur := OriginalRow227TriangleData1771.coefficient155_242,
    output := OriginalRow227TriangleData1778.coefficient156_242, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_244, Icur := OriginalRow227TriangleData1771.coefficient155_243,
    output := OriginalRow227TriangleData1778.coefficient156_243, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_245, Icur := OriginalRow227TriangleData1771.coefficient155_244,
    output := OriginalRow227TriangleData1778.coefficient156_244, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_246, Icur := OriginalRow227TriangleData1771.coefficient155_245,
    output := OriginalRow227TriangleData1778.coefficient156_245, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_247, Icur := OriginalRow227TriangleData1771.coefficient155_246,
    output := OriginalRow227TriangleData1778.coefficient156_246, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_248, Icur := OriginalRow227TriangleData1771.coefficient155_247,
    output := OriginalRow227TriangleData1778.coefficient156_247, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_249, Icur := OriginalRow227TriangleData1771.coefficient155_248,
    output := OriginalRow227TriangleData1778.coefficient156_248, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_250, Icur := OriginalRow227TriangleData1771.coefficient155_249,
    output := OriginalRow227TriangleData1778.coefficient156_249, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1772.coefficient155_251, Icur := OriginalRow227TriangleData1772.coefficient155_250,
    output := OriginalRow227TriangleData1778.coefficient156_250, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1762

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1762.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
