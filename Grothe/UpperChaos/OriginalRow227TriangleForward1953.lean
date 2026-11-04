import Grothe.UpperChaos.OriginalRow227TriangleData1965
import Grothe.UpperChaos.OriginalRow227TriangleData1966
import Grothe.UpperChaos.OriginalRow227TriangleData1969
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1953
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_224, Icur := OriginalRow227TriangleData1965.coefficient191_223,
    output := OriginalRow227TriangleData1969.coefficient192_223, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_225, Icur := OriginalRow227TriangleData1965.coefficient191_224,
    output := OriginalRow227TriangleData1969.coefficient192_224, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_226, Icur := OriginalRow227TriangleData1965.coefficient191_225,
    output := OriginalRow227TriangleData1969.coefficient192_225, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_227, Icur := OriginalRow227TriangleData1965.coefficient191_226,
    output := OriginalRow227TriangleData1969.coefficient192_226, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_228, Icur := OriginalRow227TriangleData1965.coefficient191_227,
    output := OriginalRow227TriangleData1969.coefficient192_227, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_229, Icur := OriginalRow227TriangleData1965.coefficient191_228,
    output := OriginalRow227TriangleData1969.coefficient192_228, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_230, Icur := OriginalRow227TriangleData1965.coefficient191_229,
    output := OriginalRow227TriangleData1969.coefficient192_229, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_231, Icur := OriginalRow227TriangleData1965.coefficient191_230,
    output := OriginalRow227TriangleData1969.coefficient192_230, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_232, Icur := OriginalRow227TriangleData1965.coefficient191_231,
    output := OriginalRow227TriangleData1969.coefficient192_231, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_233, Icur := OriginalRow227TriangleData1965.coefficient191_232,
    output := OriginalRow227TriangleData1969.coefficient192_232, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_234, Icur := OriginalRow227TriangleData1965.coefficient191_233,
    output := OriginalRow227TriangleData1969.coefficient192_233, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_235, Icur := OriginalRow227TriangleData1965.coefficient191_234,
    output := OriginalRow227TriangleData1969.coefficient192_234, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_236, Icur := OriginalRow227TriangleData1965.coefficient191_235,
    output := OriginalRow227TriangleData1969.coefficient192_235, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_237, Icur := OriginalRow227TriangleData1965.coefficient191_236,
    output := OriginalRow227TriangleData1969.coefficient192_236, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_238, Icur := OriginalRow227TriangleData1965.coefficient191_237,
    output := OriginalRow227TriangleData1969.coefficient192_237, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_239, Icur := OriginalRow227TriangleData1965.coefficient191_238,
    output := OriginalRow227TriangleData1969.coefficient192_238, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_240, Icur := OriginalRow227TriangleData1965.coefficient191_239,
    output := OriginalRow227TriangleData1969.coefficient192_239, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_241, Icur := OriginalRow227TriangleData1965.coefficient191_240,
    output := OriginalRow227TriangleData1969.coefficient192_240, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_242, Icur := OriginalRow227TriangleData1965.coefficient191_241,
    output := OriginalRow227TriangleData1969.coefficient192_241, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_243, Icur := OriginalRow227TriangleData1965.coefficient191_242,
    output := OriginalRow227TriangleData1969.coefficient192_242, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_244, Icur := OriginalRow227TriangleData1965.coefficient191_243,
    output := OriginalRow227TriangleData1969.coefficient192_243, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_245, Icur := OriginalRow227TriangleData1965.coefficient191_244,
    output := OriginalRow227TriangleData1969.coefficient192_244, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_246, Icur := OriginalRow227TriangleData1965.coefficient191_245,
    output := OriginalRow227TriangleData1969.coefficient192_245, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_247, Icur := OriginalRow227TriangleData1965.coefficient191_246,
    output := OriginalRow227TriangleData1969.coefficient192_246, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_248, Icur := OriginalRow227TriangleData1965.coefficient191_247,
    output := OriginalRow227TriangleData1969.coefficient192_247, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_249, Icur := OriginalRow227TriangleData1965.coefficient191_248,
    output := OriginalRow227TriangleData1969.coefficient192_248, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_250, Icur := OriginalRow227TriangleData1965.coefficient191_249,
    output := OriginalRow227TriangleData1969.coefficient192_249, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_251, Icur := OriginalRow227TriangleData1965.coefficient191_250,
    output := OriginalRow227TriangleData1969.coefficient192_250, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_252, Icur := OriginalRow227TriangleData1965.coefficient191_251,
    output := OriginalRow227TriangleData1969.coefficient192_251, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1965.coefficient191_253, Icur := OriginalRow227TriangleData1965.coefficient191_252,
    output := OriginalRow227TriangleData1969.coefficient192_252, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_254, Icur := OriginalRow227TriangleData1965.coefficient191_253,
    output := OriginalRow227TriangleData1969.coefficient192_253, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_255, Icur := OriginalRow227TriangleData1966.coefficient191_254,
    output := OriginalRow227TriangleData1969.coefficient192_254, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1953

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1953.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
