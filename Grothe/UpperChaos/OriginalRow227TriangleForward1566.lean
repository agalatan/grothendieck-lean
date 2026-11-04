import Grothe.UpperChaos.OriginalRow227TriangleData1574
import Grothe.UpperChaos.OriginalRow227TriangleData1575
import Grothe.UpperChaos.OriginalRow227TriangleData1582
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1566
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_321, Icur := OriginalRow227TriangleData1574.coefficient128_320,
    output := OriginalRow227TriangleData1582.coefficient129_320, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_322, Icur := OriginalRow227TriangleData1574.coefficient128_321,
    output := OriginalRow227TriangleData1582.coefficient129_321, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_323, Icur := OriginalRow227TriangleData1574.coefficient128_322,
    output := OriginalRow227TriangleData1582.coefficient129_322, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_324, Icur := OriginalRow227TriangleData1574.coefficient128_323,
    output := OriginalRow227TriangleData1582.coefficient129_323, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_325, Icur := OriginalRow227TriangleData1574.coefficient128_324,
    output := OriginalRow227TriangleData1582.coefficient129_324, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_326, Icur := OriginalRow227TriangleData1574.coefficient128_325,
    output := OriginalRow227TriangleData1582.coefficient129_325, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_327, Icur := OriginalRow227TriangleData1574.coefficient128_326,
    output := OriginalRow227TriangleData1582.coefficient129_326, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_328, Icur := OriginalRow227TriangleData1574.coefficient128_327,
    output := OriginalRow227TriangleData1582.coefficient129_327, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_329, Icur := OriginalRow227TriangleData1574.coefficient128_328,
    output := OriginalRow227TriangleData1582.coefficient129_328, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_330, Icur := OriginalRow227TriangleData1574.coefficient128_329,
    output := OriginalRow227TriangleData1582.coefficient129_329, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_331, Icur := OriginalRow227TriangleData1574.coefficient128_330,
    output := OriginalRow227TriangleData1582.coefficient129_330, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_332, Icur := OriginalRow227TriangleData1574.coefficient128_331,
    output := OriginalRow227TriangleData1582.coefficient129_331, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_333, Icur := OriginalRow227TriangleData1574.coefficient128_332,
    output := OriginalRow227TriangleData1582.coefficient129_332, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_334, Icur := OriginalRow227TriangleData1574.coefficient128_333,
    output := OriginalRow227TriangleData1582.coefficient129_333, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_335, Icur := OriginalRow227TriangleData1574.coefficient128_334,
    output := OriginalRow227TriangleData1582.coefficient129_334, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_336, Icur := OriginalRow227TriangleData1574.coefficient128_335,
    output := OriginalRow227TriangleData1582.coefficient129_335, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_337, Icur := OriginalRow227TriangleData1574.coefficient128_336,
    output := OriginalRow227TriangleData1582.coefficient129_336, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_338, Icur := OriginalRow227TriangleData1574.coefficient128_337,
    output := OriginalRow227TriangleData1582.coefficient129_337, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_339, Icur := OriginalRow227TriangleData1574.coefficient128_338,
    output := OriginalRow227TriangleData1582.coefficient129_338, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_340, Icur := OriginalRow227TriangleData1574.coefficient128_339,
    output := OriginalRow227TriangleData1582.coefficient129_339, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_341, Icur := OriginalRow227TriangleData1574.coefficient128_340,
    output := OriginalRow227TriangleData1582.coefficient129_340, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_342, Icur := OriginalRow227TriangleData1574.coefficient128_341,
    output := OriginalRow227TriangleData1582.coefficient129_341, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_343, Icur := OriginalRow227TriangleData1574.coefficient128_342,
    output := OriginalRow227TriangleData1582.coefficient129_342, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_344, Icur := OriginalRow227TriangleData1574.coefficient128_343,
    output := OriginalRow227TriangleData1582.coefficient129_343, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_345, Icur := OriginalRow227TriangleData1574.coefficient128_344,
    output := OriginalRow227TriangleData1582.coefficient129_344, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_346, Icur := OriginalRow227TriangleData1574.coefficient128_345,
    output := OriginalRow227TriangleData1582.coefficient129_345, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_347, Icur := OriginalRow227TriangleData1574.coefficient128_346,
    output := OriginalRow227TriangleData1582.coefficient129_346, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_348, Icur := OriginalRow227TriangleData1574.coefficient128_347,
    output := OriginalRow227TriangleData1582.coefficient129_347, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_349, Icur := OriginalRow227TriangleData1574.coefficient128_348,
    output := OriginalRow227TriangleData1582.coefficient129_348, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_350, Icur := OriginalRow227TriangleData1574.coefficient128_349,
    output := OriginalRow227TriangleData1582.coefficient129_349, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1575.coefficient128_351, Icur := OriginalRow227TriangleData1574.coefficient128_350,
    output := OriginalRow227TriangleData1582.coefficient129_350, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1575.coefficient128_352, Icur := OriginalRow227TriangleData1575.coefficient128_351,
    output := OriginalRow227TriangleData1582.coefficient129_351, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1566

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1566.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
