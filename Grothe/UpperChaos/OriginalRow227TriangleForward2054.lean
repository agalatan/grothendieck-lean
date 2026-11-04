import Grothe.UpperChaos.OriginalRow227TriangleData2068
import Grothe.UpperChaos.OriginalRow227TriangleData2069
import Grothe.UpperChaos.OriginalRow227TriangleData2070
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2054
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_223, Icur := OriginalRow227TriangleData2068.coefficient222_222,
    output := OriginalRow227TriangleData2070.coefficient223_222, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_224, Icur := OriginalRow227TriangleData2068.coefficient222_223,
    output := OriginalRow227TriangleData2070.coefficient223_223, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_225, Icur := OriginalRow227TriangleData2068.coefficient222_224,
    output := OriginalRow227TriangleData2070.coefficient223_224, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_226, Icur := OriginalRow227TriangleData2068.coefficient222_225,
    output := OriginalRow227TriangleData2070.coefficient223_225, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_227, Icur := OriginalRow227TriangleData2068.coefficient222_226,
    output := OriginalRow227TriangleData2070.coefficient223_226, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_228, Icur := OriginalRow227TriangleData2068.coefficient222_227,
    output := OriginalRow227TriangleData2070.coefficient223_227, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_229, Icur := OriginalRow227TriangleData2068.coefficient222_228,
    output := OriginalRow227TriangleData2070.coefficient223_228, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_230, Icur := OriginalRow227TriangleData2068.coefficient222_229,
    output := OriginalRow227TriangleData2070.coefficient223_229, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_231, Icur := OriginalRow227TriangleData2068.coefficient222_230,
    output := OriginalRow227TriangleData2070.coefficient223_230, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_232, Icur := OriginalRow227TriangleData2068.coefficient222_231,
    output := OriginalRow227TriangleData2070.coefficient223_231, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_233, Icur := OriginalRow227TriangleData2068.coefficient222_232,
    output := OriginalRow227TriangleData2070.coefficient223_232, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_234, Icur := OriginalRow227TriangleData2068.coefficient222_233,
    output := OriginalRow227TriangleData2070.coefficient223_233, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_235, Icur := OriginalRow227TriangleData2068.coefficient222_234,
    output := OriginalRow227TriangleData2070.coefficient223_234, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_236, Icur := OriginalRow227TriangleData2068.coefficient222_235,
    output := OriginalRow227TriangleData2070.coefficient223_235, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_237, Icur := OriginalRow227TriangleData2068.coefficient222_236,
    output := OriginalRow227TriangleData2070.coefficient223_236, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_238, Icur := OriginalRow227TriangleData2068.coefficient222_237,
    output := OriginalRow227TriangleData2070.coefficient223_237, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_239, Icur := OriginalRow227TriangleData2068.coefficient222_238,
    output := OriginalRow227TriangleData2070.coefficient223_238, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_240, Icur := OriginalRow227TriangleData2068.coefficient222_239,
    output := OriginalRow227TriangleData2070.coefficient223_239, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_241, Icur := OriginalRow227TriangleData2068.coefficient222_240,
    output := OriginalRow227TriangleData2070.coefficient223_240, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_242, Icur := OriginalRow227TriangleData2068.coefficient222_241,
    output := OriginalRow227TriangleData2070.coefficient223_241, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_243, Icur := OriginalRow227TriangleData2068.coefficient222_242,
    output := OriginalRow227TriangleData2070.coefficient223_242, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_244, Icur := OriginalRow227TriangleData2068.coefficient222_243,
    output := OriginalRow227TriangleData2070.coefficient223_243, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_245, Icur := OriginalRow227TriangleData2068.coefficient222_244,
    output := OriginalRow227TriangleData2070.coefficient223_244, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_246, Icur := OriginalRow227TriangleData2068.coefficient222_245,
    output := OriginalRow227TriangleData2070.coefficient223_245, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_247, Icur := OriginalRow227TriangleData2068.coefficient222_246,
    output := OriginalRow227TriangleData2070.coefficient223_246, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_248, Icur := OriginalRow227TriangleData2068.coefficient222_247,
    output := OriginalRow227TriangleData2070.coefficient223_247, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_249, Icur := OriginalRow227TriangleData2068.coefficient222_248,
    output := OriginalRow227TriangleData2070.coefficient223_248, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_250, Icur := OriginalRow227TriangleData2068.coefficient222_249,
    output := OriginalRow227TriangleData2070.coefficient223_249, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_251, Icur := OriginalRow227TriangleData2068.coefficient222_250,
    output := OriginalRow227TriangleData2070.coefficient223_250, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2068.coefficient222_252, Icur := OriginalRow227TriangleData2068.coefficient222_251,
    output := OriginalRow227TriangleData2070.coefficient223_251, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_253, Icur := OriginalRow227TriangleData2068.coefficient222_252,
    output := OriginalRow227TriangleData2070.coefficient223_252, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_254, Icur := OriginalRow227TriangleData2069.coefficient222_253,
    output := OriginalRow227TriangleData2070.coefficient223_253, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2054

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2054.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
