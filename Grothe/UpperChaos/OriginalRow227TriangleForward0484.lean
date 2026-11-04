import Grothe.UpperChaos.OriginalRow227TriangleData0486
import Grothe.UpperChaos.OriginalRow227TriangleData0487
import Grothe.UpperChaos.OriginalRow227TriangleData0500
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0484
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_416, Icur := OriginalRow227TriangleData0486.coefficient31_415,
    output := OriginalRow227TriangleData0500.coefficient32_415, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_417, Icur := OriginalRow227TriangleData0486.coefficient31_416,
    output := OriginalRow227TriangleData0500.coefficient32_416, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_418, Icur := OriginalRow227TriangleData0486.coefficient31_417,
    output := OriginalRow227TriangleData0500.coefficient32_417, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_419, Icur := OriginalRow227TriangleData0486.coefficient31_418,
    output := OriginalRow227TriangleData0500.coefficient32_418, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_420, Icur := OriginalRow227TriangleData0486.coefficient31_419,
    output := OriginalRow227TriangleData0500.coefficient32_419, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_421, Icur := OriginalRow227TriangleData0486.coefficient31_420,
    output := OriginalRow227TriangleData0500.coefficient32_420, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_422, Icur := OriginalRow227TriangleData0486.coefficient31_421,
    output := OriginalRow227TriangleData0500.coefficient32_421, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_423, Icur := OriginalRow227TriangleData0486.coefficient31_422,
    output := OriginalRow227TriangleData0500.coefficient32_422, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_424, Icur := OriginalRow227TriangleData0486.coefficient31_423,
    output := OriginalRow227TriangleData0500.coefficient32_423, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_425, Icur := OriginalRow227TriangleData0486.coefficient31_424,
    output := OriginalRow227TriangleData0500.coefficient32_424, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_426, Icur := OriginalRow227TriangleData0486.coefficient31_425,
    output := OriginalRow227TriangleData0500.coefficient32_425, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_427, Icur := OriginalRow227TriangleData0486.coefficient31_426,
    output := OriginalRow227TriangleData0500.coefficient32_426, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_428, Icur := OriginalRow227TriangleData0486.coefficient31_427,
    output := OriginalRow227TriangleData0500.coefficient32_427, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_429, Icur := OriginalRow227TriangleData0486.coefficient31_428,
    output := OriginalRow227TriangleData0500.coefficient32_428, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_430, Icur := OriginalRow227TriangleData0486.coefficient31_429,
    output := OriginalRow227TriangleData0500.coefficient32_429, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_431, Icur := OriginalRow227TriangleData0486.coefficient31_430,
    output := OriginalRow227TriangleData0500.coefficient32_430, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_432, Icur := OriginalRow227TriangleData0486.coefficient31_431,
    output := OriginalRow227TriangleData0500.coefficient32_431, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_433, Icur := OriginalRow227TriangleData0486.coefficient31_432,
    output := OriginalRow227TriangleData0500.coefficient32_432, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_434, Icur := OriginalRow227TriangleData0486.coefficient31_433,
    output := OriginalRow227TriangleData0500.coefficient32_433, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_435, Icur := OriginalRow227TriangleData0486.coefficient31_434,
    output := OriginalRow227TriangleData0500.coefficient32_434, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_436, Icur := OriginalRow227TriangleData0486.coefficient31_435,
    output := OriginalRow227TriangleData0500.coefficient32_435, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_437, Icur := OriginalRow227TriangleData0486.coefficient31_436,
    output := OriginalRow227TriangleData0500.coefficient32_436, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_438, Icur := OriginalRow227TriangleData0486.coefficient31_437,
    output := OriginalRow227TriangleData0500.coefficient32_437, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_439, Icur := OriginalRow227TriangleData0486.coefficient31_438,
    output := OriginalRow227TriangleData0500.coefficient32_438, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_440, Icur := OriginalRow227TriangleData0486.coefficient31_439,
    output := OriginalRow227TriangleData0500.coefficient32_439, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_441, Icur := OriginalRow227TriangleData0486.coefficient31_440,
    output := OriginalRow227TriangleData0500.coefficient32_440, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_442, Icur := OriginalRow227TriangleData0486.coefficient31_441,
    output := OriginalRow227TriangleData0500.coefficient32_441, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_443, Icur := OriginalRow227TriangleData0486.coefficient31_442,
    output := OriginalRow227TriangleData0500.coefficient32_442, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_444, Icur := OriginalRow227TriangleData0486.coefficient31_443,
    output := OriginalRow227TriangleData0500.coefficient32_443, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0486.coefficient31_445, Icur := OriginalRow227TriangleData0486.coefficient31_444,
    output := OriginalRow227TriangleData0500.coefficient32_444, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_446, Icur := OriginalRow227TriangleData0486.coefficient31_445,
    output := OriginalRow227TriangleData0500.coefficient32_445, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root32,
    Inext := OriginalRow227TriangleData0487.coefficient31_447, Icur := OriginalRow227TriangleData0487.coefficient31_446,
    output := OriginalRow227TriangleData0500.coefficient32_446, hC := OriginalRow227TriangleRoots00.root32_pos, hAC := OriginalRow227TriangleRoots00.product32_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0484

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0484.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
