import Grothe.UpperChaos.OriginalRow227TriangleData0355
import Grothe.UpperChaos.OriginalRow227TriangleData0356
import Grothe.UpperChaos.OriginalRow227TriangleData0370
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0354
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_439, Icur := OriginalRow227TriangleData0355.coefficient22_438,
    output := OriginalRow227TriangleData0370.coefficient23_438, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_440, Icur := OriginalRow227TriangleData0355.coefficient22_439,
    output := OriginalRow227TriangleData0370.coefficient23_439, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_441, Icur := OriginalRow227TriangleData0355.coefficient22_440,
    output := OriginalRow227TriangleData0370.coefficient23_440, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_442, Icur := OriginalRow227TriangleData0355.coefficient22_441,
    output := OriginalRow227TriangleData0370.coefficient23_441, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_443, Icur := OriginalRow227TriangleData0355.coefficient22_442,
    output := OriginalRow227TriangleData0370.coefficient23_442, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_444, Icur := OriginalRow227TriangleData0355.coefficient22_443,
    output := OriginalRow227TriangleData0370.coefficient23_443, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_445, Icur := OriginalRow227TriangleData0355.coefficient22_444,
    output := OriginalRow227TriangleData0370.coefficient23_444, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_446, Icur := OriginalRow227TriangleData0355.coefficient22_445,
    output := OriginalRow227TriangleData0370.coefficient23_445, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_447, Icur := OriginalRow227TriangleData0355.coefficient22_446,
    output := OriginalRow227TriangleData0370.coefficient23_446, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_448, Icur := OriginalRow227TriangleData0355.coefficient22_447,
    output := OriginalRow227TriangleData0370.coefficient23_447, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_449, Icur := OriginalRow227TriangleData0355.coefficient22_448,
    output := OriginalRow227TriangleData0370.coefficient23_448, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_450, Icur := OriginalRow227TriangleData0355.coefficient22_449,
    output := OriginalRow227TriangleData0370.coefficient23_449, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_451, Icur := OriginalRow227TriangleData0355.coefficient22_450,
    output := OriginalRow227TriangleData0370.coefficient23_450, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_452, Icur := OriginalRow227TriangleData0355.coefficient22_451,
    output := OriginalRow227TriangleData0370.coefficient23_451, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_453, Icur := OriginalRow227TriangleData0355.coefficient22_452,
    output := OriginalRow227TriangleData0370.coefficient23_452, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_454, Icur := OriginalRow227TriangleData0355.coefficient22_453,
    output := OriginalRow227TriangleData0370.coefficient23_453, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_455, Icur := OriginalRow227TriangleData0355.coefficient22_454,
    output := OriginalRow227TriangleData0370.coefficient23_454, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_456, Icur := OriginalRow227TriangleData0355.coefficient22_455,
    output := OriginalRow227TriangleData0370.coefficient23_455, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_457, Icur := OriginalRow227TriangleData0355.coefficient22_456,
    output := OriginalRow227TriangleData0370.coefficient23_456, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_458, Icur := OriginalRow227TriangleData0355.coefficient22_457,
    output := OriginalRow227TriangleData0370.coefficient23_457, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_459, Icur := OriginalRow227TriangleData0355.coefficient22_458,
    output := OriginalRow227TriangleData0370.coefficient23_458, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_460, Icur := OriginalRow227TriangleData0355.coefficient22_459,
    output := OriginalRow227TriangleData0370.coefficient23_459, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_461, Icur := OriginalRow227TriangleData0355.coefficient22_460,
    output := OriginalRow227TriangleData0370.coefficient23_460, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_462, Icur := OriginalRow227TriangleData0355.coefficient22_461,
    output := OriginalRow227TriangleData0370.coefficient23_461, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_463, Icur := OriginalRow227TriangleData0355.coefficient22_462,
    output := OriginalRow227TriangleData0370.coefficient23_462, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_464, Icur := OriginalRow227TriangleData0355.coefficient22_463,
    output := OriginalRow227TriangleData0370.coefficient23_463, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_465, Icur := OriginalRow227TriangleData0355.coefficient22_464,
    output := OriginalRow227TriangleData0370.coefficient23_464, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_466, Icur := OriginalRow227TriangleData0355.coefficient22_465,
    output := OriginalRow227TriangleData0370.coefficient23_465, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_467, Icur := OriginalRow227TriangleData0355.coefficient22_466,
    output := OriginalRow227TriangleData0370.coefficient23_466, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0355.coefficient22_468, Icur := OriginalRow227TriangleData0355.coefficient22_467,
    output := OriginalRow227TriangleData0370.coefficient23_467, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_469, Icur := OriginalRow227TriangleData0355.coefficient22_468,
    output := OriginalRow227TriangleData0370.coefficient23_468, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0356.coefficient22_470, Icur := OriginalRow227TriangleData0356.coefficient22_469,
    output := OriginalRow227TriangleData0370.coefficient23_469, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0354

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0354.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
