import Grothe.UpperChaos.OriginalRow227TriangleData0648
import Grothe.UpperChaos.OriginalRow227TriangleData0649
import Grothe.UpperChaos.OriginalRow227TriangleData0662
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0646
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_236, Icur := OriginalRow227TriangleData0648.coefficient43_235,
    output := OriginalRow227TriangleData0662.coefficient44_235, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_237, Icur := OriginalRow227TriangleData0648.coefficient43_236,
    output := OriginalRow227TriangleData0662.coefficient44_236, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_238, Icur := OriginalRow227TriangleData0648.coefficient43_237,
    output := OriginalRow227TriangleData0662.coefficient44_237, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_239, Icur := OriginalRow227TriangleData0648.coefficient43_238,
    output := OriginalRow227TriangleData0662.coefficient44_238, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_240, Icur := OriginalRow227TriangleData0648.coefficient43_239,
    output := OriginalRow227TriangleData0662.coefficient44_239, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_241, Icur := OriginalRow227TriangleData0648.coefficient43_240,
    output := OriginalRow227TriangleData0662.coefficient44_240, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_242, Icur := OriginalRow227TriangleData0648.coefficient43_241,
    output := OriginalRow227TriangleData0662.coefficient44_241, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_243, Icur := OriginalRow227TriangleData0648.coefficient43_242,
    output := OriginalRow227TriangleData0662.coefficient44_242, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_244, Icur := OriginalRow227TriangleData0648.coefficient43_243,
    output := OriginalRow227TriangleData0662.coefficient44_243, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_245, Icur := OriginalRow227TriangleData0648.coefficient43_244,
    output := OriginalRow227TriangleData0662.coefficient44_244, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_246, Icur := OriginalRow227TriangleData0648.coefficient43_245,
    output := OriginalRow227TriangleData0662.coefficient44_245, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_247, Icur := OriginalRow227TriangleData0648.coefficient43_246,
    output := OriginalRow227TriangleData0662.coefficient44_246, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_248, Icur := OriginalRow227TriangleData0648.coefficient43_247,
    output := OriginalRow227TriangleData0662.coefficient44_247, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_249, Icur := OriginalRow227TriangleData0648.coefficient43_248,
    output := OriginalRow227TriangleData0662.coefficient44_248, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_250, Icur := OriginalRow227TriangleData0648.coefficient43_249,
    output := OriginalRow227TriangleData0662.coefficient44_249, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_251, Icur := OriginalRow227TriangleData0648.coefficient43_250,
    output := OriginalRow227TriangleData0662.coefficient44_250, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_252, Icur := OriginalRow227TriangleData0648.coefficient43_251,
    output := OriginalRow227TriangleData0662.coefficient44_251, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_253, Icur := OriginalRow227TriangleData0648.coefficient43_252,
    output := OriginalRow227TriangleData0662.coefficient44_252, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_254, Icur := OriginalRow227TriangleData0648.coefficient43_253,
    output := OriginalRow227TriangleData0662.coefficient44_253, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_255, Icur := OriginalRow227TriangleData0648.coefficient43_254,
    output := OriginalRow227TriangleData0662.coefficient44_254, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_256, Icur := OriginalRow227TriangleData0648.coefficient43_255,
    output := OriginalRow227TriangleData0662.coefficient44_255, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_257, Icur := OriginalRow227TriangleData0648.coefficient43_256,
    output := OriginalRow227TriangleData0662.coefficient44_256, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_258, Icur := OriginalRow227TriangleData0648.coefficient43_257,
    output := OriginalRow227TriangleData0662.coefficient44_257, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_259, Icur := OriginalRow227TriangleData0648.coefficient43_258,
    output := OriginalRow227TriangleData0662.coefficient44_258, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_260, Icur := OriginalRow227TriangleData0648.coefficient43_259,
    output := OriginalRow227TriangleData0662.coefficient44_259, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_261, Icur := OriginalRow227TriangleData0648.coefficient43_260,
    output := OriginalRow227TriangleData0662.coefficient44_260, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_262, Icur := OriginalRow227TriangleData0648.coefficient43_261,
    output := OriginalRow227TriangleData0662.coefficient44_261, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_263, Icur := OriginalRow227TriangleData0648.coefficient43_262,
    output := OriginalRow227TriangleData0662.coefficient44_262, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_264, Icur := OriginalRow227TriangleData0648.coefficient43_263,
    output := OriginalRow227TriangleData0662.coefficient44_263, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0648.coefficient43_265, Icur := OriginalRow227TriangleData0648.coefficient43_264,
    output := OriginalRow227TriangleData0662.coefficient44_264, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_266, Icur := OriginalRow227TriangleData0648.coefficient43_265,
    output := OriginalRow227TriangleData0662.coefficient44_265, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_267, Icur := OriginalRow227TriangleData0649.coefficient43_266,
    output := OriginalRow227TriangleData0662.coefficient44_266, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0646

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0646.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
