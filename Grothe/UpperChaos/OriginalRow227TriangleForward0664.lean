import Grothe.UpperChaos.OriginalRow227TriangleData0667
import Grothe.UpperChaos.OriginalRow227TriangleData0668
import Grothe.UpperChaos.OriginalRow227TriangleData0680
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0664
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_397, Icur := OriginalRow227TriangleData0667.coefficient44_396,
    output := OriginalRow227TriangleData0680.coefficient45_396, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_398, Icur := OriginalRow227TriangleData0667.coefficient44_397,
    output := OriginalRow227TriangleData0680.coefficient45_397, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_399, Icur := OriginalRow227TriangleData0667.coefficient44_398,
    output := OriginalRow227TriangleData0680.coefficient45_398, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_400, Icur := OriginalRow227TriangleData0667.coefficient44_399,
    output := OriginalRow227TriangleData0680.coefficient45_399, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_401, Icur := OriginalRow227TriangleData0667.coefficient44_400,
    output := OriginalRow227TriangleData0680.coefficient45_400, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_402, Icur := OriginalRow227TriangleData0667.coefficient44_401,
    output := OriginalRow227TriangleData0680.coefficient45_401, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_403, Icur := OriginalRow227TriangleData0667.coefficient44_402,
    output := OriginalRow227TriangleData0680.coefficient45_402, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_404, Icur := OriginalRow227TriangleData0667.coefficient44_403,
    output := OriginalRow227TriangleData0680.coefficient45_403, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_405, Icur := OriginalRow227TriangleData0667.coefficient44_404,
    output := OriginalRow227TriangleData0680.coefficient45_404, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_406, Icur := OriginalRow227TriangleData0667.coefficient44_405,
    output := OriginalRow227TriangleData0680.coefficient45_405, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_407, Icur := OriginalRow227TriangleData0667.coefficient44_406,
    output := OriginalRow227TriangleData0680.coefficient45_406, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_408, Icur := OriginalRow227TriangleData0667.coefficient44_407,
    output := OriginalRow227TriangleData0680.coefficient45_407, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_409, Icur := OriginalRow227TriangleData0667.coefficient44_408,
    output := OriginalRow227TriangleData0680.coefficient45_408, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_410, Icur := OriginalRow227TriangleData0667.coefficient44_409,
    output := OriginalRow227TriangleData0680.coefficient45_409, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_411, Icur := OriginalRow227TriangleData0667.coefficient44_410,
    output := OriginalRow227TriangleData0680.coefficient45_410, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_412, Icur := OriginalRow227TriangleData0667.coefficient44_411,
    output := OriginalRow227TriangleData0680.coefficient45_411, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_413, Icur := OriginalRow227TriangleData0667.coefficient44_412,
    output := OriginalRow227TriangleData0680.coefficient45_412, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_414, Icur := OriginalRow227TriangleData0667.coefficient44_413,
    output := OriginalRow227TriangleData0680.coefficient45_413, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_415, Icur := OriginalRow227TriangleData0667.coefficient44_414,
    output := OriginalRow227TriangleData0680.coefficient45_414, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_416, Icur := OriginalRow227TriangleData0667.coefficient44_415,
    output := OriginalRow227TriangleData0680.coefficient45_415, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_417, Icur := OriginalRow227TriangleData0667.coefficient44_416,
    output := OriginalRow227TriangleData0680.coefficient45_416, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_418, Icur := OriginalRow227TriangleData0667.coefficient44_417,
    output := OriginalRow227TriangleData0680.coefficient45_417, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_419, Icur := OriginalRow227TriangleData0667.coefficient44_418,
    output := OriginalRow227TriangleData0680.coefficient45_418, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_420, Icur := OriginalRow227TriangleData0667.coefficient44_419,
    output := OriginalRow227TriangleData0680.coefficient45_419, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_421, Icur := OriginalRow227TriangleData0667.coefficient44_420,
    output := OriginalRow227TriangleData0680.coefficient45_420, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_422, Icur := OriginalRow227TriangleData0667.coefficient44_421,
    output := OriginalRow227TriangleData0680.coefficient45_421, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_423, Icur := OriginalRow227TriangleData0667.coefficient44_422,
    output := OriginalRow227TriangleData0680.coefficient45_422, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_424, Icur := OriginalRow227TriangleData0667.coefficient44_423,
    output := OriginalRow227TriangleData0680.coefficient45_423, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_425, Icur := OriginalRow227TriangleData0667.coefficient44_424,
    output := OriginalRow227TriangleData0680.coefficient45_424, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0667.coefficient44_426, Icur := OriginalRow227TriangleData0667.coefficient44_425,
    output := OriginalRow227TriangleData0680.coefficient45_425, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0668.coefficient44_427, Icur := OriginalRow227TriangleData0667.coefficient44_426,
    output := OriginalRow227TriangleData0680.coefficient45_426, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0668.coefficient44_428, Icur := OriginalRow227TriangleData0668.coefficient44_427,
    output := OriginalRow227TriangleData0680.coefficient45_427, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0664

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0664.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
