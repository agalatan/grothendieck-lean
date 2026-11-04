import Grothe.UpperChaos.OriginalRow227TriangleData0265
import Grothe.UpperChaos.OriginalRow227TriangleData0266
import Grothe.UpperChaos.OriginalRow227TriangleData0280
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0264
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_433, Icur := OriginalRow227TriangleData0265.coefficient16_432,
    output := OriginalRow227TriangleData0280.coefficient17_432, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_434, Icur := OriginalRow227TriangleData0265.coefficient16_433,
    output := OriginalRow227TriangleData0280.coefficient17_433, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_435, Icur := OriginalRow227TriangleData0265.coefficient16_434,
    output := OriginalRow227TriangleData0280.coefficient17_434, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_436, Icur := OriginalRow227TriangleData0265.coefficient16_435,
    output := OriginalRow227TriangleData0280.coefficient17_435, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_437, Icur := OriginalRow227TriangleData0265.coefficient16_436,
    output := OriginalRow227TriangleData0280.coefficient17_436, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_438, Icur := OriginalRow227TriangleData0265.coefficient16_437,
    output := OriginalRow227TriangleData0280.coefficient17_437, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_439, Icur := OriginalRow227TriangleData0265.coefficient16_438,
    output := OriginalRow227TriangleData0280.coefficient17_438, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_440, Icur := OriginalRow227TriangleData0265.coefficient16_439,
    output := OriginalRow227TriangleData0280.coefficient17_439, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_441, Icur := OriginalRow227TriangleData0265.coefficient16_440,
    output := OriginalRow227TriangleData0280.coefficient17_440, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_442, Icur := OriginalRow227TriangleData0265.coefficient16_441,
    output := OriginalRow227TriangleData0280.coefficient17_441, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_443, Icur := OriginalRow227TriangleData0265.coefficient16_442,
    output := OriginalRow227TriangleData0280.coefficient17_442, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_444, Icur := OriginalRow227TriangleData0265.coefficient16_443,
    output := OriginalRow227TriangleData0280.coefficient17_443, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_445, Icur := OriginalRow227TriangleData0265.coefficient16_444,
    output := OriginalRow227TriangleData0280.coefficient17_444, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_446, Icur := OriginalRow227TriangleData0265.coefficient16_445,
    output := OriginalRow227TriangleData0280.coefficient17_445, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_447, Icur := OriginalRow227TriangleData0265.coefficient16_446,
    output := OriginalRow227TriangleData0280.coefficient17_446, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_448, Icur := OriginalRow227TriangleData0265.coefficient16_447,
    output := OriginalRow227TriangleData0280.coefficient17_447, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_449, Icur := OriginalRow227TriangleData0265.coefficient16_448,
    output := OriginalRow227TriangleData0280.coefficient17_448, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_450, Icur := OriginalRow227TriangleData0265.coefficient16_449,
    output := OriginalRow227TriangleData0280.coefficient17_449, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_451, Icur := OriginalRow227TriangleData0265.coefficient16_450,
    output := OriginalRow227TriangleData0280.coefficient17_450, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_452, Icur := OriginalRow227TriangleData0265.coefficient16_451,
    output := OriginalRow227TriangleData0280.coefficient17_451, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_453, Icur := OriginalRow227TriangleData0265.coefficient16_452,
    output := OriginalRow227TriangleData0280.coefficient17_452, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_454, Icur := OriginalRow227TriangleData0265.coefficient16_453,
    output := OriginalRow227TriangleData0280.coefficient17_453, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_455, Icur := OriginalRow227TriangleData0265.coefficient16_454,
    output := OriginalRow227TriangleData0280.coefficient17_454, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_456, Icur := OriginalRow227TriangleData0265.coefficient16_455,
    output := OriginalRow227TriangleData0280.coefficient17_455, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_457, Icur := OriginalRow227TriangleData0265.coefficient16_456,
    output := OriginalRow227TriangleData0280.coefficient17_456, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_458, Icur := OriginalRow227TriangleData0265.coefficient16_457,
    output := OriginalRow227TriangleData0280.coefficient17_457, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_459, Icur := OriginalRow227TriangleData0265.coefficient16_458,
    output := OriginalRow227TriangleData0280.coefficient17_458, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_460, Icur := OriginalRow227TriangleData0265.coefficient16_459,
    output := OriginalRow227TriangleData0280.coefficient17_459, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_461, Icur := OriginalRow227TriangleData0265.coefficient16_460,
    output := OriginalRow227TriangleData0280.coefficient17_460, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0265.coefficient16_462, Icur := OriginalRow227TriangleData0265.coefficient16_461,
    output := OriginalRow227TriangleData0280.coefficient17_461, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_463, Icur := OriginalRow227TriangleData0265.coefficient16_462,
    output := OriginalRow227TriangleData0280.coefficient17_462, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_464, Icur := OriginalRow227TriangleData0266.coefficient16_463,
    output := OriginalRow227TriangleData0280.coefficient17_463, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0264

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0264.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
