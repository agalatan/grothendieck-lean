import Grothe.UpperChaos.OriginalRow227TriangleData0199
import Grothe.UpperChaos.OriginalRow227TriangleData0200
import Grothe.UpperChaos.OriginalRow227TriangleData0214
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0198
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_237, Icur := OriginalRow227TriangleData0199.coefficient12_236,
    output := OriginalRow227TriangleData0214.coefficient13_236, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_238, Icur := OriginalRow227TriangleData0199.coefficient12_237,
    output := OriginalRow227TriangleData0214.coefficient13_237, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_239, Icur := OriginalRow227TriangleData0199.coefficient12_238,
    output := OriginalRow227TriangleData0214.coefficient13_238, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_240, Icur := OriginalRow227TriangleData0199.coefficient12_239,
    output := OriginalRow227TriangleData0214.coefficient13_239, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_241, Icur := OriginalRow227TriangleData0199.coefficient12_240,
    output := OriginalRow227TriangleData0214.coefficient13_240, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_242, Icur := OriginalRow227TriangleData0199.coefficient12_241,
    output := OriginalRow227TriangleData0214.coefficient13_241, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_243, Icur := OriginalRow227TriangleData0199.coefficient12_242,
    output := OriginalRow227TriangleData0214.coefficient13_242, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_244, Icur := OriginalRow227TriangleData0199.coefficient12_243,
    output := OriginalRow227TriangleData0214.coefficient13_243, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_245, Icur := OriginalRow227TriangleData0199.coefficient12_244,
    output := OriginalRow227TriangleData0214.coefficient13_244, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_246, Icur := OriginalRow227TriangleData0199.coefficient12_245,
    output := OriginalRow227TriangleData0214.coefficient13_245, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_247, Icur := OriginalRow227TriangleData0199.coefficient12_246,
    output := OriginalRow227TriangleData0214.coefficient13_246, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_248, Icur := OriginalRow227TriangleData0199.coefficient12_247,
    output := OriginalRow227TriangleData0214.coefficient13_247, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_249, Icur := OriginalRow227TriangleData0199.coefficient12_248,
    output := OriginalRow227TriangleData0214.coefficient13_248, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_250, Icur := OriginalRow227TriangleData0199.coefficient12_249,
    output := OriginalRow227TriangleData0214.coefficient13_249, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_251, Icur := OriginalRow227TriangleData0199.coefficient12_250,
    output := OriginalRow227TriangleData0214.coefficient13_250, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_252, Icur := OriginalRow227TriangleData0199.coefficient12_251,
    output := OriginalRow227TriangleData0214.coefficient13_251, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_253, Icur := OriginalRow227TriangleData0199.coefficient12_252,
    output := OriginalRow227TriangleData0214.coefficient13_252, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_254, Icur := OriginalRow227TriangleData0199.coefficient12_253,
    output := OriginalRow227TriangleData0214.coefficient13_253, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_255, Icur := OriginalRow227TriangleData0199.coefficient12_254,
    output := OriginalRow227TriangleData0214.coefficient13_254, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_256, Icur := OriginalRow227TriangleData0199.coefficient12_255,
    output := OriginalRow227TriangleData0214.coefficient13_255, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_257, Icur := OriginalRow227TriangleData0199.coefficient12_256,
    output := OriginalRow227TriangleData0214.coefficient13_256, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_258, Icur := OriginalRow227TriangleData0199.coefficient12_257,
    output := OriginalRow227TriangleData0214.coefficient13_257, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_259, Icur := OriginalRow227TriangleData0199.coefficient12_258,
    output := OriginalRow227TriangleData0214.coefficient13_258, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_260, Icur := OriginalRow227TriangleData0199.coefficient12_259,
    output := OriginalRow227TriangleData0214.coefficient13_259, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_261, Icur := OriginalRow227TriangleData0199.coefficient12_260,
    output := OriginalRow227TriangleData0214.coefficient13_260, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_262, Icur := OriginalRow227TriangleData0199.coefficient12_261,
    output := OriginalRow227TriangleData0214.coefficient13_261, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_263, Icur := OriginalRow227TriangleData0199.coefficient12_262,
    output := OriginalRow227TriangleData0214.coefficient13_262, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_264, Icur := OriginalRow227TriangleData0199.coefficient12_263,
    output := OriginalRow227TriangleData0214.coefficient13_263, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_265, Icur := OriginalRow227TriangleData0199.coefficient12_264,
    output := OriginalRow227TriangleData0214.coefficient13_264, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0199.coefficient12_266, Icur := OriginalRow227TriangleData0199.coefficient12_265,
    output := OriginalRow227TriangleData0214.coefficient13_265, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0200.coefficient12_267, Icur := OriginalRow227TriangleData0199.coefficient12_266,
    output := OriginalRow227TriangleData0214.coefficient13_266, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0200.coefficient12_268, Icur := OriginalRow227TriangleData0200.coefficient12_267,
    output := OriginalRow227TriangleData0214.coefficient13_267, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0198

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0198.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
