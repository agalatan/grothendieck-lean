import Grothe.UpperChaos.OriginalRow227TriangleData0103
import Grothe.UpperChaos.OriginalRow227TriangleData0104
import Grothe.UpperChaos.OriginalRow227TriangleData0119
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0103
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_231, Icur := OriginalRow227TriangleData0103.coefficient6_230,
    output := OriginalRow227TriangleData0119.coefficient7_230, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_232, Icur := OriginalRow227TriangleData0103.coefficient6_231,
    output := OriginalRow227TriangleData0119.coefficient7_231, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_233, Icur := OriginalRow227TriangleData0103.coefficient6_232,
    output := OriginalRow227TriangleData0119.coefficient7_232, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_234, Icur := OriginalRow227TriangleData0103.coefficient6_233,
    output := OriginalRow227TriangleData0119.coefficient7_233, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_235, Icur := OriginalRow227TriangleData0103.coefficient6_234,
    output := OriginalRow227TriangleData0119.coefficient7_234, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_236, Icur := OriginalRow227TriangleData0103.coefficient6_235,
    output := OriginalRow227TriangleData0119.coefficient7_235, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_237, Icur := OriginalRow227TriangleData0103.coefficient6_236,
    output := OriginalRow227TriangleData0119.coefficient7_236, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_238, Icur := OriginalRow227TriangleData0103.coefficient6_237,
    output := OriginalRow227TriangleData0119.coefficient7_237, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_239, Icur := OriginalRow227TriangleData0103.coefficient6_238,
    output := OriginalRow227TriangleData0119.coefficient7_238, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_240, Icur := OriginalRow227TriangleData0103.coefficient6_239,
    output := OriginalRow227TriangleData0119.coefficient7_239, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_241, Icur := OriginalRow227TriangleData0103.coefficient6_240,
    output := OriginalRow227TriangleData0119.coefficient7_240, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_242, Icur := OriginalRow227TriangleData0103.coefficient6_241,
    output := OriginalRow227TriangleData0119.coefficient7_241, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_243, Icur := OriginalRow227TriangleData0103.coefficient6_242,
    output := OriginalRow227TriangleData0119.coefficient7_242, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_244, Icur := OriginalRow227TriangleData0103.coefficient6_243,
    output := OriginalRow227TriangleData0119.coefficient7_243, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_245, Icur := OriginalRow227TriangleData0103.coefficient6_244,
    output := OriginalRow227TriangleData0119.coefficient7_244, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_246, Icur := OriginalRow227TriangleData0103.coefficient6_245,
    output := OriginalRow227TriangleData0119.coefficient7_245, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_247, Icur := OriginalRow227TriangleData0103.coefficient6_246,
    output := OriginalRow227TriangleData0119.coefficient7_246, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_248, Icur := OriginalRow227TriangleData0103.coefficient6_247,
    output := OriginalRow227TriangleData0119.coefficient7_247, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_249, Icur := OriginalRow227TriangleData0103.coefficient6_248,
    output := OriginalRow227TriangleData0119.coefficient7_248, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_250, Icur := OriginalRow227TriangleData0103.coefficient6_249,
    output := OriginalRow227TriangleData0119.coefficient7_249, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_251, Icur := OriginalRow227TriangleData0103.coefficient6_250,
    output := OriginalRow227TriangleData0119.coefficient7_250, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_252, Icur := OriginalRow227TriangleData0103.coefficient6_251,
    output := OriginalRow227TriangleData0119.coefficient7_251, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_253, Icur := OriginalRow227TriangleData0103.coefficient6_252,
    output := OriginalRow227TriangleData0119.coefficient7_252, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_254, Icur := OriginalRow227TriangleData0103.coefficient6_253,
    output := OriginalRow227TriangleData0119.coefficient7_253, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_255, Icur := OriginalRow227TriangleData0103.coefficient6_254,
    output := OriginalRow227TriangleData0119.coefficient7_254, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_256, Icur := OriginalRow227TriangleData0103.coefficient6_255,
    output := OriginalRow227TriangleData0119.coefficient7_255, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_257, Icur := OriginalRow227TriangleData0103.coefficient6_256,
    output := OriginalRow227TriangleData0119.coefficient7_256, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_258, Icur := OriginalRow227TriangleData0103.coefficient6_257,
    output := OriginalRow227TriangleData0119.coefficient7_257, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_259, Icur := OriginalRow227TriangleData0103.coefficient6_258,
    output := OriginalRow227TriangleData0119.coefficient7_258, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0103.coefficient6_260, Icur := OriginalRow227TriangleData0103.coefficient6_259,
    output := OriginalRow227TriangleData0119.coefficient7_259, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0104.coefficient6_261, Icur := OriginalRow227TriangleData0103.coefficient6_260,
    output := OriginalRow227TriangleData0119.coefficient7_260, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0104.coefficient6_262, Icur := OriginalRow227TriangleData0104.coefficient6_261,
    output := OriginalRow227TriangleData0119.coefficient7_261, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0103

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0103.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
