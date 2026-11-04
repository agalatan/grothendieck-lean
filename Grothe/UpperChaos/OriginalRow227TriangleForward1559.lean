import Grothe.UpperChaos.OriginalRow227TriangleData1567
import Grothe.UpperChaos.OriginalRow227TriangleData1575
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1559
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_352, Icur := OriginalRow227TriangleData1567.coefficient127_351,
    output := OriginalRow227TriangleData1575.coefficient128_351, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_353, Icur := OriginalRow227TriangleData1567.coefficient127_352,
    output := OriginalRow227TriangleData1575.coefficient128_352, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_354, Icur := OriginalRow227TriangleData1567.coefficient127_353,
    output := OriginalRow227TriangleData1575.coefficient128_353, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_355, Icur := OriginalRow227TriangleData1567.coefficient127_354,
    output := OriginalRow227TriangleData1575.coefficient128_354, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_356, Icur := OriginalRow227TriangleData1567.coefficient127_355,
    output := OriginalRow227TriangleData1575.coefficient128_355, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_357, Icur := OriginalRow227TriangleData1567.coefficient127_356,
    output := OriginalRow227TriangleData1575.coefficient128_356, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_358, Icur := OriginalRow227TriangleData1567.coefficient127_357,
    output := OriginalRow227TriangleData1575.coefficient128_357, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_359, Icur := OriginalRow227TriangleData1567.coefficient127_358,
    output := OriginalRow227TriangleData1575.coefficient128_358, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_360, Icur := OriginalRow227TriangleData1567.coefficient127_359,
    output := OriginalRow227TriangleData1575.coefficient128_359, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_361, Icur := OriginalRow227TriangleData1567.coefficient127_360,
    output := OriginalRow227TriangleData1575.coefficient128_360, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_362, Icur := OriginalRow227TriangleData1567.coefficient127_361,
    output := OriginalRow227TriangleData1575.coefficient128_361, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_363, Icur := OriginalRow227TriangleData1567.coefficient127_362,
    output := OriginalRow227TriangleData1575.coefficient128_362, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_364, Icur := OriginalRow227TriangleData1567.coefficient127_363,
    output := OriginalRow227TriangleData1575.coefficient128_363, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_365, Icur := OriginalRow227TriangleData1567.coefficient127_364,
    output := OriginalRow227TriangleData1575.coefficient128_364, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_366, Icur := OriginalRow227TriangleData1567.coefficient127_365,
    output := OriginalRow227TriangleData1575.coefficient128_365, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_367, Icur := OriginalRow227TriangleData1567.coefficient127_366,
    output := OriginalRow227TriangleData1575.coefficient128_366, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_368, Icur := OriginalRow227TriangleData1567.coefficient127_367,
    output := OriginalRow227TriangleData1575.coefficient128_367, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_369, Icur := OriginalRow227TriangleData1567.coefficient127_368,
    output := OriginalRow227TriangleData1575.coefficient128_368, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_370, Icur := OriginalRow227TriangleData1567.coefficient127_369,
    output := OriginalRow227TriangleData1575.coefficient128_369, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_371, Icur := OriginalRow227TriangleData1567.coefficient127_370,
    output := OriginalRow227TriangleData1575.coefficient128_370, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_372, Icur := OriginalRow227TriangleData1567.coefficient127_371,
    output := OriginalRow227TriangleData1575.coefficient128_371, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_373, Icur := OriginalRow227TriangleData1567.coefficient127_372,
    output := OriginalRow227TriangleData1575.coefficient128_372, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root128,
    Inext := OriginalRow227TriangleData1567.coefficient127_374, Icur := OriginalRow227TriangleData1567.coefficient127_373,
    output := OriginalRow227TriangleData1575.coefficient128_373, hC := OriginalRow227TriangleRoots03.root128_pos, hAC := OriginalRow227TriangleRoots03.product128_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1559

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1559.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
