import Grothe.UpperChaos.OriginalRow227RatioData12
import Grothe.UpperChaos.OriginalRow227TriangleData0012
import Grothe.UpperChaos.OriginalRow227TriangleData0013
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero12
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[0]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root385,
    IU := OriginalRow227TriangleData0012.coefficient0_384, next := OriginalRow227TriangleData0012.coefficient0_385, hS := OriginalRow227TriangleRoots12.root385_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[1]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root386,
    IU := OriginalRow227TriangleData0012.coefficient0_385, next := OriginalRow227TriangleData0012.coefficient0_386, hS := OriginalRow227TriangleRoots12.root386_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[2]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root387,
    IU := OriginalRow227TriangleData0012.coefficient0_386, next := OriginalRow227TriangleData0012.coefficient0_387, hS := OriginalRow227TriangleRoots12.root387_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[3]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root388,
    IU := OriginalRow227TriangleData0012.coefficient0_387, next := OriginalRow227TriangleData0012.coefficient0_388, hS := OriginalRow227TriangleRoots12.root388_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[4]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root389,
    IU := OriginalRow227TriangleData0012.coefficient0_388, next := OriginalRow227TriangleData0012.coefficient0_389, hS := OriginalRow227TriangleRoots12.root389_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[5]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root390,
    IU := OriginalRow227TriangleData0012.coefficient0_389, next := OriginalRow227TriangleData0012.coefficient0_390, hS := OriginalRow227TriangleRoots12.root390_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[6]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root391,
    IU := OriginalRow227TriangleData0012.coefficient0_390, next := OriginalRow227TriangleData0012.coefficient0_391, hS := OriginalRow227TriangleRoots12.root391_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[7]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root392,
    IU := OriginalRow227TriangleData0012.coefficient0_391, next := OriginalRow227TriangleData0012.coefficient0_392, hS := OriginalRow227TriangleRoots12.root392_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[8]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root393,
    IU := OriginalRow227TriangleData0012.coefficient0_392, next := OriginalRow227TriangleData0012.coefficient0_393, hS := OriginalRow227TriangleRoots12.root393_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[9]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root394,
    IU := OriginalRow227TriangleData0012.coefficient0_393, next := OriginalRow227TriangleData0012.coefficient0_394, hS := OriginalRow227TriangleRoots12.root394_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[10]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root395,
    IU := OriginalRow227TriangleData0012.coefficient0_394, next := OriginalRow227TriangleData0012.coefficient0_395, hS := OriginalRow227TriangleRoots12.root395_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[11]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root396,
    IU := OriginalRow227TriangleData0012.coefficient0_395, next := OriginalRow227TriangleData0012.coefficient0_396, hS := OriginalRow227TriangleRoots12.root396_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[12]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root397,
    IU := OriginalRow227TriangleData0012.coefficient0_396, next := OriginalRow227TriangleData0012.coefficient0_397, hS := OriginalRow227TriangleRoots12.root397_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[13]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root398,
    IU := OriginalRow227TriangleData0012.coefficient0_397, next := OriginalRow227TriangleData0012.coefficient0_398, hS := OriginalRow227TriangleRoots12.root398_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[14]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root399,
    IU := OriginalRow227TriangleData0012.coefficient0_398, next := OriginalRow227TriangleData0012.coefficient0_399, hS := OriginalRow227TriangleRoots12.root399_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[15]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root400,
    IU := OriginalRow227TriangleData0012.coefficient0_399, next := OriginalRow227TriangleData0012.coefficient0_400, hS := OriginalRow227TriangleRoots12.root400_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[16]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root401,
    IU := OriginalRow227TriangleData0012.coefficient0_400, next := OriginalRow227TriangleData0012.coefficient0_401, hS := OriginalRow227TriangleRoots12.root401_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[17]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root402,
    IU := OriginalRow227TriangleData0012.coefficient0_401, next := OriginalRow227TriangleData0012.coefficient0_402, hS := OriginalRow227TriangleRoots12.root402_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[18]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root403,
    IU := OriginalRow227TriangleData0012.coefficient0_402, next := OriginalRow227TriangleData0012.coefficient0_403, hS := OriginalRow227TriangleRoots12.root403_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[19]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root404,
    IU := OriginalRow227TriangleData0012.coefficient0_403, next := OriginalRow227TriangleData0012.coefficient0_404, hS := OriginalRow227TriangleRoots12.root404_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[20]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root405,
    IU := OriginalRow227TriangleData0012.coefficient0_404, next := OriginalRow227TriangleData0012.coefficient0_405, hS := OriginalRow227TriangleRoots12.root405_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[21]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root406,
    IU := OriginalRow227TriangleData0012.coefficient0_405, next := OriginalRow227TriangleData0012.coefficient0_406, hS := OriginalRow227TriangleRoots12.root406_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[22]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root407,
    IU := OriginalRow227TriangleData0012.coefficient0_406, next := OriginalRow227TriangleData0012.coefficient0_407, hS := OriginalRow227TriangleRoots12.root407_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[23]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root408,
    IU := OriginalRow227TriangleData0012.coefficient0_407, next := OriginalRow227TriangleData0012.coefficient0_408, hS := OriginalRow227TriangleRoots12.root408_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[24]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root409,
    IU := OriginalRow227TriangleData0012.coefficient0_408, next := OriginalRow227TriangleData0012.coefficient0_409, hS := OriginalRow227TriangleRoots12.root409_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[25]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root410,
    IU := OriginalRow227TriangleData0012.coefficient0_409, next := OriginalRow227TriangleData0012.coefficient0_410, hS := OriginalRow227TriangleRoots12.root410_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[26]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root411,
    IU := OriginalRow227TriangleData0012.coefficient0_410, next := OriginalRow227TriangleData0012.coefficient0_411, hS := OriginalRow227TriangleRoots12.root411_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[27]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root412,
    IU := OriginalRow227TriangleData0012.coefficient0_411, next := OriginalRow227TriangleData0012.coefficient0_412, hS := OriginalRow227TriangleRoots12.root412_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[28]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root413,
    IU := OriginalRow227TriangleData0012.coefficient0_412, next := OriginalRow227TriangleData0012.coefficient0_413, hS := OriginalRow227TriangleRoots12.root413_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[29]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root414,
    IU := OriginalRow227TriangleData0012.coefficient0_413, next := OriginalRow227TriangleData0012.coefficient0_414, hS := OriginalRow227TriangleRoots12.root414_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[30]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root415,
    IU := OriginalRow227TriangleData0012.coefficient0_414, next := OriginalRow227TriangleData0012.coefficient0_415, hS := OriginalRow227TriangleRoots12.root415_pos },
  { IA := shift, IR := (OriginalRow227RatioData12.checkpoints[31]'(by rw [OriginalRow227RatioData12.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots12.root416,
    IU := OriginalRow227TriangleData0012.coefficient0_415, next := OriginalRow227TriangleData0013.coefficient0_416, hS := OriginalRow227TriangleRoots12.root416_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero12

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero12.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
