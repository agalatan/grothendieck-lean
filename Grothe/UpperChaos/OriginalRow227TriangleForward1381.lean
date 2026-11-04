import Grothe.UpperChaos.OriginalRow227TriangleData1387
import Grothe.UpperChaos.OriginalRow227TriangleData1388
import Grothe.UpperChaos.OriginalRow227TriangleData1397
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1381
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_268, Icur := OriginalRow227TriangleData1387.coefficient107_267,
    output := OriginalRow227TriangleData1397.coefficient108_267, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_269, Icur := OriginalRow227TriangleData1387.coefficient107_268,
    output := OriginalRow227TriangleData1397.coefficient108_268, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_270, Icur := OriginalRow227TriangleData1387.coefficient107_269,
    output := OriginalRow227TriangleData1397.coefficient108_269, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_271, Icur := OriginalRow227TriangleData1387.coefficient107_270,
    output := OriginalRow227TriangleData1397.coefficient108_270, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_272, Icur := OriginalRow227TriangleData1387.coefficient107_271,
    output := OriginalRow227TriangleData1397.coefficient108_271, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_273, Icur := OriginalRow227TriangleData1387.coefficient107_272,
    output := OriginalRow227TriangleData1397.coefficient108_272, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_274, Icur := OriginalRow227TriangleData1387.coefficient107_273,
    output := OriginalRow227TriangleData1397.coefficient108_273, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_275, Icur := OriginalRow227TriangleData1387.coefficient107_274,
    output := OriginalRow227TriangleData1397.coefficient108_274, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_276, Icur := OriginalRow227TriangleData1387.coefficient107_275,
    output := OriginalRow227TriangleData1397.coefficient108_275, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_277, Icur := OriginalRow227TriangleData1387.coefficient107_276,
    output := OriginalRow227TriangleData1397.coefficient108_276, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_278, Icur := OriginalRow227TriangleData1387.coefficient107_277,
    output := OriginalRow227TriangleData1397.coefficient108_277, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_279, Icur := OriginalRow227TriangleData1387.coefficient107_278,
    output := OriginalRow227TriangleData1397.coefficient108_278, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_280, Icur := OriginalRow227TriangleData1387.coefficient107_279,
    output := OriginalRow227TriangleData1397.coefficient108_279, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_281, Icur := OriginalRow227TriangleData1387.coefficient107_280,
    output := OriginalRow227TriangleData1397.coefficient108_280, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_282, Icur := OriginalRow227TriangleData1387.coefficient107_281,
    output := OriginalRow227TriangleData1397.coefficient108_281, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_283, Icur := OriginalRow227TriangleData1387.coefficient107_282,
    output := OriginalRow227TriangleData1397.coefficient108_282, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_284, Icur := OriginalRow227TriangleData1387.coefficient107_283,
    output := OriginalRow227TriangleData1397.coefficient108_283, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_285, Icur := OriginalRow227TriangleData1387.coefficient107_284,
    output := OriginalRow227TriangleData1397.coefficient108_284, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_286, Icur := OriginalRow227TriangleData1387.coefficient107_285,
    output := OriginalRow227TriangleData1397.coefficient108_285, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_287, Icur := OriginalRow227TriangleData1387.coefficient107_286,
    output := OriginalRow227TriangleData1397.coefficient108_286, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_288, Icur := OriginalRow227TriangleData1387.coefficient107_287,
    output := OriginalRow227TriangleData1397.coefficient108_287, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_289, Icur := OriginalRow227TriangleData1387.coefficient107_288,
    output := OriginalRow227TriangleData1397.coefficient108_288, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_290, Icur := OriginalRow227TriangleData1387.coefficient107_289,
    output := OriginalRow227TriangleData1397.coefficient108_289, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_291, Icur := OriginalRow227TriangleData1387.coefficient107_290,
    output := OriginalRow227TriangleData1397.coefficient108_290, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_292, Icur := OriginalRow227TriangleData1387.coefficient107_291,
    output := OriginalRow227TriangleData1397.coefficient108_291, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_293, Icur := OriginalRow227TriangleData1387.coefficient107_292,
    output := OriginalRow227TriangleData1397.coefficient108_292, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_294, Icur := OriginalRow227TriangleData1387.coefficient107_293,
    output := OriginalRow227TriangleData1397.coefficient108_293, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_295, Icur := OriginalRow227TriangleData1387.coefficient107_294,
    output := OriginalRow227TriangleData1397.coefficient108_294, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_296, Icur := OriginalRow227TriangleData1387.coefficient107_295,
    output := OriginalRow227TriangleData1397.coefficient108_295, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1387.coefficient107_297, Icur := OriginalRow227TriangleData1387.coefficient107_296,
    output := OriginalRow227TriangleData1397.coefficient108_296, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1388.coefficient107_298, Icur := OriginalRow227TriangleData1387.coefficient107_297,
    output := OriginalRow227TriangleData1397.coefficient108_297, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root108,
    Inext := OriginalRow227TriangleData1388.coefficient107_299, Icur := OriginalRow227TriangleData1388.coefficient107_298,
    output := OriginalRow227TriangleData1397.coefficient108_298, hC := OriginalRow227TriangleRoots03.root108_pos, hAC := OriginalRow227TriangleRoots03.product108_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1381

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1381.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
