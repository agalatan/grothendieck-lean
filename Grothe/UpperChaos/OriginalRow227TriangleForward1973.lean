import Grothe.UpperChaos.OriginalRow227TriangleData1985
import Grothe.UpperChaos.OriginalRow227TriangleData1986
import Grothe.UpperChaos.OriginalRow227TriangleData1989
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1973
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_229, Icur := OriginalRow227TriangleData1985.coefficient196_228,
    output := OriginalRow227TriangleData1989.coefficient197_228, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_230, Icur := OriginalRow227TriangleData1985.coefficient196_229,
    output := OriginalRow227TriangleData1989.coefficient197_229, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_231, Icur := OriginalRow227TriangleData1985.coefficient196_230,
    output := OriginalRow227TriangleData1989.coefficient197_230, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_232, Icur := OriginalRow227TriangleData1985.coefficient196_231,
    output := OriginalRow227TriangleData1989.coefficient197_231, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_233, Icur := OriginalRow227TriangleData1985.coefficient196_232,
    output := OriginalRow227TriangleData1989.coefficient197_232, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_234, Icur := OriginalRow227TriangleData1985.coefficient196_233,
    output := OriginalRow227TriangleData1989.coefficient197_233, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_235, Icur := OriginalRow227TriangleData1985.coefficient196_234,
    output := OriginalRow227TriangleData1989.coefficient197_234, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_236, Icur := OriginalRow227TriangleData1985.coefficient196_235,
    output := OriginalRow227TriangleData1989.coefficient197_235, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_237, Icur := OriginalRow227TriangleData1985.coefficient196_236,
    output := OriginalRow227TriangleData1989.coefficient197_236, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_238, Icur := OriginalRow227TriangleData1985.coefficient196_237,
    output := OriginalRow227TriangleData1989.coefficient197_237, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_239, Icur := OriginalRow227TriangleData1985.coefficient196_238,
    output := OriginalRow227TriangleData1989.coefficient197_238, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_240, Icur := OriginalRow227TriangleData1985.coefficient196_239,
    output := OriginalRow227TriangleData1989.coefficient197_239, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_241, Icur := OriginalRow227TriangleData1985.coefficient196_240,
    output := OriginalRow227TriangleData1989.coefficient197_240, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_242, Icur := OriginalRow227TriangleData1985.coefficient196_241,
    output := OriginalRow227TriangleData1989.coefficient197_241, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_243, Icur := OriginalRow227TriangleData1985.coefficient196_242,
    output := OriginalRow227TriangleData1989.coefficient197_242, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_244, Icur := OriginalRow227TriangleData1985.coefficient196_243,
    output := OriginalRow227TriangleData1989.coefficient197_243, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_245, Icur := OriginalRow227TriangleData1985.coefficient196_244,
    output := OriginalRow227TriangleData1989.coefficient197_244, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_246, Icur := OriginalRow227TriangleData1985.coefficient196_245,
    output := OriginalRow227TriangleData1989.coefficient197_245, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_247, Icur := OriginalRow227TriangleData1985.coefficient196_246,
    output := OriginalRow227TriangleData1989.coefficient197_246, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_248, Icur := OriginalRow227TriangleData1985.coefficient196_247,
    output := OriginalRow227TriangleData1989.coefficient197_247, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_249, Icur := OriginalRow227TriangleData1985.coefficient196_248,
    output := OriginalRow227TriangleData1989.coefficient197_248, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_250, Icur := OriginalRow227TriangleData1985.coefficient196_249,
    output := OriginalRow227TriangleData1989.coefficient197_249, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_251, Icur := OriginalRow227TriangleData1985.coefficient196_250,
    output := OriginalRow227TriangleData1989.coefficient197_250, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_252, Icur := OriginalRow227TriangleData1985.coefficient196_251,
    output := OriginalRow227TriangleData1989.coefficient197_251, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_253, Icur := OriginalRow227TriangleData1985.coefficient196_252,
    output := OriginalRow227TriangleData1989.coefficient197_252, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_254, Icur := OriginalRow227TriangleData1985.coefficient196_253,
    output := OriginalRow227TriangleData1989.coefficient197_253, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_255, Icur := OriginalRow227TriangleData1985.coefficient196_254,
    output := OriginalRow227TriangleData1989.coefficient197_254, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_256, Icur := OriginalRow227TriangleData1985.coefficient196_255,
    output := OriginalRow227TriangleData1989.coefficient197_255, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_257, Icur := OriginalRow227TriangleData1985.coefficient196_256,
    output := OriginalRow227TriangleData1989.coefficient197_256, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1985.coefficient196_258, Icur := OriginalRow227TriangleData1985.coefficient196_257,
    output := OriginalRow227TriangleData1989.coefficient197_257, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_259, Icur := OriginalRow227TriangleData1985.coefficient196_258,
    output := OriginalRow227TriangleData1989.coefficient197_258, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root197,
    Inext := OriginalRow227TriangleData1986.coefficient196_260, Icur := OriginalRow227TriangleData1986.coefficient196_259,
    output := OriginalRow227TriangleData1989.coefficient197_259, hC := OriginalRow227TriangleRoots06.root197_pos, hAC := OriginalRow227TriangleRoots06.product197_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1973

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1973.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
