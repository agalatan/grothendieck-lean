import Grothe.UpperChaos.OriginalRow227TriangleData1961
import Grothe.UpperChaos.OriginalRow227TriangleData1962
import Grothe.UpperChaos.OriginalRow227TriangleData1965
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1949
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_223, Icur := OriginalRow227TriangleData1961.coefficient190_222,
    output := OriginalRow227TriangleData1965.coefficient191_222, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_224, Icur := OriginalRow227TriangleData1961.coefficient190_223,
    output := OriginalRow227TriangleData1965.coefficient191_223, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_225, Icur := OriginalRow227TriangleData1961.coefficient190_224,
    output := OriginalRow227TriangleData1965.coefficient191_224, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_226, Icur := OriginalRow227TriangleData1961.coefficient190_225,
    output := OriginalRow227TriangleData1965.coefficient191_225, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_227, Icur := OriginalRow227TriangleData1961.coefficient190_226,
    output := OriginalRow227TriangleData1965.coefficient191_226, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_228, Icur := OriginalRow227TriangleData1961.coefficient190_227,
    output := OriginalRow227TriangleData1965.coefficient191_227, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_229, Icur := OriginalRow227TriangleData1961.coefficient190_228,
    output := OriginalRow227TriangleData1965.coefficient191_228, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_230, Icur := OriginalRow227TriangleData1961.coefficient190_229,
    output := OriginalRow227TriangleData1965.coefficient191_229, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_231, Icur := OriginalRow227TriangleData1961.coefficient190_230,
    output := OriginalRow227TriangleData1965.coefficient191_230, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_232, Icur := OriginalRow227TriangleData1961.coefficient190_231,
    output := OriginalRow227TriangleData1965.coefficient191_231, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_233, Icur := OriginalRow227TriangleData1961.coefficient190_232,
    output := OriginalRow227TriangleData1965.coefficient191_232, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_234, Icur := OriginalRow227TriangleData1961.coefficient190_233,
    output := OriginalRow227TriangleData1965.coefficient191_233, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_235, Icur := OriginalRow227TriangleData1961.coefficient190_234,
    output := OriginalRow227TriangleData1965.coefficient191_234, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_236, Icur := OriginalRow227TriangleData1961.coefficient190_235,
    output := OriginalRow227TriangleData1965.coefficient191_235, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_237, Icur := OriginalRow227TriangleData1961.coefficient190_236,
    output := OriginalRow227TriangleData1965.coefficient191_236, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_238, Icur := OriginalRow227TriangleData1961.coefficient190_237,
    output := OriginalRow227TriangleData1965.coefficient191_237, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_239, Icur := OriginalRow227TriangleData1961.coefficient190_238,
    output := OriginalRow227TriangleData1965.coefficient191_238, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_240, Icur := OriginalRow227TriangleData1961.coefficient190_239,
    output := OriginalRow227TriangleData1965.coefficient191_239, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_241, Icur := OriginalRow227TriangleData1961.coefficient190_240,
    output := OriginalRow227TriangleData1965.coefficient191_240, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_242, Icur := OriginalRow227TriangleData1961.coefficient190_241,
    output := OriginalRow227TriangleData1965.coefficient191_241, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_243, Icur := OriginalRow227TriangleData1961.coefficient190_242,
    output := OriginalRow227TriangleData1965.coefficient191_242, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_244, Icur := OriginalRow227TriangleData1961.coefficient190_243,
    output := OriginalRow227TriangleData1965.coefficient191_243, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_245, Icur := OriginalRow227TriangleData1961.coefficient190_244,
    output := OriginalRow227TriangleData1965.coefficient191_244, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_246, Icur := OriginalRow227TriangleData1961.coefficient190_245,
    output := OriginalRow227TriangleData1965.coefficient191_245, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_247, Icur := OriginalRow227TriangleData1961.coefficient190_246,
    output := OriginalRow227TriangleData1965.coefficient191_246, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_248, Icur := OriginalRow227TriangleData1961.coefficient190_247,
    output := OriginalRow227TriangleData1965.coefficient191_247, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_249, Icur := OriginalRow227TriangleData1961.coefficient190_248,
    output := OriginalRow227TriangleData1965.coefficient191_248, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_250, Icur := OriginalRow227TriangleData1961.coefficient190_249,
    output := OriginalRow227TriangleData1965.coefficient191_249, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_251, Icur := OriginalRow227TriangleData1961.coefficient190_250,
    output := OriginalRow227TriangleData1965.coefficient191_250, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1961.coefficient190_252, Icur := OriginalRow227TriangleData1961.coefficient190_251,
    output := OriginalRow227TriangleData1965.coefficient191_251, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1962.coefficient190_253, Icur := OriginalRow227TriangleData1961.coefficient190_252,
    output := OriginalRow227TriangleData1965.coefficient191_252, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1962.coefficient190_254, Icur := OriginalRow227TriangleData1962.coefficient190_253,
    output := OriginalRow227TriangleData1965.coefficient191_253, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1949

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1949.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
