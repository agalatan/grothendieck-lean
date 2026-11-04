import Grothe.UpperChaos.OriginalRow227TriangleData1958
import Grothe.UpperChaos.OriginalRow227TriangleData1959
import Grothe.UpperChaos.OriginalRow227TriangleData1962
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1946
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_254, Icur := OriginalRow227TriangleData1958.coefficient189_253,
    output := OriginalRow227TriangleData1962.coefficient190_253, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_255, Icur := OriginalRow227TriangleData1958.coefficient189_254,
    output := OriginalRow227TriangleData1962.coefficient190_254, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_256, Icur := OriginalRow227TriangleData1958.coefficient189_255,
    output := OriginalRow227TriangleData1962.coefficient190_255, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_257, Icur := OriginalRow227TriangleData1958.coefficient189_256,
    output := OriginalRow227TriangleData1962.coefficient190_256, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_258, Icur := OriginalRow227TriangleData1958.coefficient189_257,
    output := OriginalRow227TriangleData1962.coefficient190_257, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_259, Icur := OriginalRow227TriangleData1958.coefficient189_258,
    output := OriginalRow227TriangleData1962.coefficient190_258, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_260, Icur := OriginalRow227TriangleData1958.coefficient189_259,
    output := OriginalRow227TriangleData1962.coefficient190_259, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_261, Icur := OriginalRow227TriangleData1958.coefficient189_260,
    output := OriginalRow227TriangleData1962.coefficient190_260, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_262, Icur := OriginalRow227TriangleData1958.coefficient189_261,
    output := OriginalRow227TriangleData1962.coefficient190_261, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_263, Icur := OriginalRow227TriangleData1958.coefficient189_262,
    output := OriginalRow227TriangleData1962.coefficient190_262, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_264, Icur := OriginalRow227TriangleData1958.coefficient189_263,
    output := OriginalRow227TriangleData1962.coefficient190_263, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_265, Icur := OriginalRow227TriangleData1958.coefficient189_264,
    output := OriginalRow227TriangleData1962.coefficient190_264, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_266, Icur := OriginalRow227TriangleData1958.coefficient189_265,
    output := OriginalRow227TriangleData1962.coefficient190_265, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_267, Icur := OriginalRow227TriangleData1958.coefficient189_266,
    output := OriginalRow227TriangleData1962.coefficient190_266, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_268, Icur := OriginalRow227TriangleData1958.coefficient189_267,
    output := OriginalRow227TriangleData1962.coefficient190_267, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_269, Icur := OriginalRow227TriangleData1958.coefficient189_268,
    output := OriginalRow227TriangleData1962.coefficient190_268, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_270, Icur := OriginalRow227TriangleData1958.coefficient189_269,
    output := OriginalRow227TriangleData1962.coefficient190_269, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_271, Icur := OriginalRow227TriangleData1958.coefficient189_270,
    output := OriginalRow227TriangleData1962.coefficient190_270, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_272, Icur := OriginalRow227TriangleData1958.coefficient189_271,
    output := OriginalRow227TriangleData1962.coefficient190_271, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_273, Icur := OriginalRow227TriangleData1958.coefficient189_272,
    output := OriginalRow227TriangleData1962.coefficient190_272, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_274, Icur := OriginalRow227TriangleData1958.coefficient189_273,
    output := OriginalRow227TriangleData1962.coefficient190_273, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_275, Icur := OriginalRow227TriangleData1958.coefficient189_274,
    output := OriginalRow227TriangleData1962.coefficient190_274, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_276, Icur := OriginalRow227TriangleData1958.coefficient189_275,
    output := OriginalRow227TriangleData1962.coefficient190_275, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_277, Icur := OriginalRow227TriangleData1958.coefficient189_276,
    output := OriginalRow227TriangleData1962.coefficient190_276, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_278, Icur := OriginalRow227TriangleData1958.coefficient189_277,
    output := OriginalRow227TriangleData1962.coefficient190_277, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_279, Icur := OriginalRow227TriangleData1958.coefficient189_278,
    output := OriginalRow227TriangleData1962.coefficient190_278, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_280, Icur := OriginalRow227TriangleData1958.coefficient189_279,
    output := OriginalRow227TriangleData1962.coefficient190_279, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_281, Icur := OriginalRow227TriangleData1958.coefficient189_280,
    output := OriginalRow227TriangleData1962.coefficient190_280, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_282, Icur := OriginalRow227TriangleData1958.coefficient189_281,
    output := OriginalRow227TriangleData1962.coefficient190_281, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1958.coefficient189_283, Icur := OriginalRow227TriangleData1958.coefficient189_282,
    output := OriginalRow227TriangleData1962.coefficient190_282, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1959.coefficient189_284, Icur := OriginalRow227TriangleData1958.coefficient189_283,
    output := OriginalRow227TriangleData1962.coefficient190_283, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots05.root190,
    Inext := OriginalRow227TriangleData1959.coefficient189_285, Icur := OriginalRow227TriangleData1959.coefficient189_284,
    output := OriginalRow227TriangleData1962.coefficient190_284, hC := OriginalRow227TriangleRoots05.root190_pos, hAC := OriginalRow227TriangleRoots05.product190_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1946

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1946.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
