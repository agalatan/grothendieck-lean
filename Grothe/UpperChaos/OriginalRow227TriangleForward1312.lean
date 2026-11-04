import Grothe.UpperChaos.OriginalRow227TriangleData1318
import Grothe.UpperChaos.OriginalRow227TriangleData1319
import Grothe.UpperChaos.OriginalRow227TriangleData1328
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1312
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_293, Icur := OriginalRow227TriangleData1318.coefficient100_292,
    output := OriginalRow227TriangleData1328.coefficient101_292, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_294, Icur := OriginalRow227TriangleData1318.coefficient100_293,
    output := OriginalRow227TriangleData1328.coefficient101_293, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_295, Icur := OriginalRow227TriangleData1318.coefficient100_294,
    output := OriginalRow227TriangleData1328.coefficient101_294, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_296, Icur := OriginalRow227TriangleData1318.coefficient100_295,
    output := OriginalRow227TriangleData1328.coefficient101_295, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_297, Icur := OriginalRow227TriangleData1318.coefficient100_296,
    output := OriginalRow227TriangleData1328.coefficient101_296, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_298, Icur := OriginalRow227TriangleData1318.coefficient100_297,
    output := OriginalRow227TriangleData1328.coefficient101_297, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_299, Icur := OriginalRow227TriangleData1318.coefficient100_298,
    output := OriginalRow227TriangleData1328.coefficient101_298, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_300, Icur := OriginalRow227TriangleData1318.coefficient100_299,
    output := OriginalRow227TriangleData1328.coefficient101_299, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_301, Icur := OriginalRow227TriangleData1318.coefficient100_300,
    output := OriginalRow227TriangleData1328.coefficient101_300, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_302, Icur := OriginalRow227TriangleData1318.coefficient100_301,
    output := OriginalRow227TriangleData1328.coefficient101_301, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_303, Icur := OriginalRow227TriangleData1318.coefficient100_302,
    output := OriginalRow227TriangleData1328.coefficient101_302, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_304, Icur := OriginalRow227TriangleData1318.coefficient100_303,
    output := OriginalRow227TriangleData1328.coefficient101_303, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_305, Icur := OriginalRow227TriangleData1318.coefficient100_304,
    output := OriginalRow227TriangleData1328.coefficient101_304, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_306, Icur := OriginalRow227TriangleData1318.coefficient100_305,
    output := OriginalRow227TriangleData1328.coefficient101_305, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_307, Icur := OriginalRow227TriangleData1318.coefficient100_306,
    output := OriginalRow227TriangleData1328.coefficient101_306, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_308, Icur := OriginalRow227TriangleData1318.coefficient100_307,
    output := OriginalRow227TriangleData1328.coefficient101_307, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_309, Icur := OriginalRow227TriangleData1318.coefficient100_308,
    output := OriginalRow227TriangleData1328.coefficient101_308, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_310, Icur := OriginalRow227TriangleData1318.coefficient100_309,
    output := OriginalRow227TriangleData1328.coefficient101_309, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_311, Icur := OriginalRow227TriangleData1318.coefficient100_310,
    output := OriginalRow227TriangleData1328.coefficient101_310, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_312, Icur := OriginalRow227TriangleData1318.coefficient100_311,
    output := OriginalRow227TriangleData1328.coefficient101_311, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_313, Icur := OriginalRow227TriangleData1318.coefficient100_312,
    output := OriginalRow227TriangleData1328.coefficient101_312, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_314, Icur := OriginalRow227TriangleData1318.coefficient100_313,
    output := OriginalRow227TriangleData1328.coefficient101_313, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_315, Icur := OriginalRow227TriangleData1318.coefficient100_314,
    output := OriginalRow227TriangleData1328.coefficient101_314, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_316, Icur := OriginalRow227TriangleData1318.coefficient100_315,
    output := OriginalRow227TriangleData1328.coefficient101_315, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_317, Icur := OriginalRow227TriangleData1318.coefficient100_316,
    output := OriginalRow227TriangleData1328.coefficient101_316, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_318, Icur := OriginalRow227TriangleData1318.coefficient100_317,
    output := OriginalRow227TriangleData1328.coefficient101_317, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_319, Icur := OriginalRow227TriangleData1318.coefficient100_318,
    output := OriginalRow227TriangleData1328.coefficient101_318, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_320, Icur := OriginalRow227TriangleData1318.coefficient100_319,
    output := OriginalRow227TriangleData1328.coefficient101_319, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_321, Icur := OriginalRow227TriangleData1318.coefficient100_320,
    output := OriginalRow227TriangleData1328.coefficient101_320, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1318.coefficient100_322, Icur := OriginalRow227TriangleData1318.coefficient100_321,
    output := OriginalRow227TriangleData1328.coefficient101_321, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1319.coefficient100_323, Icur := OriginalRow227TriangleData1318.coefficient100_322,
    output := OriginalRow227TriangleData1328.coefficient101_322, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1319.coefficient100_324, Icur := OriginalRow227TriangleData1319.coefficient100_323,
    output := OriginalRow227TriangleData1328.coefficient101_323, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1312

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1312.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
