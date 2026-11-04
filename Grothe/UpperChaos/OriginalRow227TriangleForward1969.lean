import Grothe.UpperChaos.OriginalRow227TriangleData1981
import Grothe.UpperChaos.OriginalRow227TriangleData1982
import Grothe.UpperChaos.OriginalRow227TriangleData1985
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1969
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_228, Icur := OriginalRow227TriangleData1981.coefficient195_227,
    output := OriginalRow227TriangleData1985.coefficient196_227, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_229, Icur := OriginalRow227TriangleData1981.coefficient195_228,
    output := OriginalRow227TriangleData1985.coefficient196_228, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_230, Icur := OriginalRow227TriangleData1981.coefficient195_229,
    output := OriginalRow227TriangleData1985.coefficient196_229, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_231, Icur := OriginalRow227TriangleData1981.coefficient195_230,
    output := OriginalRow227TriangleData1985.coefficient196_230, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_232, Icur := OriginalRow227TriangleData1981.coefficient195_231,
    output := OriginalRow227TriangleData1985.coefficient196_231, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_233, Icur := OriginalRow227TriangleData1981.coefficient195_232,
    output := OriginalRow227TriangleData1985.coefficient196_232, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_234, Icur := OriginalRow227TriangleData1981.coefficient195_233,
    output := OriginalRow227TriangleData1985.coefficient196_233, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_235, Icur := OriginalRow227TriangleData1981.coefficient195_234,
    output := OriginalRow227TriangleData1985.coefficient196_234, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_236, Icur := OriginalRow227TriangleData1981.coefficient195_235,
    output := OriginalRow227TriangleData1985.coefficient196_235, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_237, Icur := OriginalRow227TriangleData1981.coefficient195_236,
    output := OriginalRow227TriangleData1985.coefficient196_236, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_238, Icur := OriginalRow227TriangleData1981.coefficient195_237,
    output := OriginalRow227TriangleData1985.coefficient196_237, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_239, Icur := OriginalRow227TriangleData1981.coefficient195_238,
    output := OriginalRow227TriangleData1985.coefficient196_238, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_240, Icur := OriginalRow227TriangleData1981.coefficient195_239,
    output := OriginalRow227TriangleData1985.coefficient196_239, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_241, Icur := OriginalRow227TriangleData1981.coefficient195_240,
    output := OriginalRow227TriangleData1985.coefficient196_240, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_242, Icur := OriginalRow227TriangleData1981.coefficient195_241,
    output := OriginalRow227TriangleData1985.coefficient196_241, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_243, Icur := OriginalRow227TriangleData1981.coefficient195_242,
    output := OriginalRow227TriangleData1985.coefficient196_242, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_244, Icur := OriginalRow227TriangleData1981.coefficient195_243,
    output := OriginalRow227TriangleData1985.coefficient196_243, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_245, Icur := OriginalRow227TriangleData1981.coefficient195_244,
    output := OriginalRow227TriangleData1985.coefficient196_244, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_246, Icur := OriginalRow227TriangleData1981.coefficient195_245,
    output := OriginalRow227TriangleData1985.coefficient196_245, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_247, Icur := OriginalRow227TriangleData1981.coefficient195_246,
    output := OriginalRow227TriangleData1985.coefficient196_246, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_248, Icur := OriginalRow227TriangleData1981.coefficient195_247,
    output := OriginalRow227TriangleData1985.coefficient196_247, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_249, Icur := OriginalRow227TriangleData1981.coefficient195_248,
    output := OriginalRow227TriangleData1985.coefficient196_248, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_250, Icur := OriginalRow227TriangleData1981.coefficient195_249,
    output := OriginalRow227TriangleData1985.coefficient196_249, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_251, Icur := OriginalRow227TriangleData1981.coefficient195_250,
    output := OriginalRow227TriangleData1985.coefficient196_250, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_252, Icur := OriginalRow227TriangleData1981.coefficient195_251,
    output := OriginalRow227TriangleData1985.coefficient196_251, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_253, Icur := OriginalRow227TriangleData1981.coefficient195_252,
    output := OriginalRow227TriangleData1985.coefficient196_252, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_254, Icur := OriginalRow227TriangleData1981.coefficient195_253,
    output := OriginalRow227TriangleData1985.coefficient196_253, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_255, Icur := OriginalRow227TriangleData1981.coefficient195_254,
    output := OriginalRow227TriangleData1985.coefficient196_254, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_256, Icur := OriginalRow227TriangleData1981.coefficient195_255,
    output := OriginalRow227TriangleData1985.coefficient196_255, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1981.coefficient195_257, Icur := OriginalRow227TriangleData1981.coefficient195_256,
    output := OriginalRow227TriangleData1985.coefficient196_256, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_258, Icur := OriginalRow227TriangleData1981.coefficient195_257,
    output := OriginalRow227TriangleData1985.coefficient196_257, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root196,
    Inext := OriginalRow227TriangleData1982.coefficient195_259, Icur := OriginalRow227TriangleData1982.coefficient195_258,
    output := OriginalRow227TriangleData1985.coefficient196_258, hC := OriginalRow227TriangleRoots06.root196_pos, hAC := OriginalRow227TriangleRoots06.product196_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1969

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1969.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
