import Grothe.UpperChaos.OriginalRow227TriangleData0108
import Grothe.UpperChaos.OriginalRow227TriangleData0109
import Grothe.UpperChaos.OriginalRow227TriangleData0124
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0108
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_391, Icur := OriginalRow227TriangleData0108.coefficient6_390,
    output := OriginalRow227TriangleData0124.coefficient7_390, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_392, Icur := OriginalRow227TriangleData0108.coefficient6_391,
    output := OriginalRow227TriangleData0124.coefficient7_391, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_393, Icur := OriginalRow227TriangleData0108.coefficient6_392,
    output := OriginalRow227TriangleData0124.coefficient7_392, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_394, Icur := OriginalRow227TriangleData0108.coefficient6_393,
    output := OriginalRow227TriangleData0124.coefficient7_393, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_395, Icur := OriginalRow227TriangleData0108.coefficient6_394,
    output := OriginalRow227TriangleData0124.coefficient7_394, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_396, Icur := OriginalRow227TriangleData0108.coefficient6_395,
    output := OriginalRow227TriangleData0124.coefficient7_395, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_397, Icur := OriginalRow227TriangleData0108.coefficient6_396,
    output := OriginalRow227TriangleData0124.coefficient7_396, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_398, Icur := OriginalRow227TriangleData0108.coefficient6_397,
    output := OriginalRow227TriangleData0124.coefficient7_397, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_399, Icur := OriginalRow227TriangleData0108.coefficient6_398,
    output := OriginalRow227TriangleData0124.coefficient7_398, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_400, Icur := OriginalRow227TriangleData0108.coefficient6_399,
    output := OriginalRow227TriangleData0124.coefficient7_399, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_401, Icur := OriginalRow227TriangleData0108.coefficient6_400,
    output := OriginalRow227TriangleData0124.coefficient7_400, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_402, Icur := OriginalRow227TriangleData0108.coefficient6_401,
    output := OriginalRow227TriangleData0124.coefficient7_401, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_403, Icur := OriginalRow227TriangleData0108.coefficient6_402,
    output := OriginalRow227TriangleData0124.coefficient7_402, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_404, Icur := OriginalRow227TriangleData0108.coefficient6_403,
    output := OriginalRow227TriangleData0124.coefficient7_403, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_405, Icur := OriginalRow227TriangleData0108.coefficient6_404,
    output := OriginalRow227TriangleData0124.coefficient7_404, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_406, Icur := OriginalRow227TriangleData0108.coefficient6_405,
    output := OriginalRow227TriangleData0124.coefficient7_405, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_407, Icur := OriginalRow227TriangleData0108.coefficient6_406,
    output := OriginalRow227TriangleData0124.coefficient7_406, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_408, Icur := OriginalRow227TriangleData0108.coefficient6_407,
    output := OriginalRow227TriangleData0124.coefficient7_407, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_409, Icur := OriginalRow227TriangleData0108.coefficient6_408,
    output := OriginalRow227TriangleData0124.coefficient7_408, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_410, Icur := OriginalRow227TriangleData0108.coefficient6_409,
    output := OriginalRow227TriangleData0124.coefficient7_409, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_411, Icur := OriginalRow227TriangleData0108.coefficient6_410,
    output := OriginalRow227TriangleData0124.coefficient7_410, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_412, Icur := OriginalRow227TriangleData0108.coefficient6_411,
    output := OriginalRow227TriangleData0124.coefficient7_411, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_413, Icur := OriginalRow227TriangleData0108.coefficient6_412,
    output := OriginalRow227TriangleData0124.coefficient7_412, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_414, Icur := OriginalRow227TriangleData0108.coefficient6_413,
    output := OriginalRow227TriangleData0124.coefficient7_413, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_415, Icur := OriginalRow227TriangleData0108.coefficient6_414,
    output := OriginalRow227TriangleData0124.coefficient7_414, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_416, Icur := OriginalRow227TriangleData0108.coefficient6_415,
    output := OriginalRow227TriangleData0124.coefficient7_415, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_417, Icur := OriginalRow227TriangleData0108.coefficient6_416,
    output := OriginalRow227TriangleData0124.coefficient7_416, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_418, Icur := OriginalRow227TriangleData0108.coefficient6_417,
    output := OriginalRow227TriangleData0124.coefficient7_417, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_419, Icur := OriginalRow227TriangleData0108.coefficient6_418,
    output := OriginalRow227TriangleData0124.coefficient7_418, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0108.coefficient6_420, Icur := OriginalRow227TriangleData0108.coefficient6_419,
    output := OriginalRow227TriangleData0124.coefficient7_419, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0109.coefficient6_421, Icur := OriginalRow227TriangleData0108.coefficient6_420,
    output := OriginalRow227TriangleData0124.coefficient7_420, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0109.coefficient6_422, Icur := OriginalRow227TriangleData0109.coefficient6_421,
    output := OriginalRow227TriangleData0124.coefficient7_421, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0108

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0108.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
