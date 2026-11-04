import Grothe.UpperChaos.OriginalRow227TriangleData1366
import Grothe.UpperChaos.OriginalRow227TriangleData1367
import Grothe.UpperChaos.OriginalRow227TriangleData1376
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1360
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_234, Icur := OriginalRow227TriangleData1366.coefficient105_233,
    output := OriginalRow227TriangleData1376.coefficient106_233, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_235, Icur := OriginalRow227TriangleData1366.coefficient105_234,
    output := OriginalRow227TriangleData1376.coefficient106_234, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_236, Icur := OriginalRow227TriangleData1366.coefficient105_235,
    output := OriginalRow227TriangleData1376.coefficient106_235, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_237, Icur := OriginalRow227TriangleData1366.coefficient105_236,
    output := OriginalRow227TriangleData1376.coefficient106_236, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_238, Icur := OriginalRow227TriangleData1366.coefficient105_237,
    output := OriginalRow227TriangleData1376.coefficient106_237, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_239, Icur := OriginalRow227TriangleData1366.coefficient105_238,
    output := OriginalRow227TriangleData1376.coefficient106_238, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_240, Icur := OriginalRow227TriangleData1366.coefficient105_239,
    output := OriginalRow227TriangleData1376.coefficient106_239, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_241, Icur := OriginalRow227TriangleData1366.coefficient105_240,
    output := OriginalRow227TriangleData1376.coefficient106_240, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_242, Icur := OriginalRow227TriangleData1366.coefficient105_241,
    output := OriginalRow227TriangleData1376.coefficient106_241, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_243, Icur := OriginalRow227TriangleData1366.coefficient105_242,
    output := OriginalRow227TriangleData1376.coefficient106_242, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_244, Icur := OriginalRow227TriangleData1366.coefficient105_243,
    output := OriginalRow227TriangleData1376.coefficient106_243, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_245, Icur := OriginalRow227TriangleData1366.coefficient105_244,
    output := OriginalRow227TriangleData1376.coefficient106_244, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_246, Icur := OriginalRow227TriangleData1366.coefficient105_245,
    output := OriginalRow227TriangleData1376.coefficient106_245, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_247, Icur := OriginalRow227TriangleData1366.coefficient105_246,
    output := OriginalRow227TriangleData1376.coefficient106_246, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_248, Icur := OriginalRow227TriangleData1366.coefficient105_247,
    output := OriginalRow227TriangleData1376.coefficient106_247, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_249, Icur := OriginalRow227TriangleData1366.coefficient105_248,
    output := OriginalRow227TriangleData1376.coefficient106_248, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_250, Icur := OriginalRow227TriangleData1366.coefficient105_249,
    output := OriginalRow227TriangleData1376.coefficient106_249, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_251, Icur := OriginalRow227TriangleData1366.coefficient105_250,
    output := OriginalRow227TriangleData1376.coefficient106_250, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_252, Icur := OriginalRow227TriangleData1366.coefficient105_251,
    output := OriginalRow227TriangleData1376.coefficient106_251, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_253, Icur := OriginalRow227TriangleData1366.coefficient105_252,
    output := OriginalRow227TriangleData1376.coefficient106_252, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_254, Icur := OriginalRow227TriangleData1366.coefficient105_253,
    output := OriginalRow227TriangleData1376.coefficient106_253, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_255, Icur := OriginalRow227TriangleData1366.coefficient105_254,
    output := OriginalRow227TriangleData1376.coefficient106_254, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_256, Icur := OriginalRow227TriangleData1366.coefficient105_255,
    output := OriginalRow227TriangleData1376.coefficient106_255, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_257, Icur := OriginalRow227TriangleData1366.coefficient105_256,
    output := OriginalRow227TriangleData1376.coefficient106_256, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_258, Icur := OriginalRow227TriangleData1366.coefficient105_257,
    output := OriginalRow227TriangleData1376.coefficient106_257, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_259, Icur := OriginalRow227TriangleData1366.coefficient105_258,
    output := OriginalRow227TriangleData1376.coefficient106_258, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_260, Icur := OriginalRow227TriangleData1366.coefficient105_259,
    output := OriginalRow227TriangleData1376.coefficient106_259, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_261, Icur := OriginalRow227TriangleData1366.coefficient105_260,
    output := OriginalRow227TriangleData1376.coefficient106_260, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_262, Icur := OriginalRow227TriangleData1366.coefficient105_261,
    output := OriginalRow227TriangleData1376.coefficient106_261, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1366.coefficient105_263, Icur := OriginalRow227TriangleData1366.coefficient105_262,
    output := OriginalRow227TriangleData1376.coefficient106_262, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1367.coefficient105_264, Icur := OriginalRow227TriangleData1366.coefficient105_263,
    output := OriginalRow227TriangleData1376.coefficient106_263, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1367.coefficient105_265, Icur := OriginalRow227TriangleData1367.coefficient105_264,
    output := OriginalRow227TriangleData1376.coefficient106_264, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1360

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1360.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
