import Grothe.UpperChaos.OriginalRow227RatioData10
import Grothe.UpperChaos.OriginalRow227TriangleData0010
import Grothe.UpperChaos.OriginalRow227TriangleData0011
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero10
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[0]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root321,
    IU := OriginalRow227TriangleData0010.coefficient0_320, next := OriginalRow227TriangleData0010.coefficient0_321, hS := OriginalRow227TriangleRoots10.root321_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[1]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root322,
    IU := OriginalRow227TriangleData0010.coefficient0_321, next := OriginalRow227TriangleData0010.coefficient0_322, hS := OriginalRow227TriangleRoots10.root322_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[2]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root323,
    IU := OriginalRow227TriangleData0010.coefficient0_322, next := OriginalRow227TriangleData0010.coefficient0_323, hS := OriginalRow227TriangleRoots10.root323_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[3]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root324,
    IU := OriginalRow227TriangleData0010.coefficient0_323, next := OriginalRow227TriangleData0010.coefficient0_324, hS := OriginalRow227TriangleRoots10.root324_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[4]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root325,
    IU := OriginalRow227TriangleData0010.coefficient0_324, next := OriginalRow227TriangleData0010.coefficient0_325, hS := OriginalRow227TriangleRoots10.root325_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[5]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root326,
    IU := OriginalRow227TriangleData0010.coefficient0_325, next := OriginalRow227TriangleData0010.coefficient0_326, hS := OriginalRow227TriangleRoots10.root326_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[6]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root327,
    IU := OriginalRow227TriangleData0010.coefficient0_326, next := OriginalRow227TriangleData0010.coefficient0_327, hS := OriginalRow227TriangleRoots10.root327_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[7]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root328,
    IU := OriginalRow227TriangleData0010.coefficient0_327, next := OriginalRow227TriangleData0010.coefficient0_328, hS := OriginalRow227TriangleRoots10.root328_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[8]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root329,
    IU := OriginalRow227TriangleData0010.coefficient0_328, next := OriginalRow227TriangleData0010.coefficient0_329, hS := OriginalRow227TriangleRoots10.root329_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[9]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root330,
    IU := OriginalRow227TriangleData0010.coefficient0_329, next := OriginalRow227TriangleData0010.coefficient0_330, hS := OriginalRow227TriangleRoots10.root330_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[10]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root331,
    IU := OriginalRow227TriangleData0010.coefficient0_330, next := OriginalRow227TriangleData0010.coefficient0_331, hS := OriginalRow227TriangleRoots10.root331_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[11]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root332,
    IU := OriginalRow227TriangleData0010.coefficient0_331, next := OriginalRow227TriangleData0010.coefficient0_332, hS := OriginalRow227TriangleRoots10.root332_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[12]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root333,
    IU := OriginalRow227TriangleData0010.coefficient0_332, next := OriginalRow227TriangleData0010.coefficient0_333, hS := OriginalRow227TriangleRoots10.root333_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[13]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root334,
    IU := OriginalRow227TriangleData0010.coefficient0_333, next := OriginalRow227TriangleData0010.coefficient0_334, hS := OriginalRow227TriangleRoots10.root334_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[14]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root335,
    IU := OriginalRow227TriangleData0010.coefficient0_334, next := OriginalRow227TriangleData0010.coefficient0_335, hS := OriginalRow227TriangleRoots10.root335_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[15]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root336,
    IU := OriginalRow227TriangleData0010.coefficient0_335, next := OriginalRow227TriangleData0010.coefficient0_336, hS := OriginalRow227TriangleRoots10.root336_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[16]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root337,
    IU := OriginalRow227TriangleData0010.coefficient0_336, next := OriginalRow227TriangleData0010.coefficient0_337, hS := OriginalRow227TriangleRoots10.root337_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[17]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root338,
    IU := OriginalRow227TriangleData0010.coefficient0_337, next := OriginalRow227TriangleData0010.coefficient0_338, hS := OriginalRow227TriangleRoots10.root338_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[18]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root339,
    IU := OriginalRow227TriangleData0010.coefficient0_338, next := OriginalRow227TriangleData0010.coefficient0_339, hS := OriginalRow227TriangleRoots10.root339_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[19]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root340,
    IU := OriginalRow227TriangleData0010.coefficient0_339, next := OriginalRow227TriangleData0010.coefficient0_340, hS := OriginalRow227TriangleRoots10.root340_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[20]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root341,
    IU := OriginalRow227TriangleData0010.coefficient0_340, next := OriginalRow227TriangleData0010.coefficient0_341, hS := OriginalRow227TriangleRoots10.root341_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[21]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root342,
    IU := OriginalRow227TriangleData0010.coefficient0_341, next := OriginalRow227TriangleData0010.coefficient0_342, hS := OriginalRow227TriangleRoots10.root342_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[22]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root343,
    IU := OriginalRow227TriangleData0010.coefficient0_342, next := OriginalRow227TriangleData0010.coefficient0_343, hS := OriginalRow227TriangleRoots10.root343_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[23]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root344,
    IU := OriginalRow227TriangleData0010.coefficient0_343, next := OriginalRow227TriangleData0010.coefficient0_344, hS := OriginalRow227TriangleRoots10.root344_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[24]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root345,
    IU := OriginalRow227TriangleData0010.coefficient0_344, next := OriginalRow227TriangleData0010.coefficient0_345, hS := OriginalRow227TriangleRoots10.root345_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[25]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root346,
    IU := OriginalRow227TriangleData0010.coefficient0_345, next := OriginalRow227TriangleData0010.coefficient0_346, hS := OriginalRow227TriangleRoots10.root346_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[26]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root347,
    IU := OriginalRow227TriangleData0010.coefficient0_346, next := OriginalRow227TriangleData0010.coefficient0_347, hS := OriginalRow227TriangleRoots10.root347_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[27]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root348,
    IU := OriginalRow227TriangleData0010.coefficient0_347, next := OriginalRow227TriangleData0010.coefficient0_348, hS := OriginalRow227TriangleRoots10.root348_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[28]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root349,
    IU := OriginalRow227TriangleData0010.coefficient0_348, next := OriginalRow227TriangleData0010.coefficient0_349, hS := OriginalRow227TriangleRoots10.root349_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[29]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root350,
    IU := OriginalRow227TriangleData0010.coefficient0_349, next := OriginalRow227TriangleData0010.coefficient0_350, hS := OriginalRow227TriangleRoots10.root350_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[30]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root351,
    IU := OriginalRow227TriangleData0010.coefficient0_350, next := OriginalRow227TriangleData0010.coefficient0_351, hS := OriginalRow227TriangleRoots10.root351_pos },
  { IA := shift, IR := (OriginalRow227RatioData10.checkpoints[31]'(by rw [OriginalRow227RatioData10.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots10.root352,
    IU := OriginalRow227TriangleData0010.coefficient0_351, next := OriginalRow227TriangleData0011.coefficient0_352, hS := OriginalRow227TriangleRoots10.root352_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero10

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero10.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
