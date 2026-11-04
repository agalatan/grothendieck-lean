import Grothe.UpperChaos.OriginalRow227TriangleData1337
import Grothe.UpperChaos.OriginalRow227TriangleData1338
import Grothe.UpperChaos.OriginalRow227TriangleData1347
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1331
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_263, Icur := OriginalRow227TriangleData1337.coefficient102_262,
    output := OriginalRow227TriangleData1347.coefficient103_262, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_264, Icur := OriginalRow227TriangleData1337.coefficient102_263,
    output := OriginalRow227TriangleData1347.coefficient103_263, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_265, Icur := OriginalRow227TriangleData1337.coefficient102_264,
    output := OriginalRow227TriangleData1347.coefficient103_264, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_266, Icur := OriginalRow227TriangleData1337.coefficient102_265,
    output := OriginalRow227TriangleData1347.coefficient103_265, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_267, Icur := OriginalRow227TriangleData1337.coefficient102_266,
    output := OriginalRow227TriangleData1347.coefficient103_266, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_268, Icur := OriginalRow227TriangleData1337.coefficient102_267,
    output := OriginalRow227TriangleData1347.coefficient103_267, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_269, Icur := OriginalRow227TriangleData1337.coefficient102_268,
    output := OriginalRow227TriangleData1347.coefficient103_268, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_270, Icur := OriginalRow227TriangleData1337.coefficient102_269,
    output := OriginalRow227TriangleData1347.coefficient103_269, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_271, Icur := OriginalRow227TriangleData1337.coefficient102_270,
    output := OriginalRow227TriangleData1347.coefficient103_270, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_272, Icur := OriginalRow227TriangleData1337.coefficient102_271,
    output := OriginalRow227TriangleData1347.coefficient103_271, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_273, Icur := OriginalRow227TriangleData1337.coefficient102_272,
    output := OriginalRow227TriangleData1347.coefficient103_272, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_274, Icur := OriginalRow227TriangleData1337.coefficient102_273,
    output := OriginalRow227TriangleData1347.coefficient103_273, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_275, Icur := OriginalRow227TriangleData1337.coefficient102_274,
    output := OriginalRow227TriangleData1347.coefficient103_274, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_276, Icur := OriginalRow227TriangleData1337.coefficient102_275,
    output := OriginalRow227TriangleData1347.coefficient103_275, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_277, Icur := OriginalRow227TriangleData1337.coefficient102_276,
    output := OriginalRow227TriangleData1347.coefficient103_276, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_278, Icur := OriginalRow227TriangleData1337.coefficient102_277,
    output := OriginalRow227TriangleData1347.coefficient103_277, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_279, Icur := OriginalRow227TriangleData1337.coefficient102_278,
    output := OriginalRow227TriangleData1347.coefficient103_278, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_280, Icur := OriginalRow227TriangleData1337.coefficient102_279,
    output := OriginalRow227TriangleData1347.coefficient103_279, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_281, Icur := OriginalRow227TriangleData1337.coefficient102_280,
    output := OriginalRow227TriangleData1347.coefficient103_280, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_282, Icur := OriginalRow227TriangleData1337.coefficient102_281,
    output := OriginalRow227TriangleData1347.coefficient103_281, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_283, Icur := OriginalRow227TriangleData1337.coefficient102_282,
    output := OriginalRow227TriangleData1347.coefficient103_282, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_284, Icur := OriginalRow227TriangleData1337.coefficient102_283,
    output := OriginalRow227TriangleData1347.coefficient103_283, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_285, Icur := OriginalRow227TriangleData1337.coefficient102_284,
    output := OriginalRow227TriangleData1347.coefficient103_284, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_286, Icur := OriginalRow227TriangleData1337.coefficient102_285,
    output := OriginalRow227TriangleData1347.coefficient103_285, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_287, Icur := OriginalRow227TriangleData1337.coefficient102_286,
    output := OriginalRow227TriangleData1347.coefficient103_286, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_288, Icur := OriginalRow227TriangleData1337.coefficient102_287,
    output := OriginalRow227TriangleData1347.coefficient103_287, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_289, Icur := OriginalRow227TriangleData1337.coefficient102_288,
    output := OriginalRow227TriangleData1347.coefficient103_288, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_290, Icur := OriginalRow227TriangleData1337.coefficient102_289,
    output := OriginalRow227TriangleData1347.coefficient103_289, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_291, Icur := OriginalRow227TriangleData1337.coefficient102_290,
    output := OriginalRow227TriangleData1347.coefficient103_290, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1337.coefficient102_292, Icur := OriginalRow227TriangleData1337.coefficient102_291,
    output := OriginalRow227TriangleData1347.coefficient103_291, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1338.coefficient102_293, Icur := OriginalRow227TriangleData1337.coefficient102_292,
    output := OriginalRow227TriangleData1347.coefficient103_292, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root103,
    Inext := OriginalRow227TriangleData1338.coefficient102_294, Icur := OriginalRow227TriangleData1338.coefficient102_293,
    output := OriginalRow227TriangleData1347.coefficient103_293, hC := OriginalRow227TriangleRoots03.root103_pos, hAC := OriginalRow227TriangleRoots03.product103_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1331

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1331.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
