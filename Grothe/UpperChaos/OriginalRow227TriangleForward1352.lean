import Grothe.UpperChaos.OriginalRow227TriangleData1358
import Grothe.UpperChaos.OriginalRow227TriangleData1359
import Grothe.UpperChaos.OriginalRow227TriangleData1368
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1352
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_297, Icur := OriginalRow227TriangleData1358.coefficient104_296,
    output := OriginalRow227TriangleData1368.coefficient105_296, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_298, Icur := OriginalRow227TriangleData1358.coefficient104_297,
    output := OriginalRow227TriangleData1368.coefficient105_297, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_299, Icur := OriginalRow227TriangleData1358.coefficient104_298,
    output := OriginalRow227TriangleData1368.coefficient105_298, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_300, Icur := OriginalRow227TriangleData1358.coefficient104_299,
    output := OriginalRow227TriangleData1368.coefficient105_299, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_301, Icur := OriginalRow227TriangleData1358.coefficient104_300,
    output := OriginalRow227TriangleData1368.coefficient105_300, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_302, Icur := OriginalRow227TriangleData1358.coefficient104_301,
    output := OriginalRow227TriangleData1368.coefficient105_301, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_303, Icur := OriginalRow227TriangleData1358.coefficient104_302,
    output := OriginalRow227TriangleData1368.coefficient105_302, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_304, Icur := OriginalRow227TriangleData1358.coefficient104_303,
    output := OriginalRow227TriangleData1368.coefficient105_303, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_305, Icur := OriginalRow227TriangleData1358.coefficient104_304,
    output := OriginalRow227TriangleData1368.coefficient105_304, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_306, Icur := OriginalRow227TriangleData1358.coefficient104_305,
    output := OriginalRow227TriangleData1368.coefficient105_305, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_307, Icur := OriginalRow227TriangleData1358.coefficient104_306,
    output := OriginalRow227TriangleData1368.coefficient105_306, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_308, Icur := OriginalRow227TriangleData1358.coefficient104_307,
    output := OriginalRow227TriangleData1368.coefficient105_307, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_309, Icur := OriginalRow227TriangleData1358.coefficient104_308,
    output := OriginalRow227TriangleData1368.coefficient105_308, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_310, Icur := OriginalRow227TriangleData1358.coefficient104_309,
    output := OriginalRow227TriangleData1368.coefficient105_309, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_311, Icur := OriginalRow227TriangleData1358.coefficient104_310,
    output := OriginalRow227TriangleData1368.coefficient105_310, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_312, Icur := OriginalRow227TriangleData1358.coefficient104_311,
    output := OriginalRow227TriangleData1368.coefficient105_311, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_313, Icur := OriginalRow227TriangleData1358.coefficient104_312,
    output := OriginalRow227TriangleData1368.coefficient105_312, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_314, Icur := OriginalRow227TriangleData1358.coefficient104_313,
    output := OriginalRow227TriangleData1368.coefficient105_313, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_315, Icur := OriginalRow227TriangleData1358.coefficient104_314,
    output := OriginalRow227TriangleData1368.coefficient105_314, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_316, Icur := OriginalRow227TriangleData1358.coefficient104_315,
    output := OriginalRow227TriangleData1368.coefficient105_315, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_317, Icur := OriginalRow227TriangleData1358.coefficient104_316,
    output := OriginalRow227TriangleData1368.coefficient105_316, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_318, Icur := OriginalRow227TriangleData1358.coefficient104_317,
    output := OriginalRow227TriangleData1368.coefficient105_317, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_319, Icur := OriginalRow227TriangleData1358.coefficient104_318,
    output := OriginalRow227TriangleData1368.coefficient105_318, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_320, Icur := OriginalRow227TriangleData1358.coefficient104_319,
    output := OriginalRow227TriangleData1368.coefficient105_319, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_321, Icur := OriginalRow227TriangleData1358.coefficient104_320,
    output := OriginalRow227TriangleData1368.coefficient105_320, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_322, Icur := OriginalRow227TriangleData1358.coefficient104_321,
    output := OriginalRow227TriangleData1368.coefficient105_321, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_323, Icur := OriginalRow227TriangleData1358.coefficient104_322,
    output := OriginalRow227TriangleData1368.coefficient105_322, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_324, Icur := OriginalRow227TriangleData1358.coefficient104_323,
    output := OriginalRow227TriangleData1368.coefficient105_323, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_325, Icur := OriginalRow227TriangleData1358.coefficient104_324,
    output := OriginalRow227TriangleData1368.coefficient105_324, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1358.coefficient104_326, Icur := OriginalRow227TriangleData1358.coefficient104_325,
    output := OriginalRow227TriangleData1368.coefficient105_325, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_327, Icur := OriginalRow227TriangleData1358.coefficient104_326,
    output := OriginalRow227TriangleData1368.coefficient105_326, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root105,
    Inext := OriginalRow227TriangleData1359.coefficient104_328, Icur := OriginalRow227TriangleData1359.coefficient104_327,
    output := OriginalRow227TriangleData1368.coefficient105_327, hC := OriginalRow227TriangleRoots03.root105_pos, hAC := OriginalRow227TriangleRoots03.product105_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1352

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1352.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
