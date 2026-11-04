import Grothe.UpperChaos.OriginalRow227TriangleData1966
import Grothe.UpperChaos.OriginalRow227TriangleData1967
import Grothe.UpperChaos.OriginalRow227TriangleData1970
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1954
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_256, Icur := OriginalRow227TriangleData1966.coefficient191_255,
    output := OriginalRow227TriangleData1970.coefficient192_255, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_257, Icur := OriginalRow227TriangleData1966.coefficient191_256,
    output := OriginalRow227TriangleData1970.coefficient192_256, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_258, Icur := OriginalRow227TriangleData1966.coefficient191_257,
    output := OriginalRow227TriangleData1970.coefficient192_257, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_259, Icur := OriginalRow227TriangleData1966.coefficient191_258,
    output := OriginalRow227TriangleData1970.coefficient192_258, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_260, Icur := OriginalRow227TriangleData1966.coefficient191_259,
    output := OriginalRow227TriangleData1970.coefficient192_259, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_261, Icur := OriginalRow227TriangleData1966.coefficient191_260,
    output := OriginalRow227TriangleData1970.coefficient192_260, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_262, Icur := OriginalRow227TriangleData1966.coefficient191_261,
    output := OriginalRow227TriangleData1970.coefficient192_261, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_263, Icur := OriginalRow227TriangleData1966.coefficient191_262,
    output := OriginalRow227TriangleData1970.coefficient192_262, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_264, Icur := OriginalRow227TriangleData1966.coefficient191_263,
    output := OriginalRow227TriangleData1970.coefficient192_263, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_265, Icur := OriginalRow227TriangleData1966.coefficient191_264,
    output := OriginalRow227TriangleData1970.coefficient192_264, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_266, Icur := OriginalRow227TriangleData1966.coefficient191_265,
    output := OriginalRow227TriangleData1970.coefficient192_265, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_267, Icur := OriginalRow227TriangleData1966.coefficient191_266,
    output := OriginalRow227TriangleData1970.coefficient192_266, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_268, Icur := OriginalRow227TriangleData1966.coefficient191_267,
    output := OriginalRow227TriangleData1970.coefficient192_267, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_269, Icur := OriginalRow227TriangleData1966.coefficient191_268,
    output := OriginalRow227TriangleData1970.coefficient192_268, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_270, Icur := OriginalRow227TriangleData1966.coefficient191_269,
    output := OriginalRow227TriangleData1970.coefficient192_269, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_271, Icur := OriginalRow227TriangleData1966.coefficient191_270,
    output := OriginalRow227TriangleData1970.coefficient192_270, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_272, Icur := OriginalRow227TriangleData1966.coefficient191_271,
    output := OriginalRow227TriangleData1970.coefficient192_271, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_273, Icur := OriginalRow227TriangleData1966.coefficient191_272,
    output := OriginalRow227TriangleData1970.coefficient192_272, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_274, Icur := OriginalRow227TriangleData1966.coefficient191_273,
    output := OriginalRow227TriangleData1970.coefficient192_273, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_275, Icur := OriginalRow227TriangleData1966.coefficient191_274,
    output := OriginalRow227TriangleData1970.coefficient192_274, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_276, Icur := OriginalRow227TriangleData1966.coefficient191_275,
    output := OriginalRow227TriangleData1970.coefficient192_275, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_277, Icur := OriginalRow227TriangleData1966.coefficient191_276,
    output := OriginalRow227TriangleData1970.coefficient192_276, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_278, Icur := OriginalRow227TriangleData1966.coefficient191_277,
    output := OriginalRow227TriangleData1970.coefficient192_277, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_279, Icur := OriginalRow227TriangleData1966.coefficient191_278,
    output := OriginalRow227TriangleData1970.coefficient192_278, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_280, Icur := OriginalRow227TriangleData1966.coefficient191_279,
    output := OriginalRow227TriangleData1970.coefficient192_279, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_281, Icur := OriginalRow227TriangleData1966.coefficient191_280,
    output := OriginalRow227TriangleData1970.coefficient192_280, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_282, Icur := OriginalRow227TriangleData1966.coefficient191_281,
    output := OriginalRow227TriangleData1970.coefficient192_281, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_283, Icur := OriginalRow227TriangleData1966.coefficient191_282,
    output := OriginalRow227TriangleData1970.coefficient192_282, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_284, Icur := OriginalRow227TriangleData1966.coefficient191_283,
    output := OriginalRow227TriangleData1970.coefficient192_283, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1966.coefficient191_285, Icur := OriginalRow227TriangleData1966.coefficient191_284,
    output := OriginalRow227TriangleData1970.coefficient192_284, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1967.coefficient191_286, Icur := OriginalRow227TriangleData1966.coefficient191_285,
    output := OriginalRow227TriangleData1970.coefficient192_285, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root192,
    Inext := OriginalRow227TriangleData1967.coefficient191_287, Icur := OriginalRow227TriangleData1967.coefficient191_286,
    output := OriginalRow227TriangleData1970.coefficient192_286, hC := OriginalRow227TriangleRoots05.root192_pos, hAC := OriginalRow227TriangleRoots05.product192_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1954

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1954.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
