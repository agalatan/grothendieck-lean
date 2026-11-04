import Grothe.UpperChaos.OriginalRow227TriangleData0620
import Grothe.UpperChaos.OriginalRow227TriangleData0621
import Grothe.UpperChaos.OriginalRow227TriangleData0634
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0618
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_234, Icur := OriginalRow227TriangleData0620.coefficient41_233,
    output := OriginalRow227TriangleData0634.coefficient42_233, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_235, Icur := OriginalRow227TriangleData0620.coefficient41_234,
    output := OriginalRow227TriangleData0634.coefficient42_234, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_236, Icur := OriginalRow227TriangleData0620.coefficient41_235,
    output := OriginalRow227TriangleData0634.coefficient42_235, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_237, Icur := OriginalRow227TriangleData0620.coefficient41_236,
    output := OriginalRow227TriangleData0634.coefficient42_236, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_238, Icur := OriginalRow227TriangleData0620.coefficient41_237,
    output := OriginalRow227TriangleData0634.coefficient42_237, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_239, Icur := OriginalRow227TriangleData0620.coefficient41_238,
    output := OriginalRow227TriangleData0634.coefficient42_238, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_240, Icur := OriginalRow227TriangleData0620.coefficient41_239,
    output := OriginalRow227TriangleData0634.coefficient42_239, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_241, Icur := OriginalRow227TriangleData0620.coefficient41_240,
    output := OriginalRow227TriangleData0634.coefficient42_240, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_242, Icur := OriginalRow227TriangleData0620.coefficient41_241,
    output := OriginalRow227TriangleData0634.coefficient42_241, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_243, Icur := OriginalRow227TriangleData0620.coefficient41_242,
    output := OriginalRow227TriangleData0634.coefficient42_242, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_244, Icur := OriginalRow227TriangleData0620.coefficient41_243,
    output := OriginalRow227TriangleData0634.coefficient42_243, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_245, Icur := OriginalRow227TriangleData0620.coefficient41_244,
    output := OriginalRow227TriangleData0634.coefficient42_244, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_246, Icur := OriginalRow227TriangleData0620.coefficient41_245,
    output := OriginalRow227TriangleData0634.coefficient42_245, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_247, Icur := OriginalRow227TriangleData0620.coefficient41_246,
    output := OriginalRow227TriangleData0634.coefficient42_246, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_248, Icur := OriginalRow227TriangleData0620.coefficient41_247,
    output := OriginalRow227TriangleData0634.coefficient42_247, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_249, Icur := OriginalRow227TriangleData0620.coefficient41_248,
    output := OriginalRow227TriangleData0634.coefficient42_248, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_250, Icur := OriginalRow227TriangleData0620.coefficient41_249,
    output := OriginalRow227TriangleData0634.coefficient42_249, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_251, Icur := OriginalRow227TriangleData0620.coefficient41_250,
    output := OriginalRow227TriangleData0634.coefficient42_250, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_252, Icur := OriginalRow227TriangleData0620.coefficient41_251,
    output := OriginalRow227TriangleData0634.coefficient42_251, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_253, Icur := OriginalRow227TriangleData0620.coefficient41_252,
    output := OriginalRow227TriangleData0634.coefficient42_252, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_254, Icur := OriginalRow227TriangleData0620.coefficient41_253,
    output := OriginalRow227TriangleData0634.coefficient42_253, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_255, Icur := OriginalRow227TriangleData0620.coefficient41_254,
    output := OriginalRow227TriangleData0634.coefficient42_254, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_256, Icur := OriginalRow227TriangleData0620.coefficient41_255,
    output := OriginalRow227TriangleData0634.coefficient42_255, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_257, Icur := OriginalRow227TriangleData0620.coefficient41_256,
    output := OriginalRow227TriangleData0634.coefficient42_256, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_258, Icur := OriginalRow227TriangleData0620.coefficient41_257,
    output := OriginalRow227TriangleData0634.coefficient42_257, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_259, Icur := OriginalRow227TriangleData0620.coefficient41_258,
    output := OriginalRow227TriangleData0634.coefficient42_258, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_260, Icur := OriginalRow227TriangleData0620.coefficient41_259,
    output := OriginalRow227TriangleData0634.coefficient42_259, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_261, Icur := OriginalRow227TriangleData0620.coefficient41_260,
    output := OriginalRow227TriangleData0634.coefficient42_260, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_262, Icur := OriginalRow227TriangleData0620.coefficient41_261,
    output := OriginalRow227TriangleData0634.coefficient42_261, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0620.coefficient41_263, Icur := OriginalRow227TriangleData0620.coefficient41_262,
    output := OriginalRow227TriangleData0634.coefficient42_262, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0621.coefficient41_264, Icur := OriginalRow227TriangleData0620.coefficient41_263,
    output := OriginalRow227TriangleData0634.coefficient42_263, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0621.coefficient41_265, Icur := OriginalRow227TriangleData0621.coefficient41_264,
    output := OriginalRow227TriangleData0634.coefficient42_264, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0618

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0618.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
