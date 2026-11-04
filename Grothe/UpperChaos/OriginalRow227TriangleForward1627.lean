import Grothe.UpperChaos.OriginalRow227TriangleData1635
import Grothe.UpperChaos.OriginalRow227TriangleData1636
import Grothe.UpperChaos.OriginalRow227TriangleData1643
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1627
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_233, Icur := OriginalRow227TriangleData1635.coefficient136_232,
    output := OriginalRow227TriangleData1643.coefficient137_232, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_234, Icur := OriginalRow227TriangleData1635.coefficient136_233,
    output := OriginalRow227TriangleData1643.coefficient137_233, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_235, Icur := OriginalRow227TriangleData1635.coefficient136_234,
    output := OriginalRow227TriangleData1643.coefficient137_234, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_236, Icur := OriginalRow227TriangleData1635.coefficient136_235,
    output := OriginalRow227TriangleData1643.coefficient137_235, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_237, Icur := OriginalRow227TriangleData1635.coefficient136_236,
    output := OriginalRow227TriangleData1643.coefficient137_236, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_238, Icur := OriginalRow227TriangleData1635.coefficient136_237,
    output := OriginalRow227TriangleData1643.coefficient137_237, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_239, Icur := OriginalRow227TriangleData1635.coefficient136_238,
    output := OriginalRow227TriangleData1643.coefficient137_238, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_240, Icur := OriginalRow227TriangleData1635.coefficient136_239,
    output := OriginalRow227TriangleData1643.coefficient137_239, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_241, Icur := OriginalRow227TriangleData1635.coefficient136_240,
    output := OriginalRow227TriangleData1643.coefficient137_240, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_242, Icur := OriginalRow227TriangleData1635.coefficient136_241,
    output := OriginalRow227TriangleData1643.coefficient137_241, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_243, Icur := OriginalRow227TriangleData1635.coefficient136_242,
    output := OriginalRow227TriangleData1643.coefficient137_242, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_244, Icur := OriginalRow227TriangleData1635.coefficient136_243,
    output := OriginalRow227TriangleData1643.coefficient137_243, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_245, Icur := OriginalRow227TriangleData1635.coefficient136_244,
    output := OriginalRow227TriangleData1643.coefficient137_244, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_246, Icur := OriginalRow227TriangleData1635.coefficient136_245,
    output := OriginalRow227TriangleData1643.coefficient137_245, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_247, Icur := OriginalRow227TriangleData1635.coefficient136_246,
    output := OriginalRow227TriangleData1643.coefficient137_246, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_248, Icur := OriginalRow227TriangleData1635.coefficient136_247,
    output := OriginalRow227TriangleData1643.coefficient137_247, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_249, Icur := OriginalRow227TriangleData1635.coefficient136_248,
    output := OriginalRow227TriangleData1643.coefficient137_248, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_250, Icur := OriginalRow227TriangleData1635.coefficient136_249,
    output := OriginalRow227TriangleData1643.coefficient137_249, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_251, Icur := OriginalRow227TriangleData1635.coefficient136_250,
    output := OriginalRow227TriangleData1643.coefficient137_250, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_252, Icur := OriginalRow227TriangleData1635.coefficient136_251,
    output := OriginalRow227TriangleData1643.coefficient137_251, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_253, Icur := OriginalRow227TriangleData1635.coefficient136_252,
    output := OriginalRow227TriangleData1643.coefficient137_252, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_254, Icur := OriginalRow227TriangleData1635.coefficient136_253,
    output := OriginalRow227TriangleData1643.coefficient137_253, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_255, Icur := OriginalRow227TriangleData1635.coefficient136_254,
    output := OriginalRow227TriangleData1643.coefficient137_254, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_256, Icur := OriginalRow227TriangleData1635.coefficient136_255,
    output := OriginalRow227TriangleData1643.coefficient137_255, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_257, Icur := OriginalRow227TriangleData1635.coefficient136_256,
    output := OriginalRow227TriangleData1643.coefficient137_256, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_258, Icur := OriginalRow227TriangleData1635.coefficient136_257,
    output := OriginalRow227TriangleData1643.coefficient137_257, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_259, Icur := OriginalRow227TriangleData1635.coefficient136_258,
    output := OriginalRow227TriangleData1643.coefficient137_258, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_260, Icur := OriginalRow227TriangleData1635.coefficient136_259,
    output := OriginalRow227TriangleData1643.coefficient137_259, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_261, Icur := OriginalRow227TriangleData1635.coefficient136_260,
    output := OriginalRow227TriangleData1643.coefficient137_260, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1635.coefficient136_262, Icur := OriginalRow227TriangleData1635.coefficient136_261,
    output := OriginalRow227TriangleData1643.coefficient137_261, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1636.coefficient136_263, Icur := OriginalRow227TriangleData1635.coefficient136_262,
    output := OriginalRow227TriangleData1643.coefficient137_262, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root137,
    Inext := OriginalRow227TriangleData1636.coefficient136_264, Icur := OriginalRow227TriangleData1636.coefficient136_263,
    output := OriginalRow227TriangleData1643.coefficient137_263, hC := OriginalRow227TriangleRoots04.root137_pos, hAC := OriginalRow227TriangleRoots04.product137_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1627

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1627.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
