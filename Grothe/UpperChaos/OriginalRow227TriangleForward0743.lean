import Grothe.UpperChaos.OriginalRow227TriangleData0746
import Grothe.UpperChaos.OriginalRow227TriangleData0759
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0743
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_435, Icur := OriginalRow227TriangleData0746.coefficient50_434,
    output := OriginalRow227TriangleData0759.coefficient51_434, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_436, Icur := OriginalRow227TriangleData0746.coefficient50_435,
    output := OriginalRow227TriangleData0759.coefficient51_435, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_437, Icur := OriginalRow227TriangleData0746.coefficient50_436,
    output := OriginalRow227TriangleData0759.coefficient51_436, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_438, Icur := OriginalRow227TriangleData0746.coefficient50_437,
    output := OriginalRow227TriangleData0759.coefficient51_437, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_439, Icur := OriginalRow227TriangleData0746.coefficient50_438,
    output := OriginalRow227TriangleData0759.coefficient51_438, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_440, Icur := OriginalRow227TriangleData0746.coefficient50_439,
    output := OriginalRow227TriangleData0759.coefficient51_439, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_441, Icur := OriginalRow227TriangleData0746.coefficient50_440,
    output := OriginalRow227TriangleData0759.coefficient51_440, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_442, Icur := OriginalRow227TriangleData0746.coefficient50_441,
    output := OriginalRow227TriangleData0759.coefficient51_441, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_443, Icur := OriginalRow227TriangleData0746.coefficient50_442,
    output := OriginalRow227TriangleData0759.coefficient51_442, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_444, Icur := OriginalRow227TriangleData0746.coefficient50_443,
    output := OriginalRow227TriangleData0759.coefficient51_443, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_445, Icur := OriginalRow227TriangleData0746.coefficient50_444,
    output := OriginalRow227TriangleData0759.coefficient51_444, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_446, Icur := OriginalRow227TriangleData0746.coefficient50_445,
    output := OriginalRow227TriangleData0759.coefficient51_445, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_447, Icur := OriginalRow227TriangleData0746.coefficient50_446,
    output := OriginalRow227TriangleData0759.coefficient51_446, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_448, Icur := OriginalRow227TriangleData0746.coefficient50_447,
    output := OriginalRow227TriangleData0759.coefficient51_447, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_449, Icur := OriginalRow227TriangleData0746.coefficient50_448,
    output := OriginalRow227TriangleData0759.coefficient51_448, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_450, Icur := OriginalRow227TriangleData0746.coefficient50_449,
    output := OriginalRow227TriangleData0759.coefficient51_449, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0746.coefficient50_451, Icur := OriginalRow227TriangleData0746.coefficient50_450,
    output := OriginalRow227TriangleData0759.coefficient51_450, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0743

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0743.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
