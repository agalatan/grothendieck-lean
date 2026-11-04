import Grothe.UpperChaos.OriginalRow227TriangleData2043
import Grothe.UpperChaos.OriginalRow227TriangleData2044
import Grothe.UpperChaos.OriginalRow227TriangleData2046
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2030
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_214, Icur := OriginalRow227TriangleData2043.coefficient213_213,
    output := OriginalRow227TriangleData2046.coefficient214_213, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_215, Icur := OriginalRow227TriangleData2043.coefficient213_214,
    output := OriginalRow227TriangleData2046.coefficient214_214, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_216, Icur := OriginalRow227TriangleData2043.coefficient213_215,
    output := OriginalRow227TriangleData2046.coefficient214_215, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_217, Icur := OriginalRow227TriangleData2043.coefficient213_216,
    output := OriginalRow227TriangleData2046.coefficient214_216, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_218, Icur := OriginalRow227TriangleData2043.coefficient213_217,
    output := OriginalRow227TriangleData2046.coefficient214_217, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_219, Icur := OriginalRow227TriangleData2043.coefficient213_218,
    output := OriginalRow227TriangleData2046.coefficient214_218, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_220, Icur := OriginalRow227TriangleData2043.coefficient213_219,
    output := OriginalRow227TriangleData2046.coefficient214_219, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_221, Icur := OriginalRow227TriangleData2043.coefficient213_220,
    output := OriginalRow227TriangleData2046.coefficient214_220, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_222, Icur := OriginalRow227TriangleData2043.coefficient213_221,
    output := OriginalRow227TriangleData2046.coefficient214_221, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_223, Icur := OriginalRow227TriangleData2043.coefficient213_222,
    output := OriginalRow227TriangleData2046.coefficient214_222, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_224, Icur := OriginalRow227TriangleData2043.coefficient213_223,
    output := OriginalRow227TriangleData2046.coefficient214_223, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_225, Icur := OriginalRow227TriangleData2043.coefficient213_224,
    output := OriginalRow227TriangleData2046.coefficient214_224, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_226, Icur := OriginalRow227TriangleData2043.coefficient213_225,
    output := OriginalRow227TriangleData2046.coefficient214_225, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_227, Icur := OriginalRow227TriangleData2043.coefficient213_226,
    output := OriginalRow227TriangleData2046.coefficient214_226, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_228, Icur := OriginalRow227TriangleData2043.coefficient213_227,
    output := OriginalRow227TriangleData2046.coefficient214_227, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_229, Icur := OriginalRow227TriangleData2043.coefficient213_228,
    output := OriginalRow227TriangleData2046.coefficient214_228, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_230, Icur := OriginalRow227TriangleData2043.coefficient213_229,
    output := OriginalRow227TriangleData2046.coefficient214_229, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_231, Icur := OriginalRow227TriangleData2043.coefficient213_230,
    output := OriginalRow227TriangleData2046.coefficient214_230, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_232, Icur := OriginalRow227TriangleData2043.coefficient213_231,
    output := OriginalRow227TriangleData2046.coefficient214_231, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_233, Icur := OriginalRow227TriangleData2043.coefficient213_232,
    output := OriginalRow227TriangleData2046.coefficient214_232, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_234, Icur := OriginalRow227TriangleData2043.coefficient213_233,
    output := OriginalRow227TriangleData2046.coefficient214_233, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_235, Icur := OriginalRow227TriangleData2043.coefficient213_234,
    output := OriginalRow227TriangleData2046.coefficient214_234, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_236, Icur := OriginalRow227TriangleData2043.coefficient213_235,
    output := OriginalRow227TriangleData2046.coefficient214_235, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_237, Icur := OriginalRow227TriangleData2043.coefficient213_236,
    output := OriginalRow227TriangleData2046.coefficient214_236, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_238, Icur := OriginalRow227TriangleData2043.coefficient213_237,
    output := OriginalRow227TriangleData2046.coefficient214_237, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_239, Icur := OriginalRow227TriangleData2043.coefficient213_238,
    output := OriginalRow227TriangleData2046.coefficient214_238, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_240, Icur := OriginalRow227TriangleData2043.coefficient213_239,
    output := OriginalRow227TriangleData2046.coefficient214_239, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_241, Icur := OriginalRow227TriangleData2043.coefficient213_240,
    output := OriginalRow227TriangleData2046.coefficient214_240, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_242, Icur := OriginalRow227TriangleData2043.coefficient213_241,
    output := OriginalRow227TriangleData2046.coefficient214_241, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2043.coefficient213_243, Icur := OriginalRow227TriangleData2043.coefficient213_242,
    output := OriginalRow227TriangleData2046.coefficient214_242, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2044.coefficient213_244, Icur := OriginalRow227TriangleData2043.coefficient213_243,
    output := OriginalRow227TriangleData2046.coefficient214_243, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root214,
    Inext := OriginalRow227TriangleData2044.coefficient213_245, Icur := OriginalRow227TriangleData2044.coefficient213_244,
    output := OriginalRow227TriangleData2046.coefficient214_244, hC := OriginalRow227TriangleRoots06.root214_pos, hAC := OriginalRow227TriangleRoots06.product214_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2030

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2030.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
