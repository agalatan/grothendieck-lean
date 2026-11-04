import Grothe.UpperChaos.OriginalRow227TriangleData2056
import Grothe.UpperChaos.OriginalRow227TriangleData2057
import Grothe.UpperChaos.OriginalRow227TriangleData2059
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2043
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_250, Icur := OriginalRow227TriangleData2056.coefficient217_249,
    output := OriginalRow227TriangleData2059.coefficient218_249, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_251, Icur := OriginalRow227TriangleData2056.coefficient217_250,
    output := OriginalRow227TriangleData2059.coefficient218_250, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_252, Icur := OriginalRow227TriangleData2056.coefficient217_251,
    output := OriginalRow227TriangleData2059.coefficient218_251, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_253, Icur := OriginalRow227TriangleData2056.coefficient217_252,
    output := OriginalRow227TriangleData2059.coefficient218_252, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_254, Icur := OriginalRow227TriangleData2056.coefficient217_253,
    output := OriginalRow227TriangleData2059.coefficient218_253, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_255, Icur := OriginalRow227TriangleData2056.coefficient217_254,
    output := OriginalRow227TriangleData2059.coefficient218_254, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_256, Icur := OriginalRow227TriangleData2056.coefficient217_255,
    output := OriginalRow227TriangleData2059.coefficient218_255, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_257, Icur := OriginalRow227TriangleData2056.coefficient217_256,
    output := OriginalRow227TriangleData2059.coefficient218_256, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_258, Icur := OriginalRow227TriangleData2056.coefficient217_257,
    output := OriginalRow227TriangleData2059.coefficient218_257, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_259, Icur := OriginalRow227TriangleData2056.coefficient217_258,
    output := OriginalRow227TriangleData2059.coefficient218_258, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_260, Icur := OriginalRow227TriangleData2056.coefficient217_259,
    output := OriginalRow227TriangleData2059.coefficient218_259, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_261, Icur := OriginalRow227TriangleData2056.coefficient217_260,
    output := OriginalRow227TriangleData2059.coefficient218_260, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_262, Icur := OriginalRow227TriangleData2056.coefficient217_261,
    output := OriginalRow227TriangleData2059.coefficient218_261, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_263, Icur := OriginalRow227TriangleData2056.coefficient217_262,
    output := OriginalRow227TriangleData2059.coefficient218_262, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_264, Icur := OriginalRow227TriangleData2056.coefficient217_263,
    output := OriginalRow227TriangleData2059.coefficient218_263, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_265, Icur := OriginalRow227TriangleData2056.coefficient217_264,
    output := OriginalRow227TriangleData2059.coefficient218_264, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_266, Icur := OriginalRow227TriangleData2056.coefficient217_265,
    output := OriginalRow227TriangleData2059.coefficient218_265, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_267, Icur := OriginalRow227TriangleData2056.coefficient217_266,
    output := OriginalRow227TriangleData2059.coefficient218_266, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_268, Icur := OriginalRow227TriangleData2056.coefficient217_267,
    output := OriginalRow227TriangleData2059.coefficient218_267, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_269, Icur := OriginalRow227TriangleData2056.coefficient217_268,
    output := OriginalRow227TriangleData2059.coefficient218_268, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_270, Icur := OriginalRow227TriangleData2056.coefficient217_269,
    output := OriginalRow227TriangleData2059.coefficient218_269, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_271, Icur := OriginalRow227TriangleData2056.coefficient217_270,
    output := OriginalRow227TriangleData2059.coefficient218_270, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_272, Icur := OriginalRow227TriangleData2056.coefficient217_271,
    output := OriginalRow227TriangleData2059.coefficient218_271, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_273, Icur := OriginalRow227TriangleData2056.coefficient217_272,
    output := OriginalRow227TriangleData2059.coefficient218_272, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_274, Icur := OriginalRow227TriangleData2056.coefficient217_273,
    output := OriginalRow227TriangleData2059.coefficient218_273, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_275, Icur := OriginalRow227TriangleData2056.coefficient217_274,
    output := OriginalRow227TriangleData2059.coefficient218_274, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_276, Icur := OriginalRow227TriangleData2056.coefficient217_275,
    output := OriginalRow227TriangleData2059.coefficient218_275, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_277, Icur := OriginalRow227TriangleData2056.coefficient217_276,
    output := OriginalRow227TriangleData2059.coefficient218_276, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_278, Icur := OriginalRow227TriangleData2056.coefficient217_277,
    output := OriginalRow227TriangleData2059.coefficient218_277, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2056.coefficient217_279, Icur := OriginalRow227TriangleData2056.coefficient217_278,
    output := OriginalRow227TriangleData2059.coefficient218_278, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2057.coefficient217_280, Icur := OriginalRow227TriangleData2056.coefficient217_279,
    output := OriginalRow227TriangleData2059.coefficient218_279, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root218,
    Inext := OriginalRow227TriangleData2057.coefficient217_281, Icur := OriginalRow227TriangleData2057.coefficient217_280,
    output := OriginalRow227TriangleData2059.coefficient218_280, hC := OriginalRow227TriangleRoots06.root218_pos, hAC := OriginalRow227TriangleRoots06.product218_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2043

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2043.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
