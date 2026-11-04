import Grothe.UpperChaos.OriginalRow227TriangleData1347
import Grothe.UpperChaos.OriginalRow227TriangleData1348
import Grothe.UpperChaos.OriginalRow227TriangleData1357
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1341
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_264, Icur := OriginalRow227TriangleData1347.coefficient103_263,
    output := OriginalRow227TriangleData1357.coefficient104_263, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_265, Icur := OriginalRow227TriangleData1347.coefficient103_264,
    output := OriginalRow227TriangleData1357.coefficient104_264, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_266, Icur := OriginalRow227TriangleData1347.coefficient103_265,
    output := OriginalRow227TriangleData1357.coefficient104_265, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_267, Icur := OriginalRow227TriangleData1347.coefficient103_266,
    output := OriginalRow227TriangleData1357.coefficient104_266, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_268, Icur := OriginalRow227TriangleData1347.coefficient103_267,
    output := OriginalRow227TriangleData1357.coefficient104_267, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_269, Icur := OriginalRow227TriangleData1347.coefficient103_268,
    output := OriginalRow227TriangleData1357.coefficient104_268, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_270, Icur := OriginalRow227TriangleData1347.coefficient103_269,
    output := OriginalRow227TriangleData1357.coefficient104_269, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_271, Icur := OriginalRow227TriangleData1347.coefficient103_270,
    output := OriginalRow227TriangleData1357.coefficient104_270, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_272, Icur := OriginalRow227TriangleData1347.coefficient103_271,
    output := OriginalRow227TriangleData1357.coefficient104_271, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_273, Icur := OriginalRow227TriangleData1347.coefficient103_272,
    output := OriginalRow227TriangleData1357.coefficient104_272, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_274, Icur := OriginalRow227TriangleData1347.coefficient103_273,
    output := OriginalRow227TriangleData1357.coefficient104_273, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_275, Icur := OriginalRow227TriangleData1347.coefficient103_274,
    output := OriginalRow227TriangleData1357.coefficient104_274, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_276, Icur := OriginalRow227TriangleData1347.coefficient103_275,
    output := OriginalRow227TriangleData1357.coefficient104_275, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_277, Icur := OriginalRow227TriangleData1347.coefficient103_276,
    output := OriginalRow227TriangleData1357.coefficient104_276, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_278, Icur := OriginalRow227TriangleData1347.coefficient103_277,
    output := OriginalRow227TriangleData1357.coefficient104_277, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_279, Icur := OriginalRow227TriangleData1347.coefficient103_278,
    output := OriginalRow227TriangleData1357.coefficient104_278, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_280, Icur := OriginalRow227TriangleData1347.coefficient103_279,
    output := OriginalRow227TriangleData1357.coefficient104_279, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_281, Icur := OriginalRow227TriangleData1347.coefficient103_280,
    output := OriginalRow227TriangleData1357.coefficient104_280, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_282, Icur := OriginalRow227TriangleData1347.coefficient103_281,
    output := OriginalRow227TriangleData1357.coefficient104_281, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_283, Icur := OriginalRow227TriangleData1347.coefficient103_282,
    output := OriginalRow227TriangleData1357.coefficient104_282, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_284, Icur := OriginalRow227TriangleData1347.coefficient103_283,
    output := OriginalRow227TriangleData1357.coefficient104_283, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_285, Icur := OriginalRow227TriangleData1347.coefficient103_284,
    output := OriginalRow227TriangleData1357.coefficient104_284, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_286, Icur := OriginalRow227TriangleData1347.coefficient103_285,
    output := OriginalRow227TriangleData1357.coefficient104_285, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_287, Icur := OriginalRow227TriangleData1347.coefficient103_286,
    output := OriginalRow227TriangleData1357.coefficient104_286, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_288, Icur := OriginalRow227TriangleData1347.coefficient103_287,
    output := OriginalRow227TriangleData1357.coefficient104_287, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_289, Icur := OriginalRow227TriangleData1347.coefficient103_288,
    output := OriginalRow227TriangleData1357.coefficient104_288, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_290, Icur := OriginalRow227TriangleData1347.coefficient103_289,
    output := OriginalRow227TriangleData1357.coefficient104_289, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_291, Icur := OriginalRow227TriangleData1347.coefficient103_290,
    output := OriginalRow227TriangleData1357.coefficient104_290, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_292, Icur := OriginalRow227TriangleData1347.coefficient103_291,
    output := OriginalRow227TriangleData1357.coefficient104_291, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1347.coefficient103_293, Icur := OriginalRow227TriangleData1347.coefficient103_292,
    output := OriginalRow227TriangleData1357.coefficient104_292, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1348.coefficient103_294, Icur := OriginalRow227TriangleData1347.coefficient103_293,
    output := OriginalRow227TriangleData1357.coefficient104_293, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1348.coefficient103_295, Icur := OriginalRow227TriangleData1348.coefficient103_294,
    output := OriginalRow227TriangleData1357.coefficient104_294, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1341

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1341.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
