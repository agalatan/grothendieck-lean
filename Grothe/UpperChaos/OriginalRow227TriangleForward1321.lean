import Grothe.UpperChaos.OriginalRow227TriangleData1327
import Grothe.UpperChaos.OriginalRow227TriangleData1328
import Grothe.UpperChaos.OriginalRow227TriangleData1337
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1321
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_262, Icur := OriginalRow227TriangleData1327.coefficient101_261,
    output := OriginalRow227TriangleData1337.coefficient102_261, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_263, Icur := OriginalRow227TriangleData1327.coefficient101_262,
    output := OriginalRow227TriangleData1337.coefficient102_262, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_264, Icur := OriginalRow227TriangleData1327.coefficient101_263,
    output := OriginalRow227TriangleData1337.coefficient102_263, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_265, Icur := OriginalRow227TriangleData1327.coefficient101_264,
    output := OriginalRow227TriangleData1337.coefficient102_264, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_266, Icur := OriginalRow227TriangleData1327.coefficient101_265,
    output := OriginalRow227TriangleData1337.coefficient102_265, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_267, Icur := OriginalRow227TriangleData1327.coefficient101_266,
    output := OriginalRow227TriangleData1337.coefficient102_266, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_268, Icur := OriginalRow227TriangleData1327.coefficient101_267,
    output := OriginalRow227TriangleData1337.coefficient102_267, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_269, Icur := OriginalRow227TriangleData1327.coefficient101_268,
    output := OriginalRow227TriangleData1337.coefficient102_268, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_270, Icur := OriginalRow227TriangleData1327.coefficient101_269,
    output := OriginalRow227TriangleData1337.coefficient102_269, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_271, Icur := OriginalRow227TriangleData1327.coefficient101_270,
    output := OriginalRow227TriangleData1337.coefficient102_270, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_272, Icur := OriginalRow227TriangleData1327.coefficient101_271,
    output := OriginalRow227TriangleData1337.coefficient102_271, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_273, Icur := OriginalRow227TriangleData1327.coefficient101_272,
    output := OriginalRow227TriangleData1337.coefficient102_272, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_274, Icur := OriginalRow227TriangleData1327.coefficient101_273,
    output := OriginalRow227TriangleData1337.coefficient102_273, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_275, Icur := OriginalRow227TriangleData1327.coefficient101_274,
    output := OriginalRow227TriangleData1337.coefficient102_274, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_276, Icur := OriginalRow227TriangleData1327.coefficient101_275,
    output := OriginalRow227TriangleData1337.coefficient102_275, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_277, Icur := OriginalRow227TriangleData1327.coefficient101_276,
    output := OriginalRow227TriangleData1337.coefficient102_276, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_278, Icur := OriginalRow227TriangleData1327.coefficient101_277,
    output := OriginalRow227TriangleData1337.coefficient102_277, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_279, Icur := OriginalRow227TriangleData1327.coefficient101_278,
    output := OriginalRow227TriangleData1337.coefficient102_278, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_280, Icur := OriginalRow227TriangleData1327.coefficient101_279,
    output := OriginalRow227TriangleData1337.coefficient102_279, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_281, Icur := OriginalRow227TriangleData1327.coefficient101_280,
    output := OriginalRow227TriangleData1337.coefficient102_280, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_282, Icur := OriginalRow227TriangleData1327.coefficient101_281,
    output := OriginalRow227TriangleData1337.coefficient102_281, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_283, Icur := OriginalRow227TriangleData1327.coefficient101_282,
    output := OriginalRow227TriangleData1337.coefficient102_282, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_284, Icur := OriginalRow227TriangleData1327.coefficient101_283,
    output := OriginalRow227TriangleData1337.coefficient102_283, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_285, Icur := OriginalRow227TriangleData1327.coefficient101_284,
    output := OriginalRow227TriangleData1337.coefficient102_284, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_286, Icur := OriginalRow227TriangleData1327.coefficient101_285,
    output := OriginalRow227TriangleData1337.coefficient102_285, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_287, Icur := OriginalRow227TriangleData1327.coefficient101_286,
    output := OriginalRow227TriangleData1337.coefficient102_286, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_288, Icur := OriginalRow227TriangleData1327.coefficient101_287,
    output := OriginalRow227TriangleData1337.coefficient102_287, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_289, Icur := OriginalRow227TriangleData1327.coefficient101_288,
    output := OriginalRow227TriangleData1337.coefficient102_288, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_290, Icur := OriginalRow227TriangleData1327.coefficient101_289,
    output := OriginalRow227TriangleData1337.coefficient102_289, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1327.coefficient101_291, Icur := OriginalRow227TriangleData1327.coefficient101_290,
    output := OriginalRow227TriangleData1337.coefficient102_290, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1328.coefficient101_292, Icur := OriginalRow227TriangleData1327.coefficient101_291,
    output := OriginalRow227TriangleData1337.coefficient102_291, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1328.coefficient101_293, Icur := OriginalRow227TriangleData1328.coefficient101_292,
    output := OriginalRow227TriangleData1337.coefficient102_292, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1321

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1321.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
