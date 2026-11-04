import Grothe.UpperChaos.OriginalRow227TriangleData0720
import Grothe.UpperChaos.OriginalRow227TriangleData0733
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0717
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_433, Icur := OriginalRow227TriangleData0720.coefficient48_432,
    output := OriginalRow227TriangleData0733.coefficient49_432, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_434, Icur := OriginalRow227TriangleData0720.coefficient48_433,
    output := OriginalRow227TriangleData0733.coefficient49_433, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_435, Icur := OriginalRow227TriangleData0720.coefficient48_434,
    output := OriginalRow227TriangleData0733.coefficient49_434, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_436, Icur := OriginalRow227TriangleData0720.coefficient48_435,
    output := OriginalRow227TriangleData0733.coefficient49_435, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_437, Icur := OriginalRow227TriangleData0720.coefficient48_436,
    output := OriginalRow227TriangleData0733.coefficient49_436, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_438, Icur := OriginalRow227TriangleData0720.coefficient48_437,
    output := OriginalRow227TriangleData0733.coefficient49_437, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_439, Icur := OriginalRow227TriangleData0720.coefficient48_438,
    output := OriginalRow227TriangleData0733.coefficient49_438, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_440, Icur := OriginalRow227TriangleData0720.coefficient48_439,
    output := OriginalRow227TriangleData0733.coefficient49_439, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_441, Icur := OriginalRow227TriangleData0720.coefficient48_440,
    output := OriginalRow227TriangleData0733.coefficient49_440, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_442, Icur := OriginalRow227TriangleData0720.coefficient48_441,
    output := OriginalRow227TriangleData0733.coefficient49_441, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_443, Icur := OriginalRow227TriangleData0720.coefficient48_442,
    output := OriginalRow227TriangleData0733.coefficient49_442, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_444, Icur := OriginalRow227TriangleData0720.coefficient48_443,
    output := OriginalRow227TriangleData0733.coefficient49_443, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_445, Icur := OriginalRow227TriangleData0720.coefficient48_444,
    output := OriginalRow227TriangleData0733.coefficient49_444, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_446, Icur := OriginalRow227TriangleData0720.coefficient48_445,
    output := OriginalRow227TriangleData0733.coefficient49_445, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_447, Icur := OriginalRow227TriangleData0720.coefficient48_446,
    output := OriginalRow227TriangleData0733.coefficient49_446, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_448, Icur := OriginalRow227TriangleData0720.coefficient48_447,
    output := OriginalRow227TriangleData0733.coefficient49_447, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_449, Icur := OriginalRow227TriangleData0720.coefficient48_448,
    output := OriginalRow227TriangleData0733.coefficient49_448, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_450, Icur := OriginalRow227TriangleData0720.coefficient48_449,
    output := OriginalRow227TriangleData0733.coefficient49_449, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_451, Icur := OriginalRow227TriangleData0720.coefficient48_450,
    output := OriginalRow227TriangleData0733.coefficient49_450, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_452, Icur := OriginalRow227TriangleData0720.coefficient48_451,
    output := OriginalRow227TriangleData0733.coefficient49_451, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0720.coefficient48_453, Icur := OriginalRow227TriangleData0720.coefficient48_452,
    output := OriginalRow227TriangleData0733.coefficient49_452, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0717

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0717.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
