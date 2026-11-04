import Grothe.UpperChaos.OriginalRow227TriangleData0141
import Grothe.UpperChaos.OriginalRow227TriangleData0142
import Grothe.UpperChaos.OriginalRow227TriangleData0157
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0141
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_425, Icur := OriginalRow227TriangleData0141.coefficient8_424,
    output := OriginalRow227TriangleData0157.coefficient9_424, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_426, Icur := OriginalRow227TriangleData0141.coefficient8_425,
    output := OriginalRow227TriangleData0157.coefficient9_425, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_427, Icur := OriginalRow227TriangleData0141.coefficient8_426,
    output := OriginalRow227TriangleData0157.coefficient9_426, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_428, Icur := OriginalRow227TriangleData0141.coefficient8_427,
    output := OriginalRow227TriangleData0157.coefficient9_427, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_429, Icur := OriginalRow227TriangleData0141.coefficient8_428,
    output := OriginalRow227TriangleData0157.coefficient9_428, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_430, Icur := OriginalRow227TriangleData0141.coefficient8_429,
    output := OriginalRow227TriangleData0157.coefficient9_429, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_431, Icur := OriginalRow227TriangleData0141.coefficient8_430,
    output := OriginalRow227TriangleData0157.coefficient9_430, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_432, Icur := OriginalRow227TriangleData0141.coefficient8_431,
    output := OriginalRow227TriangleData0157.coefficient9_431, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_433, Icur := OriginalRow227TriangleData0141.coefficient8_432,
    output := OriginalRow227TriangleData0157.coefficient9_432, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_434, Icur := OriginalRow227TriangleData0141.coefficient8_433,
    output := OriginalRow227TriangleData0157.coefficient9_433, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_435, Icur := OriginalRow227TriangleData0141.coefficient8_434,
    output := OriginalRow227TriangleData0157.coefficient9_434, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_436, Icur := OriginalRow227TriangleData0141.coefficient8_435,
    output := OriginalRow227TriangleData0157.coefficient9_435, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_437, Icur := OriginalRow227TriangleData0141.coefficient8_436,
    output := OriginalRow227TriangleData0157.coefficient9_436, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_438, Icur := OriginalRow227TriangleData0141.coefficient8_437,
    output := OriginalRow227TriangleData0157.coefficient9_437, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_439, Icur := OriginalRow227TriangleData0141.coefficient8_438,
    output := OriginalRow227TriangleData0157.coefficient9_438, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_440, Icur := OriginalRow227TriangleData0141.coefficient8_439,
    output := OriginalRow227TriangleData0157.coefficient9_439, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_441, Icur := OriginalRow227TriangleData0141.coefficient8_440,
    output := OriginalRow227TriangleData0157.coefficient9_440, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_442, Icur := OriginalRow227TriangleData0141.coefficient8_441,
    output := OriginalRow227TriangleData0157.coefficient9_441, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_443, Icur := OriginalRow227TriangleData0141.coefficient8_442,
    output := OriginalRow227TriangleData0157.coefficient9_442, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_444, Icur := OriginalRow227TriangleData0141.coefficient8_443,
    output := OriginalRow227TriangleData0157.coefficient9_443, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_445, Icur := OriginalRow227TriangleData0141.coefficient8_444,
    output := OriginalRow227TriangleData0157.coefficient9_444, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_446, Icur := OriginalRow227TriangleData0141.coefficient8_445,
    output := OriginalRow227TriangleData0157.coefficient9_445, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_447, Icur := OriginalRow227TriangleData0141.coefficient8_446,
    output := OriginalRow227TriangleData0157.coefficient9_446, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_448, Icur := OriginalRow227TriangleData0141.coefficient8_447,
    output := OriginalRow227TriangleData0157.coefficient9_447, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_449, Icur := OriginalRow227TriangleData0141.coefficient8_448,
    output := OriginalRow227TriangleData0157.coefficient9_448, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_450, Icur := OriginalRow227TriangleData0141.coefficient8_449,
    output := OriginalRow227TriangleData0157.coefficient9_449, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_451, Icur := OriginalRow227TriangleData0141.coefficient8_450,
    output := OriginalRow227TriangleData0157.coefficient9_450, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_452, Icur := OriginalRow227TriangleData0141.coefficient8_451,
    output := OriginalRow227TriangleData0157.coefficient9_451, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_453, Icur := OriginalRow227TriangleData0141.coefficient8_452,
    output := OriginalRow227TriangleData0157.coefficient9_452, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0141.coefficient8_454, Icur := OriginalRow227TriangleData0141.coefficient8_453,
    output := OriginalRow227TriangleData0157.coefficient9_453, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_455, Icur := OriginalRow227TriangleData0141.coefficient8_454,
    output := OriginalRow227TriangleData0157.coefficient9_454, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_456, Icur := OriginalRow227TriangleData0142.coefficient8_455,
    output := OriginalRow227TriangleData0157.coefficient9_455, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0141

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0141.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
