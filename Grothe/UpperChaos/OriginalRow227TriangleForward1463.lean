import Grothe.UpperChaos.OriginalRow227TriangleData1470
import Grothe.UpperChaos.OriginalRow227TriangleData1471
import Grothe.UpperChaos.OriginalRow227TriangleData1479
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1463
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_309, Icur := OriginalRow227TriangleData1470.coefficient116_308,
    output := OriginalRow227TriangleData1479.coefficient117_308, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_310, Icur := OriginalRow227TriangleData1470.coefficient116_309,
    output := OriginalRow227TriangleData1479.coefficient117_309, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_311, Icur := OriginalRow227TriangleData1470.coefficient116_310,
    output := OriginalRow227TriangleData1479.coefficient117_310, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_312, Icur := OriginalRow227TriangleData1470.coefficient116_311,
    output := OriginalRow227TriangleData1479.coefficient117_311, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_313, Icur := OriginalRow227TriangleData1470.coefficient116_312,
    output := OriginalRow227TriangleData1479.coefficient117_312, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_314, Icur := OriginalRow227TriangleData1470.coefficient116_313,
    output := OriginalRow227TriangleData1479.coefficient117_313, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_315, Icur := OriginalRow227TriangleData1470.coefficient116_314,
    output := OriginalRow227TriangleData1479.coefficient117_314, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_316, Icur := OriginalRow227TriangleData1470.coefficient116_315,
    output := OriginalRow227TriangleData1479.coefficient117_315, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_317, Icur := OriginalRow227TriangleData1470.coefficient116_316,
    output := OriginalRow227TriangleData1479.coefficient117_316, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_318, Icur := OriginalRow227TriangleData1470.coefficient116_317,
    output := OriginalRow227TriangleData1479.coefficient117_317, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_319, Icur := OriginalRow227TriangleData1470.coefficient116_318,
    output := OriginalRow227TriangleData1479.coefficient117_318, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_320, Icur := OriginalRow227TriangleData1470.coefficient116_319,
    output := OriginalRow227TriangleData1479.coefficient117_319, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_321, Icur := OriginalRow227TriangleData1470.coefficient116_320,
    output := OriginalRow227TriangleData1479.coefficient117_320, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_322, Icur := OriginalRow227TriangleData1470.coefficient116_321,
    output := OriginalRow227TriangleData1479.coefficient117_321, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_323, Icur := OriginalRow227TriangleData1470.coefficient116_322,
    output := OriginalRow227TriangleData1479.coefficient117_322, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_324, Icur := OriginalRow227TriangleData1470.coefficient116_323,
    output := OriginalRow227TriangleData1479.coefficient117_323, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_325, Icur := OriginalRow227TriangleData1470.coefficient116_324,
    output := OriginalRow227TriangleData1479.coefficient117_324, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_326, Icur := OriginalRow227TriangleData1470.coefficient116_325,
    output := OriginalRow227TriangleData1479.coefficient117_325, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_327, Icur := OriginalRow227TriangleData1470.coefficient116_326,
    output := OriginalRow227TriangleData1479.coefficient117_326, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_328, Icur := OriginalRow227TriangleData1470.coefficient116_327,
    output := OriginalRow227TriangleData1479.coefficient117_327, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_329, Icur := OriginalRow227TriangleData1470.coefficient116_328,
    output := OriginalRow227TriangleData1479.coefficient117_328, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_330, Icur := OriginalRow227TriangleData1470.coefficient116_329,
    output := OriginalRow227TriangleData1479.coefficient117_329, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_331, Icur := OriginalRow227TriangleData1470.coefficient116_330,
    output := OriginalRow227TriangleData1479.coefficient117_330, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_332, Icur := OriginalRow227TriangleData1470.coefficient116_331,
    output := OriginalRow227TriangleData1479.coefficient117_331, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_333, Icur := OriginalRow227TriangleData1470.coefficient116_332,
    output := OriginalRow227TriangleData1479.coefficient117_332, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_334, Icur := OriginalRow227TriangleData1470.coefficient116_333,
    output := OriginalRow227TriangleData1479.coefficient117_333, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_335, Icur := OriginalRow227TriangleData1470.coefficient116_334,
    output := OriginalRow227TriangleData1479.coefficient117_334, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_336, Icur := OriginalRow227TriangleData1470.coefficient116_335,
    output := OriginalRow227TriangleData1479.coefficient117_335, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_337, Icur := OriginalRow227TriangleData1470.coefficient116_336,
    output := OriginalRow227TriangleData1479.coefficient117_336, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1470.coefficient116_338, Icur := OriginalRow227TriangleData1470.coefficient116_337,
    output := OriginalRow227TriangleData1479.coefficient117_337, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_339, Icur := OriginalRow227TriangleData1470.coefficient116_338,
    output := OriginalRow227TriangleData1479.coefficient117_338, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1471.coefficient116_340, Icur := OriginalRow227TriangleData1471.coefficient116_339,
    output := OriginalRow227TriangleData1479.coefficient117_339, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1463

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1463.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
