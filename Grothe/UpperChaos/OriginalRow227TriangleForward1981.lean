import Grothe.UpperChaos.OriginalRow227TriangleData1993
import Grothe.UpperChaos.OriginalRow227TriangleData1994
import Grothe.UpperChaos.OriginalRow227TriangleData1997
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1981
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_231, Icur := OriginalRow227TriangleData1993.coefficient198_230,
    output := OriginalRow227TriangleData1997.coefficient199_230, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_232, Icur := OriginalRow227TriangleData1993.coefficient198_231,
    output := OriginalRow227TriangleData1997.coefficient199_231, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_233, Icur := OriginalRow227TriangleData1993.coefficient198_232,
    output := OriginalRow227TriangleData1997.coefficient199_232, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_234, Icur := OriginalRow227TriangleData1993.coefficient198_233,
    output := OriginalRow227TriangleData1997.coefficient199_233, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_235, Icur := OriginalRow227TriangleData1993.coefficient198_234,
    output := OriginalRow227TriangleData1997.coefficient199_234, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_236, Icur := OriginalRow227TriangleData1993.coefficient198_235,
    output := OriginalRow227TriangleData1997.coefficient199_235, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_237, Icur := OriginalRow227TriangleData1993.coefficient198_236,
    output := OriginalRow227TriangleData1997.coefficient199_236, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_238, Icur := OriginalRow227TriangleData1993.coefficient198_237,
    output := OriginalRow227TriangleData1997.coefficient199_237, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_239, Icur := OriginalRow227TriangleData1993.coefficient198_238,
    output := OriginalRow227TriangleData1997.coefficient199_238, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_240, Icur := OriginalRow227TriangleData1993.coefficient198_239,
    output := OriginalRow227TriangleData1997.coefficient199_239, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_241, Icur := OriginalRow227TriangleData1993.coefficient198_240,
    output := OriginalRow227TriangleData1997.coefficient199_240, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_242, Icur := OriginalRow227TriangleData1993.coefficient198_241,
    output := OriginalRow227TriangleData1997.coefficient199_241, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_243, Icur := OriginalRow227TriangleData1993.coefficient198_242,
    output := OriginalRow227TriangleData1997.coefficient199_242, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_244, Icur := OriginalRow227TriangleData1993.coefficient198_243,
    output := OriginalRow227TriangleData1997.coefficient199_243, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_245, Icur := OriginalRow227TriangleData1993.coefficient198_244,
    output := OriginalRow227TriangleData1997.coefficient199_244, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_246, Icur := OriginalRow227TriangleData1993.coefficient198_245,
    output := OriginalRow227TriangleData1997.coefficient199_245, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_247, Icur := OriginalRow227TriangleData1993.coefficient198_246,
    output := OriginalRow227TriangleData1997.coefficient199_246, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_248, Icur := OriginalRow227TriangleData1993.coefficient198_247,
    output := OriginalRow227TriangleData1997.coefficient199_247, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_249, Icur := OriginalRow227TriangleData1993.coefficient198_248,
    output := OriginalRow227TriangleData1997.coefficient199_248, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_250, Icur := OriginalRow227TriangleData1993.coefficient198_249,
    output := OriginalRow227TriangleData1997.coefficient199_249, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_251, Icur := OriginalRow227TriangleData1993.coefficient198_250,
    output := OriginalRow227TriangleData1997.coefficient199_250, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_252, Icur := OriginalRow227TriangleData1993.coefficient198_251,
    output := OriginalRow227TriangleData1997.coefficient199_251, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_253, Icur := OriginalRow227TriangleData1993.coefficient198_252,
    output := OriginalRow227TriangleData1997.coefficient199_252, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_254, Icur := OriginalRow227TriangleData1993.coefficient198_253,
    output := OriginalRow227TriangleData1997.coefficient199_253, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_255, Icur := OriginalRow227TriangleData1993.coefficient198_254,
    output := OriginalRow227TriangleData1997.coefficient199_254, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_256, Icur := OriginalRow227TriangleData1993.coefficient198_255,
    output := OriginalRow227TriangleData1997.coefficient199_255, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_257, Icur := OriginalRow227TriangleData1993.coefficient198_256,
    output := OriginalRow227TriangleData1997.coefficient199_256, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_258, Icur := OriginalRow227TriangleData1993.coefficient198_257,
    output := OriginalRow227TriangleData1997.coefficient199_257, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_259, Icur := OriginalRow227TriangleData1993.coefficient198_258,
    output := OriginalRow227TriangleData1997.coefficient199_258, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1993.coefficient198_260, Icur := OriginalRow227TriangleData1993.coefficient198_259,
    output := OriginalRow227TriangleData1997.coefficient199_259, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1994.coefficient198_261, Icur := OriginalRow227TriangleData1993.coefficient198_260,
    output := OriginalRow227TriangleData1997.coefficient199_260, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root199,
    Inext := OriginalRow227TriangleData1994.coefficient198_262, Icur := OriginalRow227TriangleData1994.coefficient198_261,
    output := OriginalRow227TriangleData1997.coefficient199_261, hC := OriginalRow227TriangleRoots06.root199_pos, hAC := OriginalRow227TriangleRoots06.product199_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1981

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1981.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
