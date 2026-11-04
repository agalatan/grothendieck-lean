import Grothe.UpperChaos.OriginalRow227TriangleData1487
import Grothe.UpperChaos.OriginalRow227TriangleData1488
import Grothe.UpperChaos.OriginalRow227TriangleData1496
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1480
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_279, Icur := OriginalRow227TriangleData1487.coefficient118_278,
    output := OriginalRow227TriangleData1496.coefficient119_278, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_280, Icur := OriginalRow227TriangleData1487.coefficient118_279,
    output := OriginalRow227TriangleData1496.coefficient119_279, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_281, Icur := OriginalRow227TriangleData1487.coefficient118_280,
    output := OriginalRow227TriangleData1496.coefficient119_280, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_282, Icur := OriginalRow227TriangleData1487.coefficient118_281,
    output := OriginalRow227TriangleData1496.coefficient119_281, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_283, Icur := OriginalRow227TriangleData1487.coefficient118_282,
    output := OriginalRow227TriangleData1496.coefficient119_282, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_284, Icur := OriginalRow227TriangleData1487.coefficient118_283,
    output := OriginalRow227TriangleData1496.coefficient119_283, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_285, Icur := OriginalRow227TriangleData1487.coefficient118_284,
    output := OriginalRow227TriangleData1496.coefficient119_284, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_286, Icur := OriginalRow227TriangleData1487.coefficient118_285,
    output := OriginalRow227TriangleData1496.coefficient119_285, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_287, Icur := OriginalRow227TriangleData1487.coefficient118_286,
    output := OriginalRow227TriangleData1496.coefficient119_286, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_288, Icur := OriginalRow227TriangleData1487.coefficient118_287,
    output := OriginalRow227TriangleData1496.coefficient119_287, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_289, Icur := OriginalRow227TriangleData1487.coefficient118_288,
    output := OriginalRow227TriangleData1496.coefficient119_288, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_290, Icur := OriginalRow227TriangleData1487.coefficient118_289,
    output := OriginalRow227TriangleData1496.coefficient119_289, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_291, Icur := OriginalRow227TriangleData1487.coefficient118_290,
    output := OriginalRow227TriangleData1496.coefficient119_290, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_292, Icur := OriginalRow227TriangleData1487.coefficient118_291,
    output := OriginalRow227TriangleData1496.coefficient119_291, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_293, Icur := OriginalRow227TriangleData1487.coefficient118_292,
    output := OriginalRow227TriangleData1496.coefficient119_292, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_294, Icur := OriginalRow227TriangleData1487.coefficient118_293,
    output := OriginalRow227TriangleData1496.coefficient119_293, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_295, Icur := OriginalRow227TriangleData1487.coefficient118_294,
    output := OriginalRow227TriangleData1496.coefficient119_294, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_296, Icur := OriginalRow227TriangleData1487.coefficient118_295,
    output := OriginalRow227TriangleData1496.coefficient119_295, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_297, Icur := OriginalRow227TriangleData1487.coefficient118_296,
    output := OriginalRow227TriangleData1496.coefficient119_296, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_298, Icur := OriginalRow227TriangleData1487.coefficient118_297,
    output := OriginalRow227TriangleData1496.coefficient119_297, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_299, Icur := OriginalRow227TriangleData1487.coefficient118_298,
    output := OriginalRow227TriangleData1496.coefficient119_298, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_300, Icur := OriginalRow227TriangleData1487.coefficient118_299,
    output := OriginalRow227TriangleData1496.coefficient119_299, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_301, Icur := OriginalRow227TriangleData1487.coefficient118_300,
    output := OriginalRow227TriangleData1496.coefficient119_300, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_302, Icur := OriginalRow227TriangleData1487.coefficient118_301,
    output := OriginalRow227TriangleData1496.coefficient119_301, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_303, Icur := OriginalRow227TriangleData1487.coefficient118_302,
    output := OriginalRow227TriangleData1496.coefficient119_302, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_304, Icur := OriginalRow227TriangleData1487.coefficient118_303,
    output := OriginalRow227TriangleData1496.coefficient119_303, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_305, Icur := OriginalRow227TriangleData1487.coefficient118_304,
    output := OriginalRow227TriangleData1496.coefficient119_304, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_306, Icur := OriginalRow227TriangleData1487.coefficient118_305,
    output := OriginalRow227TriangleData1496.coefficient119_305, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_307, Icur := OriginalRow227TriangleData1487.coefficient118_306,
    output := OriginalRow227TriangleData1496.coefficient119_306, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1487.coefficient118_308, Icur := OriginalRow227TriangleData1487.coefficient118_307,
    output := OriginalRow227TriangleData1496.coefficient119_307, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1488.coefficient118_309, Icur := OriginalRow227TriangleData1487.coefficient118_308,
    output := OriginalRow227TriangleData1496.coefficient119_308, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root119,
    Inext := OriginalRow227TriangleData1488.coefficient118_310, Icur := OriginalRow227TriangleData1488.coefficient118_309,
    output := OriginalRow227TriangleData1496.coefficient119_309, hC := OriginalRow227TriangleRoots03.root119_pos, hAC := OriginalRow227TriangleRoots03.product119_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1480

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1480.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
