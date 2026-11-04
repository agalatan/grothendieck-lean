import Grothe.UpperChaos.OriginalRow227RatioData13
import Grothe.UpperChaos.OriginalRow227TriangleData0013
import Grothe.UpperChaos.OriginalRow227TriangleData0014
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero13
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[0]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root417,
    IU := OriginalRow227TriangleData0013.coefficient0_416, next := OriginalRow227TriangleData0013.coefficient0_417, hS := OriginalRow227TriangleRoots13.root417_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[1]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root418,
    IU := OriginalRow227TriangleData0013.coefficient0_417, next := OriginalRow227TriangleData0013.coefficient0_418, hS := OriginalRow227TriangleRoots13.root418_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[2]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root419,
    IU := OriginalRow227TriangleData0013.coefficient0_418, next := OriginalRow227TriangleData0013.coefficient0_419, hS := OriginalRow227TriangleRoots13.root419_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[3]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root420,
    IU := OriginalRow227TriangleData0013.coefficient0_419, next := OriginalRow227TriangleData0013.coefficient0_420, hS := OriginalRow227TriangleRoots13.root420_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[4]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root421,
    IU := OriginalRow227TriangleData0013.coefficient0_420, next := OriginalRow227TriangleData0013.coefficient0_421, hS := OriginalRow227TriangleRoots13.root421_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[5]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root422,
    IU := OriginalRow227TriangleData0013.coefficient0_421, next := OriginalRow227TriangleData0013.coefficient0_422, hS := OriginalRow227TriangleRoots13.root422_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[6]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root423,
    IU := OriginalRow227TriangleData0013.coefficient0_422, next := OriginalRow227TriangleData0013.coefficient0_423, hS := OriginalRow227TriangleRoots13.root423_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[7]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root424,
    IU := OriginalRow227TriangleData0013.coefficient0_423, next := OriginalRow227TriangleData0013.coefficient0_424, hS := OriginalRow227TriangleRoots13.root424_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[8]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root425,
    IU := OriginalRow227TriangleData0013.coefficient0_424, next := OriginalRow227TriangleData0013.coefficient0_425, hS := OriginalRow227TriangleRoots13.root425_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[9]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root426,
    IU := OriginalRow227TriangleData0013.coefficient0_425, next := OriginalRow227TriangleData0013.coefficient0_426, hS := OriginalRow227TriangleRoots13.root426_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[10]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root427,
    IU := OriginalRow227TriangleData0013.coefficient0_426, next := OriginalRow227TriangleData0013.coefficient0_427, hS := OriginalRow227TriangleRoots13.root427_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[11]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root428,
    IU := OriginalRow227TriangleData0013.coefficient0_427, next := OriginalRow227TriangleData0013.coefficient0_428, hS := OriginalRow227TriangleRoots13.root428_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[12]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root429,
    IU := OriginalRow227TriangleData0013.coefficient0_428, next := OriginalRow227TriangleData0013.coefficient0_429, hS := OriginalRow227TriangleRoots13.root429_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[13]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root430,
    IU := OriginalRow227TriangleData0013.coefficient0_429, next := OriginalRow227TriangleData0013.coefficient0_430, hS := OriginalRow227TriangleRoots13.root430_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[14]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root431,
    IU := OriginalRow227TriangleData0013.coefficient0_430, next := OriginalRow227TriangleData0013.coefficient0_431, hS := OriginalRow227TriangleRoots13.root431_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[15]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root432,
    IU := OriginalRow227TriangleData0013.coefficient0_431, next := OriginalRow227TriangleData0013.coefficient0_432, hS := OriginalRow227TriangleRoots13.root432_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[16]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root433,
    IU := OriginalRow227TriangleData0013.coefficient0_432, next := OriginalRow227TriangleData0013.coefficient0_433, hS := OriginalRow227TriangleRoots13.root433_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[17]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root434,
    IU := OriginalRow227TriangleData0013.coefficient0_433, next := OriginalRow227TriangleData0013.coefficient0_434, hS := OriginalRow227TriangleRoots13.root434_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[18]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root435,
    IU := OriginalRow227TriangleData0013.coefficient0_434, next := OriginalRow227TriangleData0013.coefficient0_435, hS := OriginalRow227TriangleRoots13.root435_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[19]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root436,
    IU := OriginalRow227TriangleData0013.coefficient0_435, next := OriginalRow227TriangleData0013.coefficient0_436, hS := OriginalRow227TriangleRoots13.root436_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[20]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root437,
    IU := OriginalRow227TriangleData0013.coefficient0_436, next := OriginalRow227TriangleData0013.coefficient0_437, hS := OriginalRow227TriangleRoots13.root437_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[21]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root438,
    IU := OriginalRow227TriangleData0013.coefficient0_437, next := OriginalRow227TriangleData0013.coefficient0_438, hS := OriginalRow227TriangleRoots13.root438_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[22]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root439,
    IU := OriginalRow227TriangleData0013.coefficient0_438, next := OriginalRow227TriangleData0013.coefficient0_439, hS := OriginalRow227TriangleRoots13.root439_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[23]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root440,
    IU := OriginalRow227TriangleData0013.coefficient0_439, next := OriginalRow227TriangleData0013.coefficient0_440, hS := OriginalRow227TriangleRoots13.root440_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[24]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root441,
    IU := OriginalRow227TriangleData0013.coefficient0_440, next := OriginalRow227TriangleData0013.coefficient0_441, hS := OriginalRow227TriangleRoots13.root441_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[25]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root442,
    IU := OriginalRow227TriangleData0013.coefficient0_441, next := OriginalRow227TriangleData0013.coefficient0_442, hS := OriginalRow227TriangleRoots13.root442_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[26]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root443,
    IU := OriginalRow227TriangleData0013.coefficient0_442, next := OriginalRow227TriangleData0013.coefficient0_443, hS := OriginalRow227TriangleRoots13.root443_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[27]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root444,
    IU := OriginalRow227TriangleData0013.coefficient0_443, next := OriginalRow227TriangleData0013.coefficient0_444, hS := OriginalRow227TriangleRoots13.root444_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[28]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root445,
    IU := OriginalRow227TriangleData0013.coefficient0_444, next := OriginalRow227TriangleData0013.coefficient0_445, hS := OriginalRow227TriangleRoots13.root445_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[29]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root446,
    IU := OriginalRow227TriangleData0013.coefficient0_445, next := OriginalRow227TriangleData0013.coefficient0_446, hS := OriginalRow227TriangleRoots13.root446_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[30]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root447,
    IU := OriginalRow227TriangleData0013.coefficient0_446, next := OriginalRow227TriangleData0013.coefficient0_447, hS := OriginalRow227TriangleRoots13.root447_pos },
  { IA := shift, IR := (OriginalRow227RatioData13.checkpoints[31]'(by rw [OriginalRow227RatioData13.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots13.root448,
    IU := OriginalRow227TriangleData0013.coefficient0_447, next := OriginalRow227TriangleData0014.coefficient0_448, hS := OriginalRow227TriangleRoots13.root448_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero13

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero13.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
