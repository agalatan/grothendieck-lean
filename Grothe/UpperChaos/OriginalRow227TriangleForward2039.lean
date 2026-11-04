import Grothe.UpperChaos.OriginalRow227TriangleData2052
import Grothe.UpperChaos.OriginalRow227TriangleData2053
import Grothe.UpperChaos.OriginalRow227TriangleData2055
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2039
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_217, Icur := OriginalRow227TriangleData2052.coefficient216_216,
    output := OriginalRow227TriangleData2055.coefficient217_216, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_218, Icur := OriginalRow227TriangleData2052.coefficient216_217,
    output := OriginalRow227TriangleData2055.coefficient217_217, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_219, Icur := OriginalRow227TriangleData2052.coefficient216_218,
    output := OriginalRow227TriangleData2055.coefficient217_218, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_220, Icur := OriginalRow227TriangleData2052.coefficient216_219,
    output := OriginalRow227TriangleData2055.coefficient217_219, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_221, Icur := OriginalRow227TriangleData2052.coefficient216_220,
    output := OriginalRow227TriangleData2055.coefficient217_220, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_222, Icur := OriginalRow227TriangleData2052.coefficient216_221,
    output := OriginalRow227TriangleData2055.coefficient217_221, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_223, Icur := OriginalRow227TriangleData2052.coefficient216_222,
    output := OriginalRow227TriangleData2055.coefficient217_222, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_224, Icur := OriginalRow227TriangleData2052.coefficient216_223,
    output := OriginalRow227TriangleData2055.coefficient217_223, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_225, Icur := OriginalRow227TriangleData2052.coefficient216_224,
    output := OriginalRow227TriangleData2055.coefficient217_224, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_226, Icur := OriginalRow227TriangleData2052.coefficient216_225,
    output := OriginalRow227TriangleData2055.coefficient217_225, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_227, Icur := OriginalRow227TriangleData2052.coefficient216_226,
    output := OriginalRow227TriangleData2055.coefficient217_226, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_228, Icur := OriginalRow227TriangleData2052.coefficient216_227,
    output := OriginalRow227TriangleData2055.coefficient217_227, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_229, Icur := OriginalRow227TriangleData2052.coefficient216_228,
    output := OriginalRow227TriangleData2055.coefficient217_228, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_230, Icur := OriginalRow227TriangleData2052.coefficient216_229,
    output := OriginalRow227TriangleData2055.coefficient217_229, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_231, Icur := OriginalRow227TriangleData2052.coefficient216_230,
    output := OriginalRow227TriangleData2055.coefficient217_230, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_232, Icur := OriginalRow227TriangleData2052.coefficient216_231,
    output := OriginalRow227TriangleData2055.coefficient217_231, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_233, Icur := OriginalRow227TriangleData2052.coefficient216_232,
    output := OriginalRow227TriangleData2055.coefficient217_232, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_234, Icur := OriginalRow227TriangleData2052.coefficient216_233,
    output := OriginalRow227TriangleData2055.coefficient217_233, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_235, Icur := OriginalRow227TriangleData2052.coefficient216_234,
    output := OriginalRow227TriangleData2055.coefficient217_234, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_236, Icur := OriginalRow227TriangleData2052.coefficient216_235,
    output := OriginalRow227TriangleData2055.coefficient217_235, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_237, Icur := OriginalRow227TriangleData2052.coefficient216_236,
    output := OriginalRow227TriangleData2055.coefficient217_236, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_238, Icur := OriginalRow227TriangleData2052.coefficient216_237,
    output := OriginalRow227TriangleData2055.coefficient217_237, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_239, Icur := OriginalRow227TriangleData2052.coefficient216_238,
    output := OriginalRow227TriangleData2055.coefficient217_238, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_240, Icur := OriginalRow227TriangleData2052.coefficient216_239,
    output := OriginalRow227TriangleData2055.coefficient217_239, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_241, Icur := OriginalRow227TriangleData2052.coefficient216_240,
    output := OriginalRow227TriangleData2055.coefficient217_240, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_242, Icur := OriginalRow227TriangleData2052.coefficient216_241,
    output := OriginalRow227TriangleData2055.coefficient217_241, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_243, Icur := OriginalRow227TriangleData2052.coefficient216_242,
    output := OriginalRow227TriangleData2055.coefficient217_242, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_244, Icur := OriginalRow227TriangleData2052.coefficient216_243,
    output := OriginalRow227TriangleData2055.coefficient217_243, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_245, Icur := OriginalRow227TriangleData2052.coefficient216_244,
    output := OriginalRow227TriangleData2055.coefficient217_244, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2052.coefficient216_246, Icur := OriginalRow227TriangleData2052.coefficient216_245,
    output := OriginalRow227TriangleData2055.coefficient217_245, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2053.coefficient216_247, Icur := OriginalRow227TriangleData2052.coefficient216_246,
    output := OriginalRow227TriangleData2055.coefficient217_246, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root217,
    Inext := OriginalRow227TriangleData2053.coefficient216_248, Icur := OriginalRow227TriangleData2053.coefficient216_247,
    output := OriginalRow227TriangleData2055.coefficient217_247, hC := OriginalRow227TriangleRoots06.root217_pos, hAC := OriginalRow227TriangleRoots06.product217_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2039

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2039.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
