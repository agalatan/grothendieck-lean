import Grothe.UpperChaos.OriginalRow227TriangleData1969
import Grothe.UpperChaos.OriginalRow227TriangleData1970
import Grothe.UpperChaos.OriginalRow227TriangleData1973
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1957
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_225, Icur := OriginalRow227TriangleData1969.coefficient192_224,
    output := OriginalRow227TriangleData1973.coefficient193_224, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_226, Icur := OriginalRow227TriangleData1969.coefficient192_225,
    output := OriginalRow227TriangleData1973.coefficient193_225, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_227, Icur := OriginalRow227TriangleData1969.coefficient192_226,
    output := OriginalRow227TriangleData1973.coefficient193_226, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_228, Icur := OriginalRow227TriangleData1969.coefficient192_227,
    output := OriginalRow227TriangleData1973.coefficient193_227, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_229, Icur := OriginalRow227TriangleData1969.coefficient192_228,
    output := OriginalRow227TriangleData1973.coefficient193_228, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_230, Icur := OriginalRow227TriangleData1969.coefficient192_229,
    output := OriginalRow227TriangleData1973.coefficient193_229, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_231, Icur := OriginalRow227TriangleData1969.coefficient192_230,
    output := OriginalRow227TriangleData1973.coefficient193_230, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_232, Icur := OriginalRow227TriangleData1969.coefficient192_231,
    output := OriginalRow227TriangleData1973.coefficient193_231, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_233, Icur := OriginalRow227TriangleData1969.coefficient192_232,
    output := OriginalRow227TriangleData1973.coefficient193_232, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_234, Icur := OriginalRow227TriangleData1969.coefficient192_233,
    output := OriginalRow227TriangleData1973.coefficient193_233, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_235, Icur := OriginalRow227TriangleData1969.coefficient192_234,
    output := OriginalRow227TriangleData1973.coefficient193_234, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_236, Icur := OriginalRow227TriangleData1969.coefficient192_235,
    output := OriginalRow227TriangleData1973.coefficient193_235, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_237, Icur := OriginalRow227TriangleData1969.coefficient192_236,
    output := OriginalRow227TriangleData1973.coefficient193_236, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_238, Icur := OriginalRow227TriangleData1969.coefficient192_237,
    output := OriginalRow227TriangleData1973.coefficient193_237, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_239, Icur := OriginalRow227TriangleData1969.coefficient192_238,
    output := OriginalRow227TriangleData1973.coefficient193_238, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_240, Icur := OriginalRow227TriangleData1969.coefficient192_239,
    output := OriginalRow227TriangleData1973.coefficient193_239, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_241, Icur := OriginalRow227TriangleData1969.coefficient192_240,
    output := OriginalRow227TriangleData1973.coefficient193_240, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_242, Icur := OriginalRow227TriangleData1969.coefficient192_241,
    output := OriginalRow227TriangleData1973.coefficient193_241, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_243, Icur := OriginalRow227TriangleData1969.coefficient192_242,
    output := OriginalRow227TriangleData1973.coefficient193_242, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_244, Icur := OriginalRow227TriangleData1969.coefficient192_243,
    output := OriginalRow227TriangleData1973.coefficient193_243, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_245, Icur := OriginalRow227TriangleData1969.coefficient192_244,
    output := OriginalRow227TriangleData1973.coefficient193_244, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_246, Icur := OriginalRow227TriangleData1969.coefficient192_245,
    output := OriginalRow227TriangleData1973.coefficient193_245, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_247, Icur := OriginalRow227TriangleData1969.coefficient192_246,
    output := OriginalRow227TriangleData1973.coefficient193_246, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_248, Icur := OriginalRow227TriangleData1969.coefficient192_247,
    output := OriginalRow227TriangleData1973.coefficient193_247, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_249, Icur := OriginalRow227TriangleData1969.coefficient192_248,
    output := OriginalRow227TriangleData1973.coefficient193_248, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_250, Icur := OriginalRow227TriangleData1969.coefficient192_249,
    output := OriginalRow227TriangleData1973.coefficient193_249, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_251, Icur := OriginalRow227TriangleData1969.coefficient192_250,
    output := OriginalRow227TriangleData1973.coefficient193_250, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_252, Icur := OriginalRow227TriangleData1969.coefficient192_251,
    output := OriginalRow227TriangleData1973.coefficient193_251, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_253, Icur := OriginalRow227TriangleData1969.coefficient192_252,
    output := OriginalRow227TriangleData1973.coefficient193_252, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1969.coefficient192_254, Icur := OriginalRow227TriangleData1969.coefficient192_253,
    output := OriginalRow227TriangleData1973.coefficient193_253, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1970.coefficient192_255, Icur := OriginalRow227TriangleData1969.coefficient192_254,
    output := OriginalRow227TriangleData1973.coefficient193_254, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root193,
    Inext := OriginalRow227TriangleData1970.coefficient192_256, Icur := OriginalRow227TriangleData1970.coefficient192_255,
    output := OriginalRow227TriangleData1973.coefficient193_255, hC := OriginalRow227TriangleRoots06.root193_pos, hAC := OriginalRow227TriangleRoots06.product193_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1957

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1957.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
