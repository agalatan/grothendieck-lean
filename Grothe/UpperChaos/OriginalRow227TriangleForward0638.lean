import Grothe.UpperChaos.OriginalRow227TriangleData0640
import Grothe.UpperChaos.OriginalRow227TriangleData0641
import Grothe.UpperChaos.OriginalRow227TriangleData0654
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0638
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_427, Icur := OriginalRow227TriangleData0640.coefficient42_426,
    output := OriginalRow227TriangleData0654.coefficient43_426, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_428, Icur := OriginalRow227TriangleData0640.coefficient42_427,
    output := OriginalRow227TriangleData0654.coefficient43_427, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_429, Icur := OriginalRow227TriangleData0640.coefficient42_428,
    output := OriginalRow227TriangleData0654.coefficient43_428, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_430, Icur := OriginalRow227TriangleData0640.coefficient42_429,
    output := OriginalRow227TriangleData0654.coefficient43_429, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_431, Icur := OriginalRow227TriangleData0640.coefficient42_430,
    output := OriginalRow227TriangleData0654.coefficient43_430, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_432, Icur := OriginalRow227TriangleData0640.coefficient42_431,
    output := OriginalRow227TriangleData0654.coefficient43_431, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_433, Icur := OriginalRow227TriangleData0640.coefficient42_432,
    output := OriginalRow227TriangleData0654.coefficient43_432, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_434, Icur := OriginalRow227TriangleData0640.coefficient42_433,
    output := OriginalRow227TriangleData0654.coefficient43_433, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_435, Icur := OriginalRow227TriangleData0640.coefficient42_434,
    output := OriginalRow227TriangleData0654.coefficient43_434, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_436, Icur := OriginalRow227TriangleData0640.coefficient42_435,
    output := OriginalRow227TriangleData0654.coefficient43_435, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_437, Icur := OriginalRow227TriangleData0640.coefficient42_436,
    output := OriginalRow227TriangleData0654.coefficient43_436, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_438, Icur := OriginalRow227TriangleData0640.coefficient42_437,
    output := OriginalRow227TriangleData0654.coefficient43_437, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_439, Icur := OriginalRow227TriangleData0640.coefficient42_438,
    output := OriginalRow227TriangleData0654.coefficient43_438, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_440, Icur := OriginalRow227TriangleData0640.coefficient42_439,
    output := OriginalRow227TriangleData0654.coefficient43_439, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_441, Icur := OriginalRow227TriangleData0640.coefficient42_440,
    output := OriginalRow227TriangleData0654.coefficient43_440, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_442, Icur := OriginalRow227TriangleData0640.coefficient42_441,
    output := OriginalRow227TriangleData0654.coefficient43_441, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_443, Icur := OriginalRow227TriangleData0640.coefficient42_442,
    output := OriginalRow227TriangleData0654.coefficient43_442, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_444, Icur := OriginalRow227TriangleData0640.coefficient42_443,
    output := OriginalRow227TriangleData0654.coefficient43_443, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_445, Icur := OriginalRow227TriangleData0640.coefficient42_444,
    output := OriginalRow227TriangleData0654.coefficient43_444, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_446, Icur := OriginalRow227TriangleData0640.coefficient42_445,
    output := OriginalRow227TriangleData0654.coefficient43_445, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_447, Icur := OriginalRow227TriangleData0640.coefficient42_446,
    output := OriginalRow227TriangleData0654.coefficient43_446, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_448, Icur := OriginalRow227TriangleData0640.coefficient42_447,
    output := OriginalRow227TriangleData0654.coefficient43_447, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_449, Icur := OriginalRow227TriangleData0640.coefficient42_448,
    output := OriginalRow227TriangleData0654.coefficient43_448, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_450, Icur := OriginalRow227TriangleData0640.coefficient42_449,
    output := OriginalRow227TriangleData0654.coefficient43_449, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_451, Icur := OriginalRow227TriangleData0640.coefficient42_450,
    output := OriginalRow227TriangleData0654.coefficient43_450, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_452, Icur := OriginalRow227TriangleData0640.coefficient42_451,
    output := OriginalRow227TriangleData0654.coefficient43_451, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_453, Icur := OriginalRow227TriangleData0640.coefficient42_452,
    output := OriginalRow227TriangleData0654.coefficient43_452, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_454, Icur := OriginalRow227TriangleData0640.coefficient42_453,
    output := OriginalRow227TriangleData0654.coefficient43_453, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_455, Icur := OriginalRow227TriangleData0640.coefficient42_454,
    output := OriginalRow227TriangleData0654.coefficient43_454, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0640.coefficient42_456, Icur := OriginalRow227TriangleData0640.coefficient42_455,
    output := OriginalRow227TriangleData0654.coefficient43_455, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0641.coefficient42_457, Icur := OriginalRow227TriangleData0640.coefficient42_456,
    output := OriginalRow227TriangleData0654.coefficient43_456, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0641.coefficient42_458, Icur := OriginalRow227TriangleData0641.coefficient42_457,
    output := OriginalRow227TriangleData0654.coefficient43_457, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0638

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0638.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
