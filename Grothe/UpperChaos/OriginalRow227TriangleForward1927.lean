import Grothe.UpperChaos.OriginalRow227TriangleData1938
import Grothe.UpperChaos.OriginalRow227TriangleData1939
import Grothe.UpperChaos.OriginalRow227TriangleData1943
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1927
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_218, Icur := OriginalRow227TriangleData1938.coefficient185_217,
    output := OriginalRow227TriangleData1943.coefficient186_217, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_219, Icur := OriginalRow227TriangleData1938.coefficient185_218,
    output := OriginalRow227TriangleData1943.coefficient186_218, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_220, Icur := OriginalRow227TriangleData1938.coefficient185_219,
    output := OriginalRow227TriangleData1943.coefficient186_219, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_221, Icur := OriginalRow227TriangleData1938.coefficient185_220,
    output := OriginalRow227TriangleData1943.coefficient186_220, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_222, Icur := OriginalRow227TriangleData1938.coefficient185_221,
    output := OriginalRow227TriangleData1943.coefficient186_221, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_223, Icur := OriginalRow227TriangleData1938.coefficient185_222,
    output := OriginalRow227TriangleData1943.coefficient186_222, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_224, Icur := OriginalRow227TriangleData1938.coefficient185_223,
    output := OriginalRow227TriangleData1943.coefficient186_223, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_225, Icur := OriginalRow227TriangleData1938.coefficient185_224,
    output := OriginalRow227TriangleData1943.coefficient186_224, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_226, Icur := OriginalRow227TriangleData1938.coefficient185_225,
    output := OriginalRow227TriangleData1943.coefficient186_225, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_227, Icur := OriginalRow227TriangleData1938.coefficient185_226,
    output := OriginalRow227TriangleData1943.coefficient186_226, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_228, Icur := OriginalRow227TriangleData1938.coefficient185_227,
    output := OriginalRow227TriangleData1943.coefficient186_227, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_229, Icur := OriginalRow227TriangleData1938.coefficient185_228,
    output := OriginalRow227TriangleData1943.coefficient186_228, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_230, Icur := OriginalRow227TriangleData1938.coefficient185_229,
    output := OriginalRow227TriangleData1943.coefficient186_229, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_231, Icur := OriginalRow227TriangleData1938.coefficient185_230,
    output := OriginalRow227TriangleData1943.coefficient186_230, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_232, Icur := OriginalRow227TriangleData1938.coefficient185_231,
    output := OriginalRow227TriangleData1943.coefficient186_231, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_233, Icur := OriginalRow227TriangleData1938.coefficient185_232,
    output := OriginalRow227TriangleData1943.coefficient186_232, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_234, Icur := OriginalRow227TriangleData1938.coefficient185_233,
    output := OriginalRow227TriangleData1943.coefficient186_233, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_235, Icur := OriginalRow227TriangleData1938.coefficient185_234,
    output := OriginalRow227TriangleData1943.coefficient186_234, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_236, Icur := OriginalRow227TriangleData1938.coefficient185_235,
    output := OriginalRow227TriangleData1943.coefficient186_235, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_237, Icur := OriginalRow227TriangleData1938.coefficient185_236,
    output := OriginalRow227TriangleData1943.coefficient186_236, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_238, Icur := OriginalRow227TriangleData1938.coefficient185_237,
    output := OriginalRow227TriangleData1943.coefficient186_237, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_239, Icur := OriginalRow227TriangleData1938.coefficient185_238,
    output := OriginalRow227TriangleData1943.coefficient186_238, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_240, Icur := OriginalRow227TriangleData1938.coefficient185_239,
    output := OriginalRow227TriangleData1943.coefficient186_239, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_241, Icur := OriginalRow227TriangleData1938.coefficient185_240,
    output := OriginalRow227TriangleData1943.coefficient186_240, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_242, Icur := OriginalRow227TriangleData1938.coefficient185_241,
    output := OriginalRow227TriangleData1943.coefficient186_241, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_243, Icur := OriginalRow227TriangleData1938.coefficient185_242,
    output := OriginalRow227TriangleData1943.coefficient186_242, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_244, Icur := OriginalRow227TriangleData1938.coefficient185_243,
    output := OriginalRow227TriangleData1943.coefficient186_243, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_245, Icur := OriginalRow227TriangleData1938.coefficient185_244,
    output := OriginalRow227TriangleData1943.coefficient186_244, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_246, Icur := OriginalRow227TriangleData1938.coefficient185_245,
    output := OriginalRow227TriangleData1943.coefficient186_245, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1938.coefficient185_247, Icur := OriginalRow227TriangleData1938.coefficient185_246,
    output := OriginalRow227TriangleData1943.coefficient186_246, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_248, Icur := OriginalRow227TriangleData1938.coefficient185_247,
    output := OriginalRow227TriangleData1943.coefficient186_247, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root186,
    Inext := OriginalRow227TriangleData1939.coefficient185_249, Icur := OriginalRow227TriangleData1939.coefficient185_248,
    output := OriginalRow227TriangleData1943.coefficient186_248, hC := OriginalRow227TriangleRoots05.root186_pos, hAC := OriginalRow227TriangleRoots05.product186_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1927

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1927.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
