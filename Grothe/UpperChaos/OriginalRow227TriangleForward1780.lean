import Grothe.UpperChaos.OriginalRow227TriangleData1790
import Grothe.UpperChaos.OriginalRow227TriangleData1791
import Grothe.UpperChaos.OriginalRow227TriangleData1796
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1780
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_223, Icur := OriginalRow227TriangleData1790.coefficient158_222,
    output := OriginalRow227TriangleData1796.coefficient159_222, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_224, Icur := OriginalRow227TriangleData1790.coefficient158_223,
    output := OriginalRow227TriangleData1796.coefficient159_223, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_225, Icur := OriginalRow227TriangleData1790.coefficient158_224,
    output := OriginalRow227TriangleData1796.coefficient159_224, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_226, Icur := OriginalRow227TriangleData1790.coefficient158_225,
    output := OriginalRow227TriangleData1796.coefficient159_225, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_227, Icur := OriginalRow227TriangleData1790.coefficient158_226,
    output := OriginalRow227TriangleData1796.coefficient159_226, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_228, Icur := OriginalRow227TriangleData1790.coefficient158_227,
    output := OriginalRow227TriangleData1796.coefficient159_227, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_229, Icur := OriginalRow227TriangleData1790.coefficient158_228,
    output := OriginalRow227TriangleData1796.coefficient159_228, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_230, Icur := OriginalRow227TriangleData1790.coefficient158_229,
    output := OriginalRow227TriangleData1796.coefficient159_229, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_231, Icur := OriginalRow227TriangleData1790.coefficient158_230,
    output := OriginalRow227TriangleData1796.coefficient159_230, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_232, Icur := OriginalRow227TriangleData1790.coefficient158_231,
    output := OriginalRow227TriangleData1796.coefficient159_231, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_233, Icur := OriginalRow227TriangleData1790.coefficient158_232,
    output := OriginalRow227TriangleData1796.coefficient159_232, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_234, Icur := OriginalRow227TriangleData1790.coefficient158_233,
    output := OriginalRow227TriangleData1796.coefficient159_233, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_235, Icur := OriginalRow227TriangleData1790.coefficient158_234,
    output := OriginalRow227TriangleData1796.coefficient159_234, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_236, Icur := OriginalRow227TriangleData1790.coefficient158_235,
    output := OriginalRow227TriangleData1796.coefficient159_235, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_237, Icur := OriginalRow227TriangleData1790.coefficient158_236,
    output := OriginalRow227TriangleData1796.coefficient159_236, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_238, Icur := OriginalRow227TriangleData1790.coefficient158_237,
    output := OriginalRow227TriangleData1796.coefficient159_237, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_239, Icur := OriginalRow227TriangleData1790.coefficient158_238,
    output := OriginalRow227TriangleData1796.coefficient159_238, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_240, Icur := OriginalRow227TriangleData1790.coefficient158_239,
    output := OriginalRow227TriangleData1796.coefficient159_239, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_241, Icur := OriginalRow227TriangleData1790.coefficient158_240,
    output := OriginalRow227TriangleData1796.coefficient159_240, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_242, Icur := OriginalRow227TriangleData1790.coefficient158_241,
    output := OriginalRow227TriangleData1796.coefficient159_241, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_243, Icur := OriginalRow227TriangleData1790.coefficient158_242,
    output := OriginalRow227TriangleData1796.coefficient159_242, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_244, Icur := OriginalRow227TriangleData1790.coefficient158_243,
    output := OriginalRow227TriangleData1796.coefficient159_243, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_245, Icur := OriginalRow227TriangleData1790.coefficient158_244,
    output := OriginalRow227TriangleData1796.coefficient159_244, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_246, Icur := OriginalRow227TriangleData1790.coefficient158_245,
    output := OriginalRow227TriangleData1796.coefficient159_245, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_247, Icur := OriginalRow227TriangleData1790.coefficient158_246,
    output := OriginalRow227TriangleData1796.coefficient159_246, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_248, Icur := OriginalRow227TriangleData1790.coefficient158_247,
    output := OriginalRow227TriangleData1796.coefficient159_247, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_249, Icur := OriginalRow227TriangleData1790.coefficient158_248,
    output := OriginalRow227TriangleData1796.coefficient159_248, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_250, Icur := OriginalRow227TriangleData1790.coefficient158_249,
    output := OriginalRow227TriangleData1796.coefficient159_249, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_251, Icur := OriginalRow227TriangleData1790.coefficient158_250,
    output := OriginalRow227TriangleData1796.coefficient159_250, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1790.coefficient158_252, Icur := OriginalRow227TriangleData1790.coefficient158_251,
    output := OriginalRow227TriangleData1796.coefficient159_251, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_253, Icur := OriginalRow227TriangleData1790.coefficient158_252,
    output := OriginalRow227TriangleData1796.coefficient159_252, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_254, Icur := OriginalRow227TriangleData1791.coefficient158_253,
    output := OriginalRow227TriangleData1796.coefficient159_253, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1780

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1780.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
