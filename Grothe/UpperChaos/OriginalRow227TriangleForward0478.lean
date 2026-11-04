import Grothe.UpperChaos.OriginalRow227TriangleData0480
import Grothe.UpperChaos.OriginalRow227TriangleData0481
import Grothe.UpperChaos.OriginalRow227TriangleData0494
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0478
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_224, Icur := OriginalRow227TriangleData0480.coefficient31_223,
    output := OriginalRow227TriangleData0494.coefficient32_223, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_225, Icur := OriginalRow227TriangleData0480.coefficient31_224,
    output := OriginalRow227TriangleData0494.coefficient32_224, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_226, Icur := OriginalRow227TriangleData0480.coefficient31_225,
    output := OriginalRow227TriangleData0494.coefficient32_225, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_227, Icur := OriginalRow227TriangleData0480.coefficient31_226,
    output := OriginalRow227TriangleData0494.coefficient32_226, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_228, Icur := OriginalRow227TriangleData0480.coefficient31_227,
    output := OriginalRow227TriangleData0494.coefficient32_227, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_229, Icur := OriginalRow227TriangleData0480.coefficient31_228,
    output := OriginalRow227TriangleData0494.coefficient32_228, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_230, Icur := OriginalRow227TriangleData0480.coefficient31_229,
    output := OriginalRow227TriangleData0494.coefficient32_229, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_231, Icur := OriginalRow227TriangleData0480.coefficient31_230,
    output := OriginalRow227TriangleData0494.coefficient32_230, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_232, Icur := OriginalRow227TriangleData0480.coefficient31_231,
    output := OriginalRow227TriangleData0494.coefficient32_231, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_233, Icur := OriginalRow227TriangleData0480.coefficient31_232,
    output := OriginalRow227TriangleData0494.coefficient32_232, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_234, Icur := OriginalRow227TriangleData0480.coefficient31_233,
    output := OriginalRow227TriangleData0494.coefficient32_233, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_235, Icur := OriginalRow227TriangleData0480.coefficient31_234,
    output := OriginalRow227TriangleData0494.coefficient32_234, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_236, Icur := OriginalRow227TriangleData0480.coefficient31_235,
    output := OriginalRow227TriangleData0494.coefficient32_235, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_237, Icur := OriginalRow227TriangleData0480.coefficient31_236,
    output := OriginalRow227TriangleData0494.coefficient32_236, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_238, Icur := OriginalRow227TriangleData0480.coefficient31_237,
    output := OriginalRow227TriangleData0494.coefficient32_237, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_239, Icur := OriginalRow227TriangleData0480.coefficient31_238,
    output := OriginalRow227TriangleData0494.coefficient32_238, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_240, Icur := OriginalRow227TriangleData0480.coefficient31_239,
    output := OriginalRow227TriangleData0494.coefficient32_239, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_241, Icur := OriginalRow227TriangleData0480.coefficient31_240,
    output := OriginalRow227TriangleData0494.coefficient32_240, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_242, Icur := OriginalRow227TriangleData0480.coefficient31_241,
    output := OriginalRow227TriangleData0494.coefficient32_241, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_243, Icur := OriginalRow227TriangleData0480.coefficient31_242,
    output := OriginalRow227TriangleData0494.coefficient32_242, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_244, Icur := OriginalRow227TriangleData0480.coefficient31_243,
    output := OriginalRow227TriangleData0494.coefficient32_243, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_245, Icur := OriginalRow227TriangleData0480.coefficient31_244,
    output := OriginalRow227TriangleData0494.coefficient32_244, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_246, Icur := OriginalRow227TriangleData0480.coefficient31_245,
    output := OriginalRow227TriangleData0494.coefficient32_245, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_247, Icur := OriginalRow227TriangleData0480.coefficient31_246,
    output := OriginalRow227TriangleData0494.coefficient32_246, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_248, Icur := OriginalRow227TriangleData0480.coefficient31_247,
    output := OriginalRow227TriangleData0494.coefficient32_247, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_249, Icur := OriginalRow227TriangleData0480.coefficient31_248,
    output := OriginalRow227TriangleData0494.coefficient32_248, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_250, Icur := OriginalRow227TriangleData0480.coefficient31_249,
    output := OriginalRow227TriangleData0494.coefficient32_249, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_251, Icur := OriginalRow227TriangleData0480.coefficient31_250,
    output := OriginalRow227TriangleData0494.coefficient32_250, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_252, Icur := OriginalRow227TriangleData0480.coefficient31_251,
    output := OriginalRow227TriangleData0494.coefficient32_251, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0480.coefficient31_253, Icur := OriginalRow227TriangleData0480.coefficient31_252,
    output := OriginalRow227TriangleData0494.coefficient32_252, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_254, Icur := OriginalRow227TriangleData0480.coefficient31_253,
    output := OriginalRow227TriangleData0494.coefficient32_253, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0481.coefficient31_255, Icur := OriginalRow227TriangleData0481.coefficient31_254,
    output := OriginalRow227TriangleData0494.coefficient32_254, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0478

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0478.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
