import Grothe.UpperChaos.OriginalRow227TriangleData0280
import Grothe.UpperChaos.OriginalRow227TriangleData0281
import Grothe.UpperChaos.OriginalRow227TriangleData0295
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0279
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_434, Icur := OriginalRow227TriangleData0280.coefficient17_433,
    output := OriginalRow227TriangleData0295.coefficient18_433, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_435, Icur := OriginalRow227TriangleData0280.coefficient17_434,
    output := OriginalRow227TriangleData0295.coefficient18_434, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_436, Icur := OriginalRow227TriangleData0280.coefficient17_435,
    output := OriginalRow227TriangleData0295.coefficient18_435, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_437, Icur := OriginalRow227TriangleData0280.coefficient17_436,
    output := OriginalRow227TriangleData0295.coefficient18_436, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_438, Icur := OriginalRow227TriangleData0280.coefficient17_437,
    output := OriginalRow227TriangleData0295.coefficient18_437, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_439, Icur := OriginalRow227TriangleData0280.coefficient17_438,
    output := OriginalRow227TriangleData0295.coefficient18_438, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_440, Icur := OriginalRow227TriangleData0280.coefficient17_439,
    output := OriginalRow227TriangleData0295.coefficient18_439, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_441, Icur := OriginalRow227TriangleData0280.coefficient17_440,
    output := OriginalRow227TriangleData0295.coefficient18_440, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_442, Icur := OriginalRow227TriangleData0280.coefficient17_441,
    output := OriginalRow227TriangleData0295.coefficient18_441, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_443, Icur := OriginalRow227TriangleData0280.coefficient17_442,
    output := OriginalRow227TriangleData0295.coefficient18_442, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_444, Icur := OriginalRow227TriangleData0280.coefficient17_443,
    output := OriginalRow227TriangleData0295.coefficient18_443, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_445, Icur := OriginalRow227TriangleData0280.coefficient17_444,
    output := OriginalRow227TriangleData0295.coefficient18_444, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_446, Icur := OriginalRow227TriangleData0280.coefficient17_445,
    output := OriginalRow227TriangleData0295.coefficient18_445, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_447, Icur := OriginalRow227TriangleData0280.coefficient17_446,
    output := OriginalRow227TriangleData0295.coefficient18_446, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_448, Icur := OriginalRow227TriangleData0280.coefficient17_447,
    output := OriginalRow227TriangleData0295.coefficient18_447, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_449, Icur := OriginalRow227TriangleData0280.coefficient17_448,
    output := OriginalRow227TriangleData0295.coefficient18_448, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_450, Icur := OriginalRow227TriangleData0280.coefficient17_449,
    output := OriginalRow227TriangleData0295.coefficient18_449, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_451, Icur := OriginalRow227TriangleData0280.coefficient17_450,
    output := OriginalRow227TriangleData0295.coefficient18_450, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_452, Icur := OriginalRow227TriangleData0280.coefficient17_451,
    output := OriginalRow227TriangleData0295.coefficient18_451, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_453, Icur := OriginalRow227TriangleData0280.coefficient17_452,
    output := OriginalRow227TriangleData0295.coefficient18_452, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_454, Icur := OriginalRow227TriangleData0280.coefficient17_453,
    output := OriginalRow227TriangleData0295.coefficient18_453, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_455, Icur := OriginalRow227TriangleData0280.coefficient17_454,
    output := OriginalRow227TriangleData0295.coefficient18_454, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_456, Icur := OriginalRow227TriangleData0280.coefficient17_455,
    output := OriginalRow227TriangleData0295.coefficient18_455, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_457, Icur := OriginalRow227TriangleData0280.coefficient17_456,
    output := OriginalRow227TriangleData0295.coefficient18_456, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_458, Icur := OriginalRow227TriangleData0280.coefficient17_457,
    output := OriginalRow227TriangleData0295.coefficient18_457, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_459, Icur := OriginalRow227TriangleData0280.coefficient17_458,
    output := OriginalRow227TriangleData0295.coefficient18_458, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_460, Icur := OriginalRow227TriangleData0280.coefficient17_459,
    output := OriginalRow227TriangleData0295.coefficient18_459, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_461, Icur := OriginalRow227TriangleData0280.coefficient17_460,
    output := OriginalRow227TriangleData0295.coefficient18_460, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_462, Icur := OriginalRow227TriangleData0280.coefficient17_461,
    output := OriginalRow227TriangleData0295.coefficient18_461, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0280.coefficient17_463, Icur := OriginalRow227TriangleData0280.coefficient17_462,
    output := OriginalRow227TriangleData0295.coefficient18_462, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_464, Icur := OriginalRow227TriangleData0280.coefficient17_463,
    output := OriginalRow227TriangleData0295.coefficient18_463, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_465, Icur := OriginalRow227TriangleData0281.coefficient17_464,
    output := OriginalRow227TriangleData0295.coefficient18_464, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0279

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0279.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
