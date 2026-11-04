import Grothe.UpperChaos.OriginalRow227TriangleData1506
import Grothe.UpperChaos.OriginalRow227TriangleData1507
import Grothe.UpperChaos.OriginalRow227TriangleData1515
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1499
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_313, Icur := OriginalRow227TriangleData1506.coefficient120_312,
    output := OriginalRow227TriangleData1515.coefficient121_312, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_314, Icur := OriginalRow227TriangleData1506.coefficient120_313,
    output := OriginalRow227TriangleData1515.coefficient121_313, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_315, Icur := OriginalRow227TriangleData1506.coefficient120_314,
    output := OriginalRow227TriangleData1515.coefficient121_314, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_316, Icur := OriginalRow227TriangleData1506.coefficient120_315,
    output := OriginalRow227TriangleData1515.coefficient121_315, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_317, Icur := OriginalRow227TriangleData1506.coefficient120_316,
    output := OriginalRow227TriangleData1515.coefficient121_316, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_318, Icur := OriginalRow227TriangleData1506.coefficient120_317,
    output := OriginalRow227TriangleData1515.coefficient121_317, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_319, Icur := OriginalRow227TriangleData1506.coefficient120_318,
    output := OriginalRow227TriangleData1515.coefficient121_318, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_320, Icur := OriginalRow227TriangleData1506.coefficient120_319,
    output := OriginalRow227TriangleData1515.coefficient121_319, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_321, Icur := OriginalRow227TriangleData1506.coefficient120_320,
    output := OriginalRow227TriangleData1515.coefficient121_320, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_322, Icur := OriginalRow227TriangleData1506.coefficient120_321,
    output := OriginalRow227TriangleData1515.coefficient121_321, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_323, Icur := OriginalRow227TriangleData1506.coefficient120_322,
    output := OriginalRow227TriangleData1515.coefficient121_322, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_324, Icur := OriginalRow227TriangleData1506.coefficient120_323,
    output := OriginalRow227TriangleData1515.coefficient121_323, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_325, Icur := OriginalRow227TriangleData1506.coefficient120_324,
    output := OriginalRow227TriangleData1515.coefficient121_324, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_326, Icur := OriginalRow227TriangleData1506.coefficient120_325,
    output := OriginalRow227TriangleData1515.coefficient121_325, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_327, Icur := OriginalRow227TriangleData1506.coefficient120_326,
    output := OriginalRow227TriangleData1515.coefficient121_326, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_328, Icur := OriginalRow227TriangleData1506.coefficient120_327,
    output := OriginalRow227TriangleData1515.coefficient121_327, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_329, Icur := OriginalRow227TriangleData1506.coefficient120_328,
    output := OriginalRow227TriangleData1515.coefficient121_328, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_330, Icur := OriginalRow227TriangleData1506.coefficient120_329,
    output := OriginalRow227TriangleData1515.coefficient121_329, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_331, Icur := OriginalRow227TriangleData1506.coefficient120_330,
    output := OriginalRow227TriangleData1515.coefficient121_330, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_332, Icur := OriginalRow227TriangleData1506.coefficient120_331,
    output := OriginalRow227TriangleData1515.coefficient121_331, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_333, Icur := OriginalRow227TriangleData1506.coefficient120_332,
    output := OriginalRow227TriangleData1515.coefficient121_332, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_334, Icur := OriginalRow227TriangleData1506.coefficient120_333,
    output := OriginalRow227TriangleData1515.coefficient121_333, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_335, Icur := OriginalRow227TriangleData1506.coefficient120_334,
    output := OriginalRow227TriangleData1515.coefficient121_334, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_336, Icur := OriginalRow227TriangleData1506.coefficient120_335,
    output := OriginalRow227TriangleData1515.coefficient121_335, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_337, Icur := OriginalRow227TriangleData1506.coefficient120_336,
    output := OriginalRow227TriangleData1515.coefficient121_336, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_338, Icur := OriginalRow227TriangleData1506.coefficient120_337,
    output := OriginalRow227TriangleData1515.coefficient121_337, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_339, Icur := OriginalRow227TriangleData1506.coefficient120_338,
    output := OriginalRow227TriangleData1515.coefficient121_338, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_340, Icur := OriginalRow227TriangleData1506.coefficient120_339,
    output := OriginalRow227TriangleData1515.coefficient121_339, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_341, Icur := OriginalRow227TriangleData1506.coefficient120_340,
    output := OriginalRow227TriangleData1515.coefficient121_340, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1506.coefficient120_342, Icur := OriginalRow227TriangleData1506.coefficient120_341,
    output := OriginalRow227TriangleData1515.coefficient121_341, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1507.coefficient120_343, Icur := OriginalRow227TriangleData1506.coefficient120_342,
    output := OriginalRow227TriangleData1515.coefficient121_342, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1507.coefficient120_344, Icur := OriginalRow227TriangleData1507.coefficient120_343,
    output := OriginalRow227TriangleData1515.coefficient121_343, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1499

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1499.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
