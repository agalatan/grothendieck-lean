import Grothe.UpperChaos.OriginalRow227TriangleData0611
import Grothe.UpperChaos.OriginalRow227TriangleData0612
import Grothe.UpperChaos.OriginalRow227TriangleData0625
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0609
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_393, Icur := OriginalRow227TriangleData0611.coefficient40_392,
    output := OriginalRow227TriangleData0625.coefficient41_392, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_394, Icur := OriginalRow227TriangleData0611.coefficient40_393,
    output := OriginalRow227TriangleData0625.coefficient41_393, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_395, Icur := OriginalRow227TriangleData0611.coefficient40_394,
    output := OriginalRow227TriangleData0625.coefficient41_394, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_396, Icur := OriginalRow227TriangleData0611.coefficient40_395,
    output := OriginalRow227TriangleData0625.coefficient41_395, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_397, Icur := OriginalRow227TriangleData0611.coefficient40_396,
    output := OriginalRow227TriangleData0625.coefficient41_396, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_398, Icur := OriginalRow227TriangleData0611.coefficient40_397,
    output := OriginalRow227TriangleData0625.coefficient41_397, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_399, Icur := OriginalRow227TriangleData0611.coefficient40_398,
    output := OriginalRow227TriangleData0625.coefficient41_398, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_400, Icur := OriginalRow227TriangleData0611.coefficient40_399,
    output := OriginalRow227TriangleData0625.coefficient41_399, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_401, Icur := OriginalRow227TriangleData0611.coefficient40_400,
    output := OriginalRow227TriangleData0625.coefficient41_400, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_402, Icur := OriginalRow227TriangleData0611.coefficient40_401,
    output := OriginalRow227TriangleData0625.coefficient41_401, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_403, Icur := OriginalRow227TriangleData0611.coefficient40_402,
    output := OriginalRow227TriangleData0625.coefficient41_402, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_404, Icur := OriginalRow227TriangleData0611.coefficient40_403,
    output := OriginalRow227TriangleData0625.coefficient41_403, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_405, Icur := OriginalRow227TriangleData0611.coefficient40_404,
    output := OriginalRow227TriangleData0625.coefficient41_404, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_406, Icur := OriginalRow227TriangleData0611.coefficient40_405,
    output := OriginalRow227TriangleData0625.coefficient41_405, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_407, Icur := OriginalRow227TriangleData0611.coefficient40_406,
    output := OriginalRow227TriangleData0625.coefficient41_406, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_408, Icur := OriginalRow227TriangleData0611.coefficient40_407,
    output := OriginalRow227TriangleData0625.coefficient41_407, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_409, Icur := OriginalRow227TriangleData0611.coefficient40_408,
    output := OriginalRow227TriangleData0625.coefficient41_408, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_410, Icur := OriginalRow227TriangleData0611.coefficient40_409,
    output := OriginalRow227TriangleData0625.coefficient41_409, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_411, Icur := OriginalRow227TriangleData0611.coefficient40_410,
    output := OriginalRow227TriangleData0625.coefficient41_410, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_412, Icur := OriginalRow227TriangleData0611.coefficient40_411,
    output := OriginalRow227TriangleData0625.coefficient41_411, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_413, Icur := OriginalRow227TriangleData0611.coefficient40_412,
    output := OriginalRow227TriangleData0625.coefficient41_412, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_414, Icur := OriginalRow227TriangleData0611.coefficient40_413,
    output := OriginalRow227TriangleData0625.coefficient41_413, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_415, Icur := OriginalRow227TriangleData0611.coefficient40_414,
    output := OriginalRow227TriangleData0625.coefficient41_414, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_416, Icur := OriginalRow227TriangleData0611.coefficient40_415,
    output := OriginalRow227TriangleData0625.coefficient41_415, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_417, Icur := OriginalRow227TriangleData0611.coefficient40_416,
    output := OriginalRow227TriangleData0625.coefficient41_416, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_418, Icur := OriginalRow227TriangleData0611.coefficient40_417,
    output := OriginalRow227TriangleData0625.coefficient41_417, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_419, Icur := OriginalRow227TriangleData0611.coefficient40_418,
    output := OriginalRow227TriangleData0625.coefficient41_418, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_420, Icur := OriginalRow227TriangleData0611.coefficient40_419,
    output := OriginalRow227TriangleData0625.coefficient41_419, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_421, Icur := OriginalRow227TriangleData0611.coefficient40_420,
    output := OriginalRow227TriangleData0625.coefficient41_420, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0611.coefficient40_422, Icur := OriginalRow227TriangleData0611.coefficient40_421,
    output := OriginalRow227TriangleData0625.coefficient41_421, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0612.coefficient40_423, Icur := OriginalRow227TriangleData0611.coefficient40_422,
    output := OriginalRow227TriangleData0625.coefficient41_422, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root41,
    Inext := OriginalRow227TriangleData0612.coefficient40_424, Icur := OriginalRow227TriangleData0612.coefficient40_423,
    output := OriginalRow227TriangleData0625.coefficient41_423, hC := OriginalRow227TriangleRoots01.root41_pos, hAC := OriginalRow227TriangleRoots01.product41_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0609

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0609.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
