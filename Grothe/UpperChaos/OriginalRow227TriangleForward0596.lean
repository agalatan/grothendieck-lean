import Grothe.UpperChaos.OriginalRow227TriangleData0598
import Grothe.UpperChaos.OriginalRow227TriangleData0599
import Grothe.UpperChaos.OriginalRow227TriangleData0612
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0596
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_424, Icur := OriginalRow227TriangleData0598.coefficient39_423,
    output := OriginalRow227TriangleData0612.coefficient40_423, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_425, Icur := OriginalRow227TriangleData0598.coefficient39_424,
    output := OriginalRow227TriangleData0612.coefficient40_424, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_426, Icur := OriginalRow227TriangleData0598.coefficient39_425,
    output := OriginalRow227TriangleData0612.coefficient40_425, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_427, Icur := OriginalRow227TriangleData0598.coefficient39_426,
    output := OriginalRow227TriangleData0612.coefficient40_426, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_428, Icur := OriginalRow227TriangleData0598.coefficient39_427,
    output := OriginalRow227TriangleData0612.coefficient40_427, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_429, Icur := OriginalRow227TriangleData0598.coefficient39_428,
    output := OriginalRow227TriangleData0612.coefficient40_428, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_430, Icur := OriginalRow227TriangleData0598.coefficient39_429,
    output := OriginalRow227TriangleData0612.coefficient40_429, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_431, Icur := OriginalRow227TriangleData0598.coefficient39_430,
    output := OriginalRow227TriangleData0612.coefficient40_430, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_432, Icur := OriginalRow227TriangleData0598.coefficient39_431,
    output := OriginalRow227TriangleData0612.coefficient40_431, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_433, Icur := OriginalRow227TriangleData0598.coefficient39_432,
    output := OriginalRow227TriangleData0612.coefficient40_432, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_434, Icur := OriginalRow227TriangleData0598.coefficient39_433,
    output := OriginalRow227TriangleData0612.coefficient40_433, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_435, Icur := OriginalRow227TriangleData0598.coefficient39_434,
    output := OriginalRow227TriangleData0612.coefficient40_434, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_436, Icur := OriginalRow227TriangleData0598.coefficient39_435,
    output := OriginalRow227TriangleData0612.coefficient40_435, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_437, Icur := OriginalRow227TriangleData0598.coefficient39_436,
    output := OriginalRow227TriangleData0612.coefficient40_436, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_438, Icur := OriginalRow227TriangleData0598.coefficient39_437,
    output := OriginalRow227TriangleData0612.coefficient40_437, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_439, Icur := OriginalRow227TriangleData0598.coefficient39_438,
    output := OriginalRow227TriangleData0612.coefficient40_438, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_440, Icur := OriginalRow227TriangleData0598.coefficient39_439,
    output := OriginalRow227TriangleData0612.coefficient40_439, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_441, Icur := OriginalRow227TriangleData0598.coefficient39_440,
    output := OriginalRow227TriangleData0612.coefficient40_440, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_442, Icur := OriginalRow227TriangleData0598.coefficient39_441,
    output := OriginalRow227TriangleData0612.coefficient40_441, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_443, Icur := OriginalRow227TriangleData0598.coefficient39_442,
    output := OriginalRow227TriangleData0612.coefficient40_442, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_444, Icur := OriginalRow227TriangleData0598.coefficient39_443,
    output := OriginalRow227TriangleData0612.coefficient40_443, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_445, Icur := OriginalRow227TriangleData0598.coefficient39_444,
    output := OriginalRow227TriangleData0612.coefficient40_444, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_446, Icur := OriginalRow227TriangleData0598.coefficient39_445,
    output := OriginalRow227TriangleData0612.coefficient40_445, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_447, Icur := OriginalRow227TriangleData0598.coefficient39_446,
    output := OriginalRow227TriangleData0612.coefficient40_446, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_448, Icur := OriginalRow227TriangleData0598.coefficient39_447,
    output := OriginalRow227TriangleData0612.coefficient40_447, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_449, Icur := OriginalRow227TriangleData0598.coefficient39_448,
    output := OriginalRow227TriangleData0612.coefficient40_448, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_450, Icur := OriginalRow227TriangleData0598.coefficient39_449,
    output := OriginalRow227TriangleData0612.coefficient40_449, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_451, Icur := OriginalRow227TriangleData0598.coefficient39_450,
    output := OriginalRow227TriangleData0612.coefficient40_450, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_452, Icur := OriginalRow227TriangleData0598.coefficient39_451,
    output := OriginalRow227TriangleData0612.coefficient40_451, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0598.coefficient39_453, Icur := OriginalRow227TriangleData0598.coefficient39_452,
    output := OriginalRow227TriangleData0612.coefficient40_452, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_454, Icur := OriginalRow227TriangleData0598.coefficient39_453,
    output := OriginalRow227TriangleData0612.coefficient40_453, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_455, Icur := OriginalRow227TriangleData0599.coefficient39_454,
    output := OriginalRow227TriangleData0612.coefficient40_454, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0596

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0596.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
