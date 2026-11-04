import Grothe.UpperChaos.OriginalRow227TriangleData1247
import Grothe.UpperChaos.OriginalRow227TriangleData1248
import Grothe.UpperChaos.OriginalRow227TriangleData1257
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1241
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_254, Icur := OriginalRow227TriangleData1247.coefficient93_253,
    output := OriginalRow227TriangleData1257.coefficient94_253, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_255, Icur := OriginalRow227TriangleData1247.coefficient93_254,
    output := OriginalRow227TriangleData1257.coefficient94_254, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_256, Icur := OriginalRow227TriangleData1247.coefficient93_255,
    output := OriginalRow227TriangleData1257.coefficient94_255, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_257, Icur := OriginalRow227TriangleData1247.coefficient93_256,
    output := OriginalRow227TriangleData1257.coefficient94_256, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_258, Icur := OriginalRow227TriangleData1247.coefficient93_257,
    output := OriginalRow227TriangleData1257.coefficient94_257, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_259, Icur := OriginalRow227TriangleData1247.coefficient93_258,
    output := OriginalRow227TriangleData1257.coefficient94_258, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_260, Icur := OriginalRow227TriangleData1247.coefficient93_259,
    output := OriginalRow227TriangleData1257.coefficient94_259, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_261, Icur := OriginalRow227TriangleData1247.coefficient93_260,
    output := OriginalRow227TriangleData1257.coefficient94_260, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_262, Icur := OriginalRow227TriangleData1247.coefficient93_261,
    output := OriginalRow227TriangleData1257.coefficient94_261, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_263, Icur := OriginalRow227TriangleData1247.coefficient93_262,
    output := OriginalRow227TriangleData1257.coefficient94_262, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_264, Icur := OriginalRow227TriangleData1247.coefficient93_263,
    output := OriginalRow227TriangleData1257.coefficient94_263, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_265, Icur := OriginalRow227TriangleData1247.coefficient93_264,
    output := OriginalRow227TriangleData1257.coefficient94_264, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_266, Icur := OriginalRow227TriangleData1247.coefficient93_265,
    output := OriginalRow227TriangleData1257.coefficient94_265, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_267, Icur := OriginalRow227TriangleData1247.coefficient93_266,
    output := OriginalRow227TriangleData1257.coefficient94_266, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_268, Icur := OriginalRow227TriangleData1247.coefficient93_267,
    output := OriginalRow227TriangleData1257.coefficient94_267, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_269, Icur := OriginalRow227TriangleData1247.coefficient93_268,
    output := OriginalRow227TriangleData1257.coefficient94_268, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_270, Icur := OriginalRow227TriangleData1247.coefficient93_269,
    output := OriginalRow227TriangleData1257.coefficient94_269, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_271, Icur := OriginalRow227TriangleData1247.coefficient93_270,
    output := OriginalRow227TriangleData1257.coefficient94_270, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_272, Icur := OriginalRow227TriangleData1247.coefficient93_271,
    output := OriginalRow227TriangleData1257.coefficient94_271, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_273, Icur := OriginalRow227TriangleData1247.coefficient93_272,
    output := OriginalRow227TriangleData1257.coefficient94_272, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_274, Icur := OriginalRow227TriangleData1247.coefficient93_273,
    output := OriginalRow227TriangleData1257.coefficient94_273, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_275, Icur := OriginalRow227TriangleData1247.coefficient93_274,
    output := OriginalRow227TriangleData1257.coefficient94_274, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_276, Icur := OriginalRow227TriangleData1247.coefficient93_275,
    output := OriginalRow227TriangleData1257.coefficient94_275, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_277, Icur := OriginalRow227TriangleData1247.coefficient93_276,
    output := OriginalRow227TriangleData1257.coefficient94_276, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_278, Icur := OriginalRow227TriangleData1247.coefficient93_277,
    output := OriginalRow227TriangleData1257.coefficient94_277, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_279, Icur := OriginalRow227TriangleData1247.coefficient93_278,
    output := OriginalRow227TriangleData1257.coefficient94_278, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_280, Icur := OriginalRow227TriangleData1247.coefficient93_279,
    output := OriginalRow227TriangleData1257.coefficient94_279, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_281, Icur := OriginalRow227TriangleData1247.coefficient93_280,
    output := OriginalRow227TriangleData1257.coefficient94_280, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_282, Icur := OriginalRow227TriangleData1247.coefficient93_281,
    output := OriginalRow227TriangleData1257.coefficient94_281, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1247.coefficient93_283, Icur := OriginalRow227TriangleData1247.coefficient93_282,
    output := OriginalRow227TriangleData1257.coefficient94_282, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1248.coefficient93_284, Icur := OriginalRow227TriangleData1247.coefficient93_283,
    output := OriginalRow227TriangleData1257.coefficient94_283, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root94,
    Inext := OriginalRow227TriangleData1248.coefficient93_285, Icur := OriginalRow227TriangleData1248.coefficient93_284,
    output := OriginalRow227TriangleData1257.coefficient94_284, hC := OriginalRow227TriangleRoots02.root94_pos, hAC := OriginalRow227TriangleRoots02.product94_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1241

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1241.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
