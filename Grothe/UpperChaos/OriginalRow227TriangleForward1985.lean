import Grothe.UpperChaos.OriginalRow227TriangleData1997
import Grothe.UpperChaos.OriginalRow227TriangleData1998
import Grothe.UpperChaos.OriginalRow227TriangleData2001
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1985
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_232, Icur := OriginalRow227TriangleData1997.coefficient199_231,
    output := OriginalRow227TriangleData2001.coefficient200_231, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_233, Icur := OriginalRow227TriangleData1997.coefficient199_232,
    output := OriginalRow227TriangleData2001.coefficient200_232, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_234, Icur := OriginalRow227TriangleData1997.coefficient199_233,
    output := OriginalRow227TriangleData2001.coefficient200_233, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_235, Icur := OriginalRow227TriangleData1997.coefficient199_234,
    output := OriginalRow227TriangleData2001.coefficient200_234, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_236, Icur := OriginalRow227TriangleData1997.coefficient199_235,
    output := OriginalRow227TriangleData2001.coefficient200_235, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_237, Icur := OriginalRow227TriangleData1997.coefficient199_236,
    output := OriginalRow227TriangleData2001.coefficient200_236, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_238, Icur := OriginalRow227TriangleData1997.coefficient199_237,
    output := OriginalRow227TriangleData2001.coefficient200_237, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_239, Icur := OriginalRow227TriangleData1997.coefficient199_238,
    output := OriginalRow227TriangleData2001.coefficient200_238, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_240, Icur := OriginalRow227TriangleData1997.coefficient199_239,
    output := OriginalRow227TriangleData2001.coefficient200_239, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_241, Icur := OriginalRow227TriangleData1997.coefficient199_240,
    output := OriginalRow227TriangleData2001.coefficient200_240, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_242, Icur := OriginalRow227TriangleData1997.coefficient199_241,
    output := OriginalRow227TriangleData2001.coefficient200_241, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_243, Icur := OriginalRow227TriangleData1997.coefficient199_242,
    output := OriginalRow227TriangleData2001.coefficient200_242, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_244, Icur := OriginalRow227TriangleData1997.coefficient199_243,
    output := OriginalRow227TriangleData2001.coefficient200_243, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_245, Icur := OriginalRow227TriangleData1997.coefficient199_244,
    output := OriginalRow227TriangleData2001.coefficient200_244, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_246, Icur := OriginalRow227TriangleData1997.coefficient199_245,
    output := OriginalRow227TriangleData2001.coefficient200_245, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_247, Icur := OriginalRow227TriangleData1997.coefficient199_246,
    output := OriginalRow227TriangleData2001.coefficient200_246, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_248, Icur := OriginalRow227TriangleData1997.coefficient199_247,
    output := OriginalRow227TriangleData2001.coefficient200_247, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_249, Icur := OriginalRow227TriangleData1997.coefficient199_248,
    output := OriginalRow227TriangleData2001.coefficient200_248, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_250, Icur := OriginalRow227TriangleData1997.coefficient199_249,
    output := OriginalRow227TriangleData2001.coefficient200_249, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_251, Icur := OriginalRow227TriangleData1997.coefficient199_250,
    output := OriginalRow227TriangleData2001.coefficient200_250, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_252, Icur := OriginalRow227TriangleData1997.coefficient199_251,
    output := OriginalRow227TriangleData2001.coefficient200_251, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_253, Icur := OriginalRow227TriangleData1997.coefficient199_252,
    output := OriginalRow227TriangleData2001.coefficient200_252, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_254, Icur := OriginalRow227TriangleData1997.coefficient199_253,
    output := OriginalRow227TriangleData2001.coefficient200_253, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_255, Icur := OriginalRow227TriangleData1997.coefficient199_254,
    output := OriginalRow227TriangleData2001.coefficient200_254, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_256, Icur := OriginalRow227TriangleData1997.coefficient199_255,
    output := OriginalRow227TriangleData2001.coefficient200_255, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_257, Icur := OriginalRow227TriangleData1997.coefficient199_256,
    output := OriginalRow227TriangleData2001.coefficient200_256, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_258, Icur := OriginalRow227TriangleData1997.coefficient199_257,
    output := OriginalRow227TriangleData2001.coefficient200_257, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_259, Icur := OriginalRow227TriangleData1997.coefficient199_258,
    output := OriginalRow227TriangleData2001.coefficient200_258, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_260, Icur := OriginalRow227TriangleData1997.coefficient199_259,
    output := OriginalRow227TriangleData2001.coefficient200_259, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1997.coefficient199_261, Icur := OriginalRow227TriangleData1997.coefficient199_260,
    output := OriginalRow227TriangleData2001.coefficient200_260, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_262, Icur := OriginalRow227TriangleData1997.coefficient199_261,
    output := OriginalRow227TriangleData2001.coefficient200_261, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root200,
    Inext := OriginalRow227TriangleData1998.coefficient199_263, Icur := OriginalRow227TriangleData1998.coefficient199_262,
    output := OriginalRow227TriangleData2001.coefficient200_262, hC := OriginalRow227TriangleRoots06.root200_pos, hAC := OriginalRow227TriangleRoots06.product200_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1985

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1985.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
