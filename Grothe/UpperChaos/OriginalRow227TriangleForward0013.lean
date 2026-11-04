import Grothe.UpperChaos.OriginalRow227TriangleData0013
import Grothe.UpperChaos.OriginalRow227TriangleData0014
import Grothe.UpperChaos.OriginalRow227TriangleData0029
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0013
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_417, Icur := OriginalRow227TriangleData0013.coefficient0_416,
    output := OriginalRow227TriangleData0029.coefficient1_416, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_418, Icur := OriginalRow227TriangleData0013.coefficient0_417,
    output := OriginalRow227TriangleData0029.coefficient1_417, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_419, Icur := OriginalRow227TriangleData0013.coefficient0_418,
    output := OriginalRow227TriangleData0029.coefficient1_418, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_420, Icur := OriginalRow227TriangleData0013.coefficient0_419,
    output := OriginalRow227TriangleData0029.coefficient1_419, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_421, Icur := OriginalRow227TriangleData0013.coefficient0_420,
    output := OriginalRow227TriangleData0029.coefficient1_420, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_422, Icur := OriginalRow227TriangleData0013.coefficient0_421,
    output := OriginalRow227TriangleData0029.coefficient1_421, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_423, Icur := OriginalRow227TriangleData0013.coefficient0_422,
    output := OriginalRow227TriangleData0029.coefficient1_422, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_424, Icur := OriginalRow227TriangleData0013.coefficient0_423,
    output := OriginalRow227TriangleData0029.coefficient1_423, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_425, Icur := OriginalRow227TriangleData0013.coefficient0_424,
    output := OriginalRow227TriangleData0029.coefficient1_424, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_426, Icur := OriginalRow227TriangleData0013.coefficient0_425,
    output := OriginalRow227TriangleData0029.coefficient1_425, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_427, Icur := OriginalRow227TriangleData0013.coefficient0_426,
    output := OriginalRow227TriangleData0029.coefficient1_426, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_428, Icur := OriginalRow227TriangleData0013.coefficient0_427,
    output := OriginalRow227TriangleData0029.coefficient1_427, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_429, Icur := OriginalRow227TriangleData0013.coefficient0_428,
    output := OriginalRow227TriangleData0029.coefficient1_428, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_430, Icur := OriginalRow227TriangleData0013.coefficient0_429,
    output := OriginalRow227TriangleData0029.coefficient1_429, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_431, Icur := OriginalRow227TriangleData0013.coefficient0_430,
    output := OriginalRow227TriangleData0029.coefficient1_430, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_432, Icur := OriginalRow227TriangleData0013.coefficient0_431,
    output := OriginalRow227TriangleData0029.coefficient1_431, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_433, Icur := OriginalRow227TriangleData0013.coefficient0_432,
    output := OriginalRow227TriangleData0029.coefficient1_432, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_434, Icur := OriginalRow227TriangleData0013.coefficient0_433,
    output := OriginalRow227TriangleData0029.coefficient1_433, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_435, Icur := OriginalRow227TriangleData0013.coefficient0_434,
    output := OriginalRow227TriangleData0029.coefficient1_434, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_436, Icur := OriginalRow227TriangleData0013.coefficient0_435,
    output := OriginalRow227TriangleData0029.coefficient1_435, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_437, Icur := OriginalRow227TriangleData0013.coefficient0_436,
    output := OriginalRow227TriangleData0029.coefficient1_436, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_438, Icur := OriginalRow227TriangleData0013.coefficient0_437,
    output := OriginalRow227TriangleData0029.coefficient1_437, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_439, Icur := OriginalRow227TriangleData0013.coefficient0_438,
    output := OriginalRow227TriangleData0029.coefficient1_438, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_440, Icur := OriginalRow227TriangleData0013.coefficient0_439,
    output := OriginalRow227TriangleData0029.coefficient1_439, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_441, Icur := OriginalRow227TriangleData0013.coefficient0_440,
    output := OriginalRow227TriangleData0029.coefficient1_440, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_442, Icur := OriginalRow227TriangleData0013.coefficient0_441,
    output := OriginalRow227TriangleData0029.coefficient1_441, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_443, Icur := OriginalRow227TriangleData0013.coefficient0_442,
    output := OriginalRow227TriangleData0029.coefficient1_442, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_444, Icur := OriginalRow227TriangleData0013.coefficient0_443,
    output := OriginalRow227TriangleData0029.coefficient1_443, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_445, Icur := OriginalRow227TriangleData0013.coefficient0_444,
    output := OriginalRow227TriangleData0029.coefficient1_444, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_446, Icur := OriginalRow227TriangleData0013.coefficient0_445,
    output := OriginalRow227TriangleData0029.coefficient1_445, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0013.coefficient0_447, Icur := OriginalRow227TriangleData0013.coefficient0_446,
    output := OriginalRow227TriangleData0029.coefficient1_446, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0014.coefficient0_448, Icur := OriginalRow227TriangleData0013.coefficient0_447,
    output := OriginalRow227TriangleData0029.coefficient1_447, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0013

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0013.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
