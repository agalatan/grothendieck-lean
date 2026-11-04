import Grothe.UpperChaos.OriginalRow227TriangleData0923
import Grothe.UpperChaos.OriginalRow227TriangleData0935
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0919
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_417, Icur := OriginalRow227TriangleData0923.coefficient64_416,
    output := OriginalRow227TriangleData0935.coefficient65_416, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_418, Icur := OriginalRow227TriangleData0923.coefficient64_417,
    output := OriginalRow227TriangleData0935.coefficient65_417, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_419, Icur := OriginalRow227TriangleData0923.coefficient64_418,
    output := OriginalRow227TriangleData0935.coefficient65_418, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_420, Icur := OriginalRow227TriangleData0923.coefficient64_419,
    output := OriginalRow227TriangleData0935.coefficient65_419, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_421, Icur := OriginalRow227TriangleData0923.coefficient64_420,
    output := OriginalRow227TriangleData0935.coefficient65_420, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_422, Icur := OriginalRow227TriangleData0923.coefficient64_421,
    output := OriginalRow227TriangleData0935.coefficient65_421, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_423, Icur := OriginalRow227TriangleData0923.coefficient64_422,
    output := OriginalRow227TriangleData0935.coefficient65_422, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_424, Icur := OriginalRow227TriangleData0923.coefficient64_423,
    output := OriginalRow227TriangleData0935.coefficient65_423, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_425, Icur := OriginalRow227TriangleData0923.coefficient64_424,
    output := OriginalRow227TriangleData0935.coefficient65_424, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_426, Icur := OriginalRow227TriangleData0923.coefficient64_425,
    output := OriginalRow227TriangleData0935.coefficient65_425, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_427, Icur := OriginalRow227TriangleData0923.coefficient64_426,
    output := OriginalRow227TriangleData0935.coefficient65_426, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_428, Icur := OriginalRow227TriangleData0923.coefficient64_427,
    output := OriginalRow227TriangleData0935.coefficient65_427, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_429, Icur := OriginalRow227TriangleData0923.coefficient64_428,
    output := OriginalRow227TriangleData0935.coefficient65_428, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_430, Icur := OriginalRow227TriangleData0923.coefficient64_429,
    output := OriginalRow227TriangleData0935.coefficient65_429, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_431, Icur := OriginalRow227TriangleData0923.coefficient64_430,
    output := OriginalRow227TriangleData0935.coefficient65_430, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_432, Icur := OriginalRow227TriangleData0923.coefficient64_431,
    output := OriginalRow227TriangleData0935.coefficient65_431, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_433, Icur := OriginalRow227TriangleData0923.coefficient64_432,
    output := OriginalRow227TriangleData0935.coefficient65_432, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_434, Icur := OriginalRow227TriangleData0923.coefficient64_433,
    output := OriginalRow227TriangleData0935.coefficient65_433, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_435, Icur := OriginalRow227TriangleData0923.coefficient64_434,
    output := OriginalRow227TriangleData0935.coefficient65_434, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_436, Icur := OriginalRow227TriangleData0923.coefficient64_435,
    output := OriginalRow227TriangleData0935.coefficient65_435, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0923.coefficient64_437, Icur := OriginalRow227TriangleData0923.coefficient64_436,
    output := OriginalRow227TriangleData0935.coefficient65_436, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0919

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0919.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
