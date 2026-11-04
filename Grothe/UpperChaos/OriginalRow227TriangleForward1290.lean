import Grothe.UpperChaos.OriginalRow227TriangleData1296
import Grothe.UpperChaos.OriginalRow227TriangleData1297
import Grothe.UpperChaos.OriginalRow227TriangleData1306
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1290
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_227, Icur := OriginalRow227TriangleData1296.coefficient98_226,
    output := OriginalRow227TriangleData1306.coefficient99_226, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_228, Icur := OriginalRow227TriangleData1296.coefficient98_227,
    output := OriginalRow227TriangleData1306.coefficient99_227, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_229, Icur := OriginalRow227TriangleData1296.coefficient98_228,
    output := OriginalRow227TriangleData1306.coefficient99_228, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_230, Icur := OriginalRow227TriangleData1296.coefficient98_229,
    output := OriginalRow227TriangleData1306.coefficient99_229, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_231, Icur := OriginalRow227TriangleData1296.coefficient98_230,
    output := OriginalRow227TriangleData1306.coefficient99_230, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_232, Icur := OriginalRow227TriangleData1296.coefficient98_231,
    output := OriginalRow227TriangleData1306.coefficient99_231, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_233, Icur := OriginalRow227TriangleData1296.coefficient98_232,
    output := OriginalRow227TriangleData1306.coefficient99_232, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_234, Icur := OriginalRow227TriangleData1296.coefficient98_233,
    output := OriginalRow227TriangleData1306.coefficient99_233, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_235, Icur := OriginalRow227TriangleData1296.coefficient98_234,
    output := OriginalRow227TriangleData1306.coefficient99_234, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_236, Icur := OriginalRow227TriangleData1296.coefficient98_235,
    output := OriginalRow227TriangleData1306.coefficient99_235, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_237, Icur := OriginalRow227TriangleData1296.coefficient98_236,
    output := OriginalRow227TriangleData1306.coefficient99_236, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_238, Icur := OriginalRow227TriangleData1296.coefficient98_237,
    output := OriginalRow227TriangleData1306.coefficient99_237, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_239, Icur := OriginalRow227TriangleData1296.coefficient98_238,
    output := OriginalRow227TriangleData1306.coefficient99_238, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_240, Icur := OriginalRow227TriangleData1296.coefficient98_239,
    output := OriginalRow227TriangleData1306.coefficient99_239, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_241, Icur := OriginalRow227TriangleData1296.coefficient98_240,
    output := OriginalRow227TriangleData1306.coefficient99_240, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_242, Icur := OriginalRow227TriangleData1296.coefficient98_241,
    output := OriginalRow227TriangleData1306.coefficient99_241, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_243, Icur := OriginalRow227TriangleData1296.coefficient98_242,
    output := OriginalRow227TriangleData1306.coefficient99_242, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_244, Icur := OriginalRow227TriangleData1296.coefficient98_243,
    output := OriginalRow227TriangleData1306.coefficient99_243, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_245, Icur := OriginalRow227TriangleData1296.coefficient98_244,
    output := OriginalRow227TriangleData1306.coefficient99_244, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_246, Icur := OriginalRow227TriangleData1296.coefficient98_245,
    output := OriginalRow227TriangleData1306.coefficient99_245, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_247, Icur := OriginalRow227TriangleData1296.coefficient98_246,
    output := OriginalRow227TriangleData1306.coefficient99_246, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_248, Icur := OriginalRow227TriangleData1296.coefficient98_247,
    output := OriginalRow227TriangleData1306.coefficient99_247, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_249, Icur := OriginalRow227TriangleData1296.coefficient98_248,
    output := OriginalRow227TriangleData1306.coefficient99_248, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_250, Icur := OriginalRow227TriangleData1296.coefficient98_249,
    output := OriginalRow227TriangleData1306.coefficient99_249, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_251, Icur := OriginalRow227TriangleData1296.coefficient98_250,
    output := OriginalRow227TriangleData1306.coefficient99_250, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_252, Icur := OriginalRow227TriangleData1296.coefficient98_251,
    output := OriginalRow227TriangleData1306.coefficient99_251, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_253, Icur := OriginalRow227TriangleData1296.coefficient98_252,
    output := OriginalRow227TriangleData1306.coefficient99_252, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_254, Icur := OriginalRow227TriangleData1296.coefficient98_253,
    output := OriginalRow227TriangleData1306.coefficient99_253, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_255, Icur := OriginalRow227TriangleData1296.coefficient98_254,
    output := OriginalRow227TriangleData1306.coefficient99_254, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1296.coefficient98_256, Icur := OriginalRow227TriangleData1296.coefficient98_255,
    output := OriginalRow227TriangleData1306.coefficient99_255, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1297.coefficient98_257, Icur := OriginalRow227TriangleData1296.coefficient98_256,
    output := OriginalRow227TriangleData1306.coefficient99_256, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1297.coefficient98_258, Icur := OriginalRow227TriangleData1297.coefficient98_257,
    output := OriginalRow227TriangleData1306.coefficient99_257, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1290

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1290.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
