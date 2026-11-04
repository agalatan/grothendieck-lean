import Grothe.UpperChaos.OriginalRow227TriangleData1317
import Grothe.UpperChaos.OriginalRow227TriangleData1318
import Grothe.UpperChaos.OriginalRow227TriangleData1327
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1311
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_261, Icur := OriginalRow227TriangleData1317.coefficient100_260,
    output := OriginalRow227TriangleData1327.coefficient101_260, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_262, Icur := OriginalRow227TriangleData1317.coefficient100_261,
    output := OriginalRow227TriangleData1327.coefficient101_261, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_263, Icur := OriginalRow227TriangleData1317.coefficient100_262,
    output := OriginalRow227TriangleData1327.coefficient101_262, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_264, Icur := OriginalRow227TriangleData1317.coefficient100_263,
    output := OriginalRow227TriangleData1327.coefficient101_263, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_265, Icur := OriginalRow227TriangleData1317.coefficient100_264,
    output := OriginalRow227TriangleData1327.coefficient101_264, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_266, Icur := OriginalRow227TriangleData1317.coefficient100_265,
    output := OriginalRow227TriangleData1327.coefficient101_265, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_267, Icur := OriginalRow227TriangleData1317.coefficient100_266,
    output := OriginalRow227TriangleData1327.coefficient101_266, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_268, Icur := OriginalRow227TriangleData1317.coefficient100_267,
    output := OriginalRow227TriangleData1327.coefficient101_267, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_269, Icur := OriginalRow227TriangleData1317.coefficient100_268,
    output := OriginalRow227TriangleData1327.coefficient101_268, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_270, Icur := OriginalRow227TriangleData1317.coefficient100_269,
    output := OriginalRow227TriangleData1327.coefficient101_269, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_271, Icur := OriginalRow227TriangleData1317.coefficient100_270,
    output := OriginalRow227TriangleData1327.coefficient101_270, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_272, Icur := OriginalRow227TriangleData1317.coefficient100_271,
    output := OriginalRow227TriangleData1327.coefficient101_271, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_273, Icur := OriginalRow227TriangleData1317.coefficient100_272,
    output := OriginalRow227TriangleData1327.coefficient101_272, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_274, Icur := OriginalRow227TriangleData1317.coefficient100_273,
    output := OriginalRow227TriangleData1327.coefficient101_273, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_275, Icur := OriginalRow227TriangleData1317.coefficient100_274,
    output := OriginalRow227TriangleData1327.coefficient101_274, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_276, Icur := OriginalRow227TriangleData1317.coefficient100_275,
    output := OriginalRow227TriangleData1327.coefficient101_275, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_277, Icur := OriginalRow227TriangleData1317.coefficient100_276,
    output := OriginalRow227TriangleData1327.coefficient101_276, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_278, Icur := OriginalRow227TriangleData1317.coefficient100_277,
    output := OriginalRow227TriangleData1327.coefficient101_277, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_279, Icur := OriginalRow227TriangleData1317.coefficient100_278,
    output := OriginalRow227TriangleData1327.coefficient101_278, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_280, Icur := OriginalRow227TriangleData1317.coefficient100_279,
    output := OriginalRow227TriangleData1327.coefficient101_279, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_281, Icur := OriginalRow227TriangleData1317.coefficient100_280,
    output := OriginalRow227TriangleData1327.coefficient101_280, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_282, Icur := OriginalRow227TriangleData1317.coefficient100_281,
    output := OriginalRow227TriangleData1327.coefficient101_281, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_283, Icur := OriginalRow227TriangleData1317.coefficient100_282,
    output := OriginalRow227TriangleData1327.coefficient101_282, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_284, Icur := OriginalRow227TriangleData1317.coefficient100_283,
    output := OriginalRow227TriangleData1327.coefficient101_283, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_285, Icur := OriginalRow227TriangleData1317.coefficient100_284,
    output := OriginalRow227TriangleData1327.coefficient101_284, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_286, Icur := OriginalRow227TriangleData1317.coefficient100_285,
    output := OriginalRow227TriangleData1327.coefficient101_285, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_287, Icur := OriginalRow227TriangleData1317.coefficient100_286,
    output := OriginalRow227TriangleData1327.coefficient101_286, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_288, Icur := OriginalRow227TriangleData1317.coefficient100_287,
    output := OriginalRow227TriangleData1327.coefficient101_287, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_289, Icur := OriginalRow227TriangleData1317.coefficient100_288,
    output := OriginalRow227TriangleData1327.coefficient101_288, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1317.coefficient100_290, Icur := OriginalRow227TriangleData1317.coefficient100_289,
    output := OriginalRow227TriangleData1327.coefficient101_289, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_291, Icur := OriginalRow227TriangleData1317.coefficient100_290,
    output := OriginalRow227TriangleData1327.coefficient101_290, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_292, Icur := OriginalRow227TriangleData1318.coefficient100_291,
    output := OriginalRow227TriangleData1327.coefficient101_291, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1311

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1311.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
