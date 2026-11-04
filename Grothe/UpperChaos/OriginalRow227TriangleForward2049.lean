import Grothe.UpperChaos.OriginalRow227TriangleData2062
import Grothe.UpperChaos.OriginalRow227TriangleData2063
import Grothe.UpperChaos.OriginalRow227TriangleData2065
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2049
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_252, Icur := OriginalRow227TriangleData2062.coefficient219_251,
    output := OriginalRow227TriangleData2065.coefficient220_251, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_253, Icur := OriginalRow227TriangleData2062.coefficient219_252,
    output := OriginalRow227TriangleData2065.coefficient220_252, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_254, Icur := OriginalRow227TriangleData2062.coefficient219_253,
    output := OriginalRow227TriangleData2065.coefficient220_253, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_255, Icur := OriginalRow227TriangleData2062.coefficient219_254,
    output := OriginalRow227TriangleData2065.coefficient220_254, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_256, Icur := OriginalRow227TriangleData2062.coefficient219_255,
    output := OriginalRow227TriangleData2065.coefficient220_255, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_257, Icur := OriginalRow227TriangleData2062.coefficient219_256,
    output := OriginalRow227TriangleData2065.coefficient220_256, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_258, Icur := OriginalRow227TriangleData2062.coefficient219_257,
    output := OriginalRow227TriangleData2065.coefficient220_257, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_259, Icur := OriginalRow227TriangleData2062.coefficient219_258,
    output := OriginalRow227TriangleData2065.coefficient220_258, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_260, Icur := OriginalRow227TriangleData2062.coefficient219_259,
    output := OriginalRow227TriangleData2065.coefficient220_259, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_261, Icur := OriginalRow227TriangleData2062.coefficient219_260,
    output := OriginalRow227TriangleData2065.coefficient220_260, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_262, Icur := OriginalRow227TriangleData2062.coefficient219_261,
    output := OriginalRow227TriangleData2065.coefficient220_261, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_263, Icur := OriginalRow227TriangleData2062.coefficient219_262,
    output := OriginalRow227TriangleData2065.coefficient220_262, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_264, Icur := OriginalRow227TriangleData2062.coefficient219_263,
    output := OriginalRow227TriangleData2065.coefficient220_263, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_265, Icur := OriginalRow227TriangleData2062.coefficient219_264,
    output := OriginalRow227TriangleData2065.coefficient220_264, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_266, Icur := OriginalRow227TriangleData2062.coefficient219_265,
    output := OriginalRow227TriangleData2065.coefficient220_265, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_267, Icur := OriginalRow227TriangleData2062.coefficient219_266,
    output := OriginalRow227TriangleData2065.coefficient220_266, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_268, Icur := OriginalRow227TriangleData2062.coefficient219_267,
    output := OriginalRow227TriangleData2065.coefficient220_267, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_269, Icur := OriginalRow227TriangleData2062.coefficient219_268,
    output := OriginalRow227TriangleData2065.coefficient220_268, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_270, Icur := OriginalRow227TriangleData2062.coefficient219_269,
    output := OriginalRow227TriangleData2065.coefficient220_269, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_271, Icur := OriginalRow227TriangleData2062.coefficient219_270,
    output := OriginalRow227TriangleData2065.coefficient220_270, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_272, Icur := OriginalRow227TriangleData2062.coefficient219_271,
    output := OriginalRow227TriangleData2065.coefficient220_271, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_273, Icur := OriginalRow227TriangleData2062.coefficient219_272,
    output := OriginalRow227TriangleData2065.coefficient220_272, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_274, Icur := OriginalRow227TriangleData2062.coefficient219_273,
    output := OriginalRow227TriangleData2065.coefficient220_273, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_275, Icur := OriginalRow227TriangleData2062.coefficient219_274,
    output := OriginalRow227TriangleData2065.coefficient220_274, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_276, Icur := OriginalRow227TriangleData2062.coefficient219_275,
    output := OriginalRow227TriangleData2065.coefficient220_275, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_277, Icur := OriginalRow227TriangleData2062.coefficient219_276,
    output := OriginalRow227TriangleData2065.coefficient220_276, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_278, Icur := OriginalRow227TriangleData2062.coefficient219_277,
    output := OriginalRow227TriangleData2065.coefficient220_277, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_279, Icur := OriginalRow227TriangleData2062.coefficient219_278,
    output := OriginalRow227TriangleData2065.coefficient220_278, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_280, Icur := OriginalRow227TriangleData2062.coefficient219_279,
    output := OriginalRow227TriangleData2065.coefficient220_279, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2062.coefficient219_281, Icur := OriginalRow227TriangleData2062.coefficient219_280,
    output := OriginalRow227TriangleData2065.coefficient220_280, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root220,
    Inext := OriginalRow227TriangleData2063.coefficient219_282, Icur := OriginalRow227TriangleData2062.coefficient219_281,
    output := OriginalRow227TriangleData2065.coefficient220_281, hC := OriginalRow227TriangleRoots06.root220_pos, hAC := OriginalRow227TriangleRoots06.product220_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2049

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2049.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
