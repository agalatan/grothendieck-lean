import Grothe.UpperChaos.OriginalRow227TriangleData1306
import Grothe.UpperChaos.OriginalRow227TriangleData1307
import Grothe.UpperChaos.OriginalRow227TriangleData1316
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1300
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_228, Icur := OriginalRow227TriangleData1306.coefficient99_227,
    output := OriginalRow227TriangleData1316.coefficient100_227, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_229, Icur := OriginalRow227TriangleData1306.coefficient99_228,
    output := OriginalRow227TriangleData1316.coefficient100_228, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_230, Icur := OriginalRow227TriangleData1306.coefficient99_229,
    output := OriginalRow227TriangleData1316.coefficient100_229, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_231, Icur := OriginalRow227TriangleData1306.coefficient99_230,
    output := OriginalRow227TriangleData1316.coefficient100_230, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_232, Icur := OriginalRow227TriangleData1306.coefficient99_231,
    output := OriginalRow227TriangleData1316.coefficient100_231, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_233, Icur := OriginalRow227TriangleData1306.coefficient99_232,
    output := OriginalRow227TriangleData1316.coefficient100_232, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_234, Icur := OriginalRow227TriangleData1306.coefficient99_233,
    output := OriginalRow227TriangleData1316.coefficient100_233, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_235, Icur := OriginalRow227TriangleData1306.coefficient99_234,
    output := OriginalRow227TriangleData1316.coefficient100_234, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_236, Icur := OriginalRow227TriangleData1306.coefficient99_235,
    output := OriginalRow227TriangleData1316.coefficient100_235, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_237, Icur := OriginalRow227TriangleData1306.coefficient99_236,
    output := OriginalRow227TriangleData1316.coefficient100_236, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_238, Icur := OriginalRow227TriangleData1306.coefficient99_237,
    output := OriginalRow227TriangleData1316.coefficient100_237, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_239, Icur := OriginalRow227TriangleData1306.coefficient99_238,
    output := OriginalRow227TriangleData1316.coefficient100_238, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_240, Icur := OriginalRow227TriangleData1306.coefficient99_239,
    output := OriginalRow227TriangleData1316.coefficient100_239, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_241, Icur := OriginalRow227TriangleData1306.coefficient99_240,
    output := OriginalRow227TriangleData1316.coefficient100_240, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_242, Icur := OriginalRow227TriangleData1306.coefficient99_241,
    output := OriginalRow227TriangleData1316.coefficient100_241, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_243, Icur := OriginalRow227TriangleData1306.coefficient99_242,
    output := OriginalRow227TriangleData1316.coefficient100_242, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_244, Icur := OriginalRow227TriangleData1306.coefficient99_243,
    output := OriginalRow227TriangleData1316.coefficient100_243, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_245, Icur := OriginalRow227TriangleData1306.coefficient99_244,
    output := OriginalRow227TriangleData1316.coefficient100_244, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_246, Icur := OriginalRow227TriangleData1306.coefficient99_245,
    output := OriginalRow227TriangleData1316.coefficient100_245, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_247, Icur := OriginalRow227TriangleData1306.coefficient99_246,
    output := OriginalRow227TriangleData1316.coefficient100_246, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_248, Icur := OriginalRow227TriangleData1306.coefficient99_247,
    output := OriginalRow227TriangleData1316.coefficient100_247, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_249, Icur := OriginalRow227TriangleData1306.coefficient99_248,
    output := OriginalRow227TriangleData1316.coefficient100_248, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_250, Icur := OriginalRow227TriangleData1306.coefficient99_249,
    output := OriginalRow227TriangleData1316.coefficient100_249, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_251, Icur := OriginalRow227TriangleData1306.coefficient99_250,
    output := OriginalRow227TriangleData1316.coefficient100_250, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_252, Icur := OriginalRow227TriangleData1306.coefficient99_251,
    output := OriginalRow227TriangleData1316.coefficient100_251, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_253, Icur := OriginalRow227TriangleData1306.coefficient99_252,
    output := OriginalRow227TriangleData1316.coefficient100_252, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_254, Icur := OriginalRow227TriangleData1306.coefficient99_253,
    output := OriginalRow227TriangleData1316.coefficient100_253, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_255, Icur := OriginalRow227TriangleData1306.coefficient99_254,
    output := OriginalRow227TriangleData1316.coefficient100_254, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_256, Icur := OriginalRow227TriangleData1306.coefficient99_255,
    output := OriginalRow227TriangleData1316.coefficient100_255, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1306.coefficient99_257, Icur := OriginalRow227TriangleData1306.coefficient99_256,
    output := OriginalRow227TriangleData1316.coefficient100_256, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1307.coefficient99_258, Icur := OriginalRow227TriangleData1306.coefficient99_257,
    output := OriginalRow227TriangleData1316.coefficient100_257, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root100,
    Inext := OriginalRow227TriangleData1307.coefficient99_259, Icur := OriginalRow227TriangleData1307.coefficient99_258,
    output := OriginalRow227TriangleData1316.coefficient100_258, hC := OriginalRow227TriangleRoots03.root100_pos, hAC := OriginalRow227TriangleRoots03.product100_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1300

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1300.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
