import Grothe.UpperChaos.OriginalRow227TriangleData0701
import Grothe.UpperChaos.OriginalRow227TriangleData0702
import Grothe.UpperChaos.OriginalRow227TriangleData0714
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0698
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_240, Icur := OriginalRow227TriangleData0701.coefficient47_239,
    output := OriginalRow227TriangleData0714.coefficient48_239, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_241, Icur := OriginalRow227TriangleData0701.coefficient47_240,
    output := OriginalRow227TriangleData0714.coefficient48_240, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_242, Icur := OriginalRow227TriangleData0701.coefficient47_241,
    output := OriginalRow227TriangleData0714.coefficient48_241, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_243, Icur := OriginalRow227TriangleData0701.coefficient47_242,
    output := OriginalRow227TriangleData0714.coefficient48_242, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_244, Icur := OriginalRow227TriangleData0701.coefficient47_243,
    output := OriginalRow227TriangleData0714.coefficient48_243, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_245, Icur := OriginalRow227TriangleData0701.coefficient47_244,
    output := OriginalRow227TriangleData0714.coefficient48_244, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_246, Icur := OriginalRow227TriangleData0701.coefficient47_245,
    output := OriginalRow227TriangleData0714.coefficient48_245, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_247, Icur := OriginalRow227TriangleData0701.coefficient47_246,
    output := OriginalRow227TriangleData0714.coefficient48_246, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_248, Icur := OriginalRow227TriangleData0701.coefficient47_247,
    output := OriginalRow227TriangleData0714.coefficient48_247, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_249, Icur := OriginalRow227TriangleData0701.coefficient47_248,
    output := OriginalRow227TriangleData0714.coefficient48_248, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_250, Icur := OriginalRow227TriangleData0701.coefficient47_249,
    output := OriginalRow227TriangleData0714.coefficient48_249, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_251, Icur := OriginalRow227TriangleData0701.coefficient47_250,
    output := OriginalRow227TriangleData0714.coefficient48_250, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_252, Icur := OriginalRow227TriangleData0701.coefficient47_251,
    output := OriginalRow227TriangleData0714.coefficient48_251, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_253, Icur := OriginalRow227TriangleData0701.coefficient47_252,
    output := OriginalRow227TriangleData0714.coefficient48_252, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_254, Icur := OriginalRow227TriangleData0701.coefficient47_253,
    output := OriginalRow227TriangleData0714.coefficient48_253, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_255, Icur := OriginalRow227TriangleData0701.coefficient47_254,
    output := OriginalRow227TriangleData0714.coefficient48_254, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_256, Icur := OriginalRow227TriangleData0701.coefficient47_255,
    output := OriginalRow227TriangleData0714.coefficient48_255, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_257, Icur := OriginalRow227TriangleData0701.coefficient47_256,
    output := OriginalRow227TriangleData0714.coefficient48_256, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_258, Icur := OriginalRow227TriangleData0701.coefficient47_257,
    output := OriginalRow227TriangleData0714.coefficient48_257, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_259, Icur := OriginalRow227TriangleData0701.coefficient47_258,
    output := OriginalRow227TriangleData0714.coefficient48_258, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_260, Icur := OriginalRow227TriangleData0701.coefficient47_259,
    output := OriginalRow227TriangleData0714.coefficient48_259, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_261, Icur := OriginalRow227TriangleData0701.coefficient47_260,
    output := OriginalRow227TriangleData0714.coefficient48_260, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_262, Icur := OriginalRow227TriangleData0701.coefficient47_261,
    output := OriginalRow227TriangleData0714.coefficient48_261, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_263, Icur := OriginalRow227TriangleData0701.coefficient47_262,
    output := OriginalRow227TriangleData0714.coefficient48_262, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_264, Icur := OriginalRow227TriangleData0701.coefficient47_263,
    output := OriginalRow227TriangleData0714.coefficient48_263, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_265, Icur := OriginalRow227TriangleData0701.coefficient47_264,
    output := OriginalRow227TriangleData0714.coefficient48_264, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_266, Icur := OriginalRow227TriangleData0701.coefficient47_265,
    output := OriginalRow227TriangleData0714.coefficient48_265, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_267, Icur := OriginalRow227TriangleData0701.coefficient47_266,
    output := OriginalRow227TriangleData0714.coefficient48_266, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_268, Icur := OriginalRow227TriangleData0701.coefficient47_267,
    output := OriginalRow227TriangleData0714.coefficient48_267, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_269, Icur := OriginalRow227TriangleData0701.coefficient47_268,
    output := OriginalRow227TriangleData0714.coefficient48_268, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0702.coefficient47_270, Icur := OriginalRow227TriangleData0701.coefficient47_269,
    output := OriginalRow227TriangleData0714.coefficient48_269, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0702.coefficient47_271, Icur := OriginalRow227TriangleData0702.coefficient47_270,
    output := OriginalRow227TriangleData0714.coefficient48_270, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0698

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0698.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
