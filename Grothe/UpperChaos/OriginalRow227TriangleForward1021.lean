import Grothe.UpperChaos.OriginalRow227TriangleData1025
import Grothe.UpperChaos.OriginalRow227TriangleData1026
import Grothe.UpperChaos.OriginalRow227TriangleData1037
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1021
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_234, Icur := OriginalRow227TriangleData1025.coefficient73_233,
    output := OriginalRow227TriangleData1037.coefficient74_233, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_235, Icur := OriginalRow227TriangleData1025.coefficient73_234,
    output := OriginalRow227TriangleData1037.coefficient74_234, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_236, Icur := OriginalRow227TriangleData1025.coefficient73_235,
    output := OriginalRow227TriangleData1037.coefficient74_235, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_237, Icur := OriginalRow227TriangleData1025.coefficient73_236,
    output := OriginalRow227TriangleData1037.coefficient74_236, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_238, Icur := OriginalRow227TriangleData1025.coefficient73_237,
    output := OriginalRow227TriangleData1037.coefficient74_237, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_239, Icur := OriginalRow227TriangleData1025.coefficient73_238,
    output := OriginalRow227TriangleData1037.coefficient74_238, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_240, Icur := OriginalRow227TriangleData1025.coefficient73_239,
    output := OriginalRow227TriangleData1037.coefficient74_239, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_241, Icur := OriginalRow227TriangleData1025.coefficient73_240,
    output := OriginalRow227TriangleData1037.coefficient74_240, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_242, Icur := OriginalRow227TriangleData1025.coefficient73_241,
    output := OriginalRow227TriangleData1037.coefficient74_241, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_243, Icur := OriginalRow227TriangleData1025.coefficient73_242,
    output := OriginalRow227TriangleData1037.coefficient74_242, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_244, Icur := OriginalRow227TriangleData1025.coefficient73_243,
    output := OriginalRow227TriangleData1037.coefficient74_243, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_245, Icur := OriginalRow227TriangleData1025.coefficient73_244,
    output := OriginalRow227TriangleData1037.coefficient74_244, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_246, Icur := OriginalRow227TriangleData1025.coefficient73_245,
    output := OriginalRow227TriangleData1037.coefficient74_245, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_247, Icur := OriginalRow227TriangleData1025.coefficient73_246,
    output := OriginalRow227TriangleData1037.coefficient74_246, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_248, Icur := OriginalRow227TriangleData1025.coefficient73_247,
    output := OriginalRow227TriangleData1037.coefficient74_247, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_249, Icur := OriginalRow227TriangleData1025.coefficient73_248,
    output := OriginalRow227TriangleData1037.coefficient74_248, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_250, Icur := OriginalRow227TriangleData1025.coefficient73_249,
    output := OriginalRow227TriangleData1037.coefficient74_249, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_251, Icur := OriginalRow227TriangleData1025.coefficient73_250,
    output := OriginalRow227TriangleData1037.coefficient74_250, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_252, Icur := OriginalRow227TriangleData1025.coefficient73_251,
    output := OriginalRow227TriangleData1037.coefficient74_251, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_253, Icur := OriginalRow227TriangleData1025.coefficient73_252,
    output := OriginalRow227TriangleData1037.coefficient74_252, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_254, Icur := OriginalRow227TriangleData1025.coefficient73_253,
    output := OriginalRow227TriangleData1037.coefficient74_253, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_255, Icur := OriginalRow227TriangleData1025.coefficient73_254,
    output := OriginalRow227TriangleData1037.coefficient74_254, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_256, Icur := OriginalRow227TriangleData1025.coefficient73_255,
    output := OriginalRow227TriangleData1037.coefficient74_255, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_257, Icur := OriginalRow227TriangleData1025.coefficient73_256,
    output := OriginalRow227TriangleData1037.coefficient74_256, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_258, Icur := OriginalRow227TriangleData1025.coefficient73_257,
    output := OriginalRow227TriangleData1037.coefficient74_257, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_259, Icur := OriginalRow227TriangleData1025.coefficient73_258,
    output := OriginalRow227TriangleData1037.coefficient74_258, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_260, Icur := OriginalRow227TriangleData1025.coefficient73_259,
    output := OriginalRow227TriangleData1037.coefficient74_259, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_261, Icur := OriginalRow227TriangleData1025.coefficient73_260,
    output := OriginalRow227TriangleData1037.coefficient74_260, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_262, Icur := OriginalRow227TriangleData1025.coefficient73_261,
    output := OriginalRow227TriangleData1037.coefficient74_261, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_263, Icur := OriginalRow227TriangleData1025.coefficient73_262,
    output := OriginalRow227TriangleData1037.coefficient74_262, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1026.coefficient73_264, Icur := OriginalRow227TriangleData1025.coefficient73_263,
    output := OriginalRow227TriangleData1037.coefficient74_263, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1026.coefficient73_265, Icur := OriginalRow227TriangleData1026.coefficient73_264,
    output := OriginalRow227TriangleData1037.coefficient74_264, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1021

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1021.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
