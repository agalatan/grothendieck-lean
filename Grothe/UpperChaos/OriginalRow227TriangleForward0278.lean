import Grothe.UpperChaos.OriginalRow227TriangleData0279
import Grothe.UpperChaos.OriginalRow227TriangleData0280
import Grothe.UpperChaos.OriginalRow227TriangleData0294
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0278
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_402, Icur := OriginalRow227TriangleData0279.coefficient17_401,
    output := OriginalRow227TriangleData0294.coefficient18_401, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_403, Icur := OriginalRow227TriangleData0279.coefficient17_402,
    output := OriginalRow227TriangleData0294.coefficient18_402, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_404, Icur := OriginalRow227TriangleData0279.coefficient17_403,
    output := OriginalRow227TriangleData0294.coefficient18_403, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_405, Icur := OriginalRow227TriangleData0279.coefficient17_404,
    output := OriginalRow227TriangleData0294.coefficient18_404, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_406, Icur := OriginalRow227TriangleData0279.coefficient17_405,
    output := OriginalRow227TriangleData0294.coefficient18_405, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_407, Icur := OriginalRow227TriangleData0279.coefficient17_406,
    output := OriginalRow227TriangleData0294.coefficient18_406, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_408, Icur := OriginalRow227TriangleData0279.coefficient17_407,
    output := OriginalRow227TriangleData0294.coefficient18_407, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_409, Icur := OriginalRow227TriangleData0279.coefficient17_408,
    output := OriginalRow227TriangleData0294.coefficient18_408, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_410, Icur := OriginalRow227TriangleData0279.coefficient17_409,
    output := OriginalRow227TriangleData0294.coefficient18_409, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_411, Icur := OriginalRow227TriangleData0279.coefficient17_410,
    output := OriginalRow227TriangleData0294.coefficient18_410, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_412, Icur := OriginalRow227TriangleData0279.coefficient17_411,
    output := OriginalRow227TriangleData0294.coefficient18_411, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_413, Icur := OriginalRow227TriangleData0279.coefficient17_412,
    output := OriginalRow227TriangleData0294.coefficient18_412, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_414, Icur := OriginalRow227TriangleData0279.coefficient17_413,
    output := OriginalRow227TriangleData0294.coefficient18_413, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_415, Icur := OriginalRow227TriangleData0279.coefficient17_414,
    output := OriginalRow227TriangleData0294.coefficient18_414, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_416, Icur := OriginalRow227TriangleData0279.coefficient17_415,
    output := OriginalRow227TriangleData0294.coefficient18_415, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_417, Icur := OriginalRow227TriangleData0279.coefficient17_416,
    output := OriginalRow227TriangleData0294.coefficient18_416, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_418, Icur := OriginalRow227TriangleData0279.coefficient17_417,
    output := OriginalRow227TriangleData0294.coefficient18_417, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_419, Icur := OriginalRow227TriangleData0279.coefficient17_418,
    output := OriginalRow227TriangleData0294.coefficient18_418, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_420, Icur := OriginalRow227TriangleData0279.coefficient17_419,
    output := OriginalRow227TriangleData0294.coefficient18_419, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_421, Icur := OriginalRow227TriangleData0279.coefficient17_420,
    output := OriginalRow227TriangleData0294.coefficient18_420, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_422, Icur := OriginalRow227TriangleData0279.coefficient17_421,
    output := OriginalRow227TriangleData0294.coefficient18_421, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_423, Icur := OriginalRow227TriangleData0279.coefficient17_422,
    output := OriginalRow227TriangleData0294.coefficient18_422, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_424, Icur := OriginalRow227TriangleData0279.coefficient17_423,
    output := OriginalRow227TriangleData0294.coefficient18_423, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_425, Icur := OriginalRow227TriangleData0279.coefficient17_424,
    output := OriginalRow227TriangleData0294.coefficient18_424, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_426, Icur := OriginalRow227TriangleData0279.coefficient17_425,
    output := OriginalRow227TriangleData0294.coefficient18_425, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_427, Icur := OriginalRow227TriangleData0279.coefficient17_426,
    output := OriginalRow227TriangleData0294.coefficient18_426, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_428, Icur := OriginalRow227TriangleData0279.coefficient17_427,
    output := OriginalRow227TriangleData0294.coefficient18_427, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_429, Icur := OriginalRow227TriangleData0279.coefficient17_428,
    output := OriginalRow227TriangleData0294.coefficient18_428, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_430, Icur := OriginalRow227TriangleData0279.coefficient17_429,
    output := OriginalRow227TriangleData0294.coefficient18_429, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0279.coefficient17_431, Icur := OriginalRow227TriangleData0279.coefficient17_430,
    output := OriginalRow227TriangleData0294.coefficient18_430, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_432, Icur := OriginalRow227TriangleData0279.coefficient17_431,
    output := OriginalRow227TriangleData0294.coefficient18_431, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_433, Icur := OriginalRow227TriangleData0280.coefficient17_432,
    output := OriginalRow227TriangleData0294.coefficient18_432, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0278

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0278.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
