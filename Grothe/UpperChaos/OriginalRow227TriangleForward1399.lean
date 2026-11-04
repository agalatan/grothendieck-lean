import Grothe.UpperChaos.OriginalRow227TriangleData1406
import Grothe.UpperChaos.OriginalRow227TriangleData1407
import Grothe.UpperChaos.OriginalRow227TriangleData1415
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1399
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_270, Icur := OriginalRow227TriangleData1406.coefficient109_269,
    output := OriginalRow227TriangleData1415.coefficient110_269, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_271, Icur := OriginalRow227TriangleData1406.coefficient109_270,
    output := OriginalRow227TriangleData1415.coefficient110_270, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_272, Icur := OriginalRow227TriangleData1406.coefficient109_271,
    output := OriginalRow227TriangleData1415.coefficient110_271, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_273, Icur := OriginalRow227TriangleData1406.coefficient109_272,
    output := OriginalRow227TriangleData1415.coefficient110_272, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_274, Icur := OriginalRow227TriangleData1406.coefficient109_273,
    output := OriginalRow227TriangleData1415.coefficient110_273, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_275, Icur := OriginalRow227TriangleData1406.coefficient109_274,
    output := OriginalRow227TriangleData1415.coefficient110_274, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_276, Icur := OriginalRow227TriangleData1406.coefficient109_275,
    output := OriginalRow227TriangleData1415.coefficient110_275, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_277, Icur := OriginalRow227TriangleData1406.coefficient109_276,
    output := OriginalRow227TriangleData1415.coefficient110_276, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_278, Icur := OriginalRow227TriangleData1406.coefficient109_277,
    output := OriginalRow227TriangleData1415.coefficient110_277, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_279, Icur := OriginalRow227TriangleData1406.coefficient109_278,
    output := OriginalRow227TriangleData1415.coefficient110_278, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_280, Icur := OriginalRow227TriangleData1406.coefficient109_279,
    output := OriginalRow227TriangleData1415.coefficient110_279, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_281, Icur := OriginalRow227TriangleData1406.coefficient109_280,
    output := OriginalRow227TriangleData1415.coefficient110_280, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_282, Icur := OriginalRow227TriangleData1406.coefficient109_281,
    output := OriginalRow227TriangleData1415.coefficient110_281, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_283, Icur := OriginalRow227TriangleData1406.coefficient109_282,
    output := OriginalRow227TriangleData1415.coefficient110_282, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_284, Icur := OriginalRow227TriangleData1406.coefficient109_283,
    output := OriginalRow227TriangleData1415.coefficient110_283, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_285, Icur := OriginalRow227TriangleData1406.coefficient109_284,
    output := OriginalRow227TriangleData1415.coefficient110_284, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_286, Icur := OriginalRow227TriangleData1406.coefficient109_285,
    output := OriginalRow227TriangleData1415.coefficient110_285, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_287, Icur := OriginalRow227TriangleData1406.coefficient109_286,
    output := OriginalRow227TriangleData1415.coefficient110_286, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_288, Icur := OriginalRow227TriangleData1406.coefficient109_287,
    output := OriginalRow227TriangleData1415.coefficient110_287, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_289, Icur := OriginalRow227TriangleData1406.coefficient109_288,
    output := OriginalRow227TriangleData1415.coefficient110_288, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_290, Icur := OriginalRow227TriangleData1406.coefficient109_289,
    output := OriginalRow227TriangleData1415.coefficient110_289, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_291, Icur := OriginalRow227TriangleData1406.coefficient109_290,
    output := OriginalRow227TriangleData1415.coefficient110_290, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_292, Icur := OriginalRow227TriangleData1406.coefficient109_291,
    output := OriginalRow227TriangleData1415.coefficient110_291, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_293, Icur := OriginalRow227TriangleData1406.coefficient109_292,
    output := OriginalRow227TriangleData1415.coefficient110_292, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_294, Icur := OriginalRow227TriangleData1406.coefficient109_293,
    output := OriginalRow227TriangleData1415.coefficient110_293, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_295, Icur := OriginalRow227TriangleData1406.coefficient109_294,
    output := OriginalRow227TriangleData1415.coefficient110_294, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_296, Icur := OriginalRow227TriangleData1406.coefficient109_295,
    output := OriginalRow227TriangleData1415.coefficient110_295, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_297, Icur := OriginalRow227TriangleData1406.coefficient109_296,
    output := OriginalRow227TriangleData1415.coefficient110_296, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_298, Icur := OriginalRow227TriangleData1406.coefficient109_297,
    output := OriginalRow227TriangleData1415.coefficient110_297, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1406.coefficient109_299, Icur := OriginalRow227TriangleData1406.coefficient109_298,
    output := OriginalRow227TriangleData1415.coefficient110_298, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_300, Icur := OriginalRow227TriangleData1406.coefficient109_299,
    output := OriginalRow227TriangleData1415.coefficient110_299, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_301, Icur := OriginalRow227TriangleData1407.coefficient109_300,
    output := OriginalRow227TriangleData1415.coefficient110_300, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1399

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1399.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
