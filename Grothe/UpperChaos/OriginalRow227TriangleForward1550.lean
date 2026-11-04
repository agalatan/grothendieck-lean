import Grothe.UpperChaos.OriginalRow227TriangleData1558
import Grothe.UpperChaos.OriginalRow227TriangleData1559
import Grothe.UpperChaos.OriginalRow227TriangleData1566
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1550
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_319, Icur := OriginalRow227TriangleData1558.coefficient126_318,
    output := OriginalRow227TriangleData1566.coefficient127_318, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_320, Icur := OriginalRow227TriangleData1558.coefficient126_319,
    output := OriginalRow227TriangleData1566.coefficient127_319, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_321, Icur := OriginalRow227TriangleData1558.coefficient126_320,
    output := OriginalRow227TriangleData1566.coefficient127_320, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_322, Icur := OriginalRow227TriangleData1558.coefficient126_321,
    output := OriginalRow227TriangleData1566.coefficient127_321, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_323, Icur := OriginalRow227TriangleData1558.coefficient126_322,
    output := OriginalRow227TriangleData1566.coefficient127_322, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_324, Icur := OriginalRow227TriangleData1558.coefficient126_323,
    output := OriginalRow227TriangleData1566.coefficient127_323, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_325, Icur := OriginalRow227TriangleData1558.coefficient126_324,
    output := OriginalRow227TriangleData1566.coefficient127_324, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_326, Icur := OriginalRow227TriangleData1558.coefficient126_325,
    output := OriginalRow227TriangleData1566.coefficient127_325, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_327, Icur := OriginalRow227TriangleData1558.coefficient126_326,
    output := OriginalRow227TriangleData1566.coefficient127_326, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_328, Icur := OriginalRow227TriangleData1558.coefficient126_327,
    output := OriginalRow227TriangleData1566.coefficient127_327, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_329, Icur := OriginalRow227TriangleData1558.coefficient126_328,
    output := OriginalRow227TriangleData1566.coefficient127_328, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_330, Icur := OriginalRow227TriangleData1558.coefficient126_329,
    output := OriginalRow227TriangleData1566.coefficient127_329, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_331, Icur := OriginalRow227TriangleData1558.coefficient126_330,
    output := OriginalRow227TriangleData1566.coefficient127_330, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_332, Icur := OriginalRow227TriangleData1558.coefficient126_331,
    output := OriginalRow227TriangleData1566.coefficient127_331, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_333, Icur := OriginalRow227TriangleData1558.coefficient126_332,
    output := OriginalRow227TriangleData1566.coefficient127_332, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_334, Icur := OriginalRow227TriangleData1558.coefficient126_333,
    output := OriginalRow227TriangleData1566.coefficient127_333, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_335, Icur := OriginalRow227TriangleData1558.coefficient126_334,
    output := OriginalRow227TriangleData1566.coefficient127_334, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_336, Icur := OriginalRow227TriangleData1558.coefficient126_335,
    output := OriginalRow227TriangleData1566.coefficient127_335, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_337, Icur := OriginalRow227TriangleData1558.coefficient126_336,
    output := OriginalRow227TriangleData1566.coefficient127_336, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_338, Icur := OriginalRow227TriangleData1558.coefficient126_337,
    output := OriginalRow227TriangleData1566.coefficient127_337, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_339, Icur := OriginalRow227TriangleData1558.coefficient126_338,
    output := OriginalRow227TriangleData1566.coefficient127_338, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_340, Icur := OriginalRow227TriangleData1558.coefficient126_339,
    output := OriginalRow227TriangleData1566.coefficient127_339, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_341, Icur := OriginalRow227TriangleData1558.coefficient126_340,
    output := OriginalRow227TriangleData1566.coefficient127_340, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_342, Icur := OriginalRow227TriangleData1558.coefficient126_341,
    output := OriginalRow227TriangleData1566.coefficient127_341, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_343, Icur := OriginalRow227TriangleData1558.coefficient126_342,
    output := OriginalRow227TriangleData1566.coefficient127_342, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_344, Icur := OriginalRow227TriangleData1558.coefficient126_343,
    output := OriginalRow227TriangleData1566.coefficient127_343, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_345, Icur := OriginalRow227TriangleData1558.coefficient126_344,
    output := OriginalRow227TriangleData1566.coefficient127_344, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_346, Icur := OriginalRow227TriangleData1558.coefficient126_345,
    output := OriginalRow227TriangleData1566.coefficient127_345, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_347, Icur := OriginalRow227TriangleData1558.coefficient126_346,
    output := OriginalRow227TriangleData1566.coefficient127_346, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_348, Icur := OriginalRow227TriangleData1558.coefficient126_347,
    output := OriginalRow227TriangleData1566.coefficient127_347, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1559.coefficient126_349, Icur := OriginalRow227TriangleData1558.coefficient126_348,
    output := OriginalRow227TriangleData1566.coefficient127_348, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1559.coefficient126_350, Icur := OriginalRow227TriangleData1559.coefficient126_349,
    output := OriginalRow227TriangleData1566.coefficient127_349, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1550

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1550.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
