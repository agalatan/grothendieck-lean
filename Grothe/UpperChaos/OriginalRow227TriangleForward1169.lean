import Grothe.UpperChaos.OriginalRow227TriangleData1174
import Grothe.UpperChaos.OriginalRow227TriangleData1175
import Grothe.UpperChaos.OriginalRow227TriangleData1185
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1169
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_343, Icur := OriginalRow227TriangleData1174.coefficient86_342,
    output := OriginalRow227TriangleData1185.coefficient87_342, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_344, Icur := OriginalRow227TriangleData1174.coefficient86_343,
    output := OriginalRow227TriangleData1185.coefficient87_343, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_345, Icur := OriginalRow227TriangleData1174.coefficient86_344,
    output := OriginalRow227TriangleData1185.coefficient87_344, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_346, Icur := OriginalRow227TriangleData1174.coefficient86_345,
    output := OriginalRow227TriangleData1185.coefficient87_345, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_347, Icur := OriginalRow227TriangleData1174.coefficient86_346,
    output := OriginalRow227TriangleData1185.coefficient87_346, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_348, Icur := OriginalRow227TriangleData1174.coefficient86_347,
    output := OriginalRow227TriangleData1185.coefficient87_347, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_349, Icur := OriginalRow227TriangleData1174.coefficient86_348,
    output := OriginalRow227TriangleData1185.coefficient87_348, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_350, Icur := OriginalRow227TriangleData1174.coefficient86_349,
    output := OriginalRow227TriangleData1185.coefficient87_349, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_351, Icur := OriginalRow227TriangleData1174.coefficient86_350,
    output := OriginalRow227TriangleData1185.coefficient87_350, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_352, Icur := OriginalRow227TriangleData1174.coefficient86_351,
    output := OriginalRow227TriangleData1185.coefficient87_351, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_353, Icur := OriginalRow227TriangleData1174.coefficient86_352,
    output := OriginalRow227TriangleData1185.coefficient87_352, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_354, Icur := OriginalRow227TriangleData1174.coefficient86_353,
    output := OriginalRow227TriangleData1185.coefficient87_353, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_355, Icur := OriginalRow227TriangleData1174.coefficient86_354,
    output := OriginalRow227TriangleData1185.coefficient87_354, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_356, Icur := OriginalRow227TriangleData1174.coefficient86_355,
    output := OriginalRow227TriangleData1185.coefficient87_355, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_357, Icur := OriginalRow227TriangleData1174.coefficient86_356,
    output := OriginalRow227TriangleData1185.coefficient87_356, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_358, Icur := OriginalRow227TriangleData1174.coefficient86_357,
    output := OriginalRow227TriangleData1185.coefficient87_357, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_359, Icur := OriginalRow227TriangleData1174.coefficient86_358,
    output := OriginalRow227TriangleData1185.coefficient87_358, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_360, Icur := OriginalRow227TriangleData1174.coefficient86_359,
    output := OriginalRow227TriangleData1185.coefficient87_359, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_361, Icur := OriginalRow227TriangleData1174.coefficient86_360,
    output := OriginalRow227TriangleData1185.coefficient87_360, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_362, Icur := OriginalRow227TriangleData1174.coefficient86_361,
    output := OriginalRow227TriangleData1185.coefficient87_361, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_363, Icur := OriginalRow227TriangleData1174.coefficient86_362,
    output := OriginalRow227TriangleData1185.coefficient87_362, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_364, Icur := OriginalRow227TriangleData1174.coefficient86_363,
    output := OriginalRow227TriangleData1185.coefficient87_363, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_365, Icur := OriginalRow227TriangleData1174.coefficient86_364,
    output := OriginalRow227TriangleData1185.coefficient87_364, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_366, Icur := OriginalRow227TriangleData1174.coefficient86_365,
    output := OriginalRow227TriangleData1185.coefficient87_365, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_367, Icur := OriginalRow227TriangleData1174.coefficient86_366,
    output := OriginalRow227TriangleData1185.coefficient87_366, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_368, Icur := OriginalRow227TriangleData1174.coefficient86_367,
    output := OriginalRow227TriangleData1185.coefficient87_367, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_369, Icur := OriginalRow227TriangleData1174.coefficient86_368,
    output := OriginalRow227TriangleData1185.coefficient87_368, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_370, Icur := OriginalRow227TriangleData1174.coefficient86_369,
    output := OriginalRow227TriangleData1185.coefficient87_369, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_371, Icur := OriginalRow227TriangleData1174.coefficient86_370,
    output := OriginalRow227TriangleData1185.coefficient87_370, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_372, Icur := OriginalRow227TriangleData1174.coefficient86_371,
    output := OriginalRow227TriangleData1185.coefficient87_371, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1175.coefficient86_373, Icur := OriginalRow227TriangleData1174.coefficient86_372,
    output := OriginalRow227TriangleData1185.coefficient87_372, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1175.coefficient86_374, Icur := OriginalRow227TriangleData1175.coefficient86_373,
    output := OriginalRow227TriangleData1185.coefficient87_373, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1169

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1169.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
