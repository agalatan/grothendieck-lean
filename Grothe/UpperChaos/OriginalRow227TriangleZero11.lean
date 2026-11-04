import Grothe.UpperChaos.OriginalRow227RatioData11
import Grothe.UpperChaos.OriginalRow227TriangleData0011
import Grothe.UpperChaos.OriginalRow227TriangleData0012
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero11
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[0]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root353,
    IU := OriginalRow227TriangleData0011.coefficient0_352, next := OriginalRow227TriangleData0011.coefficient0_353, hS := OriginalRow227TriangleRoots11.root353_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[1]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root354,
    IU := OriginalRow227TriangleData0011.coefficient0_353, next := OriginalRow227TriangleData0011.coefficient0_354, hS := OriginalRow227TriangleRoots11.root354_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[2]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root355,
    IU := OriginalRow227TriangleData0011.coefficient0_354, next := OriginalRow227TriangleData0011.coefficient0_355, hS := OriginalRow227TriangleRoots11.root355_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[3]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root356,
    IU := OriginalRow227TriangleData0011.coefficient0_355, next := OriginalRow227TriangleData0011.coefficient0_356, hS := OriginalRow227TriangleRoots11.root356_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[4]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root357,
    IU := OriginalRow227TriangleData0011.coefficient0_356, next := OriginalRow227TriangleData0011.coefficient0_357, hS := OriginalRow227TriangleRoots11.root357_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[5]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root358,
    IU := OriginalRow227TriangleData0011.coefficient0_357, next := OriginalRow227TriangleData0011.coefficient0_358, hS := OriginalRow227TriangleRoots11.root358_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[6]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root359,
    IU := OriginalRow227TriangleData0011.coefficient0_358, next := OriginalRow227TriangleData0011.coefficient0_359, hS := OriginalRow227TriangleRoots11.root359_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[7]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root360,
    IU := OriginalRow227TriangleData0011.coefficient0_359, next := OriginalRow227TriangleData0011.coefficient0_360, hS := OriginalRow227TriangleRoots11.root360_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[8]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root361,
    IU := OriginalRow227TriangleData0011.coefficient0_360, next := OriginalRow227TriangleData0011.coefficient0_361, hS := OriginalRow227TriangleRoots11.root361_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[9]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root362,
    IU := OriginalRow227TriangleData0011.coefficient0_361, next := OriginalRow227TriangleData0011.coefficient0_362, hS := OriginalRow227TriangleRoots11.root362_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[10]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root363,
    IU := OriginalRow227TriangleData0011.coefficient0_362, next := OriginalRow227TriangleData0011.coefficient0_363, hS := OriginalRow227TriangleRoots11.root363_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[11]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root364,
    IU := OriginalRow227TriangleData0011.coefficient0_363, next := OriginalRow227TriangleData0011.coefficient0_364, hS := OriginalRow227TriangleRoots11.root364_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[12]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root365,
    IU := OriginalRow227TriangleData0011.coefficient0_364, next := OriginalRow227TriangleData0011.coefficient0_365, hS := OriginalRow227TriangleRoots11.root365_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[13]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root366,
    IU := OriginalRow227TriangleData0011.coefficient0_365, next := OriginalRow227TriangleData0011.coefficient0_366, hS := OriginalRow227TriangleRoots11.root366_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[14]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root367,
    IU := OriginalRow227TriangleData0011.coefficient0_366, next := OriginalRow227TriangleData0011.coefficient0_367, hS := OriginalRow227TriangleRoots11.root367_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[15]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root368,
    IU := OriginalRow227TriangleData0011.coefficient0_367, next := OriginalRow227TriangleData0011.coefficient0_368, hS := OriginalRow227TriangleRoots11.root368_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[16]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root369,
    IU := OriginalRow227TriangleData0011.coefficient0_368, next := OriginalRow227TriangleData0011.coefficient0_369, hS := OriginalRow227TriangleRoots11.root369_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[17]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root370,
    IU := OriginalRow227TriangleData0011.coefficient0_369, next := OriginalRow227TriangleData0011.coefficient0_370, hS := OriginalRow227TriangleRoots11.root370_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[18]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root371,
    IU := OriginalRow227TriangleData0011.coefficient0_370, next := OriginalRow227TriangleData0011.coefficient0_371, hS := OriginalRow227TriangleRoots11.root371_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[19]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root372,
    IU := OriginalRow227TriangleData0011.coefficient0_371, next := OriginalRow227TriangleData0011.coefficient0_372, hS := OriginalRow227TriangleRoots11.root372_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[20]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root373,
    IU := OriginalRow227TriangleData0011.coefficient0_372, next := OriginalRow227TriangleData0011.coefficient0_373, hS := OriginalRow227TriangleRoots11.root373_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[21]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root374,
    IU := OriginalRow227TriangleData0011.coefficient0_373, next := OriginalRow227TriangleData0011.coefficient0_374, hS := OriginalRow227TriangleRoots11.root374_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[22]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root375,
    IU := OriginalRow227TriangleData0011.coefficient0_374, next := OriginalRow227TriangleData0011.coefficient0_375, hS := OriginalRow227TriangleRoots11.root375_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[23]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root376,
    IU := OriginalRow227TriangleData0011.coefficient0_375, next := OriginalRow227TriangleData0011.coefficient0_376, hS := OriginalRow227TriangleRoots11.root376_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[24]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root377,
    IU := OriginalRow227TriangleData0011.coefficient0_376, next := OriginalRow227TriangleData0011.coefficient0_377, hS := OriginalRow227TriangleRoots11.root377_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[25]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root378,
    IU := OriginalRow227TriangleData0011.coefficient0_377, next := OriginalRow227TriangleData0011.coefficient0_378, hS := OriginalRow227TriangleRoots11.root378_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[26]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root379,
    IU := OriginalRow227TriangleData0011.coefficient0_378, next := OriginalRow227TriangleData0011.coefficient0_379, hS := OriginalRow227TriangleRoots11.root379_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[27]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root380,
    IU := OriginalRow227TriangleData0011.coefficient0_379, next := OriginalRow227TriangleData0011.coefficient0_380, hS := OriginalRow227TriangleRoots11.root380_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[28]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root381,
    IU := OriginalRow227TriangleData0011.coefficient0_380, next := OriginalRow227TriangleData0011.coefficient0_381, hS := OriginalRow227TriangleRoots11.root381_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[29]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root382,
    IU := OriginalRow227TriangleData0011.coefficient0_381, next := OriginalRow227TriangleData0011.coefficient0_382, hS := OriginalRow227TriangleRoots11.root382_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[30]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root383,
    IU := OriginalRow227TriangleData0011.coefficient0_382, next := OriginalRow227TriangleData0011.coefficient0_383, hS := OriginalRow227TriangleRoots11.root383_pos },
  { IA := shift, IR := (OriginalRow227RatioData11.checkpoints[31]'(by rw [OriginalRow227RatioData11.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots11.root384,
    IU := OriginalRow227TriangleData0011.coefficient0_383, next := OriginalRow227TriangleData0012.coefficient0_384, hS := OriginalRow227TriangleRoots11.root384_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero11

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero11.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
