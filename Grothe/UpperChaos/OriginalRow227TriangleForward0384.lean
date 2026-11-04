import Grothe.UpperChaos.OriginalRow227TriangleData0385
import Grothe.UpperChaos.OriginalRow227TriangleData0386
import Grothe.UpperChaos.OriginalRow227TriangleData0400
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0384
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_441, Icur := OriginalRow227TriangleData0385.coefficient24_440,
    output := OriginalRow227TriangleData0400.coefficient25_440, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_442, Icur := OriginalRow227TriangleData0385.coefficient24_441,
    output := OriginalRow227TriangleData0400.coefficient25_441, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_443, Icur := OriginalRow227TriangleData0385.coefficient24_442,
    output := OriginalRow227TriangleData0400.coefficient25_442, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_444, Icur := OriginalRow227TriangleData0385.coefficient24_443,
    output := OriginalRow227TriangleData0400.coefficient25_443, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_445, Icur := OriginalRow227TriangleData0385.coefficient24_444,
    output := OriginalRow227TriangleData0400.coefficient25_444, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_446, Icur := OriginalRow227TriangleData0385.coefficient24_445,
    output := OriginalRow227TriangleData0400.coefficient25_445, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_447, Icur := OriginalRow227TriangleData0385.coefficient24_446,
    output := OriginalRow227TriangleData0400.coefficient25_446, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_448, Icur := OriginalRow227TriangleData0385.coefficient24_447,
    output := OriginalRow227TriangleData0400.coefficient25_447, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_449, Icur := OriginalRow227TriangleData0385.coefficient24_448,
    output := OriginalRow227TriangleData0400.coefficient25_448, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_450, Icur := OriginalRow227TriangleData0385.coefficient24_449,
    output := OriginalRow227TriangleData0400.coefficient25_449, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_451, Icur := OriginalRow227TriangleData0385.coefficient24_450,
    output := OriginalRow227TriangleData0400.coefficient25_450, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_452, Icur := OriginalRow227TriangleData0385.coefficient24_451,
    output := OriginalRow227TriangleData0400.coefficient25_451, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_453, Icur := OriginalRow227TriangleData0385.coefficient24_452,
    output := OriginalRow227TriangleData0400.coefficient25_452, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_454, Icur := OriginalRow227TriangleData0385.coefficient24_453,
    output := OriginalRow227TriangleData0400.coefficient25_453, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_455, Icur := OriginalRow227TriangleData0385.coefficient24_454,
    output := OriginalRow227TriangleData0400.coefficient25_454, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_456, Icur := OriginalRow227TriangleData0385.coefficient24_455,
    output := OriginalRow227TriangleData0400.coefficient25_455, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_457, Icur := OriginalRow227TriangleData0385.coefficient24_456,
    output := OriginalRow227TriangleData0400.coefficient25_456, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_458, Icur := OriginalRow227TriangleData0385.coefficient24_457,
    output := OriginalRow227TriangleData0400.coefficient25_457, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_459, Icur := OriginalRow227TriangleData0385.coefficient24_458,
    output := OriginalRow227TriangleData0400.coefficient25_458, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_460, Icur := OriginalRow227TriangleData0385.coefficient24_459,
    output := OriginalRow227TriangleData0400.coefficient25_459, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_461, Icur := OriginalRow227TriangleData0385.coefficient24_460,
    output := OriginalRow227TriangleData0400.coefficient25_460, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_462, Icur := OriginalRow227TriangleData0385.coefficient24_461,
    output := OriginalRow227TriangleData0400.coefficient25_461, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_463, Icur := OriginalRow227TriangleData0385.coefficient24_462,
    output := OriginalRow227TriangleData0400.coefficient25_462, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_464, Icur := OriginalRow227TriangleData0385.coefficient24_463,
    output := OriginalRow227TriangleData0400.coefficient25_463, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_465, Icur := OriginalRow227TriangleData0385.coefficient24_464,
    output := OriginalRow227TriangleData0400.coefficient25_464, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_466, Icur := OriginalRow227TriangleData0385.coefficient24_465,
    output := OriginalRow227TriangleData0400.coefficient25_465, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_467, Icur := OriginalRow227TriangleData0385.coefficient24_466,
    output := OriginalRow227TriangleData0400.coefficient25_466, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_468, Icur := OriginalRow227TriangleData0385.coefficient24_467,
    output := OriginalRow227TriangleData0400.coefficient25_467, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_469, Icur := OriginalRow227TriangleData0385.coefficient24_468,
    output := OriginalRow227TriangleData0400.coefficient25_468, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0385.coefficient24_470, Icur := OriginalRow227TriangleData0385.coefficient24_469,
    output := OriginalRow227TriangleData0400.coefficient25_469, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_471, Icur := OriginalRow227TriangleData0385.coefficient24_470,
    output := OriginalRow227TriangleData0400.coefficient25_470, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0386.coefficient24_472, Icur := OriginalRow227TriangleData0386.coefficient24_471,
    output := OriginalRow227TriangleData0400.coefficient25_471, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0384

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0384.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
