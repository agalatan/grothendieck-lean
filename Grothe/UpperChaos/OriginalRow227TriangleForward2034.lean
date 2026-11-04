import Grothe.UpperChaos.OriginalRow227TriangleData2047
import Grothe.UpperChaos.OriginalRow227TriangleData2048
import Grothe.UpperChaos.OriginalRow227TriangleData2050
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2034
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_247, Icur := OriginalRow227TriangleData2047.coefficient214_246,
    output := OriginalRow227TriangleData2050.coefficient215_246, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_248, Icur := OriginalRow227TriangleData2047.coefficient214_247,
    output := OriginalRow227TriangleData2050.coefficient215_247, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_249, Icur := OriginalRow227TriangleData2047.coefficient214_248,
    output := OriginalRow227TriangleData2050.coefficient215_248, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_250, Icur := OriginalRow227TriangleData2047.coefficient214_249,
    output := OriginalRow227TriangleData2050.coefficient215_249, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_251, Icur := OriginalRow227TriangleData2047.coefficient214_250,
    output := OriginalRow227TriangleData2050.coefficient215_250, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_252, Icur := OriginalRow227TriangleData2047.coefficient214_251,
    output := OriginalRow227TriangleData2050.coefficient215_251, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_253, Icur := OriginalRow227TriangleData2047.coefficient214_252,
    output := OriginalRow227TriangleData2050.coefficient215_252, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_254, Icur := OriginalRow227TriangleData2047.coefficient214_253,
    output := OriginalRow227TriangleData2050.coefficient215_253, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_255, Icur := OriginalRow227TriangleData2047.coefficient214_254,
    output := OriginalRow227TriangleData2050.coefficient215_254, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_256, Icur := OriginalRow227TriangleData2047.coefficient214_255,
    output := OriginalRow227TriangleData2050.coefficient215_255, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_257, Icur := OriginalRow227TriangleData2047.coefficient214_256,
    output := OriginalRow227TriangleData2050.coefficient215_256, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_258, Icur := OriginalRow227TriangleData2047.coefficient214_257,
    output := OriginalRow227TriangleData2050.coefficient215_257, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_259, Icur := OriginalRow227TriangleData2047.coefficient214_258,
    output := OriginalRow227TriangleData2050.coefficient215_258, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_260, Icur := OriginalRow227TriangleData2047.coefficient214_259,
    output := OriginalRow227TriangleData2050.coefficient215_259, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_261, Icur := OriginalRow227TriangleData2047.coefficient214_260,
    output := OriginalRow227TriangleData2050.coefficient215_260, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_262, Icur := OriginalRow227TriangleData2047.coefficient214_261,
    output := OriginalRow227TriangleData2050.coefficient215_261, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_263, Icur := OriginalRow227TriangleData2047.coefficient214_262,
    output := OriginalRow227TriangleData2050.coefficient215_262, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_264, Icur := OriginalRow227TriangleData2047.coefficient214_263,
    output := OriginalRow227TriangleData2050.coefficient215_263, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_265, Icur := OriginalRow227TriangleData2047.coefficient214_264,
    output := OriginalRow227TriangleData2050.coefficient215_264, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_266, Icur := OriginalRow227TriangleData2047.coefficient214_265,
    output := OriginalRow227TriangleData2050.coefficient215_265, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_267, Icur := OriginalRow227TriangleData2047.coefficient214_266,
    output := OriginalRow227TriangleData2050.coefficient215_266, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_268, Icur := OriginalRow227TriangleData2047.coefficient214_267,
    output := OriginalRow227TriangleData2050.coefficient215_267, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_269, Icur := OriginalRow227TriangleData2047.coefficient214_268,
    output := OriginalRow227TriangleData2050.coefficient215_268, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_270, Icur := OriginalRow227TriangleData2047.coefficient214_269,
    output := OriginalRow227TriangleData2050.coefficient215_269, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_271, Icur := OriginalRow227TriangleData2047.coefficient214_270,
    output := OriginalRow227TriangleData2050.coefficient215_270, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_272, Icur := OriginalRow227TriangleData2047.coefficient214_271,
    output := OriginalRow227TriangleData2050.coefficient215_271, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_273, Icur := OriginalRow227TriangleData2047.coefficient214_272,
    output := OriginalRow227TriangleData2050.coefficient215_272, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_274, Icur := OriginalRow227TriangleData2047.coefficient214_273,
    output := OriginalRow227TriangleData2050.coefficient215_273, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_275, Icur := OriginalRow227TriangleData2047.coefficient214_274,
    output := OriginalRow227TriangleData2050.coefficient215_274, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2047.coefficient214_276, Icur := OriginalRow227TriangleData2047.coefficient214_275,
    output := OriginalRow227TriangleData2050.coefficient215_275, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_277, Icur := OriginalRow227TriangleData2047.coefficient214_276,
    output := OriginalRow227TriangleData2050.coefficient215_276, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root215,
    Inext := OriginalRow227TriangleData2048.coefficient214_278, Icur := OriginalRow227TriangleData2048.coefficient214_277,
    output := OriginalRow227TriangleData2050.coefficient215_277, hC := OriginalRow227TriangleRoots06.root215_pos, hAC := OriginalRow227TriangleRoots06.product215_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2034

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2034.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
