import Grothe.UpperChaos.OriginalRow227TriangleData1579
import Grothe.UpperChaos.OriginalRow227TriangleData1580
import Grothe.UpperChaos.OriginalRow227TriangleData1587
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1571
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_226, Icur := OriginalRow227TriangleData1579.coefficient129_225,
    output := OriginalRow227TriangleData1587.coefficient130_225, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_227, Icur := OriginalRow227TriangleData1579.coefficient129_226,
    output := OriginalRow227TriangleData1587.coefficient130_226, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_228, Icur := OriginalRow227TriangleData1579.coefficient129_227,
    output := OriginalRow227TriangleData1587.coefficient130_227, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_229, Icur := OriginalRow227TriangleData1579.coefficient129_228,
    output := OriginalRow227TriangleData1587.coefficient130_228, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_230, Icur := OriginalRow227TriangleData1579.coefficient129_229,
    output := OriginalRow227TriangleData1587.coefficient130_229, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_231, Icur := OriginalRow227TriangleData1579.coefficient129_230,
    output := OriginalRow227TriangleData1587.coefficient130_230, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_232, Icur := OriginalRow227TriangleData1579.coefficient129_231,
    output := OriginalRow227TriangleData1587.coefficient130_231, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_233, Icur := OriginalRow227TriangleData1579.coefficient129_232,
    output := OriginalRow227TriangleData1587.coefficient130_232, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_234, Icur := OriginalRow227TriangleData1579.coefficient129_233,
    output := OriginalRow227TriangleData1587.coefficient130_233, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_235, Icur := OriginalRow227TriangleData1579.coefficient129_234,
    output := OriginalRow227TriangleData1587.coefficient130_234, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_236, Icur := OriginalRow227TriangleData1579.coefficient129_235,
    output := OriginalRow227TriangleData1587.coefficient130_235, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_237, Icur := OriginalRow227TriangleData1579.coefficient129_236,
    output := OriginalRow227TriangleData1587.coefficient130_236, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_238, Icur := OriginalRow227TriangleData1579.coefficient129_237,
    output := OriginalRow227TriangleData1587.coefficient130_237, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_239, Icur := OriginalRow227TriangleData1579.coefficient129_238,
    output := OriginalRow227TriangleData1587.coefficient130_238, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_240, Icur := OriginalRow227TriangleData1579.coefficient129_239,
    output := OriginalRow227TriangleData1587.coefficient130_239, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_241, Icur := OriginalRow227TriangleData1579.coefficient129_240,
    output := OriginalRow227TriangleData1587.coefficient130_240, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_242, Icur := OriginalRow227TriangleData1579.coefficient129_241,
    output := OriginalRow227TriangleData1587.coefficient130_241, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_243, Icur := OriginalRow227TriangleData1579.coefficient129_242,
    output := OriginalRow227TriangleData1587.coefficient130_242, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_244, Icur := OriginalRow227TriangleData1579.coefficient129_243,
    output := OriginalRow227TriangleData1587.coefficient130_243, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_245, Icur := OriginalRow227TriangleData1579.coefficient129_244,
    output := OriginalRow227TriangleData1587.coefficient130_244, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_246, Icur := OriginalRow227TriangleData1579.coefficient129_245,
    output := OriginalRow227TriangleData1587.coefficient130_245, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_247, Icur := OriginalRow227TriangleData1579.coefficient129_246,
    output := OriginalRow227TriangleData1587.coefficient130_246, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_248, Icur := OriginalRow227TriangleData1579.coefficient129_247,
    output := OriginalRow227TriangleData1587.coefficient130_247, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_249, Icur := OriginalRow227TriangleData1579.coefficient129_248,
    output := OriginalRow227TriangleData1587.coefficient130_248, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_250, Icur := OriginalRow227TriangleData1579.coefficient129_249,
    output := OriginalRow227TriangleData1587.coefficient130_249, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_251, Icur := OriginalRow227TriangleData1579.coefficient129_250,
    output := OriginalRow227TriangleData1587.coefficient130_250, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_252, Icur := OriginalRow227TriangleData1579.coefficient129_251,
    output := OriginalRow227TriangleData1587.coefficient130_251, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_253, Icur := OriginalRow227TriangleData1579.coefficient129_252,
    output := OriginalRow227TriangleData1587.coefficient130_252, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_254, Icur := OriginalRow227TriangleData1579.coefficient129_253,
    output := OriginalRow227TriangleData1587.coefficient130_253, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1579.coefficient129_255, Icur := OriginalRow227TriangleData1579.coefficient129_254,
    output := OriginalRow227TriangleData1587.coefficient130_254, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1580.coefficient129_256, Icur := OriginalRow227TriangleData1579.coefficient129_255,
    output := OriginalRow227TriangleData1587.coefficient130_255, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1580.coefficient129_257, Icur := OriginalRow227TriangleData1580.coefficient129_256,
    output := OriginalRow227TriangleData1587.coefficient130_256, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1571

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1571.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
