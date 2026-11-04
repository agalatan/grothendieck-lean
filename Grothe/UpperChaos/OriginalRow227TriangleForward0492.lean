import Grothe.UpperChaos.OriginalRow227TriangleData0494
import Grothe.UpperChaos.OriginalRow227TriangleData0495
import Grothe.UpperChaos.OriginalRow227TriangleData0508
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0492
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_225, Icur := OriginalRow227TriangleData0494.coefficient32_224,
    output := OriginalRow227TriangleData0508.coefficient33_224, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_226, Icur := OriginalRow227TriangleData0494.coefficient32_225,
    output := OriginalRow227TriangleData0508.coefficient33_225, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_227, Icur := OriginalRow227TriangleData0494.coefficient32_226,
    output := OriginalRow227TriangleData0508.coefficient33_226, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_228, Icur := OriginalRow227TriangleData0494.coefficient32_227,
    output := OriginalRow227TriangleData0508.coefficient33_227, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_229, Icur := OriginalRow227TriangleData0494.coefficient32_228,
    output := OriginalRow227TriangleData0508.coefficient33_228, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_230, Icur := OriginalRow227TriangleData0494.coefficient32_229,
    output := OriginalRow227TriangleData0508.coefficient33_229, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_231, Icur := OriginalRow227TriangleData0494.coefficient32_230,
    output := OriginalRow227TriangleData0508.coefficient33_230, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_232, Icur := OriginalRow227TriangleData0494.coefficient32_231,
    output := OriginalRow227TriangleData0508.coefficient33_231, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_233, Icur := OriginalRow227TriangleData0494.coefficient32_232,
    output := OriginalRow227TriangleData0508.coefficient33_232, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_234, Icur := OriginalRow227TriangleData0494.coefficient32_233,
    output := OriginalRow227TriangleData0508.coefficient33_233, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_235, Icur := OriginalRow227TriangleData0494.coefficient32_234,
    output := OriginalRow227TriangleData0508.coefficient33_234, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_236, Icur := OriginalRow227TriangleData0494.coefficient32_235,
    output := OriginalRow227TriangleData0508.coefficient33_235, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_237, Icur := OriginalRow227TriangleData0494.coefficient32_236,
    output := OriginalRow227TriangleData0508.coefficient33_236, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_238, Icur := OriginalRow227TriangleData0494.coefficient32_237,
    output := OriginalRow227TriangleData0508.coefficient33_237, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_239, Icur := OriginalRow227TriangleData0494.coefficient32_238,
    output := OriginalRow227TriangleData0508.coefficient33_238, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_240, Icur := OriginalRow227TriangleData0494.coefficient32_239,
    output := OriginalRow227TriangleData0508.coefficient33_239, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_241, Icur := OriginalRow227TriangleData0494.coefficient32_240,
    output := OriginalRow227TriangleData0508.coefficient33_240, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_242, Icur := OriginalRow227TriangleData0494.coefficient32_241,
    output := OriginalRow227TriangleData0508.coefficient33_241, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_243, Icur := OriginalRow227TriangleData0494.coefficient32_242,
    output := OriginalRow227TriangleData0508.coefficient33_242, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_244, Icur := OriginalRow227TriangleData0494.coefficient32_243,
    output := OriginalRow227TriangleData0508.coefficient33_243, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_245, Icur := OriginalRow227TriangleData0494.coefficient32_244,
    output := OriginalRow227TriangleData0508.coefficient33_244, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_246, Icur := OriginalRow227TriangleData0494.coefficient32_245,
    output := OriginalRow227TriangleData0508.coefficient33_245, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_247, Icur := OriginalRow227TriangleData0494.coefficient32_246,
    output := OriginalRow227TriangleData0508.coefficient33_246, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_248, Icur := OriginalRow227TriangleData0494.coefficient32_247,
    output := OriginalRow227TriangleData0508.coefficient33_247, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_249, Icur := OriginalRow227TriangleData0494.coefficient32_248,
    output := OriginalRow227TriangleData0508.coefficient33_248, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_250, Icur := OriginalRow227TriangleData0494.coefficient32_249,
    output := OriginalRow227TriangleData0508.coefficient33_249, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_251, Icur := OriginalRow227TriangleData0494.coefficient32_250,
    output := OriginalRow227TriangleData0508.coefficient33_250, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_252, Icur := OriginalRow227TriangleData0494.coefficient32_251,
    output := OriginalRow227TriangleData0508.coefficient33_251, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_253, Icur := OriginalRow227TriangleData0494.coefficient32_252,
    output := OriginalRow227TriangleData0508.coefficient33_252, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0494.coefficient32_254, Icur := OriginalRow227TriangleData0494.coefficient32_253,
    output := OriginalRow227TriangleData0508.coefficient33_253, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0495.coefficient32_255, Icur := OriginalRow227TriangleData0494.coefficient32_254,
    output := OriginalRow227TriangleData0508.coefficient33_254, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0495.coefficient32_256, Icur := OriginalRow227TriangleData0495.coefficient32_255,
    output := OriginalRow227TriangleData0508.coefficient33_255, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0492

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0492.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
