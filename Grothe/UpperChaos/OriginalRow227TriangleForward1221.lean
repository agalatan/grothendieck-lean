import Grothe.UpperChaos.OriginalRow227TriangleData1226
import Grothe.UpperChaos.OriginalRow227TriangleData1227
import Grothe.UpperChaos.OriginalRow227TriangleData1237
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1221
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_252, Icur := OriginalRow227TriangleData1226.coefficient91_251,
    output := OriginalRow227TriangleData1237.coefficient92_251, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_253, Icur := OriginalRow227TriangleData1226.coefficient91_252,
    output := OriginalRow227TriangleData1237.coefficient92_252, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_254, Icur := OriginalRow227TriangleData1226.coefficient91_253,
    output := OriginalRow227TriangleData1237.coefficient92_253, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_255, Icur := OriginalRow227TriangleData1226.coefficient91_254,
    output := OriginalRow227TriangleData1237.coefficient92_254, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_256, Icur := OriginalRow227TriangleData1226.coefficient91_255,
    output := OriginalRow227TriangleData1237.coefficient92_255, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_257, Icur := OriginalRow227TriangleData1226.coefficient91_256,
    output := OriginalRow227TriangleData1237.coefficient92_256, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_258, Icur := OriginalRow227TriangleData1226.coefficient91_257,
    output := OriginalRow227TriangleData1237.coefficient92_257, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_259, Icur := OriginalRow227TriangleData1226.coefficient91_258,
    output := OriginalRow227TriangleData1237.coefficient92_258, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_260, Icur := OriginalRow227TriangleData1226.coefficient91_259,
    output := OriginalRow227TriangleData1237.coefficient92_259, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_261, Icur := OriginalRow227TriangleData1226.coefficient91_260,
    output := OriginalRow227TriangleData1237.coefficient92_260, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_262, Icur := OriginalRow227TriangleData1226.coefficient91_261,
    output := OriginalRow227TriangleData1237.coefficient92_261, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_263, Icur := OriginalRow227TriangleData1226.coefficient91_262,
    output := OriginalRow227TriangleData1237.coefficient92_262, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_264, Icur := OriginalRow227TriangleData1226.coefficient91_263,
    output := OriginalRow227TriangleData1237.coefficient92_263, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_265, Icur := OriginalRow227TriangleData1226.coefficient91_264,
    output := OriginalRow227TriangleData1237.coefficient92_264, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_266, Icur := OriginalRow227TriangleData1226.coefficient91_265,
    output := OriginalRow227TriangleData1237.coefficient92_265, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_267, Icur := OriginalRow227TriangleData1226.coefficient91_266,
    output := OriginalRow227TriangleData1237.coefficient92_266, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_268, Icur := OriginalRow227TriangleData1226.coefficient91_267,
    output := OriginalRow227TriangleData1237.coefficient92_267, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_269, Icur := OriginalRow227TriangleData1226.coefficient91_268,
    output := OriginalRow227TriangleData1237.coefficient92_268, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_270, Icur := OriginalRow227TriangleData1226.coefficient91_269,
    output := OriginalRow227TriangleData1237.coefficient92_269, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_271, Icur := OriginalRow227TriangleData1226.coefficient91_270,
    output := OriginalRow227TriangleData1237.coefficient92_270, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_272, Icur := OriginalRow227TriangleData1226.coefficient91_271,
    output := OriginalRow227TriangleData1237.coefficient92_271, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_273, Icur := OriginalRow227TriangleData1226.coefficient91_272,
    output := OriginalRow227TriangleData1237.coefficient92_272, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_274, Icur := OriginalRow227TriangleData1226.coefficient91_273,
    output := OriginalRow227TriangleData1237.coefficient92_273, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_275, Icur := OriginalRow227TriangleData1226.coefficient91_274,
    output := OriginalRow227TriangleData1237.coefficient92_274, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_276, Icur := OriginalRow227TriangleData1226.coefficient91_275,
    output := OriginalRow227TriangleData1237.coefficient92_275, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_277, Icur := OriginalRow227TriangleData1226.coefficient91_276,
    output := OriginalRow227TriangleData1237.coefficient92_276, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_278, Icur := OriginalRow227TriangleData1226.coefficient91_277,
    output := OriginalRow227TriangleData1237.coefficient92_277, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_279, Icur := OriginalRow227TriangleData1226.coefficient91_278,
    output := OriginalRow227TriangleData1237.coefficient92_278, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_280, Icur := OriginalRow227TriangleData1226.coefficient91_279,
    output := OriginalRow227TriangleData1237.coefficient92_279, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1226.coefficient91_281, Icur := OriginalRow227TriangleData1226.coefficient91_280,
    output := OriginalRow227TriangleData1237.coefficient92_280, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1227.coefficient91_282, Icur := OriginalRow227TriangleData1226.coefficient91_281,
    output := OriginalRow227TriangleData1237.coefficient92_281, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1227.coefficient91_283, Icur := OriginalRow227TriangleData1227.coefficient91_282,
    output := OriginalRow227TriangleData1237.coefficient92_282, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1221

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1221.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
