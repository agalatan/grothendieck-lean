import Grothe.UpperChaos.OriginalRow227RatioData15
import Grothe.UpperChaos.OriginalRow227TriangleData0015
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero15
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[0]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root481,
    IU := OriginalRow227TriangleData0015.coefficient0_480, next := OriginalRow227TriangleData0015.coefficient0_481, hS := OriginalRow227TriangleRoots15.root481_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[1]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root482,
    IU := OriginalRow227TriangleData0015.coefficient0_481, next := OriginalRow227TriangleData0015.coefficient0_482, hS := OriginalRow227TriangleRoots15.root482_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[2]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root483,
    IU := OriginalRow227TriangleData0015.coefficient0_482, next := OriginalRow227TriangleData0015.coefficient0_483, hS := OriginalRow227TriangleRoots15.root483_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[3]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root484,
    IU := OriginalRow227TriangleData0015.coefficient0_483, next := OriginalRow227TriangleData0015.coefficient0_484, hS := OriginalRow227TriangleRoots15.root484_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[4]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root485,
    IU := OriginalRow227TriangleData0015.coefficient0_484, next := OriginalRow227TriangleData0015.coefficient0_485, hS := OriginalRow227TriangleRoots15.root485_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[5]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root486,
    IU := OriginalRow227TriangleData0015.coefficient0_485, next := OriginalRow227TriangleData0015.coefficient0_486, hS := OriginalRow227TriangleRoots15.root486_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[6]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root487,
    IU := OriginalRow227TriangleData0015.coefficient0_486, next := OriginalRow227TriangleData0015.coefficient0_487, hS := OriginalRow227TriangleRoots15.root487_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[7]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root488,
    IU := OriginalRow227TriangleData0015.coefficient0_487, next := OriginalRow227TriangleData0015.coefficient0_488, hS := OriginalRow227TriangleRoots15.root488_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[8]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root489,
    IU := OriginalRow227TriangleData0015.coefficient0_488, next := OriginalRow227TriangleData0015.coefficient0_489, hS := OriginalRow227TriangleRoots15.root489_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[9]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root490,
    IU := OriginalRow227TriangleData0015.coefficient0_489, next := OriginalRow227TriangleData0015.coefficient0_490, hS := OriginalRow227TriangleRoots15.root490_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[10]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root491,
    IU := OriginalRow227TriangleData0015.coefficient0_490, next := OriginalRow227TriangleData0015.coefficient0_491, hS := OriginalRow227TriangleRoots15.root491_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[11]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root492,
    IU := OriginalRow227TriangleData0015.coefficient0_491, next := OriginalRow227TriangleData0015.coefficient0_492, hS := OriginalRow227TriangleRoots15.root492_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[12]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root493,
    IU := OriginalRow227TriangleData0015.coefficient0_492, next := OriginalRow227TriangleData0015.coefficient0_493, hS := OriginalRow227TriangleRoots15.root493_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[13]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root494,
    IU := OriginalRow227TriangleData0015.coefficient0_493, next := OriginalRow227TriangleData0015.coefficient0_494, hS := OriginalRow227TriangleRoots15.root494_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[14]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root495,
    IU := OriginalRow227TriangleData0015.coefficient0_494, next := OriginalRow227TriangleData0015.coefficient0_495, hS := OriginalRow227TriangleRoots15.root495_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[15]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root496,
    IU := OriginalRow227TriangleData0015.coefficient0_495, next := OriginalRow227TriangleData0015.coefficient0_496, hS := OriginalRow227TriangleRoots15.root496_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[16]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root497,
    IU := OriginalRow227TriangleData0015.coefficient0_496, next := OriginalRow227TriangleData0015.coefficient0_497, hS := OriginalRow227TriangleRoots15.root497_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[17]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root498,
    IU := OriginalRow227TriangleData0015.coefficient0_497, next := OriginalRow227TriangleData0015.coefficient0_498, hS := OriginalRow227TriangleRoots15.root498_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[18]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root499,
    IU := OriginalRow227TriangleData0015.coefficient0_498, next := OriginalRow227TriangleData0015.coefficient0_499, hS := OriginalRow227TriangleRoots15.root499_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[19]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root500,
    IU := OriginalRow227TriangleData0015.coefficient0_499, next := OriginalRow227TriangleData0015.coefficient0_500, hS := OriginalRow227TriangleRoots15.root500_pos },
  { IA := shift, IR := (OriginalRow227RatioData15.checkpoints[20]'(by rw [OriginalRow227RatioData15.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots15.root501,
    IU := OriginalRow227TriangleData0015.coefficient0_500, next := OriginalRow227TriangleData0015.coefficient0_501, hS := OriginalRow227TriangleRoots15.root501_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero15

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero15.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
