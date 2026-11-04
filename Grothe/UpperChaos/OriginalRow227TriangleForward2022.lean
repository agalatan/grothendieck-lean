import Grothe.UpperChaos.OriginalRow227TriangleData2035
import Grothe.UpperChaos.OriginalRow227TriangleData2036
import Grothe.UpperChaos.OriginalRow227TriangleData2038
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2022
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_243, Icur := OriginalRow227TriangleData2035.coefficient210_242,
    output := OriginalRow227TriangleData2038.coefficient211_242, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_244, Icur := OriginalRow227TriangleData2035.coefficient210_243,
    output := OriginalRow227TriangleData2038.coefficient211_243, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_245, Icur := OriginalRow227TriangleData2035.coefficient210_244,
    output := OriginalRow227TriangleData2038.coefficient211_244, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_246, Icur := OriginalRow227TriangleData2035.coefficient210_245,
    output := OriginalRow227TriangleData2038.coefficient211_245, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_247, Icur := OriginalRow227TriangleData2035.coefficient210_246,
    output := OriginalRow227TriangleData2038.coefficient211_246, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_248, Icur := OriginalRow227TriangleData2035.coefficient210_247,
    output := OriginalRow227TriangleData2038.coefficient211_247, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_249, Icur := OriginalRow227TriangleData2035.coefficient210_248,
    output := OriginalRow227TriangleData2038.coefficient211_248, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_250, Icur := OriginalRow227TriangleData2035.coefficient210_249,
    output := OriginalRow227TriangleData2038.coefficient211_249, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_251, Icur := OriginalRow227TriangleData2035.coefficient210_250,
    output := OriginalRow227TriangleData2038.coefficient211_250, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_252, Icur := OriginalRow227TriangleData2035.coefficient210_251,
    output := OriginalRow227TriangleData2038.coefficient211_251, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_253, Icur := OriginalRow227TriangleData2035.coefficient210_252,
    output := OriginalRow227TriangleData2038.coefficient211_252, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_254, Icur := OriginalRow227TriangleData2035.coefficient210_253,
    output := OriginalRow227TriangleData2038.coefficient211_253, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_255, Icur := OriginalRow227TriangleData2035.coefficient210_254,
    output := OriginalRow227TriangleData2038.coefficient211_254, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_256, Icur := OriginalRow227TriangleData2035.coefficient210_255,
    output := OriginalRow227TriangleData2038.coefficient211_255, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_257, Icur := OriginalRow227TriangleData2035.coefficient210_256,
    output := OriginalRow227TriangleData2038.coefficient211_256, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_258, Icur := OriginalRow227TriangleData2035.coefficient210_257,
    output := OriginalRow227TriangleData2038.coefficient211_257, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_259, Icur := OriginalRow227TriangleData2035.coefficient210_258,
    output := OriginalRow227TriangleData2038.coefficient211_258, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_260, Icur := OriginalRow227TriangleData2035.coefficient210_259,
    output := OriginalRow227TriangleData2038.coefficient211_259, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_261, Icur := OriginalRow227TriangleData2035.coefficient210_260,
    output := OriginalRow227TriangleData2038.coefficient211_260, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_262, Icur := OriginalRow227TriangleData2035.coefficient210_261,
    output := OriginalRow227TriangleData2038.coefficient211_261, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_263, Icur := OriginalRow227TriangleData2035.coefficient210_262,
    output := OriginalRow227TriangleData2038.coefficient211_262, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_264, Icur := OriginalRow227TriangleData2035.coefficient210_263,
    output := OriginalRow227TriangleData2038.coefficient211_263, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_265, Icur := OriginalRow227TriangleData2035.coefficient210_264,
    output := OriginalRow227TriangleData2038.coefficient211_264, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_266, Icur := OriginalRow227TriangleData2035.coefficient210_265,
    output := OriginalRow227TriangleData2038.coefficient211_265, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_267, Icur := OriginalRow227TriangleData2035.coefficient210_266,
    output := OriginalRow227TriangleData2038.coefficient211_266, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_268, Icur := OriginalRow227TriangleData2035.coefficient210_267,
    output := OriginalRow227TriangleData2038.coefficient211_267, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_269, Icur := OriginalRow227TriangleData2035.coefficient210_268,
    output := OriginalRow227TriangleData2038.coefficient211_268, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_270, Icur := OriginalRow227TriangleData2035.coefficient210_269,
    output := OriginalRow227TriangleData2038.coefficient211_269, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_271, Icur := OriginalRow227TriangleData2035.coefficient210_270,
    output := OriginalRow227TriangleData2038.coefficient211_270, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2035.coefficient210_272, Icur := OriginalRow227TriangleData2035.coefficient210_271,
    output := OriginalRow227TriangleData2038.coefficient211_271, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2036.coefficient210_273, Icur := OriginalRow227TriangleData2035.coefficient210_272,
    output := OriginalRow227TriangleData2038.coefficient211_272, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root211,
    Inext := OriginalRow227TriangleData2036.coefficient210_274, Icur := OriginalRow227TriangleData2036.coefficient210_273,
    output := OriginalRow227TriangleData2038.coefficient211_273, hC := OriginalRow227TriangleRoots06.root211_pos, hAC := OriginalRow227TriangleRoots06.product211_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2022

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2022.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
