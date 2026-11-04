import Grothe.UpperChaos.OriginalRow227TriangleData0156
import Grothe.UpperChaos.OriginalRow227TriangleData0157
import Grothe.UpperChaos.OriginalRow227TriangleData0172
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0156
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_394, Icur := OriginalRow227TriangleData0156.coefficient9_393,
    output := OriginalRow227TriangleData0172.coefficient10_393, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_395, Icur := OriginalRow227TriangleData0156.coefficient9_394,
    output := OriginalRow227TriangleData0172.coefficient10_394, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_396, Icur := OriginalRow227TriangleData0156.coefficient9_395,
    output := OriginalRow227TriangleData0172.coefficient10_395, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_397, Icur := OriginalRow227TriangleData0156.coefficient9_396,
    output := OriginalRow227TriangleData0172.coefficient10_396, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_398, Icur := OriginalRow227TriangleData0156.coefficient9_397,
    output := OriginalRow227TriangleData0172.coefficient10_397, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_399, Icur := OriginalRow227TriangleData0156.coefficient9_398,
    output := OriginalRow227TriangleData0172.coefficient10_398, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_400, Icur := OriginalRow227TriangleData0156.coefficient9_399,
    output := OriginalRow227TriangleData0172.coefficient10_399, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_401, Icur := OriginalRow227TriangleData0156.coefficient9_400,
    output := OriginalRow227TriangleData0172.coefficient10_400, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_402, Icur := OriginalRow227TriangleData0156.coefficient9_401,
    output := OriginalRow227TriangleData0172.coefficient10_401, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_403, Icur := OriginalRow227TriangleData0156.coefficient9_402,
    output := OriginalRow227TriangleData0172.coefficient10_402, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_404, Icur := OriginalRow227TriangleData0156.coefficient9_403,
    output := OriginalRow227TriangleData0172.coefficient10_403, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_405, Icur := OriginalRow227TriangleData0156.coefficient9_404,
    output := OriginalRow227TriangleData0172.coefficient10_404, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_406, Icur := OriginalRow227TriangleData0156.coefficient9_405,
    output := OriginalRow227TriangleData0172.coefficient10_405, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_407, Icur := OriginalRow227TriangleData0156.coefficient9_406,
    output := OriginalRow227TriangleData0172.coefficient10_406, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_408, Icur := OriginalRow227TriangleData0156.coefficient9_407,
    output := OriginalRow227TriangleData0172.coefficient10_407, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_409, Icur := OriginalRow227TriangleData0156.coefficient9_408,
    output := OriginalRow227TriangleData0172.coefficient10_408, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_410, Icur := OriginalRow227TriangleData0156.coefficient9_409,
    output := OriginalRow227TriangleData0172.coefficient10_409, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_411, Icur := OriginalRow227TriangleData0156.coefficient9_410,
    output := OriginalRow227TriangleData0172.coefficient10_410, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_412, Icur := OriginalRow227TriangleData0156.coefficient9_411,
    output := OriginalRow227TriangleData0172.coefficient10_411, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_413, Icur := OriginalRow227TriangleData0156.coefficient9_412,
    output := OriginalRow227TriangleData0172.coefficient10_412, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_414, Icur := OriginalRow227TriangleData0156.coefficient9_413,
    output := OriginalRow227TriangleData0172.coefficient10_413, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_415, Icur := OriginalRow227TriangleData0156.coefficient9_414,
    output := OriginalRow227TriangleData0172.coefficient10_414, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_416, Icur := OriginalRow227TriangleData0156.coefficient9_415,
    output := OriginalRow227TriangleData0172.coefficient10_415, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_417, Icur := OriginalRow227TriangleData0156.coefficient9_416,
    output := OriginalRow227TriangleData0172.coefficient10_416, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_418, Icur := OriginalRow227TriangleData0156.coefficient9_417,
    output := OriginalRow227TriangleData0172.coefficient10_417, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_419, Icur := OriginalRow227TriangleData0156.coefficient9_418,
    output := OriginalRow227TriangleData0172.coefficient10_418, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_420, Icur := OriginalRow227TriangleData0156.coefficient9_419,
    output := OriginalRow227TriangleData0172.coefficient10_419, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_421, Icur := OriginalRow227TriangleData0156.coefficient9_420,
    output := OriginalRow227TriangleData0172.coefficient10_420, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_422, Icur := OriginalRow227TriangleData0156.coefficient9_421,
    output := OriginalRow227TriangleData0172.coefficient10_421, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_423, Icur := OriginalRow227TriangleData0156.coefficient9_422,
    output := OriginalRow227TriangleData0172.coefficient10_422, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0157.coefficient9_424, Icur := OriginalRow227TriangleData0156.coefficient9_423,
    output := OriginalRow227TriangleData0172.coefficient10_423, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0157.coefficient9_425, Icur := OriginalRow227TriangleData0157.coefficient9_424,
    output := OriginalRow227TriangleData0172.coefficient10_424, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0156

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0156.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
