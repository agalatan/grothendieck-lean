import Grothe.UpperChaos.OriginalRow227TriangleData1099
import Grothe.UpperChaos.OriginalRow227TriangleData1110
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1094
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_400, Icur := OriginalRow227TriangleData1099.coefficient79_399,
    output := OriginalRow227TriangleData1110.coefficient80_399, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_401, Icur := OriginalRow227TriangleData1099.coefficient79_400,
    output := OriginalRow227TriangleData1110.coefficient80_400, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_402, Icur := OriginalRow227TriangleData1099.coefficient79_401,
    output := OriginalRow227TriangleData1110.coefficient80_401, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_403, Icur := OriginalRow227TriangleData1099.coefficient79_402,
    output := OriginalRow227TriangleData1110.coefficient80_402, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_404, Icur := OriginalRow227TriangleData1099.coefficient79_403,
    output := OriginalRow227TriangleData1110.coefficient80_403, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_405, Icur := OriginalRow227TriangleData1099.coefficient79_404,
    output := OriginalRow227TriangleData1110.coefficient80_404, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_406, Icur := OriginalRow227TriangleData1099.coefficient79_405,
    output := OriginalRow227TriangleData1110.coefficient80_405, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_407, Icur := OriginalRow227TriangleData1099.coefficient79_406,
    output := OriginalRow227TriangleData1110.coefficient80_406, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_408, Icur := OriginalRow227TriangleData1099.coefficient79_407,
    output := OriginalRow227TriangleData1110.coefficient80_407, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_409, Icur := OriginalRow227TriangleData1099.coefficient79_408,
    output := OriginalRow227TriangleData1110.coefficient80_408, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_410, Icur := OriginalRow227TriangleData1099.coefficient79_409,
    output := OriginalRow227TriangleData1110.coefficient80_409, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_411, Icur := OriginalRow227TriangleData1099.coefficient79_410,
    output := OriginalRow227TriangleData1110.coefficient80_410, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_412, Icur := OriginalRow227TriangleData1099.coefficient79_411,
    output := OriginalRow227TriangleData1110.coefficient80_411, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_413, Icur := OriginalRow227TriangleData1099.coefficient79_412,
    output := OriginalRow227TriangleData1110.coefficient80_412, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_414, Icur := OriginalRow227TriangleData1099.coefficient79_413,
    output := OriginalRow227TriangleData1110.coefficient80_413, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_415, Icur := OriginalRow227TriangleData1099.coefficient79_414,
    output := OriginalRow227TriangleData1110.coefficient80_414, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_416, Icur := OriginalRow227TriangleData1099.coefficient79_415,
    output := OriginalRow227TriangleData1110.coefficient80_415, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_417, Icur := OriginalRow227TriangleData1099.coefficient79_416,
    output := OriginalRow227TriangleData1110.coefficient80_416, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_418, Icur := OriginalRow227TriangleData1099.coefficient79_417,
    output := OriginalRow227TriangleData1110.coefficient80_417, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_419, Icur := OriginalRow227TriangleData1099.coefficient79_418,
    output := OriginalRow227TriangleData1110.coefficient80_418, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_420, Icur := OriginalRow227TriangleData1099.coefficient79_419,
    output := OriginalRow227TriangleData1110.coefficient80_419, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_421, Icur := OriginalRow227TriangleData1099.coefficient79_420,
    output := OriginalRow227TriangleData1110.coefficient80_420, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_422, Icur := OriginalRow227TriangleData1099.coefficient79_421,
    output := OriginalRow227TriangleData1110.coefficient80_421, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1094

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1094.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
