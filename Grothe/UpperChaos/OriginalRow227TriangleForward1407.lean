import Grothe.UpperChaos.OriginalRow227TriangleData1414
import Grothe.UpperChaos.OriginalRow227TriangleData1415
import Grothe.UpperChaos.OriginalRow227TriangleData1423
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1407
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_239, Icur := OriginalRow227TriangleData1414.coefficient110_238,
    output := OriginalRow227TriangleData1423.coefficient111_238, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_240, Icur := OriginalRow227TriangleData1414.coefficient110_239,
    output := OriginalRow227TriangleData1423.coefficient111_239, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_241, Icur := OriginalRow227TriangleData1414.coefficient110_240,
    output := OriginalRow227TriangleData1423.coefficient111_240, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_242, Icur := OriginalRow227TriangleData1414.coefficient110_241,
    output := OriginalRow227TriangleData1423.coefficient111_241, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_243, Icur := OriginalRow227TriangleData1414.coefficient110_242,
    output := OriginalRow227TriangleData1423.coefficient111_242, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_244, Icur := OriginalRow227TriangleData1414.coefficient110_243,
    output := OriginalRow227TriangleData1423.coefficient111_243, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_245, Icur := OriginalRow227TriangleData1414.coefficient110_244,
    output := OriginalRow227TriangleData1423.coefficient111_244, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_246, Icur := OriginalRow227TriangleData1414.coefficient110_245,
    output := OriginalRow227TriangleData1423.coefficient111_245, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_247, Icur := OriginalRow227TriangleData1414.coefficient110_246,
    output := OriginalRow227TriangleData1423.coefficient111_246, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_248, Icur := OriginalRow227TriangleData1414.coefficient110_247,
    output := OriginalRow227TriangleData1423.coefficient111_247, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_249, Icur := OriginalRow227TriangleData1414.coefficient110_248,
    output := OriginalRow227TriangleData1423.coefficient111_248, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_250, Icur := OriginalRow227TriangleData1414.coefficient110_249,
    output := OriginalRow227TriangleData1423.coefficient111_249, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_251, Icur := OriginalRow227TriangleData1414.coefficient110_250,
    output := OriginalRow227TriangleData1423.coefficient111_250, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_252, Icur := OriginalRow227TriangleData1414.coefficient110_251,
    output := OriginalRow227TriangleData1423.coefficient111_251, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_253, Icur := OriginalRow227TriangleData1414.coefficient110_252,
    output := OriginalRow227TriangleData1423.coefficient111_252, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_254, Icur := OriginalRow227TriangleData1414.coefficient110_253,
    output := OriginalRow227TriangleData1423.coefficient111_253, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_255, Icur := OriginalRow227TriangleData1414.coefficient110_254,
    output := OriginalRow227TriangleData1423.coefficient111_254, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_256, Icur := OriginalRow227TriangleData1414.coefficient110_255,
    output := OriginalRow227TriangleData1423.coefficient111_255, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_257, Icur := OriginalRow227TriangleData1414.coefficient110_256,
    output := OriginalRow227TriangleData1423.coefficient111_256, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_258, Icur := OriginalRow227TriangleData1414.coefficient110_257,
    output := OriginalRow227TriangleData1423.coefficient111_257, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_259, Icur := OriginalRow227TriangleData1414.coefficient110_258,
    output := OriginalRow227TriangleData1423.coefficient111_258, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_260, Icur := OriginalRow227TriangleData1414.coefficient110_259,
    output := OriginalRow227TriangleData1423.coefficient111_259, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_261, Icur := OriginalRow227TriangleData1414.coefficient110_260,
    output := OriginalRow227TriangleData1423.coefficient111_260, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_262, Icur := OriginalRow227TriangleData1414.coefficient110_261,
    output := OriginalRow227TriangleData1423.coefficient111_261, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_263, Icur := OriginalRow227TriangleData1414.coefficient110_262,
    output := OriginalRow227TriangleData1423.coefficient111_262, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_264, Icur := OriginalRow227TriangleData1414.coefficient110_263,
    output := OriginalRow227TriangleData1423.coefficient111_263, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_265, Icur := OriginalRow227TriangleData1414.coefficient110_264,
    output := OriginalRow227TriangleData1423.coefficient111_264, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_266, Icur := OriginalRow227TriangleData1414.coefficient110_265,
    output := OriginalRow227TriangleData1423.coefficient111_265, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_267, Icur := OriginalRow227TriangleData1414.coefficient110_266,
    output := OriginalRow227TriangleData1423.coefficient111_266, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1414.coefficient110_268, Icur := OriginalRow227TriangleData1414.coefficient110_267,
    output := OriginalRow227TriangleData1423.coefficient111_267, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1415.coefficient110_269, Icur := OriginalRow227TriangleData1414.coefficient110_268,
    output := OriginalRow227TriangleData1423.coefficient111_268, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root111,
    Inext := OriginalRow227TriangleData1415.coefficient110_270, Icur := OriginalRow227TriangleData1415.coefficient110_269,
    output := OriginalRow227TriangleData1423.coefficient111_269, hC := OriginalRow227TriangleRoots03.root111_pos, hAC := OriginalRow227TriangleRoots03.product111_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1407

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1407.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
