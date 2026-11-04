import Grothe.UpperChaos.OriginalRow227TriangleData1522
import Grothe.UpperChaos.OriginalRow227TriangleData1523
import Grothe.UpperChaos.OriginalRow227TriangleData1531
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1515
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_251, Icur := OriginalRow227TriangleData1522.coefficient122_250,
    output := OriginalRow227TriangleData1531.coefficient123_250, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_252, Icur := OriginalRow227TriangleData1522.coefficient122_251,
    output := OriginalRow227TriangleData1531.coefficient123_251, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_253, Icur := OriginalRow227TriangleData1522.coefficient122_252,
    output := OriginalRow227TriangleData1531.coefficient123_252, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_254, Icur := OriginalRow227TriangleData1522.coefficient122_253,
    output := OriginalRow227TriangleData1531.coefficient123_253, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_255, Icur := OriginalRow227TriangleData1522.coefficient122_254,
    output := OriginalRow227TriangleData1531.coefficient123_254, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_256, Icur := OriginalRow227TriangleData1522.coefficient122_255,
    output := OriginalRow227TriangleData1531.coefficient123_255, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_257, Icur := OriginalRow227TriangleData1522.coefficient122_256,
    output := OriginalRow227TriangleData1531.coefficient123_256, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_258, Icur := OriginalRow227TriangleData1522.coefficient122_257,
    output := OriginalRow227TriangleData1531.coefficient123_257, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_259, Icur := OriginalRow227TriangleData1522.coefficient122_258,
    output := OriginalRow227TriangleData1531.coefficient123_258, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_260, Icur := OriginalRow227TriangleData1522.coefficient122_259,
    output := OriginalRow227TriangleData1531.coefficient123_259, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_261, Icur := OriginalRow227TriangleData1522.coefficient122_260,
    output := OriginalRow227TriangleData1531.coefficient123_260, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_262, Icur := OriginalRow227TriangleData1522.coefficient122_261,
    output := OriginalRow227TriangleData1531.coefficient123_261, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_263, Icur := OriginalRow227TriangleData1522.coefficient122_262,
    output := OriginalRow227TriangleData1531.coefficient123_262, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_264, Icur := OriginalRow227TriangleData1522.coefficient122_263,
    output := OriginalRow227TriangleData1531.coefficient123_263, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_265, Icur := OriginalRow227TriangleData1522.coefficient122_264,
    output := OriginalRow227TriangleData1531.coefficient123_264, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_266, Icur := OriginalRow227TriangleData1522.coefficient122_265,
    output := OriginalRow227TriangleData1531.coefficient123_265, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_267, Icur := OriginalRow227TriangleData1522.coefficient122_266,
    output := OriginalRow227TriangleData1531.coefficient123_266, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_268, Icur := OriginalRow227TriangleData1522.coefficient122_267,
    output := OriginalRow227TriangleData1531.coefficient123_267, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_269, Icur := OriginalRow227TriangleData1522.coefficient122_268,
    output := OriginalRow227TriangleData1531.coefficient123_268, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_270, Icur := OriginalRow227TriangleData1522.coefficient122_269,
    output := OriginalRow227TriangleData1531.coefficient123_269, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_271, Icur := OriginalRow227TriangleData1522.coefficient122_270,
    output := OriginalRow227TriangleData1531.coefficient123_270, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_272, Icur := OriginalRow227TriangleData1522.coefficient122_271,
    output := OriginalRow227TriangleData1531.coefficient123_271, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_273, Icur := OriginalRow227TriangleData1522.coefficient122_272,
    output := OriginalRow227TriangleData1531.coefficient123_272, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_274, Icur := OriginalRow227TriangleData1522.coefficient122_273,
    output := OriginalRow227TriangleData1531.coefficient123_273, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_275, Icur := OriginalRow227TriangleData1522.coefficient122_274,
    output := OriginalRow227TriangleData1531.coefficient123_274, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_276, Icur := OriginalRow227TriangleData1522.coefficient122_275,
    output := OriginalRow227TriangleData1531.coefficient123_275, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_277, Icur := OriginalRow227TriangleData1522.coefficient122_276,
    output := OriginalRow227TriangleData1531.coefficient123_276, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_278, Icur := OriginalRow227TriangleData1522.coefficient122_277,
    output := OriginalRow227TriangleData1531.coefficient123_277, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_279, Icur := OriginalRow227TriangleData1522.coefficient122_278,
    output := OriginalRow227TriangleData1531.coefficient123_278, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1522.coefficient122_280, Icur := OriginalRow227TriangleData1522.coefficient122_279,
    output := OriginalRow227TriangleData1531.coefficient123_279, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1523.coefficient122_281, Icur := OriginalRow227TriangleData1522.coefficient122_280,
    output := OriginalRow227TriangleData1531.coefficient123_280, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root123,
    Inext := OriginalRow227TriangleData1523.coefficient122_282, Icur := OriginalRow227TriangleData1523.coefficient122_281,
    output := OriginalRow227TriangleData1531.coefficient123_281, hC := OriginalRow227TriangleRoots03.root123_pos, hAC := OriginalRow227TriangleRoots03.product123_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1515

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1515.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
