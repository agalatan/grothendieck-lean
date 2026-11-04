import Grothe.UpperChaos.OriginalRow227TriangleData1974
import Grothe.UpperChaos.OriginalRow227TriangleData1975
import Grothe.UpperChaos.OriginalRow227TriangleData1978
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1962
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_258, Icur := OriginalRow227TriangleData1974.coefficient193_257,
    output := OriginalRow227TriangleData1978.coefficient194_257, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_259, Icur := OriginalRow227TriangleData1974.coefficient193_258,
    output := OriginalRow227TriangleData1978.coefficient194_258, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_260, Icur := OriginalRow227TriangleData1974.coefficient193_259,
    output := OriginalRow227TriangleData1978.coefficient194_259, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_261, Icur := OriginalRow227TriangleData1974.coefficient193_260,
    output := OriginalRow227TriangleData1978.coefficient194_260, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_262, Icur := OriginalRow227TriangleData1974.coefficient193_261,
    output := OriginalRow227TriangleData1978.coefficient194_261, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_263, Icur := OriginalRow227TriangleData1974.coefficient193_262,
    output := OriginalRow227TriangleData1978.coefficient194_262, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_264, Icur := OriginalRow227TriangleData1974.coefficient193_263,
    output := OriginalRow227TriangleData1978.coefficient194_263, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_265, Icur := OriginalRow227TriangleData1974.coefficient193_264,
    output := OriginalRow227TriangleData1978.coefficient194_264, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_266, Icur := OriginalRow227TriangleData1974.coefficient193_265,
    output := OriginalRow227TriangleData1978.coefficient194_265, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_267, Icur := OriginalRow227TriangleData1974.coefficient193_266,
    output := OriginalRow227TriangleData1978.coefficient194_266, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_268, Icur := OriginalRow227TriangleData1974.coefficient193_267,
    output := OriginalRow227TriangleData1978.coefficient194_267, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_269, Icur := OriginalRow227TriangleData1974.coefficient193_268,
    output := OriginalRow227TriangleData1978.coefficient194_268, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_270, Icur := OriginalRow227TriangleData1974.coefficient193_269,
    output := OriginalRow227TriangleData1978.coefficient194_269, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_271, Icur := OriginalRow227TriangleData1974.coefficient193_270,
    output := OriginalRow227TriangleData1978.coefficient194_270, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_272, Icur := OriginalRow227TriangleData1974.coefficient193_271,
    output := OriginalRow227TriangleData1978.coefficient194_271, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_273, Icur := OriginalRow227TriangleData1974.coefficient193_272,
    output := OriginalRow227TriangleData1978.coefficient194_272, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_274, Icur := OriginalRow227TriangleData1974.coefficient193_273,
    output := OriginalRow227TriangleData1978.coefficient194_273, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_275, Icur := OriginalRow227TriangleData1974.coefficient193_274,
    output := OriginalRow227TriangleData1978.coefficient194_274, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_276, Icur := OriginalRow227TriangleData1974.coefficient193_275,
    output := OriginalRow227TriangleData1978.coefficient194_275, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_277, Icur := OriginalRow227TriangleData1974.coefficient193_276,
    output := OriginalRow227TriangleData1978.coefficient194_276, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_278, Icur := OriginalRow227TriangleData1974.coefficient193_277,
    output := OriginalRow227TriangleData1978.coefficient194_277, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_279, Icur := OriginalRow227TriangleData1974.coefficient193_278,
    output := OriginalRow227TriangleData1978.coefficient194_278, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_280, Icur := OriginalRow227TriangleData1974.coefficient193_279,
    output := OriginalRow227TriangleData1978.coefficient194_279, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_281, Icur := OriginalRow227TriangleData1974.coefficient193_280,
    output := OriginalRow227TriangleData1978.coefficient194_280, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_282, Icur := OriginalRow227TriangleData1974.coefficient193_281,
    output := OriginalRow227TriangleData1978.coefficient194_281, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_283, Icur := OriginalRow227TriangleData1974.coefficient193_282,
    output := OriginalRow227TriangleData1978.coefficient194_282, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_284, Icur := OriginalRow227TriangleData1974.coefficient193_283,
    output := OriginalRow227TriangleData1978.coefficient194_283, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_285, Icur := OriginalRow227TriangleData1974.coefficient193_284,
    output := OriginalRow227TriangleData1978.coefficient194_284, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_286, Icur := OriginalRow227TriangleData1974.coefficient193_285,
    output := OriginalRow227TriangleData1978.coefficient194_285, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1974.coefficient193_287, Icur := OriginalRow227TriangleData1974.coefficient193_286,
    output := OriginalRow227TriangleData1978.coefficient194_286, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_288, Icur := OriginalRow227TriangleData1974.coefficient193_287,
    output := OriginalRow227TriangleData1978.coefficient194_287, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root194,
    Inext := OriginalRow227TriangleData1975.coefficient193_289, Icur := OriginalRow227TriangleData1975.coefficient193_288,
    output := OriginalRow227TriangleData1978.coefficient194_288, hC := OriginalRow227TriangleRoots06.root194_pos, hAC := OriginalRow227TriangleRoots06.product194_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1962

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1962.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
