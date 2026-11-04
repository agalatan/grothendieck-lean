import Grothe.UpperChaos.OriginalRow227TriangleData0125
import Grothe.UpperChaos.OriginalRow227TriangleData0126
import Grothe.UpperChaos.OriginalRow227TriangleData0141
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0125
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_424, Icur := OriginalRow227TriangleData0125.coefficient7_423,
    output := OriginalRow227TriangleData0141.coefficient8_423, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_425, Icur := OriginalRow227TriangleData0125.coefficient7_424,
    output := OriginalRow227TriangleData0141.coefficient8_424, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_426, Icur := OriginalRow227TriangleData0125.coefficient7_425,
    output := OriginalRow227TriangleData0141.coefficient8_425, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_427, Icur := OriginalRow227TriangleData0125.coefficient7_426,
    output := OriginalRow227TriangleData0141.coefficient8_426, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_428, Icur := OriginalRow227TriangleData0125.coefficient7_427,
    output := OriginalRow227TriangleData0141.coefficient8_427, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_429, Icur := OriginalRow227TriangleData0125.coefficient7_428,
    output := OriginalRow227TriangleData0141.coefficient8_428, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_430, Icur := OriginalRow227TriangleData0125.coefficient7_429,
    output := OriginalRow227TriangleData0141.coefficient8_429, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_431, Icur := OriginalRow227TriangleData0125.coefficient7_430,
    output := OriginalRow227TriangleData0141.coefficient8_430, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_432, Icur := OriginalRow227TriangleData0125.coefficient7_431,
    output := OriginalRow227TriangleData0141.coefficient8_431, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_433, Icur := OriginalRow227TriangleData0125.coefficient7_432,
    output := OriginalRow227TriangleData0141.coefficient8_432, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_434, Icur := OriginalRow227TriangleData0125.coefficient7_433,
    output := OriginalRow227TriangleData0141.coefficient8_433, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_435, Icur := OriginalRow227TriangleData0125.coefficient7_434,
    output := OriginalRow227TriangleData0141.coefficient8_434, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_436, Icur := OriginalRow227TriangleData0125.coefficient7_435,
    output := OriginalRow227TriangleData0141.coefficient8_435, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_437, Icur := OriginalRow227TriangleData0125.coefficient7_436,
    output := OriginalRow227TriangleData0141.coefficient8_436, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_438, Icur := OriginalRow227TriangleData0125.coefficient7_437,
    output := OriginalRow227TriangleData0141.coefficient8_437, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_439, Icur := OriginalRow227TriangleData0125.coefficient7_438,
    output := OriginalRow227TriangleData0141.coefficient8_438, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_440, Icur := OriginalRow227TriangleData0125.coefficient7_439,
    output := OriginalRow227TriangleData0141.coefficient8_439, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_441, Icur := OriginalRow227TriangleData0125.coefficient7_440,
    output := OriginalRow227TriangleData0141.coefficient8_440, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_442, Icur := OriginalRow227TriangleData0125.coefficient7_441,
    output := OriginalRow227TriangleData0141.coefficient8_441, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_443, Icur := OriginalRow227TriangleData0125.coefficient7_442,
    output := OriginalRow227TriangleData0141.coefficient8_442, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_444, Icur := OriginalRow227TriangleData0125.coefficient7_443,
    output := OriginalRow227TriangleData0141.coefficient8_443, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_445, Icur := OriginalRow227TriangleData0125.coefficient7_444,
    output := OriginalRow227TriangleData0141.coefficient8_444, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_446, Icur := OriginalRow227TriangleData0125.coefficient7_445,
    output := OriginalRow227TriangleData0141.coefficient8_445, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_447, Icur := OriginalRow227TriangleData0125.coefficient7_446,
    output := OriginalRow227TriangleData0141.coefficient8_446, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_448, Icur := OriginalRow227TriangleData0125.coefficient7_447,
    output := OriginalRow227TriangleData0141.coefficient8_447, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_449, Icur := OriginalRow227TriangleData0125.coefficient7_448,
    output := OriginalRow227TriangleData0141.coefficient8_448, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_450, Icur := OriginalRow227TriangleData0125.coefficient7_449,
    output := OriginalRow227TriangleData0141.coefficient8_449, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_451, Icur := OriginalRow227TriangleData0125.coefficient7_450,
    output := OriginalRow227TriangleData0141.coefficient8_450, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_452, Icur := OriginalRow227TriangleData0125.coefficient7_451,
    output := OriginalRow227TriangleData0141.coefficient8_451, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0125.coefficient7_453, Icur := OriginalRow227TriangleData0125.coefficient7_452,
    output := OriginalRow227TriangleData0141.coefficient8_452, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0126.coefficient7_454, Icur := OriginalRow227TriangleData0125.coefficient7_453,
    output := OriginalRow227TriangleData0141.coefficient8_453, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0126.coefficient7_455, Icur := OriginalRow227TriangleData0126.coefficient7_454,
    output := OriginalRow227TriangleData0141.coefficient8_454, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0125

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0125.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
