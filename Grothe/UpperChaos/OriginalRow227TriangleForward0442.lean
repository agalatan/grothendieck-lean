import Grothe.UpperChaos.OriginalRow227TriangleData0444
import Grothe.UpperChaos.OriginalRow227TriangleData0445
import Grothe.UpperChaos.OriginalRow227TriangleData0458
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0442
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_413, Icur := OriginalRow227TriangleData0444.coefficient28_412,
    output := OriginalRow227TriangleData0458.coefficient29_412, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_414, Icur := OriginalRow227TriangleData0444.coefficient28_413,
    output := OriginalRow227TriangleData0458.coefficient29_413, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_415, Icur := OriginalRow227TriangleData0444.coefficient28_414,
    output := OriginalRow227TriangleData0458.coefficient29_414, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_416, Icur := OriginalRow227TriangleData0444.coefficient28_415,
    output := OriginalRow227TriangleData0458.coefficient29_415, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_417, Icur := OriginalRow227TriangleData0444.coefficient28_416,
    output := OriginalRow227TriangleData0458.coefficient29_416, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root418, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_418, Icur := OriginalRow227TriangleData0444.coefficient28_417,
    output := OriginalRow227TriangleData0458.coefficient29_417, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_419, Icur := OriginalRow227TriangleData0444.coefficient28_418,
    output := OriginalRow227TriangleData0458.coefficient29_418, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_420, Icur := OriginalRow227TriangleData0444.coefficient28_419,
    output := OriginalRow227TriangleData0458.coefficient29_419, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_421, Icur := OriginalRow227TriangleData0444.coefficient28_420,
    output := OriginalRow227TriangleData0458.coefficient29_420, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_422, Icur := OriginalRow227TriangleData0444.coefficient28_421,
    output := OriginalRow227TriangleData0458.coefficient29_421, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_423, Icur := OriginalRow227TriangleData0444.coefficient28_422,
    output := OriginalRow227TriangleData0458.coefficient29_422, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_424, Icur := OriginalRow227TriangleData0444.coefficient28_423,
    output := OriginalRow227TriangleData0458.coefficient29_423, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_425, Icur := OriginalRow227TriangleData0444.coefficient28_424,
    output := OriginalRow227TriangleData0458.coefficient29_424, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_426, Icur := OriginalRow227TriangleData0444.coefficient28_425,
    output := OriginalRow227TriangleData0458.coefficient29_425, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_427, Icur := OriginalRow227TriangleData0444.coefficient28_426,
    output := OriginalRow227TriangleData0458.coefficient29_426, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_428, Icur := OriginalRow227TriangleData0444.coefficient28_427,
    output := OriginalRow227TriangleData0458.coefficient29_427, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_429, Icur := OriginalRow227TriangleData0444.coefficient28_428,
    output := OriginalRow227TriangleData0458.coefficient29_428, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_430, Icur := OriginalRow227TriangleData0444.coefficient28_429,
    output := OriginalRow227TriangleData0458.coefficient29_429, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_431, Icur := OriginalRow227TriangleData0444.coefficient28_430,
    output := OriginalRow227TriangleData0458.coefficient29_430, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_432, Icur := OriginalRow227TriangleData0444.coefficient28_431,
    output := OriginalRow227TriangleData0458.coefficient29_431, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_433, Icur := OriginalRow227TriangleData0444.coefficient28_432,
    output := OriginalRow227TriangleData0458.coefficient29_432, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_434, Icur := OriginalRow227TriangleData0444.coefficient28_433,
    output := OriginalRow227TriangleData0458.coefficient29_433, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_435, Icur := OriginalRow227TriangleData0444.coefficient28_434,
    output := OriginalRow227TriangleData0458.coefficient29_434, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_436, Icur := OriginalRow227TriangleData0444.coefficient28_435,
    output := OriginalRow227TriangleData0458.coefficient29_435, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_437, Icur := OriginalRow227TriangleData0444.coefficient28_436,
    output := OriginalRow227TriangleData0458.coefficient29_436, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_438, Icur := OriginalRow227TriangleData0444.coefficient28_437,
    output := OriginalRow227TriangleData0458.coefficient29_437, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_439, Icur := OriginalRow227TriangleData0444.coefficient28_438,
    output := OriginalRow227TriangleData0458.coefficient29_438, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_440, Icur := OriginalRow227TriangleData0444.coefficient28_439,
    output := OriginalRow227TriangleData0458.coefficient29_439, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_441, Icur := OriginalRow227TriangleData0444.coefficient28_440,
    output := OriginalRow227TriangleData0458.coefficient29_440, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0444.coefficient28_442, Icur := OriginalRow227TriangleData0444.coefficient28_441,
    output := OriginalRow227TriangleData0458.coefficient29_441, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0445.coefficient28_443, Icur := OriginalRow227TriangleData0444.coefficient28_442,
    output := OriginalRow227TriangleData0458.coefficient29_442, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0445.coefficient28_444, Icur := OriginalRow227TriangleData0445.coefficient28_443,
    output := OriginalRow227TriangleData0458.coefficient29_443, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0442

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0442.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
