import Grothe.UpperChaos.OriginalRow227RatioData14
import Grothe.UpperChaos.OriginalRow227TriangleData0014
import Grothe.UpperChaos.OriginalRow227TriangleData0015
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero14
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[0]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root449,
    IU := OriginalRow227TriangleData0014.coefficient0_448, next := OriginalRow227TriangleData0014.coefficient0_449, hS := OriginalRow227TriangleRoots14.root449_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[1]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root450,
    IU := OriginalRow227TriangleData0014.coefficient0_449, next := OriginalRow227TriangleData0014.coefficient0_450, hS := OriginalRow227TriangleRoots14.root450_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[2]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root451,
    IU := OriginalRow227TriangleData0014.coefficient0_450, next := OriginalRow227TriangleData0014.coefficient0_451, hS := OriginalRow227TriangleRoots14.root451_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[3]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root452,
    IU := OriginalRow227TriangleData0014.coefficient0_451, next := OriginalRow227TriangleData0014.coefficient0_452, hS := OriginalRow227TriangleRoots14.root452_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[4]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root453,
    IU := OriginalRow227TriangleData0014.coefficient0_452, next := OriginalRow227TriangleData0014.coefficient0_453, hS := OriginalRow227TriangleRoots14.root453_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[5]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root454,
    IU := OriginalRow227TriangleData0014.coefficient0_453, next := OriginalRow227TriangleData0014.coefficient0_454, hS := OriginalRow227TriangleRoots14.root454_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[6]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root455,
    IU := OriginalRow227TriangleData0014.coefficient0_454, next := OriginalRow227TriangleData0014.coefficient0_455, hS := OriginalRow227TriangleRoots14.root455_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[7]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root456,
    IU := OriginalRow227TriangleData0014.coefficient0_455, next := OriginalRow227TriangleData0014.coefficient0_456, hS := OriginalRow227TriangleRoots14.root456_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[8]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root457,
    IU := OriginalRow227TriangleData0014.coefficient0_456, next := OriginalRow227TriangleData0014.coefficient0_457, hS := OriginalRow227TriangleRoots14.root457_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[9]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root458,
    IU := OriginalRow227TriangleData0014.coefficient0_457, next := OriginalRow227TriangleData0014.coefficient0_458, hS := OriginalRow227TriangleRoots14.root458_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[10]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root459,
    IU := OriginalRow227TriangleData0014.coefficient0_458, next := OriginalRow227TriangleData0014.coefficient0_459, hS := OriginalRow227TriangleRoots14.root459_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[11]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root460,
    IU := OriginalRow227TriangleData0014.coefficient0_459, next := OriginalRow227TriangleData0014.coefficient0_460, hS := OriginalRow227TriangleRoots14.root460_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[12]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root461,
    IU := OriginalRow227TriangleData0014.coefficient0_460, next := OriginalRow227TriangleData0014.coefficient0_461, hS := OriginalRow227TriangleRoots14.root461_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[13]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root462,
    IU := OriginalRow227TriangleData0014.coefficient0_461, next := OriginalRow227TriangleData0014.coefficient0_462, hS := OriginalRow227TriangleRoots14.root462_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[14]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root463,
    IU := OriginalRow227TriangleData0014.coefficient0_462, next := OriginalRow227TriangleData0014.coefficient0_463, hS := OriginalRow227TriangleRoots14.root463_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[15]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root464,
    IU := OriginalRow227TriangleData0014.coefficient0_463, next := OriginalRow227TriangleData0014.coefficient0_464, hS := OriginalRow227TriangleRoots14.root464_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[16]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root465,
    IU := OriginalRow227TriangleData0014.coefficient0_464, next := OriginalRow227TriangleData0014.coefficient0_465, hS := OriginalRow227TriangleRoots14.root465_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[17]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root466,
    IU := OriginalRow227TriangleData0014.coefficient0_465, next := OriginalRow227TriangleData0014.coefficient0_466, hS := OriginalRow227TriangleRoots14.root466_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[18]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root467,
    IU := OriginalRow227TriangleData0014.coefficient0_466, next := OriginalRow227TriangleData0014.coefficient0_467, hS := OriginalRow227TriangleRoots14.root467_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[19]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root468,
    IU := OriginalRow227TriangleData0014.coefficient0_467, next := OriginalRow227TriangleData0014.coefficient0_468, hS := OriginalRow227TriangleRoots14.root468_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[20]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root469,
    IU := OriginalRow227TriangleData0014.coefficient0_468, next := OriginalRow227TriangleData0014.coefficient0_469, hS := OriginalRow227TriangleRoots14.root469_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[21]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root470,
    IU := OriginalRow227TriangleData0014.coefficient0_469, next := OriginalRow227TriangleData0014.coefficient0_470, hS := OriginalRow227TriangleRoots14.root470_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[22]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root471,
    IU := OriginalRow227TriangleData0014.coefficient0_470, next := OriginalRow227TriangleData0014.coefficient0_471, hS := OriginalRow227TriangleRoots14.root471_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[23]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root472,
    IU := OriginalRow227TriangleData0014.coefficient0_471, next := OriginalRow227TriangleData0014.coefficient0_472, hS := OriginalRow227TriangleRoots14.root472_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[24]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root473,
    IU := OriginalRow227TriangleData0014.coefficient0_472, next := OriginalRow227TriangleData0014.coefficient0_473, hS := OriginalRow227TriangleRoots14.root473_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[25]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root474,
    IU := OriginalRow227TriangleData0014.coefficient0_473, next := OriginalRow227TriangleData0014.coefficient0_474, hS := OriginalRow227TriangleRoots14.root474_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[26]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root475,
    IU := OriginalRow227TriangleData0014.coefficient0_474, next := OriginalRow227TriangleData0014.coefficient0_475, hS := OriginalRow227TriangleRoots14.root475_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[27]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root476,
    IU := OriginalRow227TriangleData0014.coefficient0_475, next := OriginalRow227TriangleData0014.coefficient0_476, hS := OriginalRow227TriangleRoots14.root476_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[28]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root477,
    IU := OriginalRow227TriangleData0014.coefficient0_476, next := OriginalRow227TriangleData0014.coefficient0_477, hS := OriginalRow227TriangleRoots14.root477_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[29]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root478,
    IU := OriginalRow227TriangleData0014.coefficient0_477, next := OriginalRow227TriangleData0014.coefficient0_478, hS := OriginalRow227TriangleRoots14.root478_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[30]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root479,
    IU := OriginalRow227TriangleData0014.coefficient0_478, next := OriginalRow227TriangleData0014.coefficient0_479, hS := OriginalRow227TriangleRoots14.root479_pos },
  { IA := shift, IR := (OriginalRow227RatioData14.checkpoints[31]'(by rw [OriginalRow227RatioData14.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots14.root480,
    IU := OriginalRow227TriangleData0014.coefficient0_479, next := OriginalRow227TriangleData0015.coefficient0_480, hS := OriginalRow227TriangleRoots14.root480_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero14

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero14.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
