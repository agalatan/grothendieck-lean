import Grothe.UpperChaos.OriginalRow227TriangleData0244
import Grothe.UpperChaos.OriginalRow227TriangleData0245
import Grothe.UpperChaos.OriginalRow227TriangleData0259
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0243
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_240, Icur := OriginalRow227TriangleData0244.coefficient15_239,
    output := OriginalRow227TriangleData0259.coefficient16_239, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_241, Icur := OriginalRow227TriangleData0244.coefficient15_240,
    output := OriginalRow227TriangleData0259.coefficient16_240, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_242, Icur := OriginalRow227TriangleData0244.coefficient15_241,
    output := OriginalRow227TriangleData0259.coefficient16_241, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_243, Icur := OriginalRow227TriangleData0244.coefficient15_242,
    output := OriginalRow227TriangleData0259.coefficient16_242, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_244, Icur := OriginalRow227TriangleData0244.coefficient15_243,
    output := OriginalRow227TriangleData0259.coefficient16_243, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_245, Icur := OriginalRow227TriangleData0244.coefficient15_244,
    output := OriginalRow227TriangleData0259.coefficient16_244, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_246, Icur := OriginalRow227TriangleData0244.coefficient15_245,
    output := OriginalRow227TriangleData0259.coefficient16_245, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_247, Icur := OriginalRow227TriangleData0244.coefficient15_246,
    output := OriginalRow227TriangleData0259.coefficient16_246, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_248, Icur := OriginalRow227TriangleData0244.coefficient15_247,
    output := OriginalRow227TriangleData0259.coefficient16_247, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_249, Icur := OriginalRow227TriangleData0244.coefficient15_248,
    output := OriginalRow227TriangleData0259.coefficient16_248, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_250, Icur := OriginalRow227TriangleData0244.coefficient15_249,
    output := OriginalRow227TriangleData0259.coefficient16_249, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_251, Icur := OriginalRow227TriangleData0244.coefficient15_250,
    output := OriginalRow227TriangleData0259.coefficient16_250, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_252, Icur := OriginalRow227TriangleData0244.coefficient15_251,
    output := OriginalRow227TriangleData0259.coefficient16_251, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_253, Icur := OriginalRow227TriangleData0244.coefficient15_252,
    output := OriginalRow227TriangleData0259.coefficient16_252, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_254, Icur := OriginalRow227TriangleData0244.coefficient15_253,
    output := OriginalRow227TriangleData0259.coefficient16_253, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_255, Icur := OriginalRow227TriangleData0244.coefficient15_254,
    output := OriginalRow227TriangleData0259.coefficient16_254, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_256, Icur := OriginalRow227TriangleData0244.coefficient15_255,
    output := OriginalRow227TriangleData0259.coefficient16_255, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_257, Icur := OriginalRow227TriangleData0244.coefficient15_256,
    output := OriginalRow227TriangleData0259.coefficient16_256, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_258, Icur := OriginalRow227TriangleData0244.coefficient15_257,
    output := OriginalRow227TriangleData0259.coefficient16_257, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_259, Icur := OriginalRow227TriangleData0244.coefficient15_258,
    output := OriginalRow227TriangleData0259.coefficient16_258, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_260, Icur := OriginalRow227TriangleData0244.coefficient15_259,
    output := OriginalRow227TriangleData0259.coefficient16_259, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_261, Icur := OriginalRow227TriangleData0244.coefficient15_260,
    output := OriginalRow227TriangleData0259.coefficient16_260, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_262, Icur := OriginalRow227TriangleData0244.coefficient15_261,
    output := OriginalRow227TriangleData0259.coefficient16_261, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_263, Icur := OriginalRow227TriangleData0244.coefficient15_262,
    output := OriginalRow227TriangleData0259.coefficient16_262, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_264, Icur := OriginalRow227TriangleData0244.coefficient15_263,
    output := OriginalRow227TriangleData0259.coefficient16_263, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_265, Icur := OriginalRow227TriangleData0244.coefficient15_264,
    output := OriginalRow227TriangleData0259.coefficient16_264, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_266, Icur := OriginalRow227TriangleData0244.coefficient15_265,
    output := OriginalRow227TriangleData0259.coefficient16_265, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_267, Icur := OriginalRow227TriangleData0244.coefficient15_266,
    output := OriginalRow227TriangleData0259.coefficient16_266, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_268, Icur := OriginalRow227TriangleData0244.coefficient15_267,
    output := OriginalRow227TriangleData0259.coefficient16_267, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0244.coefficient15_269, Icur := OriginalRow227TriangleData0244.coefficient15_268,
    output := OriginalRow227TriangleData0259.coefficient16_268, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0245.coefficient15_270, Icur := OriginalRow227TriangleData0244.coefficient15_269,
    output := OriginalRow227TriangleData0259.coefficient16_269, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0245.coefficient15_271, Icur := OriginalRow227TriangleData0245.coefficient15_270,
    output := OriginalRow227TriangleData0259.coefficient16_270, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0243

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0243.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
