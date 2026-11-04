import Grothe.UpperChaos.OriginalRow227TriangleData1163
import Grothe.UpperChaos.OriginalRow227TriangleData1164
import Grothe.UpperChaos.OriginalRow227TriangleData1174
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1158
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_342, Icur := OriginalRow227TriangleData1163.coefficient85_341,
    output := OriginalRow227TriangleData1174.coefficient86_341, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_343, Icur := OriginalRow227TriangleData1163.coefficient85_342,
    output := OriginalRow227TriangleData1174.coefficient86_342, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_344, Icur := OriginalRow227TriangleData1163.coefficient85_343,
    output := OriginalRow227TriangleData1174.coefficient86_343, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_345, Icur := OriginalRow227TriangleData1163.coefficient85_344,
    output := OriginalRow227TriangleData1174.coefficient86_344, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_346, Icur := OriginalRow227TriangleData1163.coefficient85_345,
    output := OriginalRow227TriangleData1174.coefficient86_345, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_347, Icur := OriginalRow227TriangleData1163.coefficient85_346,
    output := OriginalRow227TriangleData1174.coefficient86_346, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_348, Icur := OriginalRow227TriangleData1163.coefficient85_347,
    output := OriginalRow227TriangleData1174.coefficient86_347, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_349, Icur := OriginalRow227TriangleData1163.coefficient85_348,
    output := OriginalRow227TriangleData1174.coefficient86_348, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_350, Icur := OriginalRow227TriangleData1163.coefficient85_349,
    output := OriginalRow227TriangleData1174.coefficient86_349, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_351, Icur := OriginalRow227TriangleData1163.coefficient85_350,
    output := OriginalRow227TriangleData1174.coefficient86_350, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_352, Icur := OriginalRow227TriangleData1163.coefficient85_351,
    output := OriginalRow227TriangleData1174.coefficient86_351, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_353, Icur := OriginalRow227TriangleData1163.coefficient85_352,
    output := OriginalRow227TriangleData1174.coefficient86_352, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_354, Icur := OriginalRow227TriangleData1163.coefficient85_353,
    output := OriginalRow227TriangleData1174.coefficient86_353, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_355, Icur := OriginalRow227TriangleData1163.coefficient85_354,
    output := OriginalRow227TriangleData1174.coefficient86_354, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_356, Icur := OriginalRow227TriangleData1163.coefficient85_355,
    output := OriginalRow227TriangleData1174.coefficient86_355, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_357, Icur := OriginalRow227TriangleData1163.coefficient85_356,
    output := OriginalRow227TriangleData1174.coefficient86_356, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_358, Icur := OriginalRow227TriangleData1163.coefficient85_357,
    output := OriginalRow227TriangleData1174.coefficient86_357, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_359, Icur := OriginalRow227TriangleData1163.coefficient85_358,
    output := OriginalRow227TriangleData1174.coefficient86_358, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_360, Icur := OriginalRow227TriangleData1163.coefficient85_359,
    output := OriginalRow227TriangleData1174.coefficient86_359, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_361, Icur := OriginalRow227TriangleData1163.coefficient85_360,
    output := OriginalRow227TriangleData1174.coefficient86_360, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_362, Icur := OriginalRow227TriangleData1163.coefficient85_361,
    output := OriginalRow227TriangleData1174.coefficient86_361, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_363, Icur := OriginalRow227TriangleData1163.coefficient85_362,
    output := OriginalRow227TriangleData1174.coefficient86_362, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_364, Icur := OriginalRow227TriangleData1163.coefficient85_363,
    output := OriginalRow227TriangleData1174.coefficient86_363, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_365, Icur := OriginalRow227TriangleData1163.coefficient85_364,
    output := OriginalRow227TriangleData1174.coefficient86_364, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_366, Icur := OriginalRow227TriangleData1163.coefficient85_365,
    output := OriginalRow227TriangleData1174.coefficient86_365, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_367, Icur := OriginalRow227TriangleData1163.coefficient85_366,
    output := OriginalRow227TriangleData1174.coefficient86_366, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_368, Icur := OriginalRow227TriangleData1163.coefficient85_367,
    output := OriginalRow227TriangleData1174.coefficient86_367, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_369, Icur := OriginalRow227TriangleData1163.coefficient85_368,
    output := OriginalRow227TriangleData1174.coefficient86_368, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_370, Icur := OriginalRow227TriangleData1163.coefficient85_369,
    output := OriginalRow227TriangleData1174.coefficient86_369, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1163.coefficient85_371, Icur := OriginalRow227TriangleData1163.coefficient85_370,
    output := OriginalRow227TriangleData1174.coefficient86_370, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_372, Icur := OriginalRow227TriangleData1163.coefficient85_371,
    output := OriginalRow227TriangleData1174.coefficient86_371, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_373, Icur := OriginalRow227TriangleData1164.coefficient85_372,
    output := OriginalRow227TriangleData1174.coefficient86_372, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1158

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1158.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
