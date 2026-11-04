import Grothe.UpperChaos.OriginalRow227TriangleData1582
import Grothe.UpperChaos.OriginalRow227TriangleData1583
import Grothe.UpperChaos.OriginalRow227TriangleData1590
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1574
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_322, Icur := OriginalRow227TriangleData1582.coefficient129_321,
    output := OriginalRow227TriangleData1590.coefficient130_321, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_323, Icur := OriginalRow227TriangleData1582.coefficient129_322,
    output := OriginalRow227TriangleData1590.coefficient130_322, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_324, Icur := OriginalRow227TriangleData1582.coefficient129_323,
    output := OriginalRow227TriangleData1590.coefficient130_323, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_325, Icur := OriginalRow227TriangleData1582.coefficient129_324,
    output := OriginalRow227TriangleData1590.coefficient130_324, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_326, Icur := OriginalRow227TriangleData1582.coefficient129_325,
    output := OriginalRow227TriangleData1590.coefficient130_325, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_327, Icur := OriginalRow227TriangleData1582.coefficient129_326,
    output := OriginalRow227TriangleData1590.coefficient130_326, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_328, Icur := OriginalRow227TriangleData1582.coefficient129_327,
    output := OriginalRow227TriangleData1590.coefficient130_327, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_329, Icur := OriginalRow227TriangleData1582.coefficient129_328,
    output := OriginalRow227TriangleData1590.coefficient130_328, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_330, Icur := OriginalRow227TriangleData1582.coefficient129_329,
    output := OriginalRow227TriangleData1590.coefficient130_329, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_331, Icur := OriginalRow227TriangleData1582.coefficient129_330,
    output := OriginalRow227TriangleData1590.coefficient130_330, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_332, Icur := OriginalRow227TriangleData1582.coefficient129_331,
    output := OriginalRow227TriangleData1590.coefficient130_331, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_333, Icur := OriginalRow227TriangleData1582.coefficient129_332,
    output := OriginalRow227TriangleData1590.coefficient130_332, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_334, Icur := OriginalRow227TriangleData1582.coefficient129_333,
    output := OriginalRow227TriangleData1590.coefficient130_333, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_335, Icur := OriginalRow227TriangleData1582.coefficient129_334,
    output := OriginalRow227TriangleData1590.coefficient130_334, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_336, Icur := OriginalRow227TriangleData1582.coefficient129_335,
    output := OriginalRow227TriangleData1590.coefficient130_335, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_337, Icur := OriginalRow227TriangleData1582.coefficient129_336,
    output := OriginalRow227TriangleData1590.coefficient130_336, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_338, Icur := OriginalRow227TriangleData1582.coefficient129_337,
    output := OriginalRow227TriangleData1590.coefficient130_337, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_339, Icur := OriginalRow227TriangleData1582.coefficient129_338,
    output := OriginalRow227TriangleData1590.coefficient130_338, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_340, Icur := OriginalRow227TriangleData1582.coefficient129_339,
    output := OriginalRow227TriangleData1590.coefficient130_339, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_341, Icur := OriginalRow227TriangleData1582.coefficient129_340,
    output := OriginalRow227TriangleData1590.coefficient130_340, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_342, Icur := OriginalRow227TriangleData1582.coefficient129_341,
    output := OriginalRow227TriangleData1590.coefficient130_341, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_343, Icur := OriginalRow227TriangleData1582.coefficient129_342,
    output := OriginalRow227TriangleData1590.coefficient130_342, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_344, Icur := OriginalRow227TriangleData1582.coefficient129_343,
    output := OriginalRow227TriangleData1590.coefficient130_343, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_345, Icur := OriginalRow227TriangleData1582.coefficient129_344,
    output := OriginalRow227TriangleData1590.coefficient130_344, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_346, Icur := OriginalRow227TriangleData1582.coefficient129_345,
    output := OriginalRow227TriangleData1590.coefficient130_345, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_347, Icur := OriginalRow227TriangleData1582.coefficient129_346,
    output := OriginalRow227TriangleData1590.coefficient130_346, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_348, Icur := OriginalRow227TriangleData1582.coefficient129_347,
    output := OriginalRow227TriangleData1590.coefficient130_347, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_349, Icur := OriginalRow227TriangleData1582.coefficient129_348,
    output := OriginalRow227TriangleData1590.coefficient130_348, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_350, Icur := OriginalRow227TriangleData1582.coefficient129_349,
    output := OriginalRow227TriangleData1590.coefficient130_349, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1582.coefficient129_351, Icur := OriginalRow227TriangleData1582.coefficient129_350,
    output := OriginalRow227TriangleData1590.coefficient130_350, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_352, Icur := OriginalRow227TriangleData1582.coefficient129_351,
    output := OriginalRow227TriangleData1590.coefficient130_351, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root130,
    Inext := OriginalRow227TriangleData1583.coefficient129_353, Icur := OriginalRow227TriangleData1583.coefficient129_352,
    output := OriginalRow227TriangleData1590.coefficient130_352, hC := OriginalRow227TriangleRoots04.root130_pos, hAC := OriginalRow227TriangleRoots04.product130_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1574

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1574.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
