import Grothe.UpperChaos.OriginalRow227TriangleData0694
import Grothe.UpperChaos.OriginalRow227TriangleData0707
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0691
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_431, Icur := OriginalRow227TriangleData0694.coefficient46_430,
    output := OriginalRow227TriangleData0707.coefficient47_430, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_432, Icur := OriginalRow227TriangleData0694.coefficient46_431,
    output := OriginalRow227TriangleData0707.coefficient47_431, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_433, Icur := OriginalRow227TriangleData0694.coefficient46_432,
    output := OriginalRow227TriangleData0707.coefficient47_432, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_434, Icur := OriginalRow227TriangleData0694.coefficient46_433,
    output := OriginalRow227TriangleData0707.coefficient47_433, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_435, Icur := OriginalRow227TriangleData0694.coefficient46_434,
    output := OriginalRow227TriangleData0707.coefficient47_434, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_436, Icur := OriginalRow227TriangleData0694.coefficient46_435,
    output := OriginalRow227TriangleData0707.coefficient47_435, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_437, Icur := OriginalRow227TriangleData0694.coefficient46_436,
    output := OriginalRow227TriangleData0707.coefficient47_436, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_438, Icur := OriginalRow227TriangleData0694.coefficient46_437,
    output := OriginalRow227TriangleData0707.coefficient47_437, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_439, Icur := OriginalRow227TriangleData0694.coefficient46_438,
    output := OriginalRow227TriangleData0707.coefficient47_438, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_440, Icur := OriginalRow227TriangleData0694.coefficient46_439,
    output := OriginalRow227TriangleData0707.coefficient47_439, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_441, Icur := OriginalRow227TriangleData0694.coefficient46_440,
    output := OriginalRow227TriangleData0707.coefficient47_440, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_442, Icur := OriginalRow227TriangleData0694.coefficient46_441,
    output := OriginalRow227TriangleData0707.coefficient47_441, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_443, Icur := OriginalRow227TriangleData0694.coefficient46_442,
    output := OriginalRow227TriangleData0707.coefficient47_442, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_444, Icur := OriginalRow227TriangleData0694.coefficient46_443,
    output := OriginalRow227TriangleData0707.coefficient47_443, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_445, Icur := OriginalRow227TriangleData0694.coefficient46_444,
    output := OriginalRow227TriangleData0707.coefficient47_444, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_446, Icur := OriginalRow227TriangleData0694.coefficient46_445,
    output := OriginalRow227TriangleData0707.coefficient47_445, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_447, Icur := OriginalRow227TriangleData0694.coefficient46_446,
    output := OriginalRow227TriangleData0707.coefficient47_446, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_448, Icur := OriginalRow227TriangleData0694.coefficient46_447,
    output := OriginalRow227TriangleData0707.coefficient47_447, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_449, Icur := OriginalRow227TriangleData0694.coefficient46_448,
    output := OriginalRow227TriangleData0707.coefficient47_448, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_450, Icur := OriginalRow227TriangleData0694.coefficient46_449,
    output := OriginalRow227TriangleData0707.coefficient47_449, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_451, Icur := OriginalRow227TriangleData0694.coefficient46_450,
    output := OriginalRow227TriangleData0707.coefficient47_450, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_452, Icur := OriginalRow227TriangleData0694.coefficient46_451,
    output := OriginalRow227TriangleData0707.coefficient47_451, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_453, Icur := OriginalRow227TriangleData0694.coefficient46_452,
    output := OriginalRow227TriangleData0707.coefficient47_452, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_454, Icur := OriginalRow227TriangleData0694.coefficient46_453,
    output := OriginalRow227TriangleData0707.coefficient47_453, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0694.coefficient46_455, Icur := OriginalRow227TriangleData0694.coefficient46_454,
    output := OriginalRow227TriangleData0707.coefficient47_454, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0691

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0691.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
