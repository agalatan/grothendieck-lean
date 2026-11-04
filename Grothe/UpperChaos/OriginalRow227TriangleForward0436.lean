import Grothe.UpperChaos.OriginalRow227TriangleData0438
import Grothe.UpperChaos.OriginalRow227TriangleData0439
import Grothe.UpperChaos.OriginalRow227TriangleData0452
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0436
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_221, Icur := OriginalRow227TriangleData0438.coefficient28_220,
    output := OriginalRow227TriangleData0452.coefficient29_220, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_222, Icur := OriginalRow227TriangleData0438.coefficient28_221,
    output := OriginalRow227TriangleData0452.coefficient29_221, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_223, Icur := OriginalRow227TriangleData0438.coefficient28_222,
    output := OriginalRow227TriangleData0452.coefficient29_222, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_224, Icur := OriginalRow227TriangleData0438.coefficient28_223,
    output := OriginalRow227TriangleData0452.coefficient29_223, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_225, Icur := OriginalRow227TriangleData0438.coefficient28_224,
    output := OriginalRow227TriangleData0452.coefficient29_224, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_226, Icur := OriginalRow227TriangleData0438.coefficient28_225,
    output := OriginalRow227TriangleData0452.coefficient29_225, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_227, Icur := OriginalRow227TriangleData0438.coefficient28_226,
    output := OriginalRow227TriangleData0452.coefficient29_226, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_228, Icur := OriginalRow227TriangleData0438.coefficient28_227,
    output := OriginalRow227TriangleData0452.coefficient29_227, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_229, Icur := OriginalRow227TriangleData0438.coefficient28_228,
    output := OriginalRow227TriangleData0452.coefficient29_228, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_230, Icur := OriginalRow227TriangleData0438.coefficient28_229,
    output := OriginalRow227TriangleData0452.coefficient29_229, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_231, Icur := OriginalRow227TriangleData0438.coefficient28_230,
    output := OriginalRow227TriangleData0452.coefficient29_230, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_232, Icur := OriginalRow227TriangleData0438.coefficient28_231,
    output := OriginalRow227TriangleData0452.coefficient29_231, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_233, Icur := OriginalRow227TriangleData0438.coefficient28_232,
    output := OriginalRow227TriangleData0452.coefficient29_232, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_234, Icur := OriginalRow227TriangleData0438.coefficient28_233,
    output := OriginalRow227TriangleData0452.coefficient29_233, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_235, Icur := OriginalRow227TriangleData0438.coefficient28_234,
    output := OriginalRow227TriangleData0452.coefficient29_234, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_236, Icur := OriginalRow227TriangleData0438.coefficient28_235,
    output := OriginalRow227TriangleData0452.coefficient29_235, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_237, Icur := OriginalRow227TriangleData0438.coefficient28_236,
    output := OriginalRow227TriangleData0452.coefficient29_236, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_238, Icur := OriginalRow227TriangleData0438.coefficient28_237,
    output := OriginalRow227TriangleData0452.coefficient29_237, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_239, Icur := OriginalRow227TriangleData0438.coefficient28_238,
    output := OriginalRow227TriangleData0452.coefficient29_238, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_240, Icur := OriginalRow227TriangleData0438.coefficient28_239,
    output := OriginalRow227TriangleData0452.coefficient29_239, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_241, Icur := OriginalRow227TriangleData0438.coefficient28_240,
    output := OriginalRow227TriangleData0452.coefficient29_240, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_242, Icur := OriginalRow227TriangleData0438.coefficient28_241,
    output := OriginalRow227TriangleData0452.coefficient29_241, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_243, Icur := OriginalRow227TriangleData0438.coefficient28_242,
    output := OriginalRow227TriangleData0452.coefficient29_242, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_244, Icur := OriginalRow227TriangleData0438.coefficient28_243,
    output := OriginalRow227TriangleData0452.coefficient29_243, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_245, Icur := OriginalRow227TriangleData0438.coefficient28_244,
    output := OriginalRow227TriangleData0452.coefficient29_244, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_246, Icur := OriginalRow227TriangleData0438.coefficient28_245,
    output := OriginalRow227TriangleData0452.coefficient29_245, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_247, Icur := OriginalRow227TriangleData0438.coefficient28_246,
    output := OriginalRow227TriangleData0452.coefficient29_246, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_248, Icur := OriginalRow227TriangleData0438.coefficient28_247,
    output := OriginalRow227TriangleData0452.coefficient29_247, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_249, Icur := OriginalRow227TriangleData0438.coefficient28_248,
    output := OriginalRow227TriangleData0452.coefficient29_248, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0438.coefficient28_250, Icur := OriginalRow227TriangleData0438.coefficient28_249,
    output := OriginalRow227TriangleData0452.coefficient29_249, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0439.coefficient28_251, Icur := OriginalRow227TriangleData0438.coefficient28_250,
    output := OriginalRow227TriangleData0452.coefficient29_250, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0439.coefficient28_252, Icur := OriginalRow227TriangleData0439.coefficient28_251,
    output := OriginalRow227TriangleData0452.coefficient29_251, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0436

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0436.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
