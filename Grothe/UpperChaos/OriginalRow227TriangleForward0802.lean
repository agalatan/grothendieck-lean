import Grothe.UpperChaos.OriginalRow227TriangleData0805
import Grothe.UpperChaos.OriginalRow227TriangleData0806
import Grothe.UpperChaos.OriginalRow227TriangleData0818
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0802
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_248, Icur := OriginalRow227TriangleData0805.coefficient55_247,
    output := OriginalRow227TriangleData0818.coefficient56_247, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_249, Icur := OriginalRow227TriangleData0805.coefficient55_248,
    output := OriginalRow227TriangleData0818.coefficient56_248, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_250, Icur := OriginalRow227TriangleData0805.coefficient55_249,
    output := OriginalRow227TriangleData0818.coefficient56_249, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_251, Icur := OriginalRow227TriangleData0805.coefficient55_250,
    output := OriginalRow227TriangleData0818.coefficient56_250, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_252, Icur := OriginalRow227TriangleData0805.coefficient55_251,
    output := OriginalRow227TriangleData0818.coefficient56_251, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_253, Icur := OriginalRow227TriangleData0805.coefficient55_252,
    output := OriginalRow227TriangleData0818.coefficient56_252, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_254, Icur := OriginalRow227TriangleData0805.coefficient55_253,
    output := OriginalRow227TriangleData0818.coefficient56_253, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_255, Icur := OriginalRow227TriangleData0805.coefficient55_254,
    output := OriginalRow227TriangleData0818.coefficient56_254, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_256, Icur := OriginalRow227TriangleData0805.coefficient55_255,
    output := OriginalRow227TriangleData0818.coefficient56_255, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_257, Icur := OriginalRow227TriangleData0805.coefficient55_256,
    output := OriginalRow227TriangleData0818.coefficient56_256, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_258, Icur := OriginalRow227TriangleData0805.coefficient55_257,
    output := OriginalRow227TriangleData0818.coefficient56_257, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_259, Icur := OriginalRow227TriangleData0805.coefficient55_258,
    output := OriginalRow227TriangleData0818.coefficient56_258, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_260, Icur := OriginalRow227TriangleData0805.coefficient55_259,
    output := OriginalRow227TriangleData0818.coefficient56_259, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_261, Icur := OriginalRow227TriangleData0805.coefficient55_260,
    output := OriginalRow227TriangleData0818.coefficient56_260, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_262, Icur := OriginalRow227TriangleData0805.coefficient55_261,
    output := OriginalRow227TriangleData0818.coefficient56_261, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_263, Icur := OriginalRow227TriangleData0805.coefficient55_262,
    output := OriginalRow227TriangleData0818.coefficient56_262, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_264, Icur := OriginalRow227TriangleData0805.coefficient55_263,
    output := OriginalRow227TriangleData0818.coefficient56_263, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_265, Icur := OriginalRow227TriangleData0805.coefficient55_264,
    output := OriginalRow227TriangleData0818.coefficient56_264, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_266, Icur := OriginalRow227TriangleData0805.coefficient55_265,
    output := OriginalRow227TriangleData0818.coefficient56_265, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_267, Icur := OriginalRow227TriangleData0805.coefficient55_266,
    output := OriginalRow227TriangleData0818.coefficient56_266, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_268, Icur := OriginalRow227TriangleData0805.coefficient55_267,
    output := OriginalRow227TriangleData0818.coefficient56_267, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_269, Icur := OriginalRow227TriangleData0805.coefficient55_268,
    output := OriginalRow227TriangleData0818.coefficient56_268, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_270, Icur := OriginalRow227TriangleData0805.coefficient55_269,
    output := OriginalRow227TriangleData0818.coefficient56_269, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_271, Icur := OriginalRow227TriangleData0805.coefficient55_270,
    output := OriginalRow227TriangleData0818.coefficient56_270, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_272, Icur := OriginalRow227TriangleData0805.coefficient55_271,
    output := OriginalRow227TriangleData0818.coefficient56_271, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_273, Icur := OriginalRow227TriangleData0805.coefficient55_272,
    output := OriginalRow227TriangleData0818.coefficient56_272, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_274, Icur := OriginalRow227TriangleData0805.coefficient55_273,
    output := OriginalRow227TriangleData0818.coefficient56_273, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_275, Icur := OriginalRow227TriangleData0805.coefficient55_274,
    output := OriginalRow227TriangleData0818.coefficient56_274, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_276, Icur := OriginalRow227TriangleData0805.coefficient55_275,
    output := OriginalRow227TriangleData0818.coefficient56_275, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0805.coefficient55_277, Icur := OriginalRow227TriangleData0805.coefficient55_276,
    output := OriginalRow227TriangleData0818.coefficient56_276, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0806.coefficient55_278, Icur := OriginalRow227TriangleData0805.coefficient55_277,
    output := OriginalRow227TriangleData0818.coefficient56_277, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0806.coefficient55_279, Icur := OriginalRow227TriangleData0806.coefficient55_278,
    output := OriginalRow227TriangleData0818.coefficient56_278, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0802

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0802.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
