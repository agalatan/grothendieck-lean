import Grothe.UpperChaos.OriginalRow227TriangleData0500
import Grothe.UpperChaos.OriginalRow227TriangleData0501
import Grothe.UpperChaos.OriginalRow227TriangleData0514
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0498
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_417, Icur := OriginalRow227TriangleData0500.coefficient32_416,
    output := OriginalRow227TriangleData0514.coefficient33_416, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_418, Icur := OriginalRow227TriangleData0500.coefficient32_417,
    output := OriginalRow227TriangleData0514.coefficient33_417, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_419, Icur := OriginalRow227TriangleData0500.coefficient32_418,
    output := OriginalRow227TriangleData0514.coefficient33_418, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_420, Icur := OriginalRow227TriangleData0500.coefficient32_419,
    output := OriginalRow227TriangleData0514.coefficient33_419, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_421, Icur := OriginalRow227TriangleData0500.coefficient32_420,
    output := OriginalRow227TriangleData0514.coefficient33_420, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_422, Icur := OriginalRow227TriangleData0500.coefficient32_421,
    output := OriginalRow227TriangleData0514.coefficient33_421, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_423, Icur := OriginalRow227TriangleData0500.coefficient32_422,
    output := OriginalRow227TriangleData0514.coefficient33_422, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_424, Icur := OriginalRow227TriangleData0500.coefficient32_423,
    output := OriginalRow227TriangleData0514.coefficient33_423, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_425, Icur := OriginalRow227TriangleData0500.coefficient32_424,
    output := OriginalRow227TriangleData0514.coefficient33_424, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_426, Icur := OriginalRow227TriangleData0500.coefficient32_425,
    output := OriginalRow227TriangleData0514.coefficient33_425, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_427, Icur := OriginalRow227TriangleData0500.coefficient32_426,
    output := OriginalRow227TriangleData0514.coefficient33_426, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_428, Icur := OriginalRow227TriangleData0500.coefficient32_427,
    output := OriginalRow227TriangleData0514.coefficient33_427, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_429, Icur := OriginalRow227TriangleData0500.coefficient32_428,
    output := OriginalRow227TriangleData0514.coefficient33_428, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_430, Icur := OriginalRow227TriangleData0500.coefficient32_429,
    output := OriginalRow227TriangleData0514.coefficient33_429, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_431, Icur := OriginalRow227TriangleData0500.coefficient32_430,
    output := OriginalRow227TriangleData0514.coefficient33_430, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_432, Icur := OriginalRow227TriangleData0500.coefficient32_431,
    output := OriginalRow227TriangleData0514.coefficient33_431, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_433, Icur := OriginalRow227TriangleData0500.coefficient32_432,
    output := OriginalRow227TriangleData0514.coefficient33_432, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_434, Icur := OriginalRow227TriangleData0500.coefficient32_433,
    output := OriginalRow227TriangleData0514.coefficient33_433, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_435, Icur := OriginalRow227TriangleData0500.coefficient32_434,
    output := OriginalRow227TriangleData0514.coefficient33_434, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_436, Icur := OriginalRow227TriangleData0500.coefficient32_435,
    output := OriginalRow227TriangleData0514.coefficient33_435, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_437, Icur := OriginalRow227TriangleData0500.coefficient32_436,
    output := OriginalRow227TriangleData0514.coefficient33_436, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_438, Icur := OriginalRow227TriangleData0500.coefficient32_437,
    output := OriginalRow227TriangleData0514.coefficient33_437, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_439, Icur := OriginalRow227TriangleData0500.coefficient32_438,
    output := OriginalRow227TriangleData0514.coefficient33_438, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_440, Icur := OriginalRow227TriangleData0500.coefficient32_439,
    output := OriginalRow227TriangleData0514.coefficient33_439, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_441, Icur := OriginalRow227TriangleData0500.coefficient32_440,
    output := OriginalRow227TriangleData0514.coefficient33_440, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_442, Icur := OriginalRow227TriangleData0500.coefficient32_441,
    output := OriginalRow227TriangleData0514.coefficient33_441, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_443, Icur := OriginalRow227TriangleData0500.coefficient32_442,
    output := OriginalRow227TriangleData0514.coefficient33_442, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_444, Icur := OriginalRow227TriangleData0500.coefficient32_443,
    output := OriginalRow227TriangleData0514.coefficient33_443, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_445, Icur := OriginalRow227TriangleData0500.coefficient32_444,
    output := OriginalRow227TriangleData0514.coefficient33_444, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0500.coefficient32_446, Icur := OriginalRow227TriangleData0500.coefficient32_445,
    output := OriginalRow227TriangleData0514.coefficient33_445, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0501.coefficient32_447, Icur := OriginalRow227TriangleData0500.coefficient32_446,
    output := OriginalRow227TriangleData0514.coefficient33_446, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0501.coefficient32_448, Icur := OriginalRow227TriangleData0501.coefficient32_447,
    output := OriginalRow227TriangleData0514.coefficient33_447, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0498

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0498.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
