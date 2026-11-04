import Grothe.UpperChaos.OriginalRow227TriangleData0653
import Grothe.UpperChaos.OriginalRow227TriangleData0654
import Grothe.UpperChaos.OriginalRow227TriangleData0667
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0651
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_396, Icur := OriginalRow227TriangleData0653.coefficient43_395,
    output := OriginalRow227TriangleData0667.coefficient44_395, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_397, Icur := OriginalRow227TriangleData0653.coefficient43_396,
    output := OriginalRow227TriangleData0667.coefficient44_396, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_398, Icur := OriginalRow227TriangleData0653.coefficient43_397,
    output := OriginalRow227TriangleData0667.coefficient44_397, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_399, Icur := OriginalRow227TriangleData0653.coefficient43_398,
    output := OriginalRow227TriangleData0667.coefficient44_398, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_400, Icur := OriginalRow227TriangleData0653.coefficient43_399,
    output := OriginalRow227TriangleData0667.coefficient44_399, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_401, Icur := OriginalRow227TriangleData0653.coefficient43_400,
    output := OriginalRow227TriangleData0667.coefficient44_400, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_402, Icur := OriginalRow227TriangleData0653.coefficient43_401,
    output := OriginalRow227TriangleData0667.coefficient44_401, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_403, Icur := OriginalRow227TriangleData0653.coefficient43_402,
    output := OriginalRow227TriangleData0667.coefficient44_402, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_404, Icur := OriginalRow227TriangleData0653.coefficient43_403,
    output := OriginalRow227TriangleData0667.coefficient44_403, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_405, Icur := OriginalRow227TriangleData0653.coefficient43_404,
    output := OriginalRow227TriangleData0667.coefficient44_404, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_406, Icur := OriginalRow227TriangleData0653.coefficient43_405,
    output := OriginalRow227TriangleData0667.coefficient44_405, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_407, Icur := OriginalRow227TriangleData0653.coefficient43_406,
    output := OriginalRow227TriangleData0667.coefficient44_406, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_408, Icur := OriginalRow227TriangleData0653.coefficient43_407,
    output := OriginalRow227TriangleData0667.coefficient44_407, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_409, Icur := OriginalRow227TriangleData0653.coefficient43_408,
    output := OriginalRow227TriangleData0667.coefficient44_408, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_410, Icur := OriginalRow227TriangleData0653.coefficient43_409,
    output := OriginalRow227TriangleData0667.coefficient44_409, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_411, Icur := OriginalRow227TriangleData0653.coefficient43_410,
    output := OriginalRow227TriangleData0667.coefficient44_410, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_412, Icur := OriginalRow227TriangleData0653.coefficient43_411,
    output := OriginalRow227TriangleData0667.coefficient44_411, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_413, Icur := OriginalRow227TriangleData0653.coefficient43_412,
    output := OriginalRow227TriangleData0667.coefficient44_412, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_414, Icur := OriginalRow227TriangleData0653.coefficient43_413,
    output := OriginalRow227TriangleData0667.coefficient44_413, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_415, Icur := OriginalRow227TriangleData0653.coefficient43_414,
    output := OriginalRow227TriangleData0667.coefficient44_414, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_416, Icur := OriginalRow227TriangleData0653.coefficient43_415,
    output := OriginalRow227TriangleData0667.coefficient44_415, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_417, Icur := OriginalRow227TriangleData0653.coefficient43_416,
    output := OriginalRow227TriangleData0667.coefficient44_416, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_418, Icur := OriginalRow227TriangleData0653.coefficient43_417,
    output := OriginalRow227TriangleData0667.coefficient44_417, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_419, Icur := OriginalRow227TriangleData0653.coefficient43_418,
    output := OriginalRow227TriangleData0667.coefficient44_418, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_420, Icur := OriginalRow227TriangleData0653.coefficient43_419,
    output := OriginalRow227TriangleData0667.coefficient44_419, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_421, Icur := OriginalRow227TriangleData0653.coefficient43_420,
    output := OriginalRow227TriangleData0667.coefficient44_420, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_422, Icur := OriginalRow227TriangleData0653.coefficient43_421,
    output := OriginalRow227TriangleData0667.coefficient44_421, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_423, Icur := OriginalRow227TriangleData0653.coefficient43_422,
    output := OriginalRow227TriangleData0667.coefficient44_422, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_424, Icur := OriginalRow227TriangleData0653.coefficient43_423,
    output := OriginalRow227TriangleData0667.coefficient44_423, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0653.coefficient43_425, Icur := OriginalRow227TriangleData0653.coefficient43_424,
    output := OriginalRow227TriangleData0667.coefficient44_424, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_426, Icur := OriginalRow227TriangleData0653.coefficient43_425,
    output := OriginalRow227TriangleData0667.coefficient44_425, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_427, Icur := OriginalRow227TriangleData0654.coefficient43_426,
    output := OriginalRow227TriangleData0667.coefficient44_426, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0651

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0651.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
