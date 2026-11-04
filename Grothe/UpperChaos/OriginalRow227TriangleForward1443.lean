import Grothe.UpperChaos.OriginalRow227TriangleData1450
import Grothe.UpperChaos.OriginalRow227TriangleData1451
import Grothe.UpperChaos.OriginalRow227TriangleData1459
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1443
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_243, Icur := OriginalRow227TriangleData1450.coefficient114_242,
    output := OriginalRow227TriangleData1459.coefficient115_242, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_244, Icur := OriginalRow227TriangleData1450.coefficient114_243,
    output := OriginalRow227TriangleData1459.coefficient115_243, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_245, Icur := OriginalRow227TriangleData1450.coefficient114_244,
    output := OriginalRow227TriangleData1459.coefficient115_244, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_246, Icur := OriginalRow227TriangleData1450.coefficient114_245,
    output := OriginalRow227TriangleData1459.coefficient115_245, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_247, Icur := OriginalRow227TriangleData1450.coefficient114_246,
    output := OriginalRow227TriangleData1459.coefficient115_246, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_248, Icur := OriginalRow227TriangleData1450.coefficient114_247,
    output := OriginalRow227TriangleData1459.coefficient115_247, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_249, Icur := OriginalRow227TriangleData1450.coefficient114_248,
    output := OriginalRow227TriangleData1459.coefficient115_248, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_250, Icur := OriginalRow227TriangleData1450.coefficient114_249,
    output := OriginalRow227TriangleData1459.coefficient115_249, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_251, Icur := OriginalRow227TriangleData1450.coefficient114_250,
    output := OriginalRow227TriangleData1459.coefficient115_250, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_252, Icur := OriginalRow227TriangleData1450.coefficient114_251,
    output := OriginalRow227TriangleData1459.coefficient115_251, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_253, Icur := OriginalRow227TriangleData1450.coefficient114_252,
    output := OriginalRow227TriangleData1459.coefficient115_252, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_254, Icur := OriginalRow227TriangleData1450.coefficient114_253,
    output := OriginalRow227TriangleData1459.coefficient115_253, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_255, Icur := OriginalRow227TriangleData1450.coefficient114_254,
    output := OriginalRow227TriangleData1459.coefficient115_254, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_256, Icur := OriginalRow227TriangleData1450.coefficient114_255,
    output := OriginalRow227TriangleData1459.coefficient115_255, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_257, Icur := OriginalRow227TriangleData1450.coefficient114_256,
    output := OriginalRow227TriangleData1459.coefficient115_256, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_258, Icur := OriginalRow227TriangleData1450.coefficient114_257,
    output := OriginalRow227TriangleData1459.coefficient115_257, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_259, Icur := OriginalRow227TriangleData1450.coefficient114_258,
    output := OriginalRow227TriangleData1459.coefficient115_258, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_260, Icur := OriginalRow227TriangleData1450.coefficient114_259,
    output := OriginalRow227TriangleData1459.coefficient115_259, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_261, Icur := OriginalRow227TriangleData1450.coefficient114_260,
    output := OriginalRow227TriangleData1459.coefficient115_260, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_262, Icur := OriginalRow227TriangleData1450.coefficient114_261,
    output := OriginalRow227TriangleData1459.coefficient115_261, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_263, Icur := OriginalRow227TriangleData1450.coefficient114_262,
    output := OriginalRow227TriangleData1459.coefficient115_262, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_264, Icur := OriginalRow227TriangleData1450.coefficient114_263,
    output := OriginalRow227TriangleData1459.coefficient115_263, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_265, Icur := OriginalRow227TriangleData1450.coefficient114_264,
    output := OriginalRow227TriangleData1459.coefficient115_264, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_266, Icur := OriginalRow227TriangleData1450.coefficient114_265,
    output := OriginalRow227TriangleData1459.coefficient115_265, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_267, Icur := OriginalRow227TriangleData1450.coefficient114_266,
    output := OriginalRow227TriangleData1459.coefficient115_266, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_268, Icur := OriginalRow227TriangleData1450.coefficient114_267,
    output := OriginalRow227TriangleData1459.coefficient115_267, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_269, Icur := OriginalRow227TriangleData1450.coefficient114_268,
    output := OriginalRow227TriangleData1459.coefficient115_268, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_270, Icur := OriginalRow227TriangleData1450.coefficient114_269,
    output := OriginalRow227TriangleData1459.coefficient115_269, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_271, Icur := OriginalRow227TriangleData1450.coefficient114_270,
    output := OriginalRow227TriangleData1459.coefficient115_270, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1450.coefficient114_272, Icur := OriginalRow227TriangleData1450.coefficient114_271,
    output := OriginalRow227TriangleData1459.coefficient115_271, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1451.coefficient114_273, Icur := OriginalRow227TriangleData1450.coefficient114_272,
    output := OriginalRow227TriangleData1459.coefficient115_272, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1451.coefficient114_274, Icur := OriginalRow227TriangleData1451.coefficient114_273,
    output := OriginalRow227TriangleData1459.coefficient115_273, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1443

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1443.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
