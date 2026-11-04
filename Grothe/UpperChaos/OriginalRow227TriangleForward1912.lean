import Grothe.UpperChaos.OriginalRow227TriangleData1923
import Grothe.UpperChaos.OriginalRow227TriangleData1924
import Grothe.UpperChaos.OriginalRow227TriangleData1928
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1912
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_215, Icur := OriginalRow227TriangleData1923.coefficient182_214,
    output := OriginalRow227TriangleData1928.coefficient183_214, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_216, Icur := OriginalRow227TriangleData1923.coefficient182_215,
    output := OriginalRow227TriangleData1928.coefficient183_215, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_217, Icur := OriginalRow227TriangleData1923.coefficient182_216,
    output := OriginalRow227TriangleData1928.coefficient183_216, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_218, Icur := OriginalRow227TriangleData1923.coefficient182_217,
    output := OriginalRow227TriangleData1928.coefficient183_217, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_219, Icur := OriginalRow227TriangleData1923.coefficient182_218,
    output := OriginalRow227TriangleData1928.coefficient183_218, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_220, Icur := OriginalRow227TriangleData1923.coefficient182_219,
    output := OriginalRow227TriangleData1928.coefficient183_219, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_221, Icur := OriginalRow227TriangleData1923.coefficient182_220,
    output := OriginalRow227TriangleData1928.coefficient183_220, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_222, Icur := OriginalRow227TriangleData1923.coefficient182_221,
    output := OriginalRow227TriangleData1928.coefficient183_221, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_223, Icur := OriginalRow227TriangleData1923.coefficient182_222,
    output := OriginalRow227TriangleData1928.coefficient183_222, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_224, Icur := OriginalRow227TriangleData1923.coefficient182_223,
    output := OriginalRow227TriangleData1928.coefficient183_223, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_225, Icur := OriginalRow227TriangleData1923.coefficient182_224,
    output := OriginalRow227TriangleData1928.coefficient183_224, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_226, Icur := OriginalRow227TriangleData1923.coefficient182_225,
    output := OriginalRow227TriangleData1928.coefficient183_225, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_227, Icur := OriginalRow227TriangleData1923.coefficient182_226,
    output := OriginalRow227TriangleData1928.coefficient183_226, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_228, Icur := OriginalRow227TriangleData1923.coefficient182_227,
    output := OriginalRow227TriangleData1928.coefficient183_227, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_229, Icur := OriginalRow227TriangleData1923.coefficient182_228,
    output := OriginalRow227TriangleData1928.coefficient183_228, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_230, Icur := OriginalRow227TriangleData1923.coefficient182_229,
    output := OriginalRow227TriangleData1928.coefficient183_229, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_231, Icur := OriginalRow227TriangleData1923.coefficient182_230,
    output := OriginalRow227TriangleData1928.coefficient183_230, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_232, Icur := OriginalRow227TriangleData1923.coefficient182_231,
    output := OriginalRow227TriangleData1928.coefficient183_231, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_233, Icur := OriginalRow227TriangleData1923.coefficient182_232,
    output := OriginalRow227TriangleData1928.coefficient183_232, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_234, Icur := OriginalRow227TriangleData1923.coefficient182_233,
    output := OriginalRow227TriangleData1928.coefficient183_233, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_235, Icur := OriginalRow227TriangleData1923.coefficient182_234,
    output := OriginalRow227TriangleData1928.coefficient183_234, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_236, Icur := OriginalRow227TriangleData1923.coefficient182_235,
    output := OriginalRow227TriangleData1928.coefficient183_235, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_237, Icur := OriginalRow227TriangleData1923.coefficient182_236,
    output := OriginalRow227TriangleData1928.coefficient183_236, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_238, Icur := OriginalRow227TriangleData1923.coefficient182_237,
    output := OriginalRow227TriangleData1928.coefficient183_237, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_239, Icur := OriginalRow227TriangleData1923.coefficient182_238,
    output := OriginalRow227TriangleData1928.coefficient183_238, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_240, Icur := OriginalRow227TriangleData1923.coefficient182_239,
    output := OriginalRow227TriangleData1928.coefficient183_239, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_241, Icur := OriginalRow227TriangleData1923.coefficient182_240,
    output := OriginalRow227TriangleData1928.coefficient183_240, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_242, Icur := OriginalRow227TriangleData1923.coefficient182_241,
    output := OriginalRow227TriangleData1928.coefficient183_241, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_243, Icur := OriginalRow227TriangleData1923.coefficient182_242,
    output := OriginalRow227TriangleData1928.coefficient183_242, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1923.coefficient182_244, Icur := OriginalRow227TriangleData1923.coefficient182_243,
    output := OriginalRow227TriangleData1928.coefficient183_243, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1924.coefficient182_245, Icur := OriginalRow227TriangleData1923.coefficient182_244,
    output := OriginalRow227TriangleData1928.coefficient183_244, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root183,
    Inext := OriginalRow227TriangleData1924.coefficient182_246, Icur := OriginalRow227TriangleData1924.coefficient182_245,
    output := OriginalRow227TriangleData1928.coefficient183_245, hC := OriginalRow227TriangleRoots05.root183_pos, hAC := OriginalRow227TriangleRoots05.product183_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1912

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1912.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
