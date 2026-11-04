import Grothe.UpperChaos.OriginalRow227TriangleData1259
import Grothe.UpperChaos.OriginalRow227TriangleData1260
import Grothe.UpperChaos.OriginalRow227TriangleData1269
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1253
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_319, Icur := OriginalRow227TriangleData1259.coefficient94_318,
    output := OriginalRow227TriangleData1269.coefficient95_318, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_320, Icur := OriginalRow227TriangleData1259.coefficient94_319,
    output := OriginalRow227TriangleData1269.coefficient95_319, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_321, Icur := OriginalRow227TriangleData1259.coefficient94_320,
    output := OriginalRow227TriangleData1269.coefficient95_320, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_322, Icur := OriginalRow227TriangleData1259.coefficient94_321,
    output := OriginalRow227TriangleData1269.coefficient95_321, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_323, Icur := OriginalRow227TriangleData1259.coefficient94_322,
    output := OriginalRow227TriangleData1269.coefficient95_322, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_324, Icur := OriginalRow227TriangleData1259.coefficient94_323,
    output := OriginalRow227TriangleData1269.coefficient95_323, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_325, Icur := OriginalRow227TriangleData1259.coefficient94_324,
    output := OriginalRow227TriangleData1269.coefficient95_324, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_326, Icur := OriginalRow227TriangleData1259.coefficient94_325,
    output := OriginalRow227TriangleData1269.coefficient95_325, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_327, Icur := OriginalRow227TriangleData1259.coefficient94_326,
    output := OriginalRow227TriangleData1269.coefficient95_326, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_328, Icur := OriginalRow227TriangleData1259.coefficient94_327,
    output := OriginalRow227TriangleData1269.coefficient95_327, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_329, Icur := OriginalRow227TriangleData1259.coefficient94_328,
    output := OriginalRow227TriangleData1269.coefficient95_328, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_330, Icur := OriginalRow227TriangleData1259.coefficient94_329,
    output := OriginalRow227TriangleData1269.coefficient95_329, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_331, Icur := OriginalRow227TriangleData1259.coefficient94_330,
    output := OriginalRow227TriangleData1269.coefficient95_330, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_332, Icur := OriginalRow227TriangleData1259.coefficient94_331,
    output := OriginalRow227TriangleData1269.coefficient95_331, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_333, Icur := OriginalRow227TriangleData1259.coefficient94_332,
    output := OriginalRow227TriangleData1269.coefficient95_332, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_334, Icur := OriginalRow227TriangleData1259.coefficient94_333,
    output := OriginalRow227TriangleData1269.coefficient95_333, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_335, Icur := OriginalRow227TriangleData1259.coefficient94_334,
    output := OriginalRow227TriangleData1269.coefficient95_334, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_336, Icur := OriginalRow227TriangleData1259.coefficient94_335,
    output := OriginalRow227TriangleData1269.coefficient95_335, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_337, Icur := OriginalRow227TriangleData1259.coefficient94_336,
    output := OriginalRow227TriangleData1269.coefficient95_336, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_338, Icur := OriginalRow227TriangleData1259.coefficient94_337,
    output := OriginalRow227TriangleData1269.coefficient95_337, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_339, Icur := OriginalRow227TriangleData1259.coefficient94_338,
    output := OriginalRow227TriangleData1269.coefficient95_338, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_340, Icur := OriginalRow227TriangleData1259.coefficient94_339,
    output := OriginalRow227TriangleData1269.coefficient95_339, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_341, Icur := OriginalRow227TriangleData1259.coefficient94_340,
    output := OriginalRow227TriangleData1269.coefficient95_340, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_342, Icur := OriginalRow227TriangleData1259.coefficient94_341,
    output := OriginalRow227TriangleData1269.coefficient95_341, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_343, Icur := OriginalRow227TriangleData1259.coefficient94_342,
    output := OriginalRow227TriangleData1269.coefficient95_342, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_344, Icur := OriginalRow227TriangleData1259.coefficient94_343,
    output := OriginalRow227TriangleData1269.coefficient95_343, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_345, Icur := OriginalRow227TriangleData1259.coefficient94_344,
    output := OriginalRow227TriangleData1269.coefficient95_344, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_346, Icur := OriginalRow227TriangleData1259.coefficient94_345,
    output := OriginalRow227TriangleData1269.coefficient95_345, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_347, Icur := OriginalRow227TriangleData1259.coefficient94_346,
    output := OriginalRow227TriangleData1269.coefficient95_346, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1259.coefficient94_348, Icur := OriginalRow227TriangleData1259.coefficient94_347,
    output := OriginalRow227TriangleData1269.coefficient95_347, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_349, Icur := OriginalRow227TriangleData1259.coefficient94_348,
    output := OriginalRow227TriangleData1269.coefficient95_348, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root95,
    Inext := OriginalRow227TriangleData1260.coefficient94_350, Icur := OriginalRow227TriangleData1260.coefficient94_349,
    output := OriginalRow227TriangleData1269.coefficient95_349, hC := OriginalRow227TriangleRoots02.root95_pos, hAC := OriginalRow227TriangleRoots02.product95_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1253

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1253.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
