import Grothe.UpperChaos.OriginalRow227TriangleData2032
import Grothe.UpperChaos.OriginalRow227TriangleData2033
import Grothe.UpperChaos.OriginalRow227TriangleData2035
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2019
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_242, Icur := OriginalRow227TriangleData2032.coefficient209_241,
    output := OriginalRow227TriangleData2035.coefficient210_241, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_243, Icur := OriginalRow227TriangleData2032.coefficient209_242,
    output := OriginalRow227TriangleData2035.coefficient210_242, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_244, Icur := OriginalRow227TriangleData2032.coefficient209_243,
    output := OriginalRow227TriangleData2035.coefficient210_243, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_245, Icur := OriginalRow227TriangleData2032.coefficient209_244,
    output := OriginalRow227TriangleData2035.coefficient210_244, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_246, Icur := OriginalRow227TriangleData2032.coefficient209_245,
    output := OriginalRow227TriangleData2035.coefficient210_245, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_247, Icur := OriginalRow227TriangleData2032.coefficient209_246,
    output := OriginalRow227TriangleData2035.coefficient210_246, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_248, Icur := OriginalRow227TriangleData2032.coefficient209_247,
    output := OriginalRow227TriangleData2035.coefficient210_247, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_249, Icur := OriginalRow227TriangleData2032.coefficient209_248,
    output := OriginalRow227TriangleData2035.coefficient210_248, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_250, Icur := OriginalRow227TriangleData2032.coefficient209_249,
    output := OriginalRow227TriangleData2035.coefficient210_249, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_251, Icur := OriginalRow227TriangleData2032.coefficient209_250,
    output := OriginalRow227TriangleData2035.coefficient210_250, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_252, Icur := OriginalRow227TriangleData2032.coefficient209_251,
    output := OriginalRow227TriangleData2035.coefficient210_251, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_253, Icur := OriginalRow227TriangleData2032.coefficient209_252,
    output := OriginalRow227TriangleData2035.coefficient210_252, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_254, Icur := OriginalRow227TriangleData2032.coefficient209_253,
    output := OriginalRow227TriangleData2035.coefficient210_253, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_255, Icur := OriginalRow227TriangleData2032.coefficient209_254,
    output := OriginalRow227TriangleData2035.coefficient210_254, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_256, Icur := OriginalRow227TriangleData2032.coefficient209_255,
    output := OriginalRow227TriangleData2035.coefficient210_255, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_257, Icur := OriginalRow227TriangleData2032.coefficient209_256,
    output := OriginalRow227TriangleData2035.coefficient210_256, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_258, Icur := OriginalRow227TriangleData2032.coefficient209_257,
    output := OriginalRow227TriangleData2035.coefficient210_257, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_259, Icur := OriginalRow227TriangleData2032.coefficient209_258,
    output := OriginalRow227TriangleData2035.coefficient210_258, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_260, Icur := OriginalRow227TriangleData2032.coefficient209_259,
    output := OriginalRow227TriangleData2035.coefficient210_259, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_261, Icur := OriginalRow227TriangleData2032.coefficient209_260,
    output := OriginalRow227TriangleData2035.coefficient210_260, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_262, Icur := OriginalRow227TriangleData2032.coefficient209_261,
    output := OriginalRow227TriangleData2035.coefficient210_261, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_263, Icur := OriginalRow227TriangleData2032.coefficient209_262,
    output := OriginalRow227TriangleData2035.coefficient210_262, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_264, Icur := OriginalRow227TriangleData2032.coefficient209_263,
    output := OriginalRow227TriangleData2035.coefficient210_263, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_265, Icur := OriginalRow227TriangleData2032.coefficient209_264,
    output := OriginalRow227TriangleData2035.coefficient210_264, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_266, Icur := OriginalRow227TriangleData2032.coefficient209_265,
    output := OriginalRow227TriangleData2035.coefficient210_265, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_267, Icur := OriginalRow227TriangleData2032.coefficient209_266,
    output := OriginalRow227TriangleData2035.coefficient210_266, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_268, Icur := OriginalRow227TriangleData2032.coefficient209_267,
    output := OriginalRow227TriangleData2035.coefficient210_267, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_269, Icur := OriginalRow227TriangleData2032.coefficient209_268,
    output := OriginalRow227TriangleData2035.coefficient210_268, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_270, Icur := OriginalRow227TriangleData2032.coefficient209_269,
    output := OriginalRow227TriangleData2035.coefficient210_269, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2032.coefficient209_271, Icur := OriginalRow227TriangleData2032.coefficient209_270,
    output := OriginalRow227TriangleData2035.coefficient210_270, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_272, Icur := OriginalRow227TriangleData2032.coefficient209_271,
    output := OriginalRow227TriangleData2035.coefficient210_271, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root210,
    Inext := OriginalRow227TriangleData2033.coefficient209_273, Icur := OriginalRow227TriangleData2033.coefficient209_272,
    output := OriginalRow227TriangleData2035.coefficient210_272, hC := OriginalRow227TriangleRoots06.root210_pos, hAC := OriginalRow227TriangleRoots06.product210_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2019

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2019.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
