import Grothe.UpperChaos.OriginalRow227TriangleData1572
import Grothe.UpperChaos.OriginalRow227TriangleData1573
import Grothe.UpperChaos.OriginalRow227TriangleData1580
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1564
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_257, Icur := OriginalRow227TriangleData1572.coefficient128_256,
    output := OriginalRow227TriangleData1580.coefficient129_256, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_258, Icur := OriginalRow227TriangleData1572.coefficient128_257,
    output := OriginalRow227TriangleData1580.coefficient129_257, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_259, Icur := OriginalRow227TriangleData1572.coefficient128_258,
    output := OriginalRow227TriangleData1580.coefficient129_258, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_260, Icur := OriginalRow227TriangleData1572.coefficient128_259,
    output := OriginalRow227TriangleData1580.coefficient129_259, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_261, Icur := OriginalRow227TriangleData1572.coefficient128_260,
    output := OriginalRow227TriangleData1580.coefficient129_260, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_262, Icur := OriginalRow227TriangleData1572.coefficient128_261,
    output := OriginalRow227TriangleData1580.coefficient129_261, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_263, Icur := OriginalRow227TriangleData1572.coefficient128_262,
    output := OriginalRow227TriangleData1580.coefficient129_262, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_264, Icur := OriginalRow227TriangleData1572.coefficient128_263,
    output := OriginalRow227TriangleData1580.coefficient129_263, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_265, Icur := OriginalRow227TriangleData1572.coefficient128_264,
    output := OriginalRow227TriangleData1580.coefficient129_264, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_266, Icur := OriginalRow227TriangleData1572.coefficient128_265,
    output := OriginalRow227TriangleData1580.coefficient129_265, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_267, Icur := OriginalRow227TriangleData1572.coefficient128_266,
    output := OriginalRow227TriangleData1580.coefficient129_266, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_268, Icur := OriginalRow227TriangleData1572.coefficient128_267,
    output := OriginalRow227TriangleData1580.coefficient129_267, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_269, Icur := OriginalRow227TriangleData1572.coefficient128_268,
    output := OriginalRow227TriangleData1580.coefficient129_268, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_270, Icur := OriginalRow227TriangleData1572.coefficient128_269,
    output := OriginalRow227TriangleData1580.coefficient129_269, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_271, Icur := OriginalRow227TriangleData1572.coefficient128_270,
    output := OriginalRow227TriangleData1580.coefficient129_270, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_272, Icur := OriginalRow227TriangleData1572.coefficient128_271,
    output := OriginalRow227TriangleData1580.coefficient129_271, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_273, Icur := OriginalRow227TriangleData1572.coefficient128_272,
    output := OriginalRow227TriangleData1580.coefficient129_272, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_274, Icur := OriginalRow227TriangleData1572.coefficient128_273,
    output := OriginalRow227TriangleData1580.coefficient129_273, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_275, Icur := OriginalRow227TriangleData1572.coefficient128_274,
    output := OriginalRow227TriangleData1580.coefficient129_274, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_276, Icur := OriginalRow227TriangleData1572.coefficient128_275,
    output := OriginalRow227TriangleData1580.coefficient129_275, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_277, Icur := OriginalRow227TriangleData1572.coefficient128_276,
    output := OriginalRow227TriangleData1580.coefficient129_276, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_278, Icur := OriginalRow227TriangleData1572.coefficient128_277,
    output := OriginalRow227TriangleData1580.coefficient129_277, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_279, Icur := OriginalRow227TriangleData1572.coefficient128_278,
    output := OriginalRow227TriangleData1580.coefficient129_278, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_280, Icur := OriginalRow227TriangleData1572.coefficient128_279,
    output := OriginalRow227TriangleData1580.coefficient129_279, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_281, Icur := OriginalRow227TriangleData1572.coefficient128_280,
    output := OriginalRow227TriangleData1580.coefficient129_280, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_282, Icur := OriginalRow227TriangleData1572.coefficient128_281,
    output := OriginalRow227TriangleData1580.coefficient129_281, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_283, Icur := OriginalRow227TriangleData1572.coefficient128_282,
    output := OriginalRow227TriangleData1580.coefficient129_282, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_284, Icur := OriginalRow227TriangleData1572.coefficient128_283,
    output := OriginalRow227TriangleData1580.coefficient129_283, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_285, Icur := OriginalRow227TriangleData1572.coefficient128_284,
    output := OriginalRow227TriangleData1580.coefficient129_284, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1572.coefficient128_286, Icur := OriginalRow227TriangleData1572.coefficient128_285,
    output := OriginalRow227TriangleData1580.coefficient129_285, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_287, Icur := OriginalRow227TriangleData1572.coefficient128_286,
    output := OriginalRow227TriangleData1580.coefficient129_286, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_288, Icur := OriginalRow227TriangleData1573.coefficient128_287,
    output := OriginalRow227TriangleData1580.coefficient129_287, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1564

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1564.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
