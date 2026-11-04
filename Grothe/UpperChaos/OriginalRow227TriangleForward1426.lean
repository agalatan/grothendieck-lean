import Grothe.UpperChaos.OriginalRow227TriangleData1433
import Grothe.UpperChaos.OriginalRow227TriangleData1434
import Grothe.UpperChaos.OriginalRow227TriangleData1442
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1426
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_273, Icur := OriginalRow227TriangleData1433.coefficient112_272,
    output := OriginalRow227TriangleData1442.coefficient113_272, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_274, Icur := OriginalRow227TriangleData1433.coefficient112_273,
    output := OriginalRow227TriangleData1442.coefficient113_273, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_275, Icur := OriginalRow227TriangleData1433.coefficient112_274,
    output := OriginalRow227TriangleData1442.coefficient113_274, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_276, Icur := OriginalRow227TriangleData1433.coefficient112_275,
    output := OriginalRow227TriangleData1442.coefficient113_275, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_277, Icur := OriginalRow227TriangleData1433.coefficient112_276,
    output := OriginalRow227TriangleData1442.coefficient113_276, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_278, Icur := OriginalRow227TriangleData1433.coefficient112_277,
    output := OriginalRow227TriangleData1442.coefficient113_277, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_279, Icur := OriginalRow227TriangleData1433.coefficient112_278,
    output := OriginalRow227TriangleData1442.coefficient113_278, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_280, Icur := OriginalRow227TriangleData1433.coefficient112_279,
    output := OriginalRow227TriangleData1442.coefficient113_279, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_281, Icur := OriginalRow227TriangleData1433.coefficient112_280,
    output := OriginalRow227TriangleData1442.coefficient113_280, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_282, Icur := OriginalRow227TriangleData1433.coefficient112_281,
    output := OriginalRow227TriangleData1442.coefficient113_281, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_283, Icur := OriginalRow227TriangleData1433.coefficient112_282,
    output := OriginalRow227TriangleData1442.coefficient113_282, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_284, Icur := OriginalRow227TriangleData1433.coefficient112_283,
    output := OriginalRow227TriangleData1442.coefficient113_283, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_285, Icur := OriginalRow227TriangleData1433.coefficient112_284,
    output := OriginalRow227TriangleData1442.coefficient113_284, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_286, Icur := OriginalRow227TriangleData1433.coefficient112_285,
    output := OriginalRow227TriangleData1442.coefficient113_285, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_287, Icur := OriginalRow227TriangleData1433.coefficient112_286,
    output := OriginalRow227TriangleData1442.coefficient113_286, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_288, Icur := OriginalRow227TriangleData1433.coefficient112_287,
    output := OriginalRow227TriangleData1442.coefficient113_287, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_289, Icur := OriginalRow227TriangleData1433.coefficient112_288,
    output := OriginalRow227TriangleData1442.coefficient113_288, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_290, Icur := OriginalRow227TriangleData1433.coefficient112_289,
    output := OriginalRow227TriangleData1442.coefficient113_289, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_291, Icur := OriginalRow227TriangleData1433.coefficient112_290,
    output := OriginalRow227TriangleData1442.coefficient113_290, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_292, Icur := OriginalRow227TriangleData1433.coefficient112_291,
    output := OriginalRow227TriangleData1442.coefficient113_291, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_293, Icur := OriginalRow227TriangleData1433.coefficient112_292,
    output := OriginalRow227TriangleData1442.coefficient113_292, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_294, Icur := OriginalRow227TriangleData1433.coefficient112_293,
    output := OriginalRow227TriangleData1442.coefficient113_293, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_295, Icur := OriginalRow227TriangleData1433.coefficient112_294,
    output := OriginalRow227TriangleData1442.coefficient113_294, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_296, Icur := OriginalRow227TriangleData1433.coefficient112_295,
    output := OriginalRow227TriangleData1442.coefficient113_295, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_297, Icur := OriginalRow227TriangleData1433.coefficient112_296,
    output := OriginalRow227TriangleData1442.coefficient113_296, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_298, Icur := OriginalRow227TriangleData1433.coefficient112_297,
    output := OriginalRow227TriangleData1442.coefficient113_297, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_299, Icur := OriginalRow227TriangleData1433.coefficient112_298,
    output := OriginalRow227TriangleData1442.coefficient113_298, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_300, Icur := OriginalRow227TriangleData1433.coefficient112_299,
    output := OriginalRow227TriangleData1442.coefficient113_299, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_301, Icur := OriginalRow227TriangleData1433.coefficient112_300,
    output := OriginalRow227TriangleData1442.coefficient113_300, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1433.coefficient112_302, Icur := OriginalRow227TriangleData1433.coefficient112_301,
    output := OriginalRow227TriangleData1442.coefficient113_301, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1434.coefficient112_303, Icur := OriginalRow227TriangleData1433.coefficient112_302,
    output := OriginalRow227TriangleData1442.coefficient113_302, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root113,
    Inext := OriginalRow227TriangleData1434.coefficient112_304, Icur := OriginalRow227TriangleData1434.coefficient112_303,
    output := OriginalRow227TriangleData1442.coefficient113_303, hC := OriginalRow227TriangleRoots03.root113_pos, hAC := OriginalRow227TriangleRoots03.product113_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1426

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1426.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
