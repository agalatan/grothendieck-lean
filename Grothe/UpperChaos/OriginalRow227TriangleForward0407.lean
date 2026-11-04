import Grothe.UpperChaos.OriginalRow227TriangleData0408
import Grothe.UpperChaos.OriginalRow227TriangleData0409
import Grothe.UpperChaos.OriginalRow227TriangleData0423
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0407
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_219, Icur := OriginalRow227TriangleData0408.coefficient26_218,
    output := OriginalRow227TriangleData0423.coefficient27_218, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_220, Icur := OriginalRow227TriangleData0408.coefficient26_219,
    output := OriginalRow227TriangleData0423.coefficient27_219, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_221, Icur := OriginalRow227TriangleData0408.coefficient26_220,
    output := OriginalRow227TriangleData0423.coefficient27_220, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_222, Icur := OriginalRow227TriangleData0408.coefficient26_221,
    output := OriginalRow227TriangleData0423.coefficient27_221, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_223, Icur := OriginalRow227TriangleData0408.coefficient26_222,
    output := OriginalRow227TriangleData0423.coefficient27_222, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_224, Icur := OriginalRow227TriangleData0408.coefficient26_223,
    output := OriginalRow227TriangleData0423.coefficient27_223, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_225, Icur := OriginalRow227TriangleData0408.coefficient26_224,
    output := OriginalRow227TriangleData0423.coefficient27_224, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_226, Icur := OriginalRow227TriangleData0408.coefficient26_225,
    output := OriginalRow227TriangleData0423.coefficient27_225, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_227, Icur := OriginalRow227TriangleData0408.coefficient26_226,
    output := OriginalRow227TriangleData0423.coefficient27_226, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_228, Icur := OriginalRow227TriangleData0408.coefficient26_227,
    output := OriginalRow227TriangleData0423.coefficient27_227, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_229, Icur := OriginalRow227TriangleData0408.coefficient26_228,
    output := OriginalRow227TriangleData0423.coefficient27_228, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_230, Icur := OriginalRow227TriangleData0408.coefficient26_229,
    output := OriginalRow227TriangleData0423.coefficient27_229, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_231, Icur := OriginalRow227TriangleData0408.coefficient26_230,
    output := OriginalRow227TriangleData0423.coefficient27_230, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_232, Icur := OriginalRow227TriangleData0408.coefficient26_231,
    output := OriginalRow227TriangleData0423.coefficient27_231, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_233, Icur := OriginalRow227TriangleData0408.coefficient26_232,
    output := OriginalRow227TriangleData0423.coefficient27_232, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_234, Icur := OriginalRow227TriangleData0408.coefficient26_233,
    output := OriginalRow227TriangleData0423.coefficient27_233, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_235, Icur := OriginalRow227TriangleData0408.coefficient26_234,
    output := OriginalRow227TriangleData0423.coefficient27_234, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_236, Icur := OriginalRow227TriangleData0408.coefficient26_235,
    output := OriginalRow227TriangleData0423.coefficient27_235, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_237, Icur := OriginalRow227TriangleData0408.coefficient26_236,
    output := OriginalRow227TriangleData0423.coefficient27_236, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_238, Icur := OriginalRow227TriangleData0408.coefficient26_237,
    output := OriginalRow227TriangleData0423.coefficient27_237, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_239, Icur := OriginalRow227TriangleData0408.coefficient26_238,
    output := OriginalRow227TriangleData0423.coefficient27_238, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_240, Icur := OriginalRow227TriangleData0408.coefficient26_239,
    output := OriginalRow227TriangleData0423.coefficient27_239, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_241, Icur := OriginalRow227TriangleData0408.coefficient26_240,
    output := OriginalRow227TriangleData0423.coefficient27_240, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_242, Icur := OriginalRow227TriangleData0408.coefficient26_241,
    output := OriginalRow227TriangleData0423.coefficient27_241, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_243, Icur := OriginalRow227TriangleData0408.coefficient26_242,
    output := OriginalRow227TriangleData0423.coefficient27_242, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_244, Icur := OriginalRow227TriangleData0408.coefficient26_243,
    output := OriginalRow227TriangleData0423.coefficient27_243, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_245, Icur := OriginalRow227TriangleData0408.coefficient26_244,
    output := OriginalRow227TriangleData0423.coefficient27_244, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_246, Icur := OriginalRow227TriangleData0408.coefficient26_245,
    output := OriginalRow227TriangleData0423.coefficient27_245, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_247, Icur := OriginalRow227TriangleData0408.coefficient26_246,
    output := OriginalRow227TriangleData0423.coefficient27_246, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0408.coefficient26_248, Icur := OriginalRow227TriangleData0408.coefficient26_247,
    output := OriginalRow227TriangleData0423.coefficient27_247, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_249, Icur := OriginalRow227TriangleData0408.coefficient26_248,
    output := OriginalRow227TriangleData0423.coefficient27_248, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0409.coefficient26_250, Icur := OriginalRow227TriangleData0409.coefficient26_249,
    output := OriginalRow227TriangleData0423.coefficient27_249, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0407

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0407.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
